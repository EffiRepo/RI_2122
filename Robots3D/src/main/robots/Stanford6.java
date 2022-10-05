package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PApplet.radians;
import static processing.core.PConstants.PI;

public class Stanford6 extends Robot {

    public Stanford6(PApplet p3d) {
        super(p3d);
        reset();
    }
    @Override
    protected void dh(float theta, float d, float alpha, float a, int i) {
        super.dh(theta, d, alpha, a, i);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if(i == 5) isTerm = true;
        link(theta,d,alpha,a,isTerm,isHorz,angle,false);
        frames.get(i).show(toShow);
    }
    @Override
    public void setTable(float[] q) {
        setTheta(new float[]{q[0],q[1],-PI/2,q[3],q[4],q[5]});
        setD(new float[]{100,80,q[2],0,0,60});
        setTable(new float[][]{theta,d,alpha,a});
    }

    @Override
    protected void reset() {
        setQ(new float[]{0,0,50,0,0,0});
        setTheta(new float[]{q[0],q[1],-PI/2,q[3],q[4],q[5]});
        setD(new float[]{100,80,q[2],0,0,60});
        setAlpha(new float[]{-PI/2,PI/2,0,-PI/2,PI/2,0});
        setA(new float[]{0,0,0,0,0,0});
        setTable(new float[][]{q,d,alpha,a});
        qRef = q.clone();
    }
}
