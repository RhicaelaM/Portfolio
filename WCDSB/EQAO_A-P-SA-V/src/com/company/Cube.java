package com.company;

public class Cube {

    // Fields
    private double base;

    //Methods

    public void setBase(double base) {
        this.base = base;
    }

    public double getBase() {
        return base;
    }

    public void display() {
        System.out.println("Cube: \nBase = " + base);
    }

    public double calcSurfaceArea() {
        return (6 * Math.pow(base, 2));
    }

    public double calcVolume() {
        return (Math.pow(base, 3));
    }

}
