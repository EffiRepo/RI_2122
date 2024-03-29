package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PApplet.degrees;
import static processing.core.PApplet.radians;
import static processing.core.PConstants.PI;

public class Cilindrico extends Robot {
    public Cilindrico(PApplet p3d) {
        super(p3d);
        reset();
    }

    @Override
    public void dh(float theta, float d, float alpha, float a, int i, boolean phantom) {
        super.dh(theta, d, alpha, a, i, phantom);
        boolean isTerm = false;
        boolean isHorz = false;
        float angle = 0;
        if (i == 2) {
            isHorz = true;
            angle = PI / 2;
            isTerm = true;
        }
        link(theta, d, alpha, a, isTerm, isHorz, angle, false,phantom);
        frames.get(i).show(toShow);
    }

    @Override
    protected void reset() {
        qRef = new float[]{0, 50, 50};
        q = q == null ? new float[]{0, 50, 50} : getQ();
        setTheta(new float[]{q[0], 0, 0});
        setD(new float[]{100, q[1], q[2]});
        setAlpha(new float[]{0, -PI / 2, 0});
        setA(new float[]{0, 0, 0});
        setTable(new float[][]{theta, d, alpha, a});
    }

    @Override
    public void setTable(float[] q) {
        setTheta(new float[]{radians(q[0]), 0,0});
        setD(new float[]{100, q[1], q[2]});
        setTable(new float[][]{theta, d, alpha, a});

    }
}