package com.company;

public class Parallelogram  {

    // Fields

    private double sideC;
    private double base;
    private double height;

    //Methods

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
        System.out.println("Parallelogram: \nSide C = " + sideC + "\nBase = " + base + "\nHeight = " + height);
    }

    public double calcPerimeter(){
        return (2 * (base + sideC));
    }

    public double calcArea(){
        return (base * height);
    }
}
