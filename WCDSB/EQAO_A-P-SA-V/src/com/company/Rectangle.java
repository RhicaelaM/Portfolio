package com.company;

public class Rectangle {

    // Fields

    private double length;
    private double width;

    // Methods

    public void setLength(double length) {
        this.length = length;
    }

    public double getLength() {
        return length;
    }

    public void setWidth(double width) {
        this.width = width;
    }

    public double getWidth() {
        return width;
    }

    public void display(){
        System.out.println("Rectangle: \nLength = " + getLength() + "\nWidth = " + getWidth());
    }

    public double calcPerimeter(){
        return (2 * (length + width));
    }

    public double calcArea() {
        return (length * width);
    }
}
