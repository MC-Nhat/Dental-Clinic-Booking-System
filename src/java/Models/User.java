/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Admin
 */
@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {

    private int id;
    private String fullName;
    private String password;
    private String phoneNumber;
    private int roleID;
    private boolean status;
    private String email;
    private String Roll;
    private String gender;
    
    public User(int id, String fullName, String password, String phoneNumber, int roleID, boolean status, String email, String Roll) {
        this.id = id;
        this.fullName = fullName;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.roleID = roleID;
        this.status = status;
        this.email = email;
        this.Roll = Roll;
    }
    public User(int id, String fullName, String Roll){
        this.id = id;
        this.fullName = fullName;
        this.Roll = Roll;
    }

    public User(int id, String phoneNumber, String email, String gender) {
        this.id = id;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.gender = gender;
    }
    
    public User(int id, String fullName, String password, String phoneNumber, int roleID, boolean status, String email, String Roll, String gender) {
        this.id = id;
        this.fullName = fullName;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.roleID = roleID;
        this.status = status;
        this.email = email;
        this.gender = gender;
        if (Roll == null) {
            this.Roll = "";
        } else {
            this.Roll = Roll;
        }
    }
}
