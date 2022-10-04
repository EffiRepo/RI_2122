package main;

import processing.core.PApplet;

import static main.Colors.VIOLET;
import static processing.core.PConstants.PI;

public class Stanford extends Robot{
//    private static final float d1 = 100;
//    private static final float d2 = 100;
//    private static final float d3 = 50;

    protected Stanford(PApplet p3d) {
        super(p3d);
        d = new float[]{100f,100f,50};
        q = new float[]{0,0,0};
        alpha = new float[]{-PI/2,PI/2,0};
    }

    @Override
    public void draw(){
        super.draw();
        for (int i = 0; i < q.length; i++)
            dh(q[i], d[i], alpha[i], a[i], i);
    }
    @Override
    public void dh(float theta, float d, float alpha, float a, int i){
        if( frames.size() <= table.length  )
            frames.add(i,new Reference(p3d));
        p3d.rotateZ(theta);
        p3d.fill(colorWrap(VIOLET));
        p3d.sphere(sphereRadius);
        if(i == table.length)
            p3d.translate(0, 0, q[i]/2);
        else
            p3d.translate(0, 0, d/2);
        drawCylinder(sides,boxSize/2f,boxSize/2f,d);
        if(i == table.length)
            p3d.translate(0, 0, q[i]/2);
        else
            p3d.translate(0, 0, d/2);
        p3d.sphere(sphereRadius);
        p3d.rotateX(alpha);
        p3d.translate(a, 0, 0);
//        drawCylinder(sides,boxSize/2f,boxSize/2f,d);
        frames.get(i).show(toShow);
    }
    @Override
    public void setTable(float[] q, float[] d, float[] alpha, float[] a) {
        // empty
    }
}
