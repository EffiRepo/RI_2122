package main;

import org.apache.commons.math3.linear.MatrixUtils;
import org.apache.commons.math3.linear.RealMatrix;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Vector;

import static java.lang.Math.cos;
import static java.lang.Math.sin;

public class RobotUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(RobotUtils.class);
    public static final float MIN = 30f;
    public static final float MAX = 200f;

    public static void printR(RealMatrix realMatrix) {
        LOGGER.info("\n[{},{},{}]\n[{},{},{}]\n[{},{},{}]",
                realMatrix.getEntry(0, 0), realMatrix.getEntry(0, 1), realMatrix.getEntry(0, 2),
                realMatrix.getEntry(1, 0), realMatrix.getEntry(1, 1), realMatrix.getEntry(1, 2),
                realMatrix.getEntry(2, 0), realMatrix.getEntry(2, 1), realMatrix.getEntry(2, 2));
    }

    private static double[][] rotateZm(float theta) {
        return new double[][]{{cos(theta), -sin(theta), 0},
                {sin(theta), cos(theta), 0},
                {0d, 0d, 1}};
    }

    private static double[][] rotateYm(float theta) {
        return new double[][]{{cos(theta), 0, sin(theta)},
                {0d, 1d, 0d},
                {-sin(theta), 0, cos(theta)}};
    }

    private static double[][] rotateXm(float theta) {
        return new double[][]{{1, 0, 0}, {0, cos(theta), -sin(theta)}, {0, sin(theta), cos(theta)}};
    }

    private static double[][] translateM(float x, float y, float z) {
        return new double[][]{{x}, {y}, {z}};
    }

    private static double[][] rotor(String axis, float theta, float d) {
        double[][] av = new double[][]{{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 1}};
        double[][] rotationMatrix = new double[][]{};
        double[][] transformMatrix = new double[][]{};
        if (axis.equals("x")) {
            rotationMatrix = rotateXm(theta);
            transformMatrix = translateM(d, 0, 0);
        } else if (axis.equals("z")) {
            rotationMatrix = rotateZm(theta);
            transformMatrix = translateM(0, 0, d);
        }
        for (int i = 0; i < 3; i++) {
            System.arraycopy(rotationMatrix[i], 0, av[i], 0, 3);
        }
        for (int k = 0; k < 3; k++) {
            av[k][3] = transformMatrix[k][0];
        }
        return av;
    }

    public static double[][] dhValue(Vector<Vector<Float>> dhTable) {
        double[][] value = new double[][]{{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 1}};
        RealMatrix qMatrix = MatrixUtils.createRealIdentityMatrix(4);
        for (Vector<Float> dhRow : dhTable) {
            float qValue = dhRow.get(0);
            float dValue = dhRow.get(1);
            float alphaValue = dhRow.get(2);
            float aValue = dhRow.get(3);
            double[][] qZi = rotor("z", qValue, dValue);
            double[][] qXi = rotor("x", alphaValue, aValue);
            RealMatrix qziM = MatrixUtils.createRealMatrix(qZi);
            RealMatrix qxiM = MatrixUtils.createRealMatrix(qXi);
            qMatrix = qMatrix.multiply(qziM).multiply(qxiM);
        }
        for (int i = 0; i < 4; i++) {
            value[i] = qMatrix.getRow(i);
        }
        return value;
    }

    public static RealMatrix rotZYX(float roll, float pitch, float yaw) {
        RealMatrix rx = MatrixUtils.createRealMatrix(rotateXm(yaw));
        RealMatrix ry = MatrixUtils.createRealMatrix(rotateYm(pitch));
        RealMatrix rz = MatrixUtils.createRealMatrix(rotateZm(roll));
        return rz.multiply(ry).multiply(rx);
    }
    public static float saturate(float v, float min, float max){
        return Math.min(Math.max(min, v), max);
    }
    public static float saturate(float v){
        return saturate(v,RobotUtils.MIN, RobotUtils.MAX);
    }
}