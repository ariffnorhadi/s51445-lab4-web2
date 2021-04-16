/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4.Exercise;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class User {

    private String email, password, name, nric;
    private int id;

    public User(String email, String name, String nric) {
        this.email = email;
        this.name = name;
        this.nric = nric;
    }

    public User(String email, String password, String name, String nric, int id) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
        this.id = id;
    }

    public User(String email, String password, String name, String nric) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.nric = nric;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNric() {
        return nric;
    }

    public void setNric(String nric) {
        this.nric = nric;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
