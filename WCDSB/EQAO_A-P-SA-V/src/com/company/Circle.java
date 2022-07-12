package com.company;

public class Circle {

    //Fields

    private double diameter;
    private double radius;

    //Methods

    public void setDiameter(double diameter) {
        this.diameter = diameter;
    }

    public double getDiameter() {
        return diameter;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public double getRadius() {
        return radius;
    }

    public void display() {
        System.out.println("Circle: \nDiameter = " + diameter + "\nRadius = " + radius);
    }

    public double calcPerimeter() {
        return (Math.PI * diameter);
    }

    public double calcArea() {
        return (Math.PI * Math.pow(radius, 2));
    }
}
