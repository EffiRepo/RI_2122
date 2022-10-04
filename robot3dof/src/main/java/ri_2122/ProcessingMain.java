package ri_2122;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import processing.core.PApplet;
import processing.core.PConstants;
import processing.core.PShape;

import java.util.ArrayList;
import java.util.concurrent.ThreadLocalRandom;

public class ProcessingMain extends PApplet {
    private static final Logger LOGGER = LoggerFactory.getLogger(ProcessingMain.class.getSimpleName());
    private static final String TITLE = "3 DOF";
    private Robot robot;
    private ArrayList<Float[]> settingRobot;
    private Gui gui;
    private int dx=0;
    private int dy=0;

    private float xTarget = 0;

    private float yTarget = 0;

    private float q1=-PI/2;
    private float q2=0f;
    private float q3=0f;
    
    private float q1N=0f;
    private float q2N=0f;
    private float q3N=0f;

    private float q1G=-PI/2;
    private float q2G=0.0f;
    private float q3G=0.0f;

    private float phi=PI/2;
    private float kN =0.1f;
    private float kP = 0.1f;

    private float kG =0.01f;
    private float gomito = 1f;
    float epsilon = 0.0000001f;

    private boolean targetVisibility= false;
    private PShape target;
    private float q1Ref;
    private float q2Ref;
    private float q3Ref;
    private Robot robot1;
    private Robot robot2;
    private int gomitoN;
    private Robot robot3;
    private int gomitoG;
    private float sumGrad;
    private boolean toShow=true;

    @Override
    public void settings() {
        super.settings();
        width = 1000;
        height = 980;
        size(width, height, P2D);
        pixelDensity(1);
        smooth(8);
    }

    @Override
    public void setup() {
        surface.setLocation(10,10);
        /*
        Phantom Robot
         */
        this.robot = new Robot();
        robot.buildRobot(settingRobot);
        robot.getLink(0).setColor(new float[]{255, 255, 255,125});
        robot.getLink(1).setColor(new float[]{255, 255, 255,125});
        robot.getLink(2).setColor(new float[]{255, 255, 255,125});

        /*
        Proportional Robot
         */
        this.robot1 = new Robot();
        robot1.buildRobot(settingRobot);
        robot1.getLink(0).setColor(new float[]{251, 140, 0,170});
        robot1.getLink(1).setColor(new float[]{251, 140, 0,170});
        robot1.getLink(2).setColor(new float[]{251, 140, 0,170});
        /*
        Newton Robot
         */

        this.robot2 = new Robot();
        robot2.buildRobot(settingRobot);
        robot2.getLink(0).setColor(new float[]{156, 39, 176,170});
        robot2.getLink(1).setColor(new float[]{156, 39, 176,170});
        robot2.getLink(2).setColor(new float[]{156, 39, 176,170});
        /*
        Gradient Robot
         */
        this.robot3 = new Robot();
        robot3.buildRobot(settingRobot);
        robot3.getLink(0).setColor(new float[]{141, 110, 99,170});
        robot3.getLink(1).setColor(new float[]{141, 110, 99,170});
        robot3.getLink(2).setColor(new float[]{141, 110, 99,170});

        this.gui = new Gui();

        Oscilloscope.getInstance().addPlot("EN",50,40,400,275);
        Oscilloscope.getInstance().addPlot("EG",50,10+40+275,400,275);
        Oscilloscope.getInstance().addPlot("EP",50,2*(30+275),400,275);

        Oscilloscope.getInstance().setPlotBuffer("EN",3);
        Oscilloscope.getInstance().setPlotBuffer("EG",3);
        Oscilloscope.getInstance().setPlotBuffer("EP",3);


        this.target = createTarget();
        yTarget = robot.getoPValue();

    }

    public PShape createTarget(){
        PShape targetShape = createShape(GROUP);

        PShape base = createShape(PConstants.ELLIPSE, 0, 0, 70, 70);
        base.setFill(color(118, 255, 3,50));
        base.setStrokeWeight(0.5f);

        PShape center = createShape(PConstants.ELLIPSE,0,0,30,30);
        center.setFill(color(118, 255, 3,50));
        center.setStrokeWeight(0.5f);

        PShape topLine = createShape(PConstants.LINE,0,5,0,40);
        PShape botLine = createShape(PConstants.LINE,0,-5,0,-40);
        PShape leftLine = createShape(PConstants.LINE,5,0,40,0);
        PShape rightLine = createShape(PConstants.LINE,-5,0,-40,0);

        targetShape.addChild(base);
        targetShape.addChild(center);
        targetShape.addChild(topLine);
        targetShape.addChild(botLine);
        targetShape.addChild(leftLine);
        targetShape.addChild(rightLine);

        return targetShape;
    }

    @Override
    public void draw() {
        float[] qNewton = newton(q1N,q2N,q3N,radians(phi),kN,(int)gomito);
        q1N = qNewton[0];
        q2N = qNewton[1];
        q3N = qNewton[2];


        float[] qP = proportionalLaw(q1,q2,q3,kP);
        q1 = qP[0];
        q2 = qP[1];
        q3 = qP[2];



        float[] qGradient = gradient(q1G,q2G,q3G,radians(phi),kG,(int)gomito);
        q1G = qGradient[0];
        q2G = qGradient[1];
        q3G = qGradient[2];

        background(187, 222, 251);
        /*
        GUI Init
        */
        image(gui.drawGui(),0,height-200f);
        textSize(60);
        fill(255);
        stroke(0);
        strokeWeight(1);
        text(TITLE,-80+width/2f,-400+height/2f);
        translate(width/2f,height/2f);

        /*
        Operational Space
         */
        beginShape();
        shape(robot.getoP());
        endShape();
        /*
        Target
         */

        if(targetVisibility){
            pushMatrix();
            translate(xTarget ,yTarget);
            rotate(radians(phi));
            shape(target);
            popMatrix();
        }
        /*
        Phantom Robot
         */
        robot.drawRobot(q1Ref,q2Ref,q3Ref);
        /*
        Proportional Robot
         */
        robot1.drawRobot(q1,q2,q3);
        /*
        Newton Robot
         */
        robot2.drawRobot(q1N-PI/2,q2N,q3N);

        /*
        Gradient Robot
         */
        robot3.drawRobot(q1G-PI/2,q2G,q3G);

         /*
        Draw Plot
         */
        pushMatrix();
        translate(-512,-512);
        Oscilloscope.getInstance().drawPlots();
        popMatrix();
    }

    private float[] gradient(float q1G, float q2G, float q3G, float phi, float kG, int gomito) {
        float link1 = robot.getLink(0).getHeightLink();
        float link2 = robot.getLink(1).getHeightLink();
        float link3 = robot.getLink(2).getHeightLink();
        if (gomitoG%2!=0) {
            q2G=q2G+gomito*PI;
            gomitoG++;
        }
        float s_2=sin(q2G);
//        if(s_2>-0.9) s_2+=-0.01;
        float s_1=sin(q1G);
        float c_2=cos(q2G);
        float c_1=cos(q1G);
        float c_3=cos(q3G);
        float s_3=sin(q3G);
        float c_123=c_1*c_2*c_3-s_1*s_2*c_3-s_1*c_2*s_3-c_1*s_2*s_3;
        float s_123=-s_1*s_2*s_3+s_1* c_2*c_3+c_1*s_2*c_3+c_1*c_2*s_3;
        float s_12=c_1*s_2 + c_2*s_1;
        float c_12=c_1*c_2-s_1*s_2;
        float s_23=c_2*s_3+s_2*c_3;
        float L_3=link3;
        float L_2=link2;
        float L_1=link1;
        float  Q1g=((L_3*c_123+L_2*c_12+L_1*c_1)*yTarget+(-L_3*s_123-L_2*s_12-L_1*s_1)*xTarget+phi-q3G-q2G-q1G);
        float Q2g=((L_3*c_123+L_2*c_12)*yTarget+(-L_3*s_123-L_2*s_12)*xTarget+L_1*L_3*s_23+L_1*L_2*s_2+phi-q3G-q2G-q1G);
        float Q3g=(L_3*c_123*yTarget-L_3*s_123*xTarget+phi+L_1*L_3*s_23+L_2*L_3*s_3-q3G-q2G-q1G);

        /*
        Check stop condition
         */
        float xCurr = link3 * cos(q1G + q2G + q3G) + link2 * cos(q1G + q2G) + link1 * cos(q1G);
        float yCurr = link3 * sin(q1G + q2G + q3G) + link2 * sin(q1G + q2G) + link1 * sin(q1G);
        float phiCurr = q1G + q2G + q3G;
        float errnorm = pow(xCurr-xTarget, 2) +
                pow(yCurr-yTarget, 2) +
                10000*pow(phiCurr-phi, 2);
//        pow(Q1g, 2) + pow(Q2g, 2) + pow(Q3g, 2)+
        sumGrad += errnorm;
        Q1g = Q1g/sqrt(sumGrad+epsilon);
        Q2g = Q2g/sqrt(sumGrad+epsilon);
        Q3g = Q3g/(sqrt(sumGrad+epsilon));
        if(abs(kG*Q1g)>0.0001) {
            Oscilloscope.getInstance().addPoint("EG", Q1g, 0);
        }
        if(abs(kG*Q2g)>0.0001) {
        Oscilloscope.getInstance().addPoint("EG",Q2g,1);
        }
        float q3New = (phi - q1G - q2G + kG * Q3g) / 2f;
        if(abs(q3New -q3G)>0.0001) {
            Oscilloscope.getInstance().addPoint("EG", Q3g, 2);
        }
        return new float[]{
                q1G+kG*Q1g,
                q2G+kG*Q2g,
//                q3G+kG*Q3g
                q3New
        };
    }

    private float[] proportionalLaw(float q1, float q2, float q3, float kP) {
        if(abs(q1Ref-q1)>0.001) {
            Oscilloscope.getInstance().addPoint("EP", (q1Ref - q1), 0);
        }
        if(abs(q2Ref-q2)>0.001) {
        Oscilloscope.getInstance().addPoint("EP",(q2Ref-q2),1);}
            if(abs(q3Ref-q3)>0.001) {
                Oscilloscope.getInstance().addPoint("EP", (q3Ref - q3), 2);
            }
        return new float[]{
                q1+kP*(q1Ref-q1),
                q2+kP*(q2Ref-q2),
                q3+kP*(q3Ref-q3)
        };
    }


    public void setRobotLink(ArrayList<Float[]> settingsRobot) {
        this.settingRobot = settingsRobot;
    }
    @Override
    public void keyPressed(){
        if(key=='X'||key=='x'){
            dx +=1;
        }else if(key=='C'||key=='c'){
            dx -=1;
        }else if(key=='Y'||key=='y'){
            dy +=1;
        }else if(key=='U'||key=='u'){
            dy -=1;
        }else if(key=='T'||key=='t'){
            targetVisibility=!targetVisibility;
        }else if(key=='P'||key=='p'){
            phi +=5;
            sumGrad=0f;
//            Oscilloscope.getInstance().resetPlot();

            exactIK();

        }else if(key=='L'||key=='l'){
            phi -=5;
            sumGrad=0f;
//            Oscilloscope.getInstance().resetPlot();

            exactIK();
        }else if(key=='E'||key=='e'){
            gomito = -gomito;
            gomitoN++;
            gomitoG++;
            sumGrad=0f;
//            Oscilloscope.getInstance().resetPlot();

            exactIK();
        }else if(key=='S'||key=='s'){

            Oscilloscope.getInstance().allVisible(toShow);
            toShow=!toShow;

        }else if(key == 'N'|| key=='n'){
            kN+=0.01;
        }else if(key == 'J'|| key=='j'){
            kN-=0.01;
        }else if(key == 'G'|| key=='g'){
            kG+=0.01;
        }else if(key == 'V'|| key=='v'){
            kG-=0.01;
        }else if(key == 'B'|| key=='b'){
            kP+=0.01;
        }else if(key == 'H'|| key=='h'){
            kP-=0.01;
        }
    }
    @Override
    public void mousePressed(){
        xTarget = this.mouseX-width/2f;
        yTarget = this.mouseY-height/2f;
        sumGrad=0f;
        Oscilloscope.getInstance().resetPlot();
        exactIK();
    }

    private void exactIK() {
        float link1 = robot.getLink(0).getHeightLink();
        float link2 = robot.getLink(1).getHeightLink();
        float link3 = robot.getLink(2).getHeightLink();
        float xpolso= xTarget-cos(radians(phi))*link3;
        float ypolso= yTarget-sin(radians(phi))*link3;
        if (sqrt(abs(pow(xpolso, 2)+pow(ypolso, 2)))<(link2+link1)
                &&
                sqrt(abs(pow(xpolso, 2)+pow(ypolso, 2)))>abs(link2-link1)) {
            target.getChild(0).setFill(color(118, 255, 3,50));
            target.getChild(1).setFill(color(118, 255, 3,50));

            println("Punto raggiungibile");
        } else {
            target.getChild(0).setFill(color(229, 57, 53,50));
            target.getChild(1).setFill(color(229, 57, 53,50));

            println("Punto non raggiungibile");
        }

        float a=(xpolso*xpolso+ypolso*ypolso-link1*link1-link2*link2)/(2*link1*link2);
        float c2=a;
        float s2=gomito*sqrt(abs(1-a*a));
        float b1=link1+c2*link2;
        float b2=link2*s2;
        float c1=b1*xpolso+b2*ypolso;
        float s1=-b2*xpolso+b1*ypolso;
        q1Ref = atan2(s1, c1)-PI/2;
        q2Ref = atan2(s2, c2);
        q3Ref=radians(phi)-(q2Ref+q1Ref)-PI/2;

    }

    public float[] newton(float q1,float q2,float q3,float phi, float k,int gomito){
        if (gomitoN%2!=0) {
            q2=q2+Math.signum(-this.q2)*PI;
            gomitoN--;
        }
        float link1 = robot2.getLink(0).getHeightLink();
        float link2 = robot2.getLink(1).getHeightLink();
        float link3 = robot2.getLink(2).getHeightLink();

        float s_2=sin(q2);
        if (abs(s_2)<0.01) {
//            println("Correzione Newton");
            s_2+=gomito*PI*0.01f;
        }
        float s_1=sin(q1);
        float c_2=cos(q2);
        float c_1=cos(q1);
        float c_3=cos(q3);
        float s_3=sin(q3);
        float s_12=c_1*s_2 + c_2*s_1;
        float c_12=c_1*c_2-s_1*s_2;
        float s_23=c_2*s_3+s_2*c_3;
        float c_23=c_2*c_3-s_2*s_3;
        float v = (-q2 - q1) * link3 - link3 * q3;
        float Q1=(s_12*yTarget+c_12*xTarget+link3*s_3*phi+ v *s_3-link3*c_3-link1*c_2-link2)/(link1*s_2);
        float Q2=-((link2*s_12+link1*s_1)*yTarget+(link2*c_12+link1*c_1)*xTarget+(link1*link3*s_23+link2*link3*s_3)*phi+((-link1*q2-link1*q1)*link3-link1*link3*q3)*s_23-link1*link3*c_23+((-link2*q2-q1*link2)*link3-link2*link3*q3)*s_3-link2*link3*c_3-2*link1*link2*c_2-link2*link2-link1*link1)/(link1*link2*s_2);
        float Q3=(s_1*yTarget+c_1*xTarget+(link3*s_23+link2*s_2)*phi+ v *s_23-link3*c_23+(-link2*q3-link2*q2-q1*link2)*s_2-link2*c_2-link1)/(link2*s_2);
        if(abs(k*Q1)>0.01) {
            Oscilloscope.getInstance().addPoint("EN", Q1, 0);
        }
        if(abs(k*Q2)>0.01) {
            Oscilloscope.getInstance().addPoint("EN", Q2, 1);
        }
        if(abs(k*Q3)>0.01) {
            Oscilloscope.getInstance().addPoint("EN", Q3, 2);
        }
        q1=q1+k*Q1;

        q2=q2+k*Q2;

        q3=q3+k*Q3;
        return new float[]{q1,q2,q3};
    }

    public float getxTarget() {
        return xTarget;
    }

    public void setxTarget(float xTarget) {
        this.xTarget = xTarget;
    }

    public float getyTarget() {
        return yTarget;
    }

    public void setyTarget(float yTarget) {
        this.yTarget = yTarget;
    }

    public float getQ1() {
        return q1;
    }

    public void setQ1(float q1) {
        this.q1 = q1;
    }

    public float getQ2() {
        return q2;
    }

    public void setQ2(float q2) {
        this.q2 = q2;
    }

    public float getQ3() {
        return q3;
    }

    public void setQ3(float q3) {
        this.q3 = q3;
    }

    public float getQ1N() {
        return q1N;
    }

    public void setQ1N(float q1N) {
        this.q1N = q1N;
    }

    public float getQ2N() {
        return q2N;
    }

    public void setQ2N(float q2N) {
        this.q2N = q2N;
    }

    public float getQ3N() {
        return q3N;
    }

    public void setQ3N(float q3N) {
        this.q3N = q3N;
    }

    public float getQ1G() {
        return q1G;
    }

    public void setQ1G(float q1G) {
        this.q1G = q1G;
    }

    public float getQ2G() {
        return q2G;
    }

    public void setQ2G(float q2G) {
        this.q2G = q2G;
    }

    public float getQ3G() {
        return q3G;
    }

    public void setQ3G(float q3G) {
        this.q3G = q3G;
    }

    public float getPhi() {
        return phi;
    }

    public void setPhi(float phi) {
        this.phi = phi;
    }

    public float getkN() {
        return kN;
    }

    public void setkN(float kN) {
        this.kN = kN;
    }

    public float getkP() {
        return kP;
    }

    public void setkP(float kP) {
        this.kP = kP;
    }

    public float getkG() {
        return kG;
    }

    public void setkG(float kG) {
        this.kG = kG;
    }

    public float getGomito() {
        return gomito;
    }

    public void setGomito(float gomito) {
        this.gomito = gomito;
    }

    public float getQ1Ref() {
        return q1Ref;
    }

    public void setQ1Ref(float q1Ref) {
        this.q1Ref = q1Ref;
    }

    public float getQ2Ref() {
        return q2Ref;
    }

    public void setQ2Ref(float q2Ref) {
        this.q2Ref = q2Ref;
    }

    public float getQ3Ref() {
        return q3Ref;
    }

    public void setQ3Ref(float q3Ref) {
        this.q3Ref = q3Ref;
    }
}