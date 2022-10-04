package main.robots;

import main.Reference;
import main.Robot;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import processing.core.PApplet;

import java.beans.PropertyChangeEvent;

import static main.Colors.*;
import static processing.core.PConstants.PI;

public class Stanford extends Robot {

    //! WARNING: WHEN PLOTTING q[3] MUST BE MULTIPLIED BY 4.

    public Stanford(PApplet p3d) {
        super(p3d);
        reset();
    }
    @Override
    public void draw(){
        super.draw();


    }

    @Override
    public void dh(float theta, float d, float alpha, float a, int i){
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
        q = new float[]{0,0,30};
        theta = new float[]{q[0],q[1],0};
        d = new float[]{100f,120f,0};
        alpha = new float[]{-PI/2,PI/2,0};
        a = new float[]{0,0,0};
        table = new float[][]{q,d,alpha,a};
    }

    @Override
    public void setTable(float[] q) {
        theta[0] = q[0];
        theta[1] = q[1];
        d[2] = M*q[2];
        setTable(new float[][]{theta,d,alpha,a});
    }
}
