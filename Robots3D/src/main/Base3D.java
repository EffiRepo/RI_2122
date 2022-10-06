package main;

import main.plot.Oscilloscope;
import main.robots.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import peasy.PeasyCam;
import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PGraphics;
import processing.core.PVector;
import processing.opengl.PGL;
import processing.opengl.PGraphics3D;
import processing.opengl.PJOGL;
import java.beans.PropertyChangeListener;
import java.beans.PropertyChangeSupport;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import static main.Colors.*;

public class Base3D extends PApplet {

    private final int bgColor = colorWrap(ACID_GREEN);
    private static final int NX = 1;
    private static final int NY = 1;
    private final Oscilloscope oscilloscope;
    private final float shifting = 2f;
    private float dZ;
    private float dY;
    private float dX;

    PeasyCam[] cameras = new PeasyCam[NX * NY];
    private Robot robot;
    PropertyChangeSupport changes = new PropertyChangeSupport(this);
    private boolean showPlt=true;

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
    private static final List<Robot> robotList = new ArrayList<>();
    private int listSize;
    private int listIndex = 0;
    private Menu helper;
    private Menu legend;
    private Menu robotData;
    private PGraphics robotNameG;
    private String[] robotNameS = {"Antropomorfo","Cartesiano","Cilindrico","Polso","Scara","Sferico",
            "Stanford","Stanford Completo","Puma"};
    private PFont TITLE_FONT;
    private static final float TITLE_SIZE = 36;
    public Base3D() {
        // empty constructor
        robotList.addAll(List.of(
                new Antropomorfo(this), new Cartesiano(this), new Cilindrico(this),
                new Polso(this), new Scara(this), new Sferico(this), new Stanford(this),
                new Stanford6(this), new Puma(this)
                )
        );
        listSize = robotList.size();
        this.oscilloscope = Oscilloscope.getInstance();

    }


    @Override
    public void settings() {
        size(1280, 720, P3D);
        pixelDensity(1);
        smooth(8);
    }

    @Override
    public void setup() {
        // project setup
        setRobot();
        background(bgColor);
        frameRate(120);
        rectMode(CENTER);
        ellipseMode(RADIUS);
        sphereDetail(30);
        helper = new Menu(270,250,270,250,this);
        helper.show();
        TITLE_FONT = createFont("Arial Bold",TITLE_SIZE);
        robotNameG = this.createGraphics(500,500);
        /* From PeasyCam documentation */
        int padding = 10;
        int tileX = floor((width - padding));
        int tileY = floor((height - padding));
        int offX = (width - (tileX - padding)) / 2;
        int offY = (height - (tileY - padding)) / 2;
        int cw = tileX - padding;
        int ch = tileY - padding;
        // create new viewport for each camera
        for (int y = 0; y < NY; y++) {
            for (int x = 0; x < NX; x++) {
                int id = y * NX + x;
                int cx = offX + x * tileX;
                int cy = offY + y * tileY;
                cameras[id] = new PeasyCam(this, 500);
                cameras[id].setViewport(cx, cy, cw, ch); // this is the key of this whole demo
            }
        }
        /*
        Plot Initialization
         */
        Oscilloscope.getInstance().addPlot("E",20,20,400,250);
        Oscilloscope.getInstance().setPlotBuffer("E",6);
        legend = new Menu(150,30, this);
    }

    @Override
    public void draw() {
        // from camera doc
        setGLGraphicsViewport(0, 0, width, height);
        // start project
        background(colorWrap(MAGENTA));
        /*Render the scene*/
        pushStyle();
        pushMatrix();
        // Aggiungo degli effetti di luce direzionale
        directionalLight(126F, 126F, 126F, -1, 1, (float) -0.7);
        // Aggiungo degli effetti di luce ambientale
        ambientLight(200, 200, 200);
        // inizializzo camera
        cameraSetup(cameras[0]);
        if (robot != null) {
            pushMatrix();
            robot.draw(true);
            popMatrix();
            pushMatrix();
            robot.draw(false);
            popMatrix();

        }
        /* RENDERING END */
        // HUD
        cameras[0].beginHUD();
            helper.drawHelper();
            oscilloscope.drawPlots();
            assert(robot != null);
            legend.drawPlotInfo(this.robot.q.length);
            robotData.drawRobotData(this.robot.q.length);
            // draw title
            robotNameG.beginDraw();
            robotNameG.background(0,0,0,0);
            robotNameG.textAlign(LEFT);
            robotNameG.textFont(TITLE_FONT);
            robotNameG.fill(colorWrap(DARK_RED));
            robotNameG.text(robotNameS[robotList.indexOf(robot)],0,40);
            this.image(robotNameG,width/2f-150,15);
            robotNameG.endDraw();
        cameras[0].endHUD();

        popMatrix();
        popStyle();
    }

    public void run(String className) {
        String[] processingArgs = {"main" + className};
        PApplet.runSketch(processingArgs, this);
    }

    public Robot getRobot() {
        return robot;
    }

    public void setRobot() {
        // seleziono robot tramite buffer circolare
        this.robot = robotList.get(listIndex % listSize);
        // resetto per evitare problemi al cambiamento del robot selezionato
        this.robot.reset();
        robotData = new Menu(270, 230, 1280-270-10, -20 ,this, robot);

        // pulisco lista dei S.d.R.
        if (robot.gripper == null) robot.loadGripper();
        listIndex = (listIndex+1) % listSize;
        PVector origin = this.robot.getFrames().get(0).getOrigin();
        dX = origin.x;
        dY = origin.y;
        dZ = origin.z;
        // assert there aren't any listeners on this robot instance
        removePropertyChangeListener(this.robot);
        // add new listener
        addPropertyChangeListener(this.robot);
    }

    private void cameraSetup(PeasyCam camera) {

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

    public int colorWrap(Colors color) {
        int[] colorVector = color.getColor();
        return color(colorVector[0], colorVector[1], colorVector[2], colorVector[3]);
    }

    @Override
    public void keyPressed() {
        qUpdate(key);
        switch (key) {
            case 'r' -> { // show frames
                robot.toShow = !robot.toShow;
                robot.turnFrames();
            }
            case ENTER -> {// reset joints
                robot.reset();
                oscilloscope.resetPlot();
                robot.getFrames().get(0).setOrigin(0, 0, -230);
//                notifyPropertyChange("QUPDATE", null, robot.qRef);
            }
            case CODED -> {
                if (keyCode == UP) {
                    dZ += shifting * 10;
                    robot.getFrames().get(0).setOrigin(dX, dY, dZ);
                } else if (keyCode == DOWN) {
                    dZ -= shifting * 10;
                    robot.getFrames().get(0).setOrigin(dX, dY, dZ);
                } else if (keyCode == LEFT) {
                    dY -= shifting * 10;
                    robot.getFrames().get(0).setOrigin(dX, dY, dZ);
                } else if (keyCode == RIGHT) {
                    dY += shifting * 10;
                    robot.getFrames().get(0).setOrigin(dX, dY, dZ);
                }
            }
            case 'h' -> helper.show();
            case 'k' -> robot.setKp(robot.getKp()+0.01f);
            case 'j' -> robot.setKp(robot.getKp()-0.01f);
            case 'g' -> {
                legend.show();
                oscilloscope.allVisible(showPlt);
                showPlt=!showPlt;
            }
            case 'd' -> robotData.show();
            case 's' -> {
                setRobot();
                oscilloscope.resetPlot();
            }
            default -> {/**/}
        }
    }

    private void qUpdate(char key) {

        String[] keySet = new String[]{"1", "2", "3", "4", "5", "6"};
        String keyS = String.valueOf(key);
        if (Arrays.asList(keySet).contains(keyS)) {

            int joint = Integer.parseInt(keyS) - 1;
            if (joint < robot.table[0].length) {
                oscilloscope.resetPlot();

                robot.qRef[joint] += 2*shifting;
            }
        }
        notifyPropertyChange("QUPDATE", null, robot.qRef);
//        LOGGER.info("{}", robot.getQ());
    }
}
