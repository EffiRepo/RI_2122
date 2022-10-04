package ri_2122;

import processing.core.PApplet;

import java.util.ArrayList;

public class Main {
    private static final float LINK1_WIDTH = 50f;
    private static final float LINK1_HEIGTH = 80f;

    private static final float LINK2_WIDTH = 50f;
    private static final float LINK2_HEIGTH = 50f;

    private static final float LINK3_WIDTH = 50f;
    private static final float LINK3_HEIGTH = 100f;
    static final ProcessingMain PROCESSING_MAIN = new ProcessingMain();

    public static void main(String[] args){
//
        ArrayList<Float[]> settingsRobot=new ArrayList<>();
        settingsRobot.add(new Float[]{LINK1_WIDTH,LINK1_HEIGTH});
        settingsRobot.add(new Float[]{LINK2_WIDTH,LINK2_HEIGTH});
        settingsRobot.add(new Float[]{LINK3_WIDTH,LINK3_HEIGTH});
        PROCESSING_MAIN.setRobotLink(settingsRobot);
        String[] processingArgs = {"com.ri_2122."+PROCESSING_MAIN.getClass().getSimpleName()};
        PApplet.runSketch(processingArgs, PROCESSING_MAIN);
    }
}