package main;

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PGraphics;

import static main.Colors.MAGENTA;
import static processing.core.PConstants.CENTER;
import static processing.core.PConstants.LEFT;


public class Menu {
    private final int width;
    private final int height;
    private boolean isVisible = false;
    private PGraphics g;
    private int sizeX;
    private int sizeY;
    private int[]  borderColor = MAGENTA.getColor();
    private static final float borderWidth = 10;
    private static final float borderHeight = 10;
    private static final float TITLE_SIZE = 22;
    private static final float TEXT_SIZE = 16;
    private PApplet p3d;
    private static PFont TITLE_FONT;
    private static PFont TEXT_FONT;
    public Menu(int sizeX, int sizeY, int width, int height, PApplet p3d){
        this.p3d = p3d;
        g = p3d.createGraphics(sizeX, sizeY);
        this.sizeX = sizeX;
        this.sizeY = sizeY;
        this.width = width;
        this.height = height;
        TITLE_FONT =  p3d.createFont("Arial Bold",TITLE_SIZE);
        TEXT_FONT =  p3d.createFont("Arial",TEXT_SIZE);
    }
    public void draw(){

        // creo menu
        if (isVisible){
            g.beginDraw();
            g.noStroke();
            // reference frame is left-handed with center in (0,0) in the top left corner
            // bordo
            g.fill(borderColor[0],borderColor[1],borderColor[2],10);
            g.rect(0,0,sizeX,sizeY,20);
            // sfondo
            g.fill(255);
            g.rect(borderWidth,borderHeight,width-2*borderWidth,height-2*borderHeight,10);
            // titolo
            g.textSize(TITLE_SIZE);
            g.fill(255,0,0);
            g.textAlign(CENTER);
            g.textFont(TITLE_FONT);
            g.text("Helper",sizeX/2f,4*borderHeight);
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
            p3d.image(g,p3d.width-(float)sizeX-3*borderWidth,p3d.height-(float)sizeY-3*borderHeight);

        }
    }

    public void show(){
        isVisible = !isVisible;
    }
}
