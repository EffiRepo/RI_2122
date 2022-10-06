package main;

import main.plot.Oscilloscope;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import processing.core.PApplet;
import processing.core.PShape;

import java.beans.PropertyChangeEvent;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import static java.lang.Math.abs;
import static main.Colors.*;
import static processing.core.PApplet.*;
import static processing.core.PConstants.CLOSE;

import java.beans.PropertyChangeListener;

public abstract class Robot implements PropertyChangeListener{
    // theta
    protected float[] theta;
    // d
    protected float[] d;
    // Alpha
    protected float[] alpha;
    // a
    protected float[] a;
    // joints
    protected float[] q;

    protected int[][] ELBOW;

    // DH table
    protected float[][] table;
    public abstract void setTable(float[] q);   // ogni figlio setta le sue variabili di giunto in tabella
    public float[][] getTable(){
        return new float[][]{this.theta, this.d, this.alpha, this.a};
    }
    protected Reference frameZero;
    protected List<Reference> frames;
    protected int baseColor;
    protected int[] robotColor;
    // raggio inferiore della base
    protected float baseR1;
    // raggio superiore della base
    protected float baseR2;
    // altezza base
    protected float baseH;
    // numero di lati per renderizzare la base
    protected int sides;
    // raggio sfera del link
    protected int sphereRadius;
    // diametro cilindro
    protected int boxSize;
    // booleano per mostrare i S.d.R.
    protected boolean toShow;
    // parametro del controllo proporzionale
    protected float kp = (float) 0.01;
    // valore di riferimento dei giunti
    protected float[] qRef;
    // riferimento a processing
    protected PApplet p3d;
    // modello della pinza
    protected PShape gripper;

    protected static final Logger LOGGER = LoggerFactory.getLogger(Robot.class.getName());

    protected Robot(PApplet p3d){
        this.p3d = p3d;
        this.frameZero = new Reference(p3d);
        this.frameZero.setOrigin(0,0,-230);
        baseColor = colorWrap(DARK_RED);
        baseR1 = 50;
        baseR2 = 50;
        baseH = 15;
        sides = 20;
        sphereRadius = 20;
        boxSize = 20;
        robotColor = new int[]{colorWrap(ORANGE),colorWrap(MAGENTA)};
        this.toShow = true;
        table =  new float[][]{this.theta, this.d, this.alpha, this.a};
        frames = new ArrayList<>();
        frames.add(frameZero);
    }

    protected void loadGripper() {
        File file = p3d.sketchFile("models/r6c.obj");
        String objPath = file.getAbsolutePath();
        gripper = p3d.loadShape(objPath);
        gripper.scale(0.3f);
        gripper.setFill(colorWrap(DARK_RED));
    }

    protected void draw(){
        // set origin
        p3d.translate(frameZero.getOrigin().x,frameZero.getOrigin().y,frameZero.getOrigin().z);
        p3d.fill(baseColor);
        p3d.pushMatrix();
        p3d.translate(0,0, -10);
        drawCylinder(sides, baseR1, baseR2, baseH);
        p3d.popMatrix();
        frameZero.show(toShow);
        // draw robot
        // inizializzo controllo proporzionale
        float[] qNew = qProp(qRef, kp);
        // setto la tabella con i nuovi valori
        setTable(qNew);
        for (int i = 0; i < q.length; i++) {
            dh(table[0][i], table[1][i], table[2][i], table[3][i], i);
        }

    }

    @Override
    public void propertyChange(PropertyChangeEvent evt) {
        String eventName = evt.getPropertyName();
        switch (eventName){
            case "QUPDATE" -> {
                this.qRef = (float[]) evt.getNewValue();
            }
        }
    }
    protected void drawCylinder( int sides, float r1, float r2, float h) {
        p3d.noStroke();
        float angle = 360f / sides;
        float halfHeight = h / 2;
        // top
        p3d.beginShape();
        for (int i = 0; i < sides; i++) {
            float x = cos( radians( i * angle ) ) * r1;
            float y = sin( radians( i * angle ) ) * r1;
            p3d.vertex( x, y, -halfHeight);
        }
        p3d.endShape(CLOSE);
        // bottom
        p3d.beginShape();
        for (int i = 0; i < sides; i++) {
            float x = cos( radians( i * angle ) ) * r2;
            float y = sin( radians( i * angle ) ) * r2;
            p3d.vertex( x, y, halfHeight);
        }
        p3d.endShape(CLOSE);
        // draw body
        p3d.beginShape(TRIANGLE_STRIP);
        for (int i = 0; i < sides + 1; i++) {
            float x1 = cos( radians( i * angle ) ) * r1;
            float y1 = sin( radians( i * angle ) ) * r1;
            float x2 = cos( radians( i * angle ) ) * r2;
            float y2 = sin( radians( i * angle ) ) * r2;
            p3d.vertex( x1, y1, -halfHeight);
            p3d.vertex( x2, y2, halfHeight);
        }
        p3d.endShape(CLOSE);
    }

    public int colorWrap(Colors color){
        int[] colorVector = color.getColor();
        return this.p3d.color(colorVector[0],colorVector[1],colorVector[2],colorVector[3]);
    }

    protected void link(float theta, float d, float alpha, float a, boolean isTerm, boolean isHorz, float angle, boolean turnGripple){
        // ruoto su Z
        p3d.rotateZ(theta);
        // metto sfera viola
        p3d.fill(colorWrap(VIOLET));
        p3d.sphere(sphereRadius);
        // traslo su Z fino al bc del link
        p3d.translate(0, 0, d/2);
        p3d.pushMatrix();
        // disegno cilindro giallo
        p3d.fill(colorWrap(DARK_YELLOW));
        drawCylinder(sides, boxSize / 2f, boxSize / 2f, d);
        p3d.popMatrix();
        // traslo fino all'estremità del giunto
        p3d.translate(0, 0, d/2);
        // ruoto su X
        p3d.rotateX(alpha);
        // traslo su X come ho fatto prima su Z
        p3d.translate(a/2, 0, 0);
        p3d.pushMatrix();
        // verifico che il giunto sia orizzontale e in tal caso ruoto
        if(isHorz) {
            p3d.rotateY(angle);
        }
        // disegno cilindro giallo
        p3d.fill(colorWrap(DARK_YELLOW));
        drawCylinder(sides, boxSize / 2f, boxSize / 2f, a);
        p3d.popMatrix();
        p3d.translate(a/2, 0, 0);
        // verifico che il giunto è terminale, in tal caso aggancio l'end-effector
        if (isTerm){
            p3d.fill(colorWrap(DARK_RED));
            p3d.sphere(sphereRadius/2f);
            p3d.pushMatrix();
            // se la configurazione mi porta a non avere l'EF lungo il link, ruoto
            if(turnGripple) p3d.rotateY(PI/2);
            p3d.translate(0,0,10);
            p3d.shape(gripper);
            p3d.popMatrix();
        }
    }

    protected void dh(float theta, float d, float alpha, float a, int i){
        if( frames.size() <= table[0].length  )
            frames.add(i+1,new Reference(p3d));
    }

    public float[] qProp(float[] qRef, float k) {
        float[] qNew = this.q;
        for (int i = 0; i < qRef.length; i++) {
            float diff = qRef[i] - qNew[i];
            if (abs(diff) != 0) {
                if(abs(diff) > 1e-3) Oscilloscope.getInstance().addPoint("E",diff,i);
                qNew[i] = qNew[i] + k * (diff);
            }
        }
        setQ(qNew);
        return qNew;
    }

    protected abstract void reset();

    public float[] getQ() {
        return q;
    }

    public void setQ(float[] q) {
        this.q = q;
    }

    public float[] getD() {
        return d;
    }

    public void setD(float[] d) {
        this.d = d;
    }

    public float[] getAlpha() {
        return alpha;
    }

    public void setAlpha(float[] alpha) {
        this.alpha = alpha;
    }

    public float[] getA() {
        return a;
    }
    public void setA(float[] a) {
        this.a = a;
    }

    protected void setTable(float[][] table){ this.table = table; }

    public boolean isToShow() {
        return toShow;
    }

    public void setToShow(boolean toShow) {
        this.toShow = toShow;
    }

    public float[] getTheta() {
        return theta;
    }
    public void setTheta(float[] theta) {
        this.theta = theta;
    }
    public void turnFrames(){
        for (Reference r : frames){
            r.show(!toShow);
        }
    }

    public float getKp() {
        return kp;
    }

    public void setKp(float kp) {
        this.kp = (float) Math.min(Math.max(0.01, kp), 0.09);
    }

    public float[] getqRef() {
        return qRef;
    }

    public void setqRef(float[] qRef) {
        this.qRef = qRef;
    }

    public List<Reference> getFrames() {
        return frames;
    }
}
