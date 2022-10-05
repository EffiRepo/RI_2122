package main.robots;

import main.Robot;
import processing.core.PApplet;

import java.beans.PropertyChangeEvent;

import static main.Colors.VIOLET;
import static processing.core.PConstants.PI;

public class Cartesiano extends Robot {
    public Cartesiano(PApplet p3d) {
        super(p3d);
        reset();
    }

    @Override
    public void dh(float theta, float d, float alpha, float a, int i) {
        super.dh(theta, d, alpha, a, i);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i == 1) {
            isHorz = true;
            angle = PI/2;
        } else if(i == 2) {
            isTerm = true;
        }
        link(theta,d,alpha,a,isTerm,isHorz,angle,false);
        frames.get(i).show(toShow);

    }

    @Override
    protected void reset() {
        setQ(new float[]{30,30,30});
        setD(new float[]{M*q[0],M*q[1],M*q[2]});
        setTheta(new float[]{0,-PI/2,0});
        setAlpha(new float[]{-PI/2,-PI/2,0});
        setA(new float[]{0,0,0});
        setTable(new float[][]{q,d,alpha,a});
        qRef = q.clone();
    }

    @Override
    public void setTable(float[] q) {
        d[0] = q[0];
        d[1] = q[1];
        d[2] = q[2];
        setTable(new float[][]{theta,d,alpha,a});
    }



}
