package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PConstants.PI;

public class Puma extends Robot {

    public Puma(PApplet p3d) {
        super(p3d);
        reset();
    }
    @Override
    protected void dh(float theta, float d, float alpha, float a, int i) {
        super.dh(theta, d, alpha, a, i);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i == 1) {
            isHorz = true;
            angle = PI/2;
        }
        if(i == 5) isTerm = true;
        link(theta,d,alpha,a,isTerm,isHorz,angle,false);
        frames.get(i).show(toShow);
    }
    @Override
    public void setTable(float[] q) {
        setTheta(q);
        setTable(new float[][]{theta,d,alpha,a});
    }

    @Override
    protected void reset() {
        qRef = new float[]{0,0,0,0,0,0};
        q = q == null? new float[]{0,0,0,0,0,0}: getQ();
        setTheta(q);
        setD(new float[]{100,0,0,80,0,60});
        setAlpha(new float[]{-PI/2,0,PI/2,-PI/2,PI/2,0});
        setA(new float[]{0,80,0,0,0,0});
        setTable(qProp(qRef, kp));
    }
}
