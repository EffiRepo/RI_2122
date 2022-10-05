package ri_2122;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import processing.core.PConstants;
import processing.core.PShape;
import java.util.ArrayList;
import java.util.List;

import static ri_2122.Main.PROCESSING_MAIN;

public class Robot {

    private static final Logger LOGGER = LoggerFactory.getLogger(Robot.class.getSimpleName());
    private final ArrayList<Link> linkList;
    private float oPradius =0f;
    private PShape opShape;

    public Robot(){
        linkList = new ArrayList<>();
    }

    public void buildRobot(List<Float[]> table){

        for(Float[] link:table){

            this.addLink(link[0], link[1]);

            oPradius +=link[1];

        }
        setoP();

    }


    public void addLink(Float width, Float height) {
        Link link = new Link(width,height);
        linkList.add(link.createLink(width,height));
    }

    public void drawRobot(float q1, float q2, float q3){
        PROCESSING_MAIN.pushMatrix();
        PROCESSING_MAIN.rotate(q1);

        PROCESSING_MAIN.beginShape();
        PROCESSING_MAIN.shape(linkList.get(0).getPSlink());
        PROCESSING_MAIN.endShape();


        PROCESSING_MAIN.translate(0,linkList.get(0).getPSlink().getHeight()-linkList.get(0).getPSlink().getWidth());
        PROCESSING_MAIN.rotate(q2);
        PROCESSING_MAIN.pushMatrix();
        PROCESSING_MAIN.beginShape();
        PROCESSING_MAIN.shape(linkList.get(1).getPSlink());
        PROCESSING_MAIN.endShape();


        PROCESSING_MAIN.pushMatrix();
        PROCESSING_MAIN.translate(0,linkList.get(1).getPSlink().getHeight()-linkList.get(1).getPSlink().getWidth());
        PROCESSING_MAIN.beginShape();


        PROCESSING_MAIN.rotate(q3);
        PROCESSING_MAIN.shape(linkList.get(2).getPSlink());
        PROCESSING_MAIN.endShape();


        PROCESSING_MAIN.popMatrix();
        PROCESSING_MAIN.popMatrix();
        PROCESSING_MAIN.popMatrix();
    }




    public Link getLink(int i) {
        return linkList.get(i);
    }

    public PShape getoP() {
        return opShape;
    }

    public void setoP() {
        opShape = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,0,2*oPradius,2*oPradius);
        opShape.setFill(PROCESSING_MAIN.color(255, 236, 179));
        opShape.setStrokeWeight(0.5f);
    }


    public float getoPValue() {
        return oPradius;
    }
}