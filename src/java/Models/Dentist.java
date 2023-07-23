/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author ADMIN
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Dentist extends User{
    
    private String degree;
    private String experience;
    private String img;
    private String roleDentist;

    public Dentist(String degree, String experience, String img, String roleDentist, int id, String fullName, String password, String phoneNumber, int roleID, boolean status, String email, String Roll, String gender) {
        super(id, fullName, password, phoneNumber, roleID, status, email, Roll, gender);
        this.degree = degree;
        this.experience = experience;
        this.img = img;
        this.roleDentist = roleDentist;
    }
    public Dentist(String degree, String experience, String img) {
        this.degree = degree;
        this.experience = experience;
        this.img = img;
    }
    
    public Dentist(String degree, String experience, String img, int id, String fullName, String password, String phoneNumber, int roleID, boolean status, String email, String Roll, String gender) {
        super(id, fullName, password, phoneNumber, roleID, status, email, Roll, gender);
        this.degree = degree;
        this.experience = experience;
        this.img = img;
    }  
}