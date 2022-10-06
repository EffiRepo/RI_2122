package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PApplet.radians;
import static processing.core.PConstants.PI;

public class Polso extends Robot {

    public Polso(PApplet p3d) {
        super(p3d);
        reset();
    }


    @Override
    protected void dh(float theta, float d, float alpha, float a, int i) {
        super.dh(theta, d, alpha, a, i);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i == 2) {
            isTerm = true;
        }
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
        qRef = new float[]{PI/2,0,0};
        q = q == null? new float[]{PI/2,0,0}: getQ();
        setTheta(q);
        setD(new float[]{0,0,100f});
        setAlpha(new float[]{-PI/2,PI/2,0});
        setA(new float[]{0,0,0});
        setTable(new float[][]{theta,d,alpha,a});
    }
}
