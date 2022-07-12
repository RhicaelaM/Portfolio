package com.company;

public class Cylinder {

    //Fields

    private double height;
    private double radius;
    private Circle circle;

    //Methods

    public void setHeight(double height) {
        this.height = height;
    }

    public double getHeight() {
        return height;
    }

    public void setRadius(double radius) {
        if (circle == null) {
            circle = new Circle();
        }
        this.radius = radius;
        circle.setRadius(radius);
    }

    public double getRadius() {
        return radius;
    }

    public void display() {
        System.out.println("Cylinder: \nHeight = " + height + "\nRadius = " + radius);
    }

    public double calcSurfaceArea() {
        if (circle == null) {
            circle = new Circle();
        }
        return ((2 * (circle.calcArea())) + (2 * Math.PI * radius * height));
    }

    public double calcVolume() {
        if (circle == null) {
            circle = new Circle();
        }
        return (circle.calcArea() * height);
    }
}
