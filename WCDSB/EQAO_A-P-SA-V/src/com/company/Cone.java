package com.company;

public class Cone {

    //Fields

    private double slantLength;
    private double height;
    private double radius;
    private Circle circle;

    //Methods

    public void setSlantLength(double slantLength) {
        this.slantLength = slantLength;
    }

    public double getSlantLength() {
        return slantLength;
    }

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
        System.out.println("Cone: \nSlant Length = " + slantLength + "\nHeight = " + height + "\nRadius = " + radius);

    }

    public double calcSurfaceArea() {
        if (circle == null) {
            circle = new Circle();
        }
        return (circle.calcArea() + (Math.PI * radius * slantLength));
    }

    public double calcVolume() {
        if (circle == null) {
            circle = new Circle();
        }
        return ((circle.calcArea() * height) / 3);
    }
}
