/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.Appointment;
import Models.Dentist;
import Models.User;
import Util.Util;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class AppointmentDAO {

    UserDAO userDAO = new UserDAO();
    DentistDAO dentistDAO = new DentistDAO();

    public ArrayList<Appointment> getAllAppointment() {
        Connection cn = null;
        ArrayList<Appointment> list = new ArrayList<>();
        Appointment app = null;
        User u = new User();
        Dentist d = new Dentist();
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select id, appDate, appTime, userID, dentistID, description, status from tblAppointment where status = 'false'";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idApp = rs.getInt("id");
                        Date appDate = rs.getDate("appDate");
                        Time appTime = rs.getTime("appTime");
                        int userIDApp = rs.getInt("userID");
                        int dentistIDApp = rs.getInt("dentistID");
                        String desciption = rs.getString("description");
                        u = userDAO.getEmployeeById(userIDApp);
                        d = dentistDAO.getDentistByID(String.valueOf(dentistIDApp));
                        String userName = u.getFullName();
                        String dentistName = d.getFullName();
                        boolean statusApp = rs.getBoolean("status");
                        app = new Appointment(idApp, userName, dentistName, appDate, appTime, desciption, statusApp);
                        list.add(app);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public ArrayList<Appointment> getAppointmentByDate(String from, String to) {
        Connection cn = null;
        ArrayList<Appointment> list = new ArrayList<>();
        Appointment app = null;
        User u = new User();
        Dentist d = new Dentist();
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select id, appointmentDate, userID, dentistID, description, status from tblAppointment\n"
                        + "WHERE (appointmentDate > ? OR appointmentDate = ?)\n"
                        + "AND (appointmentDate < ? OR appointmentDate = ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, from);
                pst.setString(2, from);
                pst.setString(3, to);
                pst.setString(4, to);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idApp = rs.getInt("id");
                        int userIDApp = rs.getInt("userID");
                        int dentistIDApp = rs.getInt("dentistID");
                        u = userDAO.getEmployeeById(userIDApp);
                        d = dentistDAO.getDentistByID(String.valueOf(dentistIDApp));
                        String userName = u.getFullName();
                        String dentistName = d.getFullName();
                        Date dateApp = rs.getDate("appointmentDate");
                        String descriptionApp = rs.getString("description");
                        boolean statusApp = rs.getBoolean("status");
                        app = new Appointment(idApp, userName, dentistName, dateApp, descriptionApp, statusApp);
                        list.add(app);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    int id;
    private String userName;
    private String dentistName;
    private Date date;  
    private String description;
    private boolean status;
  
    public boolean insertAppointment(String userID, String dentistID, Date date, String description, String status) {

        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                int iddentist = 0;

                String sql = "INSERT INTO tblAppointment\n"
                        + "values (?,?,?,?,?)\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setDate(1, date);
                pst.setInt(2, Integer.parseInt(userID));
                pst.setInt(3, Integer.parseInt(dentistID));
                pst.setString(4, description);
                pst.setBoolean(5, Boolean.parseBoolean(status));
                pst.executeUpdate();
                cn.close();
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    public ArrayList<Appointment> getAllAppointmentByDentistID(int id) throws SQLException {
        Connection cn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Appointment> list = new ArrayList<>();
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select a.*,u.fullName, u.Roll  from tblAppointment a join tblUser u\n"
                        + "on a.userID = u.id where dentistID = ? and a.status = 0";
                stm = cn.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int a = rs.getInt("id");
                    String name = rs.getString("fullName");
                    Date c = rs.getDate("appDate");
                    Time d = rs.getTime("appTime");
                    list.add(new Appointment(rs.getInt("id"), rs.getString("fullName"), rs.getDate("appDate"), rs.getTime("appTime"), rs.getString("Description"), rs.getBoolean("status"), rs.getString("Roll")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                cn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public void CompleteAppointment(int id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "update tblAppointment set status = 1 where id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
    }

    public static int ReceiveAppointment(int userID, int denID, String stringdate, String stringtime, String note) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        int result = 0;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                // Kiểm tra sự tồn tại của bản ghi theo userID
                String checkSql = "SELECT COUNT(*) FROM tblAppointment WHERE userID = ? and status = ?";
                pst = cn.prepareStatement(checkSql);
                pst.setInt(1, userID);
                pst.setBoolean(2, false);
                rs = pst.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                rs.close();
                pst.close();

                if (count == 0) {
                    // Thêm lịch hẹn nếu không có bản ghi tồn tại với userID
                    Date date = Date.valueOf(stringdate);
                    Time time = Time.valueOf(stringtime);
                    String sql = "INSERT INTO tblAppointment(userID, dentistID, appDate, appTime, description, status)\n"
                            + "values (?,?,?,?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, userID);
                    pst.setInt(2, denID);
                    pst.setDate(3, date);
                    pst.setTime(4, time);
                    pst.setString(5, note);
                    pst.setBoolean(6, false);
                    pst.executeUpdate();
                    result = 1;
                } else if (count == 1){
                    // Đã tồn tại một bản ghi với userID, trả về false
                    result = 2;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return result;
    }

    public static boolean isTimeBooked(String stringdate, String stringtime, int dentistid) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                Date date = Date.valueOf(stringdate);
                Time time = Time.valueOf(stringtime);
                String sql = "SELECT appDate, appTime, dentistID\n"
                        + "FROM tblAppointment\n"
                        + "WHERE appDate = ? AND appTime = ? AND dentistID = ?";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, date);
                pst.setTime(2, time);
                pst.setInt(3, dentistid);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    result = true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return result; 
    }

    public static boolean isExistAppointment(int userid) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String checkSql = "SELECT COUNT(*) FROM tblAppointment WHERE userID = ?";
                pst = cn.prepareStatement(checkSql);
                pst.setInt(1, userid);
                rs = pst.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                if (count == 0) {
                    result = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return result;
    }
}
