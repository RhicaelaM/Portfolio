package com.company;

public class Triangle {

    // Fields

    private double sideA;
    private double sideC;
    private double base;
    private double height;

    //Methods

    public void setSideA(double sideA) {
        this.sideA = sideA;
    }

    public double getSideA() {
        return sideA;
    }

    public void setSideC(double sideC) {
        this.sideC = sideC;
    }

    public double getSideC() {
        return sideC;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getBase() {
        return base;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getHeight() {
        return height;
    }

    public void display() {
        System.out.println("Triangle: \nSide A = " + sideA + "\nSide C = " + sideC + "\nBase = " + base + "\nHeight = " + height);
    }

    public double calcPerimeter() {
        return (sideA + sideC + base);
    }

    public double calcArea() {
        return ((base * height) / 2);
    }
}
