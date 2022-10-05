package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PConstants.PI;

public class Antropomorfo extends Robot {
    public Antropomorfo(PApplet p3d) {
        super(p3d);
        reset();
    }
    @Override
    protected void dh(float theta, float d, float alpha, float a, int i) {
        super.dh(theta, d, alpha, a, i);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i > 0) {
            isHorz = true;
            angle = PI/2;
        }
        if(i == 2) {
            isTerm = true;
        }
        link(theta,d,alpha,a,isTerm,isHorz,angle,true);
        frames.get(i).show(toShow);
    }
    @Override
    public void setTable(float[] q) {
        setTheta(new float[]{q[0],q[1],q[2]});
        setTable(new float[][]{q,d,alpha,a});
    }

    @Override
    protected void reset() {
        qRef = new float[]{PI/2,0,0};
        q = q == null? new float[]{PI/2,0,0} : getQ();
        setTheta(new float[]{q[0],q[1],q[2]});
        setD(new float[]{100,0,0});
        setAlpha(new float[]{PI/2,0,0});
        setA(new float[]{0,80,50});
        setTable(new float[][]{theta, d, alpha, a});
    }
}
