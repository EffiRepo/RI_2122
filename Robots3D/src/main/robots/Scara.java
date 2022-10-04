package main.robots;

import main.Robot;
import processing.core.PApplet;

import java.beans.PropertyChangeEvent;

import static main.Colors.*;
import static processing.core.PConstants.PI;

public class Scara extends Robot {
    @Override
    public void setTable(float[] q) {
        theta[0] = q[0];
        theta[1] = q[1];
        d[2] = M*q[2];
        setTable(new float[][]{theta,d,alpha,a});
    }

    //! WARNING: WHEN PLOTTING q[3] MUST BE MULTIPLIED BY 4.
    public Scara(PApplet p3d) {
        super(p3d);
        reset();

    }
    @Override
    protected void dh(float theta, float d, float alpha, float a, int i) {
        super.dh(theta, d, alpha, a, i);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i < 2) {
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
        q = new float[]{0,0,30};
        d = new float[]{100f,0,0};
        alpha = new float[]{0,0,0};
        a = new float[]{80,80,0};
        table = new float[][]{q,d,alpha,a};
        qRef = q.clone();
    }


}
