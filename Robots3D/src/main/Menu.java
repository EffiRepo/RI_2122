package main;

import main.plot.Oscilloscope;
import main.plot.Plot;
import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PGraphics;

import static java.lang.Math.ceil;
import static main.Colors.MAGENTA;
import static processing.core.PConstants.CENTER;
import static processing.core.PConstants.LEFT;


public class Menu {
    private int width;
    private int height;
    private boolean isVisible = false;
    private PGraphics g;
    private int startX;
    private int startY;
    private int[]  borderColor = MAGENTA.getColor();
    private static final float borderWidth = 10;
    private static final float borderHeight = 10;
    private static final float TITLE_SIZE = 22;
    private static final float TEXT_SIZE = 16;
    private static final float TEXT_PLOT = 12;
    private PApplet p3d;
    private static PFont TITLE_FONT;
    private static PFont TEXT_FONT;
    public Menu(int sizeX, int sizeY, int width, int height, PApplet p3d){
        this.p3d = p3d;
        g = p3d.createGraphics(sizeX, sizeY);
        this.startX = sizeX;
        this.startY = sizeY;
        this.width = width;
        this.height = height;
        TITLE_FONT =  p3d.createFont("Arial Bold",TITLE_SIZE);
        TEXT_FONT =  p3d.createFont("Arial",TEXT_SIZE);
    }
    public Menu(int width, int height, PApplet p3d){
        this.p3d = p3d;
        g = p3d.createGraphics(width, (int) (ceil(1.5*height)+1));
        this.startX = Oscilloscope.getInstance().getPlostlist().get("E").getxPos();
        this.startY = Oscilloscope.getInstance().getPlostlist().get("E").getyPos();

        this.width = width;
        this.height = height;
        TEXT_FONT =  p3d.createFont("Arial",TEXT_PLOT);
    }
    public void drawHelper(){

        // creo menu
        if (isVisible){
            g.beginDraw();
            g.noStroke();
            // reference frame is left-handed with center in (0,0) in the top left corner
            // bordo
            g.fill(borderColor[0],borderColor[1],borderColor[2],10);
            g.rect(0,0, startX, startY,20);
            // sfondo
            g.fill(255);
            g.rect(borderWidth,borderHeight,width-2*borderWidth,height-2*borderHeight,10);
            // titolo
            g.textSize(TITLE_SIZE);
            g.fill(255,0,0);
            g.textAlign(CENTER);
            g.textFont(TITLE_FONT);
            g.text("Helper", startX /2f,4*borderHeight);
            // comandi
            g.textAlign(LEFT);
            g.textFont(TEXT_FONT);
            g.fill(0);
            g.text("> R: Mostra/Nascondi S.d.R.",2*borderWidth, 8*borderHeight);
            g.text("> S: Cambiare il Robot.",2*borderWidth, 8*borderHeight+20);
            g.text("> Invio: Resetta i giunti.",2*borderWidth, 8*borderHeight+40);
            g.text("> Frecce Direz.: Muovi la base",2*borderWidth, 8*borderHeight+60);
            g.text("> K: Aumenta il Kp",2*borderWidth, 8*borderHeight+80);
            g.text("> J: Diminuisci il Kp",2*borderWidth, 8*borderHeight+100);
            g.text("> G: Mostra/Nascondi grafici",2*borderWidth, 8*borderHeight+120);
            g.text("> H: Mostra/Nascondi Helper",2*borderWidth, 8*borderHeight+140);
            g.endDraw();
            p3d.image(g,p3d.width+(float) startX -3*borderWidth,p3d.height-(float) startY -3*borderHeight);

        }
    }
    public void drawPlotInfo(int joints){
        // upper left corner patch
        // size X
        // int plotX = Oscilloscope.getInstance().getPlostlist().get("E").getxPos();
        // size Y
        // int plotY = Oscilloscope.getInstance().getPlostlist().get("E").getyPos();
        int offX = Oscilloscope.getInstance().getPlostlist().get("E").getWidth();
        int titleHeight = Oscilloscope.getInstance().getPlostlist().get("E").getTitleHeight();
//        int rectX = 150;
        int rectY = height * joints/3-5;
        if (isVisible) {
            g.beginDraw();
            g.background(0,0,0,0);
            g.noStroke();
            // sfondo
            g.fill(0);
            g.rect(0,0,width,rectY,5);
            g.fill(255);
            g.rect(1,1,width-2f,rectY-2f,5);
            g.fill(255,0,0);
            g.textAlign(LEFT);
            g.textFont(TEXT_FONT);
            // q1
            g.fill(Plot.colorLine[0]);
            g.rect(10,13,10,5);
            g.fill(0);
            g.text("Eq1",22,19);
            g.fill(Plot.colorLine[1]);
            g.rect(10+10+22+10f,13,10,5);
            g.fill(0);
            g.text("Eq2",10+10+22+10+10+5f,19);
            g.fill(Plot.colorLine[2]);
            g.rect(10+10+22+10+10+5+10f+10+10,13,10,5);
            g.fill(0);
            g.text("Eq3",10+10+22+10+10+5+10f+10+5+20,19);
            /* --- */
            g.fill(Plot.colorLine[3]);
            g.rect(10,13+20,10,5);
            g.fill(0);
            g.text("Eq4",22,19+20);
            g.fill(Plot.colorLine[4]);
            g.rect(10+10+22+10f,13+20,10,5);
            g.fill(0);
            g.text("Eq5",10+10+22+10+10+5f,19+20);
            g.fill(Plot.colorLine[5]);
            g.rect(10+10+22+10+10+5+10f+10+10,13+20,10,5);
            g.fill(0);
            g.text("Eq6",10+10+22+10+10+5+10f+10+5+20,19+20);

            g.endDraw();
            p3d.image(g, startX + offX - (width) - 3f , startY + 3f + titleHeight);
        }
    }
    public void show(){
        isVisible = !isVisible;
    }
}
