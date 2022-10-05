package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PApplet.radians;
import static processing.core.PConstants.PI;

public class Cilindrico extends Robot {
    public Cilindrico(PApplet p3d) {
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
            isHorz = true;
            angle = PI/2;
            isTerm = true;
        }
        link(theta,d,alpha,a,isTerm,isHorz,angle,false);
        frames.get(i).show(toShow);
    }

    @Override
    protected void reset() {
        setQ(new float[]{PI/2,30,30});
        setTheta(new float[]{q[0],0,0});
        setD(new float[]{80f,M*q[1],M*q[2]});
        setAlpha(new float[]{0,-PI/2,0});
        setA(new float[]{0,0,0});
        setTable(new float[][]{q,d,alpha,a});
        qRef = q.clone();
    }

    @Override
    public void setTable(float[] q) {
        theta[0] = radians(q[0]);
        d[1] = q[1];
        d[2] = q[2];
        setTable(new float[][]{theta,d,alpha,a});

    }

}
