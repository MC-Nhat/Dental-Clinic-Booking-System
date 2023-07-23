/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Models.Dentist;
import Util.Util;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.Calendar;

/**
 *
 * @author ADMIN
 */
public class DentistDAO {

    public static ArrayList<Dentist> getAllDentist() {
        Connection cn = null;
        ArrayList<Dentist> list = new ArrayList<>();
        Dentist den = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select id, fullName, phoneNumber, password, email, idRole, Roll, gender, degree, experience, image, status\n"
                        + "from tblUser u, tblDentist d\n"
                        + "where u.id = d.dentistID and status = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idden = rs.getInt("id");
                        String fullnameden = rs.getString("fullName");
                        String phoneden = rs.getString("phoneNumber");
                        String passwordden = rs.getString("password");
                        String emailden = rs.getString("email");
                        int idRoleden = rs.getInt("idRole");
                        String Rollden = rs.getString("Roll");
                        String genderden = rs.getString("gender");
                        String degreeden = rs.getString("degree");
                        String experienceden = rs.getString("experience");
                        String imgden = rs.getString("image");
                        boolean statusden = rs.getBoolean("status");

                        den = new Dentist(degreeden, experienceden, imgden, idden, fullnameden, passwordden, phoneden, idRoleden, statusden, emailden, Rollden, genderden);
                        list.add(den);
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

    public ArrayList<Dentist> getTop8Dentist() {
        Connection cn = null;
        ArrayList<Dentist> list = new ArrayList<>();
        Dentist den = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select top 8 * from tblUser u, tblDentist d, tblRoleDentist rd\n"
                        + "where u.id = d.dentistID and d.idRoleDentist = rd.id and status = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idden = rs.getInt("id");
                        String fullnameden = rs.getString("fullName");
                        String phoneden = rs.getString("phoneNumber");
                        String passwordden = rs.getString("password");
                        String emailden = rs.getString("email");
                        int idrole = rs.getInt("idRole");
                        String Rollden = rs.getString("Roll");
                        String genderden = rs.getString("gender");
                        String degreeden = rs.getString("degree");
                        String experienceden = rs.getString("experience");
                        String imgden = rs.getString("image");
                        boolean statusden = rs.getBoolean("status");
                        String idRoleden = rs.getString("name");
                        den = new Dentist(degreeden, experienceden, imgden, idRoleden, idden, fullnameden, passwordden, phoneden, idrole, statusden, emailden, Rollden, genderden);
                        list.add(den);
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

    public ArrayList<Dentist> getNext4Dentist(int amount) {
        Connection cn = null;
        ArrayList<Dentist> list = new ArrayList<>();
        Dentist den = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from tblUser u, tblDentist d, tblRoleDentist rd\n"
                        + "where u.id = d.dentistID and d.idRoleDentist = rd.id and status = 1\n"
                        + "order by u.id offset ? rows\n"
                        + "fetch next 4 rows only";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, amount);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idden = rs.getInt("id");
                        String fullnameden = rs.getString("fullName");
                        String phoneden = rs.getString("phoneNumber");
                        String passwordden = rs.getString("password");
                        String emailden = rs.getString("email");
                        int idrole = rs.getInt("idRole");
                        String Rollden = rs.getString("Roll");
                        String genderden = rs.getString("gender");
                        String degreeden = rs.getString("degree");
                        String experienceden = rs.getString("experience");
                        String imgden = rs.getString("image");
                        boolean statusden = rs.getBoolean("status");
                        String idRoleden = rs.getString("name");
                        den = new Dentist(degreeden, experienceden, imgden, idRoleden, idden, fullnameden, passwordden, phoneden, idrole, statusden, emailden, Rollden, genderden);
                        list.add(den);
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

    public ArrayList<Dentist> getNext3Dentist(int amount) {
        Connection cn = null;
        ArrayList<Dentist> list = new ArrayList<>();
        Dentist den = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from tblUser u, tblDentist d, tblRoleDentist rd\n"
                        + "where u.id = d.dentistID and d.idRoleDentist = rd.id and status = 1\n"
                        + "order by u.id offset ? rows\n"
                        + "fetch next 3 rows only";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, amount);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int idden = rs.getInt("id");
                        String fullnameden = rs.getString("fullName");
                        String phoneden = rs.getString("phoneNumber");
                        String passwordden = rs.getString("password");
                        String emailden = rs.getString("email");
                        int idrole = rs.getInt("idRole");
                        String Rollden = rs.getString("Roll");
                        String genderden = rs.getString("gender");
                        String degreeden = rs.getString("degree");
                        String experienceden = rs.getString("experience");
                        String imgden = rs.getString("image");
                        boolean statusden = rs.getBoolean("status");
                        String idRoleden = rs.getString("name");
                        den = new Dentist(degreeden, experienceden, imgden, idRoleden, idden, fullnameden, passwordden, phoneden, idrole, statusden, emailden, Rollden, genderden);
                        list.add(den);
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

    public Dentist getDentistByID(String id) {
        Connection cn = null;
        Dentist den = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select id, fullName, phoneNumber, password, email, idRole, Roll, gender, degree, experience, image, status\n"
                        + "from tblUser, tblDentist\n"
                        + "where id = dentistID AND id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, Integer.parseInt(id));

                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int idden = rs.getInt("id");
                    String fullnameden = rs.getString("fullName");
                    String phoneden = rs.getString("phoneNumber");
                    String passwordden = rs.getString("password");
                    String emailden = rs.getString("email");
                    int idRoleden = rs.getInt("idRole");
                    String Rollden = rs.getString("Roll");
                    String genderden = rs.getString("gender");
                    String degreeden = rs.getString("degree");
                    String experienceden = rs.getString("experience");
                    String imgden = rs.getString("image");
                    boolean statusden = rs.getBoolean("status");

                    den = new Dentist(degreeden, experienceden, imgden, idden, fullnameden, passwordden, phoneden, idRoleden, statusden, emailden, Rollden, genderden);
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
        return den;
    }

    public static boolean updateDentist(int id, String fullname, String phone, String email, String degree, String experience, String img, int status, String gender) {
        boolean kq = false;
        Dentist den = null;
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblUser\n"
                        + "SET fullName = ?, phoneNumber = ?, email = ?, status = ?, gender = ?\n"
                        + "WHERE id = ?;\n"
                        + "\n"
                        + "UPDATE tblDentist\n"
                        + "SET experience = ?, degree = ?, image = ?\n"
                        + "WHERE dentistID = ?;";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullname);
                pst.setString(2, phone);
                pst.setString(3, email);
                pst.setInt(4, status);
                pst.setString(5, gender);
                pst.setInt(6, id);
                pst.setString(7, experience);
                pst.setString(8, degree);
                pst.setString(9, img);
                pst.setInt(10, id);

                int rs = pst.executeUpdate();
                kq = true;
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
        return kq;
    }

    public static boolean insertDentist(String fullname, String phone, String email, String password, String degree, String experience, String img, int status, String gender, String idRoleDentist) {
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                int iddentist = 0;

                String sql = "INSERT INTO tblUser\n"
                        + "values (?,?,?,?,?,?,?,?)\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullname);
                pst.setString(2, password);
                pst.setString(3, phone);
                pst.setInt(4, 2);
                pst.setInt(5, 1);
                pst.setString(6, email);
                pst.setString(7, null);
                pst.setString(8, gender);
                pst.executeUpdate();

                sql = "select top 1 id from tblUser order by id desc";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    iddentist = rs.getInt("id");
                }

                sql = "INSERT INTO tblDentist\n"
                        + "values (?, ?, ?, ?, ?)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, iddentist);
                pst.setString(2, experience);
                pst.setString(3, degree);
                pst.setString(4, img);
                pst.setString(5, idRoleDentist);
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

    public static boolean updateStatusDentist(int id, int status) {
        boolean kq = false;
        Dentist den = null;
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblUser\n"
                        + "SET status = ?\n"
                        + "WHERE id = ?;\n";

                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, status);

                pst.setInt(2, id);

                int rs = pst.executeUpdate();
                kq = true;
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
        return kq;
    }

    public static boolean checkDentistIsFree(Date dateSelected, Time timeSelected, int dentistID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql1 = "select * from tblAppointment where dentistID = ? and appDate = ? and appTime between ? and ? and status = 0";
                stm = con.prepareStatement(sql1);
                stm.setInt(1, dentistID);
                stm.setDate(2, dateSelected);
                stm.setTime(3, timeSelected);
                stm.setTime(4, new Time(timeSelected.toLocalTime().plusMinutes(30).toNanoOfDay() / 1_000_000));
                rs = stm.executeQuery();
                if (!rs.next()) {
                    String sql2 = "select * from \n"
                            + "tblTreatmentCourseDetail td join tblTreatmentCourse t\n"
                            + "on td.treatmentID = t.id\n"
                            + "where t.dentistID = ? and td.treatmentDate = ? and treatmentTime between ? and ? and td.status = 0";
                    stm = con.prepareStatement(sql2);
                    stm.setInt(1, dentistID);
                    stm.setDate(2, dateSelected);
                    stm.setTime(3, timeSelected);
                    stm.setTime(4, new Time(timeSelected.toLocalTime().plusMinutes(30).toNanoOfDay() / 1_000_000));
                    rs = stm.executeQuery();
                    if(!rs.next()){
                        return true;
                    }
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
        return false;
    }
}
