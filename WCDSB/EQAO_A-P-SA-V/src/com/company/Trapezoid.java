package com.company;

public class Trapezoid {

    //Fields

    private double sideA;
    private double sideC;
    private double sideD;
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

    public void setSideD(double sideD) {
        this.sideD = sideD;
    }

    public double getSideD() {
        return sideD;
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
        System.out.println("Trapezoid: \nSide A = " + sideA + "\nSide C = " + sideC + "\nSide D = " + sideD + "\nBase = " + base + "\nHeight = " + height);
    }

    public double calcPerimeter() {
        return (sideA + base + sideC + sideD);
    }

    public double calcArea() {
        return (((sideA + base) * height) / 2);
    }
}
