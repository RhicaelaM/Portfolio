package com.company;

public class RectangularBasedPrism {

    //Fields

    private double length;
    private double width;
    private double height;
    private Rectangle rectangle;

    //Methods

    public void setLength(double length) {
        if (rectangle == null){
            rectangle = new Rectangle();
        }
        this.length = length;
        rectangle.setLength(length);
    }

    public double getLength() {
        return length;
    }

    public void setWidth(double width) {
        if (rectangle == null){
            rectangle = new Rectangle();
        }
        this.width = width;
        rectangle.setWidth(width);
    }

    public double getWidth() {
        return width;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getHeight() {
        return height;
    }

    public void display(){
        System.out.println("Rectangular-Based Pyramid: \nLength = " + length + "\nWidth = " + width + "\nHeight = " + height);
    }

    public double calcSurfaceArea(){
        return (2*((width * height) + (length * width) + (length * height)));
    }

    public double calcVolume(){
        if (rectangle == null){
            rectangle = new Rectangle();
        }

        return (rectangle.calcArea() * height);
    }
}
