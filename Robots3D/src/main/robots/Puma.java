package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PApplet.degrees;
import static processing.core.PApplet.radians;
import static processing.core.PConstants.PI;

public class Puma extends Robot {

    public Puma(PApplet p3d) {
        super(p3d);
        reset();
    }
    @Override
    public void dh(float theta, float d, float alpha, float a, int i, boolean phantom) {
        super.dh(theta, d, alpha, a, i, phantom);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i == 1) {
            isHorz = true;
            angle = PI/2;
        }
        if(i == 5) isTerm = true;
        link(theta,d,alpha,a,isTerm,isHorz,angle,false,phantom);
        frames.get(i).show(toShow);
    }
    @Override
    public void setTable(float[] q) {
        setTheta(new float[]{radians(q[0]),radians(q[1]),radians(q[2]),
                radians(q[3]),radians(q[4]),radians(q[5])});
        setTable(new float[][]{theta,d,alpha,a});
    }

    @Override
    protected void reset() {
        qRef = new float[]{degrees(PI/2),0,0,0,0,0};
        q = q == null? new float[]{degrees(PI/2),0,0,0,0,0}: getQ();
        setTheta(q);
        setD(new float[]{100,0,0,80,0,60});
        setAlpha(new float[]{-PI/2,0,PI/2,-PI/2,PI/2,0});
        setA(new float[]{0,80,0,0,0,0});
        setTable(new float[][]{theta,d,alpha,a});

    }
}
