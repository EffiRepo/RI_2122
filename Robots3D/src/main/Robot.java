package main;

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
    protected float[] q = new float[]{0, 0, 0, 0, 0, 0};
    // d
    protected float d1 = 0f;
    protected float d2 = 0f;
    protected float d3 = 0f;
    protected float d4 = 0f;
    protected float d5 = 0f;
    protected float d6 = 0f;
    protected float[] d = new float[]{d1, d2, d3, d4, d5, d6};
    // Alpha
    protected float alpha1 = 0f;
    protected float alpha2 = 0f;
    protected float alpha3 = 0f;
    protected float alpha4 = 0f;
    protected float alpha5 = 0f;
    protected float alpha6 = 0f;
    protected float[] alpha = new float[]{alpha1, alpha2, alpha3, alpha4, alpha5, alpha6};
    // a
    protected float a1 = 0f;
    protected float a2 = 0f;
    protected float a3 = 0f;
    protected float a4 = 0f;
    protected float a5 = 0f;
    protected float a6 = 0f;
    protected float[] a = new float[]{a1, a2, a3, a4, a5, a6};
    protected int[][] ELBOW;
    protected boolean start;
    protected float[] theta = new float[]{0,0,0,0,0,0};

    public abstract void setTable(float[] q);
    public float[][] getTable(){
        return new float[][]{this.theta, this.d, this.alpha, this.a};
    }
    protected float[][] table;
    protected Reference frameZero;
    protected List<Reference> frames;
    protected int baseColor;
    protected int[] robotColor;
    protected float baseR1;
    protected float baseR2;
    protected float baseH;
    protected int sides;
    protected int sphereRadius;
    protected int boxSize;
    protected boolean toShow;
    protected float k = (float) 0.01;
    protected float[] qRef;
    protected PApplet p3d;
    protected PShape gripper;
    protected static final Logger LOGGER = LoggerFactory.getLogger(Robot.class.getName());
    protected static final int M  = 5;
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
        qRef = q.clone();
        robotColor = new int[]{colorWrap(ORANGE),colorWrap(MAGENTA)};
        this.toShow = true;
        table =  new float[][]{this.q, this.d, this.alpha, this.a};
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
        drawCylinder(sides, baseR1, baseR2, baseH);
        frameZero.show(toShow);
        // draw robot
        p3d.pushMatrix();
        float[] qNew = qProp(qRef,k);
        setTable(qNew);
        for (int i = 0; i < q.length; i++) {
            dh(table[0][i], table[1][i], table[2][i], table[3][i], i);
        }
        p3d.popMatrix();
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
        p3d.rotateZ(theta);
        p3d.fill(colorWrap(VIOLET));
        p3d.sphere(sphereRadius);
        p3d.translate(0, 0, d/2);
        p3d.pushMatrix();
        p3d.fill(colorWrap(DARK_YELLOW));
        drawCylinder(sides, boxSize / 2f, boxSize / 2f, d);
        p3d.popMatrix();
        p3d.translate(0, 0, d/2);
        p3d.rotateX(alpha);
        p3d.translate(a/2, 0, 0);
        p3d.pushMatrix();
        if(isHorz) {
            p3d.rotateY(angle);
        }
        p3d.fill(colorWrap(DARK_YELLOW));
        drawCylinder(sides, boxSize / 2f, boxSize / 2f, a);
        p3d.popMatrix();
        p3d.translate(a/2, 0, 0);
        if (isTerm){
            p3d.fill(colorWrap(DARK_RED));
            p3d.sphere(sphereRadius/2f);
            p3d.pushMatrix();
            if(turnGripple) p3d.rotateY(PI/2);
            p3d.translate(0,0,10);
            p3d.shape(gripper);
            p3d.popMatrix();
        } else {
            p3d.fill(colorWrap(VIOLET));
            p3d.sphere(sphereRadius);
        }
    }

    protected void dh(float theta, float d, float alpha, float a, int i){
        if( i <= table[0].length  )
            frames.add(i+1,new Reference(p3d));
    }

    public float[] qProp(float[] qRef, float k) {
        float[] qNew = this.q;
        for (int i = 0; i < qRef.length; i++) {
            float diff = qRef[i] - qNew[i];
            if (abs(diff) != 0) {
                qNew[i] = qNew[i] + k * (diff);
            }
        }
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

    public List<Reference> getFrames() {
        return frames;
    }
}
