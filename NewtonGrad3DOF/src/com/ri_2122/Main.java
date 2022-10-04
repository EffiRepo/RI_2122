package com.ri_2122;

import processing.core.PApplet;

public class Main {

    public static void main(String[] args){
        ProcessingMain pm = new ProcessingMain();
        String[] processingArgs = {"com.ri_2122."+pm.getClass().getSimpleName()};
        PApplet.runSketch(processingArgs, pm);
    }
}