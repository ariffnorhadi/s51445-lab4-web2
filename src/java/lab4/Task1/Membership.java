/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4.Task1;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class Membership {
    
    private String fname,lname,icno,email;
    int type;

    public Membership() {
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getIcno() {
        return icno;
    }

    public void setIcno(String icno) {
        this.icno = icno;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
    
    public String getMemberType(){
        if(type==1){
            return "Regular Member";
        }
        else if(type==2){
            return "VIP Member";
        }
        else{
            return "Unknown";
        }
    }
    
    public double calculateFees(){
         if(type==1){
            return 100*0.75;
        }
        else if(type==2){
            return 200*0.9;
        }
        else{
            return 0;
        }
    }
    
}
