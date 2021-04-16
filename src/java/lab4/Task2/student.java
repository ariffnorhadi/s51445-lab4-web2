package lab4.Task2;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class student {

    private String name, matrics, programme;

    public student() {
    }

    public student(String name, String matrics, String programme) {
        this.name = name;
        this.matrics = matrics;
        this.programme = programme;
    }
    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMatrics() {
        return matrics;
    }

    public void setMatrics(String matrics) {
        this.matrics = matrics;
    }

    public String getProgramme() {
        return programme;
    }

    public void setProgramme(String programme) {
        this.programme = programme;
    }
    
    public String programType(){
        if(programme.equals("1")){
            return "BSc Computer Science";
        }
        else if(programme.equals("2")){
            return "BSc Medical";
        }
        else if(programme.equals("3")){
            return "BSc Nathematics";
        }
        else{
            return "Unknown";
        }
    }
    
    
    
    

}
