package main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import peasy.PeasyCam;
import processing.core.PApplet;
import processing.opengl.PGL;
import processing.opengl.PGraphics3D;
import processing.opengl.PJOGL;

import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;


import static main.Colors.ACID_GREEN;
import static main.Colors.MAGENTA;

public class Base3D extends PApplet {

    private final int bgColor = colorWrap(ACID_GREEN);
    private static final int NX = 1;
    private static final int NY = 1;
    private float shifting = 2.2f;
    private float[] qRef;
    PeasyCam[] cameras = new PeasyCam[NX * NY];
    private Robot robot;
    PropertyChangeSupport changes = new PropertyChangeSupport(this);

    public void notifyPropertyChange(String propertyName, Object oldValue, Object newValue) {
        /*
         * Just a wrapper for the fire property change method.
         */
        changes.firePropertyChange(propertyName, oldValue, newValue);
    }
    public void addPropertyChangeListener(PropertyChangeListener l) {
        changes.addPropertyChangeListener(l);
    }
    public void removePropertyChangeListener(PropertyChangeListener l) {
        changes.removePropertyChangeListener(l);
    }
    private static final Logger LOGGER = LoggerFactory.getLogger(Base3D.class.getName());
    public Base3D(){
        // empty constructor
    }


    @Override
    public void settings(){
        size(1280,720,P3D);
        pixelDensity(1);
        smooth(8);
    }

    @Override
    public void setup() {
        background(bgColor);
        frameRate(120);
        rectMode(CENTER);
        ellipseMode(RADIUS);
        sphereDetail(30);
        robot.loadGripper();
        /* From PeasyCam documentation */
        int padding = 10;
        int tileX = floor((width - padding));
        int tileY = floor((height - padding));
        int offX = (width - (tileX - padding)) / 2;
        int offY = (height - (tileY - padding)) / 2;
        int cw = tileX - padding;
        int ch = tileY - padding;
        // create new viewport for each camera
        for(int y = 0; y < NY; y++){
            for(int x = 0; x < NX; x++){
                int id = y * NX + x;
                int cx = offX + x * tileX;
                int cy = offY + y * tileY;
                cameras[id] = new PeasyCam(this, 500);
                cameras[id].setViewport(cx, cy, cw, ch); // this is the key of this whole demo
            }
        }
    }

    @Override
    public void draw(){
        setGLGraphicsViewport(0, 0, width, height);
        background(colorWrap(MAGENTA));
        /*Render the scene*/
        pushStyle();
        pushMatrix();
        // Aggiungo degli effetti di luce direzionale
        directionalLight(126F, 126F, 126F, -1, 1, (float) -0.7);
        // Aggiungo degli effetti di luce ambientale
        ambientLight(200, 200, 200);

        cameraSetup(cameras[0]);
        if (robot != null) {
            robot.draw();
        }
        /* RENDERING END */
        // HUD
        cameras[0].beginHUD();
            // insert code here
        cameras[0].endHUD();

        popMatrix();
        popStyle();
    }

    public void run(String className){
        String[] processingArgs = {"main"+className};
        PApplet.runSketch(processingArgs, this);
    }

    public Robot getRobot() {
        return robot;
    }

    public void setRobot(Robot robot) {
        this.robot = robot;
        this.qRef = robot.getQ().clone();
        // assert there aren't any listeners on this robot instance
        removePropertyChangeListener(this.robot);
        // add new listener
        addPropertyChangeListener(this.robot);
    }

    private void cameraSetup(PeasyCam camera){

        int[] viewport = camera.getViewport();
        int w = viewport[2];
        int h = viewport[3];
        int x = viewport[0];
        int y = viewport[1];
        int yInv = height - y - h; // inverted y-axis
        // scissors-test and viewport transformation
        setGLGraphicsViewport(x, yInv, w, h);
        // set camera state like spinning a globe
        camera.setYawRotationMode();
        camera.setRightDragHandler(null);
        camera.setCenterDragHandler(null);
        camera.setMinimumDistance(300);
        camera.setMaximumDistance(1000);
        camera.feed();
        // projection - using camera viewport
        perspective(60 * PI / 180, w / (float) h, 1, 5000);
        // clear background (scissors makes sure we only clear the region we own)
        background(bgColor);
        // Scalo su -y per ottenere un S.d.R. destrorso e ruoto per settare
        // Z > ZERO su, X > ZERO a destra, Y > ZERO in avanti
        scale(1, -1, 1);
        rotateX(-PI / 2);
        rotateZ(-PI / 2);



    }
    public void setGLGraphicsViewport(int x, int y, int w, int h) {
        /*From PeasyCam Documentation*/
        PGraphics3D pg = (PGraphics3D) this.g;
        PJOGL pgl = (PJOGL) pg.beginPGL();
        pg.endPGL();
        pgl.enable(PGL.SCISSOR_TEST);
        pgl.scissor(x, y, w, h);
        pgl.viewport(x, y, w, h);
    }
    public int colorWrap(Colors color){
        int[] colorVector = color.getColor();
        return color(colorVector[0],colorVector[1],colorVector[2],colorVector[3]);
    }

    @Override
    public void keyPressed(){
        qUpdate(key);
        switch(key){
            case 'r' -> { // show frames
                robot.toShow = !robot.toShow;
                robot.turnFrames();
            }
            case ENTER ->{// reset joints
                robot.reset();
            }
        }
    }
    private void qUpdate(char key) {
        switch(key){
            case '1' -> {
                robot.qRef[0] = robot.getQ()[0] + shifting;
            }
            case '2' -> {
                robot.qRef[1] = robot.getQ()[1] + shifting;
            }
            case '3' -> {
                robot.qRef[2] = robot.getQ()[2] + shifting;
            }
            case '4' -> {
                if(qRef.length >3)
                    robot.qRef[3] = robot.getQ()[3] + shifting;
            }
            case '5' -> {
                if(qRef.length >3)
                    robot.qRef[4] = robot.getQ()[4] + shifting;
            }
            case '6' -> {
                if(qRef.length >3)
                    robot.qRef[5] = robot.getQ()[5] + shifting;
            }
            default -> {
                LOGGER.info("default key");
            }
        }
        notifyPropertyChange("QUPDATE",null,qRef);
        LOGGER.info("{}",robot.getQ());
    }
}
