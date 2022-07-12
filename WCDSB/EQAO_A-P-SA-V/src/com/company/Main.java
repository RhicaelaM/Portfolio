package com.company;

import java.util.Scanner;
import java.text.DecimalFormat;

public class Main {

    public final static String SEPARATOR = "\n--------------------------------------------------------------------------------------------------------------------------------------\n";
    public final static String SMALLSEPARATOR = "\n=============================================\n";
    public final static int INVALID = -1;

    public static void programInfo() {
        System.out.println(SEPARATOR);
        System.out.println("This program calculates the perimeter and area, or surface area and volume, of the following shapes below...");
        System.out.println("\t0) EXIT");
        System.out.println("\t1) Rectangle");
        System.out.println("\t2) Parallelogram");
        System.out.println("\t3) Triangle");
        System.out.println("\t4) Trapezoid");
        System.out.println("\t5) Circle");
        System.out.println("\t6) Cylinder");
        System.out.println("\t7) Cube");
        System.out.println("\t8) Cone");
        System.out.println("\t9) Square-Based Pyramid");
        System.out.println("\t10) Rectangular-Based Prism");
        System.out.println("\t11) Triangular-Based Prism");
    }

    public static void main(String[] args) {

        boolean done;
        boolean haveData;
        int option = 0;

        double perimeter;
        double area;
        double volume;
        double surfaceArea;

        String garbage;
        String response;

        Scanner s = new Scanner(System.in);
        Rectangle rectangle = new Rectangle();
        Parallelogram parallelogram = new Parallelogram();
        Triangle triangle = new Triangle();
        Trapezoid trapezoid = new Trapezoid();
        Circle circle = new Circle();
        Cylinder cylinder = new Cylinder();
        Cube cube = new Cube();
        Cone cone = new Cone();
        SquareBasedPyramid squareBasedPyramid = new SquareBasedPyramid();
        RectangularBasedPrism rectangularBasedPrism = new RectangularBasedPrism();
        TriangularBasedPrism triangularBasedPrism = new TriangularBasedPrism();

        DecimalFormat df = new DecimalFormat("0.00");


        System.out.println(SEPARATOR);
        System.out.println("This program calculates the perimeter and area, or surface area and volume, of various 2-Dimensional and 3-Dimensional shapes.");
        do {
            done = false;
            System.out.println("\n\tWould you like to continue? (yes/no)");

            if (s.hasNext("yes") || (s.hasNext("Yes"))) {
                done = false;
                response = s.next();
                programInfo();
                System.out.println("\n\t\tPlease enter the appropriate integer value: ");
                System.out.println(SMALLSEPARATOR);

                if (s.hasNextInt()) {
                    option = s.nextInt();

                    // 0) EXIT

                    switch (option) {
                        case 0: {
                            System.out.println(SEPARATOR);
                            System.out.println("\tGoodbye!");
                            done = true;
                            break;
                        }

                        // 1) Rectangle

                        case 1: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter rectangle length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    rectangle.setLength(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length MUST be an integer.");
                                    rectangle.setLength(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter rectangle width: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    rectangle.setWidth(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Width MUST be an integer.");
                                    rectangle.setWidth(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            perimeter = rectangle.calcPerimeter();
                            area = rectangle.calcArea();

                            System.out.println(SMALLSEPARATOR);
                            rectangle.display();
                            System.out.println("\nPerimeter = " + perimeter + "\nArea = " + area);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 2) Parallelogram

                        case 2: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter parallelogram's length of Side C: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    parallelogram.setSideC(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side C MUST be an integer.");
                                    parallelogram.setSideC(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter parallelogram base length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    parallelogram.setBase(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Base MUST be an integer.");
                                    parallelogram.setBase(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter parallelogram height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    parallelogram.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    parallelogram.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            perimeter = parallelogram.calcPerimeter();
                            area = parallelogram.calcArea();

                            System.out.println(SMALLSEPARATOR);
                            parallelogram.display();
                            System.out.println("\nPerimeter = " + perimeter + "\nArea = " + area);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 3) Triangle

                        case 3: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter triangle's length of Side A: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangle.setSideA(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side A MUST be an integer.");
                                    triangle.setSideA(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangle's length of Side C: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangle.setSideC(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side C MUST be an integer.");
                                    triangle.setSideC(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangle base length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangle.setBase(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Base MUST be an integer.");
                                    triangle.setBase(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangle height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangle.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    triangle.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            perimeter = triangle.calcPerimeter();
                            area = triangle.calcArea();

                            System.out.println(SMALLSEPARATOR);
                            triangle.display();
                            System.out.println("\nPerimeter = " + perimeter + "\nArea = " + area);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 4) Trapezoid

                        case 4: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter trapezoid's length of Side A: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    trapezoid.setSideA(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side A MUST be an integer.");
                                    trapezoid.setSideA(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter trapezoid's length of Side C: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    trapezoid.setSideC(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side C MUST be an integer.");
                                    trapezoid.setSideC(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter trapezoid's length of Side D: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    trapezoid.setSideD(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side D MUST be an integer.");
                                    trapezoid.setSideD(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter trapezoid base length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    trapezoid.setBase(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Base MUST be an integer.");
                                    trapezoid.setBase(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter trapezoid height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    trapezoid.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    trapezoid.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            perimeter = trapezoid.calcPerimeter();
                            area = trapezoid.calcArea();

                            System.out.println(SMALLSEPARATOR);
                            trapezoid.display();
                            System.out.println("\nPerimeter = " + perimeter + "\nArea = " + area);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 5) Circle

                        case 5: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter circle diameter: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    circle.setDiameter(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Diameter MUST be an integer.");
                                    circle.setDiameter(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter circle radius: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    circle.setRadius(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Radius MUST be an integer.");
                                    circle.setRadius(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            perimeter = circle.calcPerimeter();
                            area = circle.calcArea();

                            System.out.println(SMALLSEPARATOR);
                            circle.display();
                            System.out.println("\n(Rounded to two decimal places)");
                            System.out.println("Perimeter/Circumference ≈ " + df.format(perimeter) + "\nArea ≈ " + df.format(area));
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // Cylinder

                        case 6: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter cylinder height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    cylinder.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    cylinder.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter cylinder radius: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    cylinder.setRadius(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Radius MUST be an integer.");
                                    cylinder.setRadius(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            surfaceArea = cylinder.calcSurfaceArea();
                            volume = cylinder.calcVolume();

                            System.out.println(SMALLSEPARATOR);
                            cylinder.display();
                            System.out.println("\n(Rounded to two decimal places)");
                            System.out.println("Surface Area ≈ " + df.format(surfaceArea) + "\nVolume ≈ " + df.format(volume));
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 6) Cube

                        case 7: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter cube's base length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    cube.setBase(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Base MUST be an integer.");
                                    cube.setBase(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);


                            surfaceArea = cube.calcSurfaceArea();
                            volume = cube.calcVolume();

                            System.out.println(SMALLSEPARATOR);
                            cube.display();
                            System.out.println("\nSurface Area = " + surfaceArea + "\nVolume = " + volume);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 8) Cone

                        case 8: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter cone's slant length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    cone.setSlantLength(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Slant length MUST be an integer.");
                                    cone.setSlantLength(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter cone's radius: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    cone.setRadius(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Radius MUST be an integer.");
                                    cone.setRadius(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter cone's height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    cone.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    cone.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            surfaceArea = cone.calcSurfaceArea();
                            volume = cone.calcVolume();

                            System.out.println(SMALLSEPARATOR);
                            cone.display();
                            System.out.println("\n(Rounded to two decimal places)");
                            System.out.println("Surface Area ≈ " + df.format(surfaceArea) + "\nVolume ≈ " + df.format(volume));
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 9) Square-Based Pyramid

                        case 9: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter square-based pyramid's slant height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    squareBasedPyramid.setSlantHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Slant height MUST be an integer.");
                                    squareBasedPyramid.setSlantHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter square-based pyramid's base: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    squareBasedPyramid.setBase(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Base MUST be an integer.");
                                    squareBasedPyramid.setBase(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter square-based pyramid's height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    squareBasedPyramid.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    squareBasedPyramid.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            surfaceArea = squareBasedPyramid.calcSurfaceArea();
                            volume = squareBasedPyramid.calcVolume();

                            System.out.println(SMALLSEPARATOR);
                            squareBasedPyramid.display();
                            System.out.println("\nSurface Area = " + surfaceArea + "\nVolume = " + volume);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 10) Rectangle-based Prism

                        case 10: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter rectangular-based prism's length: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    rectangularBasedPrism.setLength(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length MUST be an integer.");
                                    rectangularBasedPrism.setLength(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter rectangle-based prism's width: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    rectangularBasedPrism.setWidth(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Width MUST be an integer.");
                                    rectangularBasedPrism.setWidth(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter rectangle-based prism's height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    rectangularBasedPrism.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    rectangularBasedPrism.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            surfaceArea = rectangularBasedPrism.calcSurfaceArea();
                            volume = rectangularBasedPrism.calcVolume();

                            System.out.println(SMALLSEPARATOR);
                            rectangularBasedPrism.display();
                            System.out.println("\nSurface Area = " + surfaceArea + "\nVolume = " + volume);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        // 11) Triangular-based Prism

                        case 11: {
                            System.out.println(SEPARATOR);

                            do {
                                System.out.println("\nPlease enter triangular-based prism's length of Side A (triangle face): ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangularBasedPrism.setSideA(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side A MUST be an integer.");
                                    triangularBasedPrism.setSideA(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangular-based prism's length of Side C(triangle face): ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangularBasedPrism.setSideC(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length of Side C MUST be an integer.");
                                    triangularBasedPrism.setSideC(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangular-based prism base: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangularBasedPrism.setBase(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Base MUST be an integer.");
                                    triangularBasedPrism.setBase(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangular-based prism length (triangle face): ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangularBasedPrism.setLength(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Length MUST be an integer.");
                                    triangularBasedPrism.setLength(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            do {
                                System.out.println("\nPlease enter triangular-based prism height: ");
                                haveData = false;

                                if (s.hasNextDouble()) {
                                    triangularBasedPrism.setHeight(s.nextDouble());
                                    haveData = true;
                                } else {
                                    System.out.println("\n\tINPUT ERROR: Height MUST be an integer.");
                                    triangularBasedPrism.setHeight(INVALID);
                                    garbage = s.next();
                                }
                            } while (!haveData);

                            surfaceArea = triangularBasedPrism.calcSurfaceArea();
                            volume = triangularBasedPrism.calcVolume();

                            System.out.println(SMALLSEPARATOR);
                            triangularBasedPrism.display();
                            System.out.println("\nSurface Area = " + surfaceArea + "\nVolume = " + volume);
                            System.out.println(SMALLSEPARATOR);

                            break;
                        }

                        default: {
                            System.out.println(SMALLSEPARATOR);
                            System.out.println("\tERROR: Unknown Option!");
                            System.out.println(SMALLSEPARATOR);
                            break;
                        }
                    }
                }
            } else {
                System.out.println(SEPARATOR);
                System.out.println("\tGoodbye!");
                done = true;

            }
        } while (!done);

    } // end main class
}  // end main method
