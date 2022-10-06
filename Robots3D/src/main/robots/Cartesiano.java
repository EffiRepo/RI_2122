package main.robots;

import main.Robot;
import processing.core.PApplet;

import static processing.core.PConstants.PI;

public class Cartesiano extends Robot {
    public Cartesiano(PApplet p3d) {
        // richiamo il costruttore del padre
        super(p3d);
        // inizializzo e/o resetto
        reset();
    }

    @Override
    public void dh(float theta, float d, float alpha, float a, int i, boolean phantom) {
        super.dh(theta, d, alpha, a, i, phantom);
        // parametro per la verifica di un giunto terminale
        boolean isTerm = false;
        // parametro per la verifica di un link orizzontale
        boolean isHorz = false;
        // angolo per la rotazione in orizzontale
        float angle = 0;
        if(i == 1) {
            isHorz = true;
            angle = PI/2;
        } else if(i == 2) {
            isTerm = true;
        }
        // disegno il link i-esimo
        link(theta,d,alpha,a,isTerm,isHorz,angle,false,phantom);
        // mostro S.d.R. i-esimo
        frames.get(i).show(toShow);

    }

    @Override
    protected void reset() {
        q = q == null? new float[]{100,100,100} : getQ();
        qRef = new float[]{100,100,100};
        setTheta(new float[]{0,-PI/2,0});
        setD(q);
        setAlpha(new float[]{-PI/2,-PI/2,0});
        setA(new float[]{0,0,0});
        setTable(new float[][]{theta, d, alpha, a});
    }

    @Override
    public void setTable(float[] q) {
        setD(q);
        setTable(new float[][]{theta,d,alpha,a});
    }



}
