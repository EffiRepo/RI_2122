package ri_2122;

import org.apache.commons.lang3.ArrayUtils;
import processing.core.PConstants;
import processing.core.PShape;

import static ri_2122.Main.PROCESSING_MAIN;

public class Link extends PShape {

    private float[] color;
    private final Float width;
    private final Float height;
    private PShape PSlink;
    private float alpha;


    public Link(Float width, Float height) {
        this.width = width;
        this.height =height;
        this.color = new float[]{255,255,255,255};
    }

    public Link createLink(Float width, Float height) {
        float wd =  ArrayUtils.toPrimitive(new Float[]{width})[0];
        float ht =  ArrayUtils.toPrimitive(new Float[]{height})[0];

        PShape link = PROCESSING_MAIN.createShape(PConstants.GROUP);

        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);
        PShape circleBot = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,0,wd,wd);

        circleBot.setStroke(false);

        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);
        PShape dotB = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,0,wd/3,wd/3);


        PShape body = PROCESSING_MAIN.createShape(PConstants.RECT,-width/2,0,wd,ht);
        body.setStroke(false);

        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);
        PShape circleTop = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,ht,wd,wd);
        circleTop.setStroke(false);
        body.setStroke(false);
        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);

        PShape dotT = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,ht,wd/3,wd/3);


        body.setFill(PROCESSING_MAIN.color((int)this.color[0],(int)this.color[1],(int)this.color[2],(int)this.color[3]));
        circleBot.setFill(PROCESSING_MAIN.color(176, 190, 197,(int)this.color[3]));
        circleTop.setFill(PROCESSING_MAIN.color(176, 190, 197,(int)this.color[3]));
        dotT.setFill(PROCESSING_MAIN.color(0,0,0,(int)this.color[3]));
        dotB.setFill(PROCESSING_MAIN.color(0,0,0,(int)this.color[3]));

        link.addChild(circleTop);
        link.addChild(circleBot);
        link.addChild(body);
        link.addChild(dotB);
        link.addChild(dotT);
        link.setStroke(true);
        this.PSlink = link;
        return this;
    }

    public float[] getColor() {
        return color;
    }

    public void setColor(float[] color) {
        this.color = color;
        refreshShape();
    }

    public void refreshShape(){
        float wd =  ArrayUtils.toPrimitive(new Float[]{width})[0];
        float ht =  ArrayUtils.toPrimitive(new Float[]{height})[0];

        PShape link = PROCESSING_MAIN.createShape(PConstants.GROUP);

        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);
        PShape circleBot = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,0,wd,wd);

        circleBot.setStroke(false);

        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);
        PShape dotB = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,0,wd/3,wd/3);


        PShape body = PROCESSING_MAIN.createShape(PConstants.RECT,-width/2,0,wd,ht);
        body.setStroke(false);

        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);
        PShape circleTop = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,ht,wd,wd);
        circleTop.setStroke(false);
        body.setStroke(false);
        PROCESSING_MAIN.ellipseMode(PConstants.CENTER);

        PShape dotT = PROCESSING_MAIN.createShape(PConstants.ELLIPSE,0,ht,wd/3,wd/3);


        body.setFill(PROCESSING_MAIN.color((int)this.color[0],(int)this.color[1],(int)this.color[2],(int)this.color[3]));
        circleBot.setFill(PROCESSING_MAIN.color(176, 190, 197,(int)this.color[3]));
        circleTop.setFill(PROCESSING_MAIN.color(176, 190, 197,(int)this.color[3]));
        dotT.setFill(PROCESSING_MAIN.color(0,0,0,(int)this.color[3]));
        dotB.setFill(PROCESSING_MAIN.color(0,0,0,(int)this.color[3]));

        link.addChild(circleTop);
        link.addChild(circleBot);
        link.addChild(body);
        link.addChild(dotB);
        link.addChild(dotT);
        link.setStroke(true);
        this.PSlink = link;
    }

    public float getWidthLink() {
        return (float) ArrayUtils.toPrimitive(this.width);
    }

    public float getHeightLink() {
        return (float) ArrayUtils.toPrimitive(this.height);
    }

    public PShape getPSlink() {
        return PSlink;
    }

    public void setPSlink(PShape PSlink) {
        this.PSlink = PSlink;
    }



}