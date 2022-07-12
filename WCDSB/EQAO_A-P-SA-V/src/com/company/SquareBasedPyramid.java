package com.company;

public class SquareBasedPyramid {

    //Fields

    private double slantHeight;
    private double base;
    private double height;
    private Triangle triangle;

    //Methods

    public void setSlantHeight(double slantHeight) {
        if (triangle == null){
            triangle = new Triangle();
        }
        this.slantHeight = slantHeight;
        triangle.setHeight(slantHeight);
    }

    public double getSlantHeight() {
        return slantHeight;
    }

    public void setBase(double base) {
        if (triangle == null){
            triangle = new Triangle();
        }
        this.base = base;
        triangle.setBase(base);
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

    public void display(){
        System.out.println("Square-Based Pyramid: \nSlant Height = " + slantHeight + "\nBase = " + base + "\nHeight = " + height);
    }

    public double calcSurfaceArea(){
        if (triangle == null){
            triangle = new Triangle();
        }

        return ((Math.pow(base, 2)) + (4 * triangle.calcArea()));
    }

    public double calcVolume(){
        return (((Math.pow(base, 2))*height) / 3);
    }

}
