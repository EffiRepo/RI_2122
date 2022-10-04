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
        link(theta,d,alpha,a,isTerm,isHorz,angle);
        frames.get(i).show(toShow);

    }

    @Override
    protected void reset() {
        q = new float[]{30,30,30};
        d = new float[]{M*q[0],M*q[1],M*q[2]};
        theta = new float[]{0,-PI/2,0};
        alpha = new float[]{-PI/2,-PI/2,0};
        a = new float[]{0,0,0};
        table = new float[][]{q,d,alpha,a};
        qRef = q.clone();
    }

    @Override
    public void setTable(float[] q) {
        d[0] = M*q[0];
        d[1] = M*q[1];
        d[2] = M*q[2];
        setTable(new float[][]{theta,d,alpha,a});
    }



}
