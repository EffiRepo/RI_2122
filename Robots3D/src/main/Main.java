package main;

import main.robots.Cartesiano;
import main.robots.Cilindrico;
import main.robots.Scara;
import main.robots.Stanford;
import processing.core.PApplet;

public class Main extends PApplet {
    public static void main(String[] args) {

        Base3D world = new Base3D();
        world.setRobot(new Cilindrico(world));
        world.run(world.getClass().getSimpleName());
    }
}