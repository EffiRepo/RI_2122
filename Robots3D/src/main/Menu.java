package main;

import main.plot.Oscilloscope;
import main.plot.Plot;
import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PGraphics;

import static main.Colors.MAGENTA;
import static processing.core.PApplet.floor;
import static processing.core.PConstants.CENTER;
import static processing.core.PConstants.LEFT;


public class Menu {
    private final int width;
    private final int height;
    private boolean isVisible = false;
    private final PGraphics g;
    private final int startX;
    private final int startY;
    private final int[]  borderColor = MAGENTA.getColor();
    private static final float BORDER_WIDTH = 5;
    private static final float BORDER_HEIGHT = 5;
    private static final float TITLE_SIZE = 22;
    private static final float TEXT_SIZE = 16;
    private static final float TEXT_PLOT = 12;
    private final PApplet p3d;
    private PFont titleFont;
    private final PFont textFont;
    private Robot robot;
    public Menu(int sizeX, int sizeY, int width, int height, PApplet p3d){
        this.p3d = p3d;
        g = p3d.createGraphics(sizeX, sizeY);
        this.startX = sizeX;
        this.startY = sizeY;
        this.width = width;
        this.height = height;
        titleFont =  p3d.createFont("Arial Bold",TITLE_SIZE);
        textFont =  p3d.createFont("Arial", TEXT_SIZE);
    }
    public Menu(int width, int height, PApplet p3d){
        this.p3d = p3d;
        g = p3d.createGraphics(width, floor(1.5f*height)+1);
        this.startX = Oscilloscope.getInstance().getPlostlist().get("E").getxPos();
        this.startY = Oscilloscope.getInstance().getPlostlist().get("E").getyPos();
        this.width = width;
        this.height = height;
        textFont =  p3d.createFont("Arial", TEXT_PLOT);
    }
    public Menu(int width, int height, int startX, int startY, PApplet p3d, Robot robot){
        this.p3d = p3d;
        g = p3d.createGraphics(width, height);
        this.width = width;
        this.height = height;
        this.startX = startX;
        this.startY = startY;
        this.robot = robot;
        this.isVisible = true;
        titleFont =  p3d.createFont("Arial Bold",TITLE_SIZE);
        textFont =  p3d.createFont("Arial", TEXT_SIZE);
    }
    public void drawHelper(){

        // creo menu
        if (isVisible){
            g.beginDraw();
            g.noStroke();
            // reference frame is left-handed with center in (0,0) in the top left corner
            // bordo
            g.fill(borderColor[0],borderColor[1],borderColor[2]);
            g.rect(0,0, startX, startY,15,0,0,15);
            // sfondo
            g.fill(255);
            g.rect(BORDER_WIDTH, BORDER_HEIGHT,width-2* BORDER_WIDTH,height-2* BORDER_HEIGHT,10);
            // titolo
            g.textSize(TITLE_SIZE);
            g.fill(255,0,0);
            g.textAlign(CENTER);
            g.textFont(titleFont);
            g.text("Helper", startX /2f,8* BORDER_HEIGHT);
            // comandi
            g.textAlign(LEFT);
            g.textFont(textFont);
            g.fill(0);
            g.text("> R: Mostra/Nascondi S.d.R.",2* BORDER_WIDTH, 16* BORDER_HEIGHT);
            g.text("> S: Cambiare il Robot.",2* BORDER_WIDTH, 16* BORDER_HEIGHT +20);
            g.text("> Invio: Resetta i giunti.",2* BORDER_WIDTH, 16* BORDER_HEIGHT +40);
            g.text("> Frecce Direz.: Muovi la base",2* BORDER_WIDTH, 16* BORDER_HEIGHT +60);
            g.text("> K: Aumenta il Kp",2* BORDER_WIDTH, 16* BORDER_HEIGHT +80);
            g.text("> J: Diminuisci il Kp",2* BORDER_WIDTH, 16* BORDER_HEIGHT +100);
            g.text("> G: Mostra/Nascondi grafici",2* BORDER_WIDTH, 16* BORDER_HEIGHT +120);
            g.text("> D: Mostra/Nascondi Info",2* BORDER_WIDTH, 16* BORDER_HEIGHT +140);
            g.text("> H: Mostra/Nascondi Helper",2* BORDER_WIDTH, 16* BORDER_HEIGHT +160);
            g.endDraw();
            p3d.image(g,p3d.width-(float) startX -3* BORDER_WIDTH,p3d.height-(float) startY -3* BORDER_HEIGHT);

        }
    }
    public void drawPlotInfo(int joints){
        int offX = Oscilloscope.getInstance().getPlostlist().get("E").getWidth();
        int titleHeight = Oscilloscope.getInstance().getPlostlist().get("E").getTitleHeight();
        int rectY = height * joints/3;
        if (isVisible) {
            g.beginDraw();
            g.background(0,0,0,0);
            g.noStroke();
            // sfondo
            g.fill(0);
            g.rect(0,0,width,rectY,10);
            g.fill(255);
            if(joints == 6) {
                g.rect(1, 1, width - 2f, rectY - 14 - joints / 3f, 10);
                g.fill(Plot.colorLine[3]);
                g.rect(10, 13 + 20f, 10, 5,5);
                g.fill(0);
                g.text("Eq4", 22, 19 + 20f);
                g.fill(Plot.colorLine[4]);
                g.rect(10 + 10 + 22 + 10f, 13 + 20f, 10, 5,5);
                g.fill(0);
                g.text("Eq5", 10 + 10 + 22 + 10 + 10 + 5f, 19 + 20f);
                g.fill(Plot.colorLine[5]);
                g.rect(10 + 10 + 22 + 10 + 10 + 5 + 10f + 10 + 10, 13 + 20f, 10, 5,5);
                g.fill(0);
                g.text("Eq6", 10 + 10 + 22 + 10 + 10 + 5 + 10f + 10 + 5 + 20, 19 + 20f);
            }
            else
                g.rect(1,1,width-2f,rectY-2f,10);
            g.textAlign(LEFT);
            g.textFont(textFont);
            // q1
            g.fill(Plot.colorLine[0]);
            g.rect(10,13,10,5,5);
            g.fill(0);
            g.text("Eq1",22,19);
            g.fill(Plot.colorLine[1]);
            g.rect(10+10+22+10f,13,10,5,5);
            g.fill(0);
            g.text("Eq2",10+10+22+10+10+5f,19);
            g.fill(Plot.colorLine[2]);
            g.rect(10+10+22+10+10+5+10f+10+10,13,10,5,5);
            g.fill(0);
            g.text("Eq3",10+10+22+10+10+5+10f+10+5+20,19);
            /* --- */


            g.endDraw();
            p3d.image(g, startX + offX - (width) - 3f , startY + 3f + titleHeight);
        }
    }
    public void drawRobotData(int joints){
        if(isVisible){
            g.beginDraw();
            g.noStroke();
            // bordo
            g.fill(borderColor[0],borderColor[1],borderColor[2]);
            g.rect(0,0,width,height,20);
            // sfondo
            g.fill(255);
            g.rect(BORDER_WIDTH, BORDER_HEIGHT,width-2* BORDER_WIDTH,height-2* BORDER_HEIGHT,15,0,0,15);
            // titolo
            g.textSize(TITLE_SIZE);
            g.textAlign(CENTER);
            g.fill(255,0,0);
            g.textFont(titleFont);
            g.text("Robot-Info", width/2f,8*BORDER_HEIGHT);
            // vars
            g.textAlign(LEFT);
            g.textFont(textFont);
            g.fill(0);
            g.text("> Kp = "+String.format("%.2f",robot.getKp()),4*BORDER_WIDTH,16*BORDER_HEIGHT);
            g.text("> q1 = "+String.format("%.2f",robot.getQ()[0]),4*BORDER_WIDTH,16*BORDER_HEIGHT+20);
            g.text("> q1-ref = "+String.format("%.2f",robot.getqRef()[0]),width/2f-BORDER_WIDTH,16*BORDER_HEIGHT+20);
            g.text("> q2 = "+String.format("%.2f",robot.getQ()[1]),4*BORDER_WIDTH,16*BORDER_HEIGHT+40);
            g.text("> q2-ref = "+String.format("%.2f",robot.getqRef()[1]),width/2f-BORDER_WIDTH,16*BORDER_HEIGHT+40);
            g.text("> q3 = "+String.format("%.2f",robot.getQ()[2]),4*BORDER_WIDTH,16*BORDER_HEIGHT+60);
            g.text("> q3-ref = "+String.format("%.2f",robot.getqRef()[2]),width/2f-BORDER_WIDTH,16*BORDER_HEIGHT+60);
            if(joints == 6 && robot.getQ().length == 6){
                g.text("> q4 = "+String.format("%.2f",robot.getQ()[3]),4*BORDER_WIDTH,16*BORDER_HEIGHT+80);
                g.text("> q4-ref = "+String.format("%.2f",robot.getqRef()[3]),width/2f-BORDER_WIDTH,16*BORDER_HEIGHT+80);
                g.text("> q5 = "+String.format("%.2f",robot.getQ()[4]),4*BORDER_WIDTH,16*BORDER_HEIGHT+100);
                g.text("> q5-ref = "+String.format("%.2f",robot.getqRef()[4]),width/2f-BORDER_WIDTH,16*BORDER_HEIGHT+100);
                g.text("> q6 = "+String.format("%.2f",robot.getQ()[5]),4*BORDER_WIDTH,16*BORDER_HEIGHT+120);
                g.text("> q6-ref = "+String.format("%.2f",robot.getqRef()[5]),width/2f-BORDER_WIDTH,16*BORDER_HEIGHT+120);
            }

            g.endDraw();
            p3d.image(g, startX, startY);
        }
    }
    public void show(){
        isVisible = !isVisible;
    }
}
