/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Util;

import DAL.AppointmentDAO;
import Models.Appointment;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author Admin
 */
public class Test {

    public static void main(String[] args) {
        try {
            AppointmentDAO appointmentDAO = new AppointmentDAO();
            ArrayList<Appointment> list = appointmentDAO.getAllAppointment();
            Date date = new Date(123, 7, 12);
            int month[] = new int[30];
            for (Appointment appointment : list) {
                if (date.getDate() > appointment.getDate().getDate()) {
                    month[29 - (date.getDate() - appointment.getDate().getDate())]++;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
