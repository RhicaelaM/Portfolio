package com.company;

public class TriangularBasedPrism {

    //Fields

    private double sideA; // Triangle sideA
    private double sideC; // Triangle sideC
    private double base; // Triangle base
    private double length; // Triangle height
    private double height;
    private Triangle triangle;

    //Methods

    public void setSideA(double sideA) {
        if (triangle == null) {
            triangle = new Triangle();
        }
        this.sideA = sideA;
        triangle.setSideA(sideA);
    }

    public double getSideA() {
        return sideA;
    }

    public void setSideC(double sideC) {
        if (triangle == null) {
            triangle = new Triangle();
        }
        this.sideC = sideC;
        triangle.setSideC(sideC);
    }

    public double getSideC() {
        return sideC;
    }

    public void setBase(double base) {
        if (triangle == null) {
            triangle = new Triangle();
        }

        this.base = base;
        triangle.setBase(base);
    }

    public double getBase() {
        return base;
    }

    public void setLength(double length) {
        if (triangle == null) {
            triangle = new Triangle();
        }
        this.length = length;
        triangle.setHeight(length);
    }

    public double getLength() {
        return length;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getHeight() {
        return height;
    }

    public void display() {
        System.out.println("Triangular-Based Prism: \nSide A = " + sideA + "\nSide C = " + sideC + "\nBase = " + base + "\nLength = " + length + "\nHeight = " + height);
    }

    public double calcSurfaceArea() {
        if (triangle == null) {
            triangle = new Triangle();
        }

        return ((2 * triangle.calcArea()) + ((sideA * height) + (base * height) + (sideC * height)));
    }

    public double calcVolume() {
        if (triangle == null) {
            triangle = new Triangle();
        }
        return (triangle.calcArea() * height);
    }
}
