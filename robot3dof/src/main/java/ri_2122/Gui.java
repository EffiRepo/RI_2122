package ri_2122;

import processing.core.PApplet;
import processing.core.PConstants;
import processing.core.PGraphics;
import processing.core.PShape;

import java.math.RoundingMode;
import java.text.DecimalFormat;

import static ri_2122.Main.PROCESSING_MAIN;


public class Gui extends PShape {
    private static final int barPrimary = PROCESSING_MAIN.color(239, 83, 80);
    private static final int  barSecondary = PROCESSING_MAIN.color(255);

    private static final float topHeight = PROCESSING_MAIN.width*15/100f;
    private static final float botHeight = PROCESSING_MAIN.width*15/100f;
    private PGraphics env;
    DecimalFormat df;
    public Gui() {
        this.df = new DecimalFormat("###.##");
        df.setRoundingMode(RoundingMode.DOWN);
        this.env = PROCESSING_MAIN.createGraphics(PROCESSING_MAIN.width,200);
    }


    public PGraphics drawGui() {
        env.beginDraw();
        /*
        Background
         */
        env.stroke(0,0,0);
        env.fill(PROCESSING_MAIN.color(255, 249, 196));
        env.rect(0,0,PROCESSING_MAIN.width,250f);
        /*
        Plot Legend
         */
        env.textSize(16);
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Legenda Plot:",10,20);
        /*
        Q1 Legend
         */
        env.stroke(255,0,0,255);
        env.rect(10,40,20,5);
        env.fill(PROCESSING_MAIN.color(0,0,0,255));
        env.text("Q1",35,45);
        env.noStroke();

         /*
        Q2 Legend
         */
        env.stroke(0,255,0,180);
        env.rect(10,80,20,5);
        env.fill(PROCESSING_MAIN.color(0,0,0,255));
        env.text("Q2",35,85);
        env.noStroke();

         /*
        Q3 Legend
         */
        env.stroke(0,0,255,180);
        env.rect(10,120,20,5);
        env.fill(PROCESSING_MAIN.color(0,0,0,255));
        env.text("Q3",35,125);
        env.noStroke();

        /*
        Newton Robot
         */
        env.stroke(156, 39, 176,170);
        env.rect(10,160,20,5);
        env.fill(PROCESSING_MAIN.color(0,0,0,255));
        env.text("Newton",35,165);
        env.noStroke();

        /*
        Gradient Robot
         */
        env.stroke(141, 110, 99,170);
        env.rect(100,40,20,5);
        env.fill(PROCESSING_MAIN.color(0,0,0,255));
        env.text("Gradient",130,50);
        env.noStroke();

        /*
        Proporzionale Robot
         */
        env.stroke(251, 140, 0,180);
        env.rect(100,80,20,5);
        env.fill(PROCESSING_MAIN.color(0,0,0,255));
        env.text("Prop.",130,85);
        env.noStroke();

        /*
        Sipario
         */
        env.stroke(0,0,0);
        env.strokeWeight(0.8f);
        env.line(200,30,200,170f);
        env.noStroke();


        /*
        Comandi Processing
         */
        env.textSize(16);
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Comandi Processing:",210,20);
        env.noStroke();

        /*
        First Column of comand
         */
        env.fill(PROCESSING_MAIN.color(0,0,0,200));
        env.text("E/e: cambio gomito",210,50);
        env.text("P/p: + orientamento",210,75);
        env.text("L/l: - orientamento",210,100);
        env.text("T/t: Mostra/Nascondi target",210,125);
        env.text("S/s: Mostra/Nascondi Plot",210,150);
        env.noStroke();

        /*
        Secondo Columin of comand
         */
        env.text("N/n: Kn++",450,50);
        env.text("J/J: Kn--",450,75);
        env.text("G/g: Kg++",450,100);
        env.text("V/v: Kg--",450,125);
        env.text("B/b: Kp++",450,150);
        env.text("H/h: Kp--",450,175);
        env.noStroke();

        /*
        Sipario
         */
        env.stroke(0,0,0);
        env.strokeWeight(0.8f);
        env.line(550,30,550,170f);
        env.noStroke();

        /*
        Valori dei giunti
         */
        env.textSize(16);
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Valori di giunto:",550,20);
        env.noStroke();

        /*
        Coordinate desiderate
         */
        env.text("P:",560,50);
        env.fill(PROCESSING_MAIN.color(0,0,0,200));
        env.text("x:"+df.format(PROCESSING_MAIN.getxTarget()),585,50);
        env.text("y:"+df.format(PROCESSING_MAIN.getyTarget()),635,50);
        env.text("phi:"+df.format(PROCESSING_MAIN.getPhi()),675,50);
        env.text("Kp;"+df.format(PROCESSING_MAIN.getkP()),745,50);
        env.text("Kn:"+df.format(PROCESSING_MAIN.getkN()),805,50);
        env.text("KG:"+df.format(PROCESSING_MAIN.getkG()),855,50);
        env.text("Gomito:"+PROCESSING_MAIN.getGomito(),920,50);
        env.noStroke();

        /*
        Riferimenti
         */
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Riferimenti:",560,75);
        env.fill(PROCESSING_MAIN.color(0,0,0,200));
        env.text("q1r:"+df.format(PROCESSING_MAIN.getQ1Ref()),640,75);
        env.text("q2r:"+df.format(PROCESSING_MAIN.getQ2Ref()),715,75);
        env.text("q3r:"+df.format(PROCESSING_MAIN.getQ3Ref()),785,75);
        env.noStroke();

        /*
        Newton
         */
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Newton:",560,100);
        env.fill(PROCESSING_MAIN.color(0,0,0,200));
        env.text("q1r:"+df.format(PROCESSING_MAIN.getQ1N()),640,100);
        env.text("q2r:"+df.format(PROCESSING_MAIN.getQ2N()),715,100);
        env.text("q3r:"+df.format(PROCESSING_MAIN.getQ3N()),785,100);
        env.noStroke();

        /*
        Gradiente
         */
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Gradiente:",560,125);
        env.fill(PROCESSING_MAIN.color(0,0,0,200));
        env.text("q1r:"+df.format(PROCESSING_MAIN.getQ1G()),640,125);
        env.text("q2r:"+df.format(PROCESSING_MAIN.getQ2G()),715,125);
        env.text("q3r:"+df.format(PROCESSING_MAIN.getQ3G()),785,125);
        env.noStroke();

        /*
        Proporzionale
         */
        env.fill(PROCESSING_MAIN.color(255,0,0,200));
        env.text("Prop.:",560,150);
        env.fill(PROCESSING_MAIN.color(0,0,0,200));
        env.text("q1r:"+df.format(PROCESSING_MAIN.getQ1()),640,150);
        env.text("q2r:"+df.format(PROCESSING_MAIN.getQ2()),715,150);
        env.text("q3r:"+df.format(PROCESSING_MAIN.getQ3()),785,150);
        env.noStroke();

        env.endDraw();
        return env;
    }

}