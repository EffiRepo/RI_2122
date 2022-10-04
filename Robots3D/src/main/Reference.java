package main;

import processing.core.PApplet;
import processing.core.PVector;

public class Reference {
    private PVector origin;
    private final PApplet p3d;

    // default constructor for origin show reference
    public Reference(PApplet p3d) {
        this.p3d = p3d;
        this.origin = new PVector(0, 0, 0);
    }

    // constructor to set show reference's coordinates
    public Reference(PApplet p3d, float x, float y, float z) {
        this.p3d = p3d;
        this.origin = new PVector(x, y, z);
    }

    // analog of the previous constructor but with PVector item
    public Reference(PApplet p3d, PVector position) {
        this.p3d = p3d;
        this.origin = position;
    }


    public PVector getOrigin() {
        return this.origin;
    }

    public void setOrigin(float newX, float newY, float newZ) {
        this.origin.x = newX;
        this.origin.y = newY;
        this.origin.z = newZ;
    }

    public void setOrigin(PVector newOrigin) {
        this.origin = newOrigin;
    }

    public void show(boolean show) {
        // reference coordinates
        p3d.pushMatrix();
//        p3d.translate(origin.x, origin.y, origin.z);
        float alpha = show ? 255.0f : 0.0f;
        p3d.strokeWeight(3);
        // x-axis
        p3d.stroke(255, 0, 0, alpha);
        float length = 200.0f;
        p3d.line(0, 0, 0, length, 0, 0);
        // y-axis
        p3d.stroke(0, 255, 0, alpha);
        p3d.line(0, 0, 0, 0, length, 0);
        // z-axis
        p3d.stroke(0, 0, 255, alpha);
        p3d.line(0, 0, 0, 0, 0, length);
        // show

        if (show) {
            p3d.strokeWeight(1);
            p3d.stroke(0);
            p3d.fill(153, 204, 204);
            p3d.box(5.0f);
            p3d.noFill();
        }
        p3d.noStroke();
        p3d.popMatrix();

    }

}