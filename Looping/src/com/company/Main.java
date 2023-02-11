package com.company;

import java.util.Random;
import java.util.Arrays;

public class Main {

    final static int MAX_DATA = 10;
    final static String SEPERATOR = "\n---------------------------------------------------------\n";


    public static void main(String[] args) {

        NumData dataStorage[] = new NumData[MAX_DATA];
        Random rand = new Random();
        int upperbound = 100;
        int tempInt;
        double tempDouble;

        for (int i = 0; i < MAX_DATA; i++) {
            dataStorage[i] = new NumData();
            dataStorage[i].setiData(rand.nextInt(upperbound));
            dataStorage[i].setdData(rand.nextDouble());
        }
        System.out.println(SEPERATOR);
        System.out.println("USING FOR LOOPS");
        System.out.println(SEPERATOR);
        System.out.println("Displaying array using a for loop...\n");
        for (int i = 0; i < MAX_DATA; i++) {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
        }

        //

        for (int k = 0; k < MAX_DATA; k++) {

            for (int i = 0; i < MAX_DATA - 1; i++) {

                if (dataStorage[i].getiData() > dataStorage[i + 1].getiData()) {
                    tempInt = dataStorage[i].getiData();
                    tempDouble = dataStorage[i].getdData();

                    dataStorage[i].setiData(dataStorage[i + 1].getiData());
                    dataStorage[i].setdData(dataStorage[i + 1].getdData());

                    dataStorage[i + 1].setiData(tempInt);
                    dataStorage[i + 1].setdData(tempDouble);
                }

            }
        }

        System.out.println(SEPERATOR);
        System.out.println("Displaying array with sorted integer values using a for loop...\n");
        for (int i = 0; i < MAX_DATA; i++) {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
        }


        for (int k = 0; k < MAX_DATA; k++) {

            for (int i = 0; i < MAX_DATA - 1; i++) {

                if (dataStorage[i].getdData() > dataStorage[i + 1].getdData()) {
                    tempInt = dataStorage[i].getiData();
                    tempDouble = dataStorage[i].getdData();

                    dataStorage[i].setiData(dataStorage[i + 1].getiData());
                    dataStorage[i].setdData(dataStorage[i + 1].getdData());

                    dataStorage[i + 1].setiData(tempInt);
                    dataStorage[i + 1].setdData(tempDouble);
                }
            }
        }

        System.out.println(SEPERATOR);
        System.out.println("Displaying array with sorted double values using a for loop...\n");
        for (
                int i = 0;
                i < MAX_DATA; i++) {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
        }


        // USING A WHILE LOOP TO PRINT ARRAY DATA


        for (int i = 0; i < MAX_DATA; i++) {
            dataStorage[i] = new NumData();
            dataStorage[i].setiData(rand.nextInt(upperbound));
            dataStorage[i].setdData(rand.nextDouble());
        }

        System.out.println(SEPERATOR);
        System.out.println("USING WHILE LOOPS");
        System.out.println(SEPERATOR);
        System.out.println("Displaying array using a while loop...\n");

        int i =0;
        while (i < MAX_DATA) {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
                i = i + 1;
            }


        //

        for (int k = 0; k < MAX_DATA; k++) {

            for (i = 0; i < MAX_DATA - 1; i++) {

                if (dataStorage[i].getiData() > dataStorage[i + 1].getiData()) {
                    tempInt = dataStorage[i].getiData();
                    tempDouble = dataStorage[i].getdData();

                    dataStorage[i].setiData(dataStorage[i + 1].getiData());
                    dataStorage[i].setdData(dataStorage[i + 1].getdData());

                    dataStorage[i + 1].setiData(tempInt);
                    dataStorage[i + 1].setdData(tempDouble);
                }
            }
        }

        System.out.println(SEPERATOR);
        System.out.println("Displaying array with sorted integer values using a while loop...\n");

        i = 0;
        while (i < MAX_DATA) {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
            i = i + 1;
        }

        //

        for (int k = 0; k < MAX_DATA; k++) {

            for (i = 0; i < MAX_DATA - 1; i++) {

                if (dataStorage[i].getdData() > dataStorage[i + 1].getdData()) {
                    tempInt = dataStorage[i].getiData();
                    tempDouble = dataStorage[i].getdData();

                    dataStorage[i].setiData(dataStorage[i + 1].getiData());
                    dataStorage[i].setdData(dataStorage[i + 1].getdData());

                    dataStorage[i + 1].setiData(tempInt);
                    dataStorage[i + 1].setdData(tempDouble);
                }
            }
        }

        System.out.println(SEPERATOR);
        System.out.println("Displaying array with sorted double values using a while loop...\n");

        i = 0;
        while (i < MAX_DATA) {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
            i = i + 1;
        }




        // USING A DO WHILE LOOP


        System.out.println(SEPERATOR);
        System.out.println("USING DO WHILE LOOPS");
        System.out.println(SEPERATOR);
        System.out.println("Displaying array using a do-while loop...\n");


        for (i = 0; i < MAX_DATA; i++) {
            dataStorage[i] = new NumData();
            dataStorage[i].setiData(rand.nextInt(upperbound));
            dataStorage[i].setdData(rand.nextDouble());
        }


        i = 0;
        do {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
            i++;

        } while (i < MAX_DATA);

        //



        for (int k = 0; k < MAX_DATA; k++) {

            for (i = 0; i < MAX_DATA - 1; i++) {

                if (dataStorage[i].getiData() > dataStorage[i + 1].getiData()) {
                    tempInt = dataStorage[i].getiData();
                    tempDouble = dataStorage[i].getdData();

                    dataStorage[i].setiData(dataStorage[i + 1].getiData());
                    dataStorage[i].setdData(dataStorage[i + 1].getdData());

                    dataStorage[i + 1].setiData(tempInt);
                    dataStorage[i + 1].setdData(tempDouble);
                }
            }
        }

        System.out.println(SEPERATOR);
        System.out.println("Displaying array with sorted integer values using a do-while loop...\n");

        i = 0;
        do {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
            i++;

        } while (i < MAX_DATA);


        //

        for (int k = 0; k < MAX_DATA; k++) {

            for (i = 0; i < MAX_DATA - 1; i++) {

                if (dataStorage[i].getdData() > dataStorage[i + 1].getdData()) {
                    tempInt = dataStorage[i].getiData();
                    tempDouble = dataStorage[i].getdData();

                    dataStorage[i].setiData(dataStorage[i + 1].getiData());
                    dataStorage[i].setdData(dataStorage[i + 1].getdData());

                    dataStorage[i + 1].setiData(tempInt);
                    dataStorage[i + 1].setdData(tempDouble);
                }
            }
        }

        System.out.println(SEPERATOR);
        System.out.println("Displaying array with sorted double values using a do-while loop...\n");

        i = 0;
        do {
            System.out.println("Index: " + i + "\t\tInt Value: " + dataStorage[i].getiData() + "\t\tDouble Value: " + dataStorage[i].getdData());
            i++;

        } while (i < MAX_DATA);


    } // end main method
} // end main class
