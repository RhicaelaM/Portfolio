package com.company;

import java.util.Scanner;

import static com.company.ProjectConstants.*;

public class Main {

    public static void programDescription(){
        System.out.println(SEPARATOR);
        System.out.println("This program asks the user to create a team of 5 participants for an intramural sports team then displays the team's participant's name and grade stored in a sorted array.");
    }

    public static void main(String[] args) {

        Scanner s = new Scanner(System.in);
        SomeData participant = new SomeData();
        SomeData participants[] = new SomeData[MAXDATA];

        boolean doneTypeCheck;
        boolean done;
        String input;
        String garbage;
        String tempParticipant;
        int tempGrade;


        // User input

        programDescription();
        System.out.println("\nWould you like to continue? (yes/no)");
        if (s.hasNext("yes") || s.hasNext("YES")) {
            input = s.next();

            for (int i = 0; i < MAXDATA; i++) {
                participants[i] = new SomeData();
                do {
                    done = false;
                    doneTypeCheck = false;
                    System.out.println(SEPARATOR);
                    System.out.println("Initializing participant details...");

                    System.out.println("\nPlease enter the name of the participant: ");
                    participants[i].setParticipant(s.next());

                    do {
                        System.out.println("\nPlease enter the grade of the participant: ");
                        if (s.hasNextInt()){
                            participants[i].setGrade(s.nextInt());
                            doneTypeCheck = true;
                        } else {
                            System.out.println("\n\tINPUT ERROR: Grade MUST be an integer.");
                            participants[i].setGrade(INVALID);
                            garbage = s.next();
                        }
                    } while (!doneTypeCheck);

                    done = true;

                } while (!done);

            }

            System.out.println("\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
            System.out.println("\nPlease enter a team name: ");
            participant.setTeamName(s.next());

            for (int k = 0; k < 5; k++) {
                for (int i = 0; i < 4; i++) {
                    if (participants[i].getGrade() > participants[i + 1].getGrade()) {
                        tempParticipant = participants[i].getParticipant();
                        tempGrade = participants[i].getGrade();

                        participants[i].setParticipant(participants[i + 1].getParticipant());
                        participants[i].setGrade(participants[i + 1].getGrade());

                        participants[i + 1].setParticipant(tempParticipant);
                        participants[i + 1].setGrade(tempGrade);
                    }
                }
            }


            System.out.println(SEPARATOR);
            System.out.println("Displaying sorted array of participants...");
            System.out.println(SEPARATOR);
            System.out.println("\nTeam Name: " + participant.getTeamName());
            for (int i = 0; i < MAXDATA; i++){
                System.out.println("\nFirst Name: " + participants[i].getParticipant() + "\nGrade: " + participants[i].getGrade());
            }


        } else {
            System.out.println("Goodbye!");
        }
    }
}
