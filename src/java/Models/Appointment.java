/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
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
public class Appointment{
    private int id;
    private String userName;
    private String dentistName;
    private Date date;  
    private Time time;
    private String description;
    private boolean status;
    private String Roll;

    public Appointment(int id, String userName, String dentistName, Date date, String description, boolean status) {
        this.id = id;
        this.userName = userName;
        this.dentistName = dentistName;
        this.date = date;
        this.description = description;
        this.status = status;
    }


    public Appointment(int id, String userName, Date date, Time time, String description, boolean status, String Roll) {
        this.id = id;
        this.userName = userName;
        this.date = date;
        this.time = time;
        this.description = description;
        this.status = status;
        this.Roll = Roll;
    }
    
    public Appointment(int id, String userName, String dentistName, Date date, Time time, String description, boolean status) {
        this.id = id;
        this.userName = userName;
        this.dentistName = dentistName;
        this.date = date;
        this.time = time;
        this.description = description;
        this.status = status;
    }    
}
