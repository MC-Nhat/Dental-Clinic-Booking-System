/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Service;
import Models.TreatmentCourse;
import Models.User;
import Util.Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class TreatmentCourseDAO {

    public float getRevenue() throws SQLException {
        float total = 0;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql1 = "select SUM(s.price) from tblTreatmentCourseDetail tc join tblService s on tc.serviceID = s.id";
                stm = con.prepareStatement(sql1);
                rs = stm.executeQuery();
                if (rs.next()) {
                    total = rs.getFloat(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return total;
    }

    public static ArrayList<TreatmentCourse> getTreatmentByCustomerID(String from) {
        ArrayList<TreatmentCourse> list = new ArrayList<>();
        Util dbu = new Util();

        String sql = "select tblTreatmentCourse.id as id, nameTreatment, customertable.fullName as customername, dentisttable.fullName as dentistname,tblTreatmentCourse.status as status\n"
                + "from tblTreatmentCourse, (select id, fullName from tblUser where idRole = 2) as dentisttable, (select id, fullName from tblUser where id = ?) as customertable\n"
                + "where tblTreatmentCourse.dentistID = dentisttable.id and tblTreatmentCourse.userID = customertable.id";
        try {
            Connection connection = dbu.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, from);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameTreat = rs.getString("nameTreatment");
                String cusname = rs.getString("customername");
                String denname = rs.getString("dentistname");
                boolean status = rs.getBoolean("status");
                TreatmentCourse c = new TreatmentCourse(id, nameTreat, cusname, denname, status);
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ArrayList<TreatmentCourse> getTreatmentByDentistID(String from) {
        ArrayList<TreatmentCourse> list = new ArrayList<>();
        Util dbu = new Util();

        String sql = "select tblTreatmentCourse.id as id, nameTreatment, customertable.fullName as customername, dentisttable.fullName as dentistname,tblTreatmentCourse.status as status\n"
                + "from tblTreatmentCourse, (select id, fullName from tblUser where id = ?) as dentisttable, (select id, fullName from tblUser where idRole = 5) as customertable\n"
                + "where tblTreatmentCourse.dentistID = dentisttable.id and tblTreatmentCourse.userID = customertable.id";
        try {
            Connection connection = dbu.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, from);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String nameTreat = rs.getString("nameTreatment");
                String cusname = rs.getString("customername");
                String denname = rs.getString("dentistname");
                boolean status = rs.getBoolean("status");
                TreatmentCourse c = new TreatmentCourse(id, nameTreat, cusname, denname, status);
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static ArrayList<TreatmentCourse> searchTreatmentCourseByNamePatient(String idDentist, String namePatient) {
        ArrayList<TreatmentCourse> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select tblTreatmentCourse.id as id, nameTreatment, customertable.fullName as customername, dentisttable.fullName as dentistname,tblTreatmentCourse.status as status\n"
                        + "from tblTreatmentCourse, (select id, fullName from tblUser) as dentisttable, (select id, fullName from tblUser) as customertable\n"
                        + "where tblTreatmentCourse.dentistID = dentisttable.id and tblTreatmentCourse.userID = customertable.id\n"
                        + "AND dentisttable.id = ? AND customertable.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI";
                stm = con.prepareStatement(sql);
                stm.setString(1, idDentist);
                stm.setString(2, "%" + namePatient + "%");

                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nameTreat = rs.getString("nameTreatment");
                    String cusname = rs.getString("customername");
                    String denname = rs.getString("dentistname");
                    boolean status = rs.getBoolean("status");
                    TreatmentCourse c = new TreatmentCourse(id, nameTreat, cusname, denname, status);
                    list.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void createNewTreatmentCourse(int userID, int dentistID, String treatmentName) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "insert into tblTreatmentCourse values(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, userID);
                stm.setInt(2, dentistID);
                stm.setBoolean(3, false);
                stm.setString(4, treatmentName);
                stm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int getDentistByTreatmentCourseID(int id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int dentistID = 0;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select t.dentistID \n"
                        + "from tblTreatmentCourse t join tblTreatmentCourseDetail td on t.id = td.treatmentID \n"
                        + "where td.id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    dentistID = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return dentistID;
    }
    public int getServiceByTreatmentCourseID(int id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int serviceID = 0;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select td.ServiceID \n"
                        + "from tblTreatmentCourse t join tblTreatmentCourseDetail td on t.id = td.treatmentID \n"
                        + "where td.id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                if (rs.next()) {
                    serviceID = rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return serviceID;
    }
}
