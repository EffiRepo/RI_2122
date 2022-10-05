package main;

import processing.core.PApplet;

public class Main {
    public static final Base3D world = new Base3D();
    public static void main(String[] args) {
        world.run(world.getClass().getSimpleName());
    }
}