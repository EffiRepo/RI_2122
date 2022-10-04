package main;

import processing.core.PApplet;

public class Main extends PApplet {
    public static void main(String[] args) {

        Base3D world = new Base3D();
        world.setRobot(new Stanford(world));
        world.run(world.getClass().getSimpleName());
    }
}