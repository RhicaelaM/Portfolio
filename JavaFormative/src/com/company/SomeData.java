package com.company;


public class SomeData {

    private String participant;
    private String teamName;
    private int grade;

    public void setParticipant(String participant) {
        this.participant = participant;
    }

    public String getParticipant() {
        return participant;
    }

    public void setTeamName(String teamName) {
        this.teamName = teamName;
    }

    public String getTeamName() {
        return teamName;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getGrade() {
        return grade;
    }

    public void display(){
        System.out.println("\n\nParticipant Added to Team... ");
        System.out.println("Participant Name: " + getParticipant());
        System.out.println("Participant Grade: " + getGrade());
    }

}
