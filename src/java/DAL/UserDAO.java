/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Bill;
import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Util.Util;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserDAO {

    public User checkLogin(String accountName, String password) throws SQLException {
        User user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql1 = "select * from tblUser where email = ? and password = ?";
                stm = con.prepareStatement(sql1);
                stm.setString(1, accountName);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    user = new User(rs.getInt(1), rs.getString(2), "*********", rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9));
                } else {
                    String sql2 = "select * from tblUser where phoneNumber = ? and password = ?";
                    stm = con.prepareStatement(sql2);
                    stm.setInt(1, Integer.parseInt(accountName));
                    stm.setString(2, password);
                    rs = stm.executeQuery();
                    if (rs.next()) {
                        user = new User(rs.getInt(1), rs.getString(2), "*********", rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
        return user;
    }

    public int getAllEmployees() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select count(*) from tblUser where idRole !=5 and idRole!=2";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public int getAllNumberPatient() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select count(*) from tblUser where idRole =5 and status = 1";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public List<User> pagingEmployees(int index) throws SQLException {
        List<User> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblUser where idRole !=5 and idRole !=2 and status = 1  order by id desc offset ? rows fetch next 8 rows only";
                stm = con.prepareStatement(sql);
                stm.setInt(1, (index - 1) * 8);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9)));
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
        return list;
    }

    public List<User> searchEmployeesByRole(int id) throws SQLException {
        List<User> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                if (id != 0) {
                    String sql = "select * from tblUser where idRole = ?";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, id);
                } else {
                    list = pagingEmployees(1);
                }
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9)));
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
        return list;
    }

    public List<User> searchEmployeesByName(String name) throws SQLException {
        List<User> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblUser where fullName like ?  COLLATE SQL_Latin1_General_CP1_CI_AI and idRole!=5 and idRole!=2 and status = 1 ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9)));
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
        return list;
    }

    public User getUserByEmail(String email) throws SQLException {
        User user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblUser where email = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                while (rs.next()) {
                    user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
        return user;
    }

    public User getEmployeeById(int id) throws SQLException {
        User user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblUser where id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9));
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
        return user;
    }

    public boolean editPasswordUser(String email, String passnew) {
        boolean kq = false;
        User u = null;
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblUser\n"
                        + "SET password = ?\n"
                        + "WHERE email = ?;\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, passnew);
                pst.setString(2, email);

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

    public void editEmployee(int id, String name, String email, String phoneNumber, int roleID, boolean status, String gender) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "update tblUser set fullName = ?, phoneNumber = ?, idRole = ?, status =?, gender = ?, email = ? where id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, phoneNumber);
                stm.setInt(3, roleID);
                stm.setBoolean(4, status);
                stm.setString(5, gender);
                stm.setString(6, email);
                stm.setInt(7, id);
                stm.executeUpdate();
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
    }

    public void insertEmployee(String name, String password, String phoneNumber, int idRole, String gender, String email) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "insert into tblUser(fullName, password, phoneNumber, idRole,status, email, gender) values(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, password);
                stm.setString(3, phoneNumber);
                stm.setInt(4, idRole);
                stm.setBoolean(5, true);
                stm.setString(6, email);
                stm.setString(7, gender);
                stm.executeUpdate();
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
    }

    public static ArrayList<User> getAllPatient() {
        ArrayList<User> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select *\n"
                        + "from tblUser\n"
                        + "where idRole = 5";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String fullName = rs.getString("fullName");
                        String password = rs.getString("password");
                        String phoneNumber = rs.getString("phoneNumber");
                        int idRole = rs.getInt("idRole");
                        boolean status = rs.getBoolean("status");
                        String email = rs.getString("email");
                        String roll = rs.getString("Roll");
                        String gender = rs.getString("gender");
                        User patient = new User(id, fullName, password, phoneNumber, idRole, status, email, roll, gender);
                        list.add(patient);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public void deleteEmployeeByID(int id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "update tblUser set status = 0 where id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
                stm.executeUpdate();
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
    }

    public static ArrayList<User> searchPatient(String searchname) {
        ArrayList<User> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from tblUser\n"
                        + "where [fullName] like ? COLLATE SQL_Latin1_General_CP1_CI_AI and idRole = 5";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + searchname + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String fullName = rs.getString("fullName");
                        String password = rs.getString("password");
                        String phoneNumber = rs.getString("phoneNumber");
                        int idRole = rs.getInt("idRole");
                        boolean status = rs.getBoolean("status");
                        String email = rs.getString("email");
                        String roll = rs.getString("Roll");
                        User patient = new User(id, fullName, password, phoneNumber, idRole, status, email, roll);
                        list.add(patient);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static boolean insertPatient(String fullName, String email, String phoneNumber, int status, int idRole, String Roll, String password, String gender) {
        Connection cn = null;
        int kq = 0;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String s = "insert into dbo.tblUser(fullName, email,phoneNumber,status,idRole,Roll,password,gender)\n"
                        + "                        values (?,?,?,?,5,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, fullName);
                pst.setString(2, email);
                pst.setString(3, phoneNumber);
                pst.setInt(4, status);
                pst.setString(5, Roll);
                pst.setString(6, password);
                pst.setString(7, gender);
                kq = pst.executeUpdate();
                if (kq != 0) {
                    return true;
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
        return false;
    }

    public static User getPatient(int id) {
        Connection cn = null;
        User p = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from  tblUser where id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, id);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String name = rs.getString("fullName");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phoneNumber");
                    int idRole = rs.getInt("idRole");

                    boolean status = rs.getBoolean("status");
                    String email = rs.getString("email");
                    String Roll = rs.getString("Roll");
                    p = new User(id, name, password, phoneNumber, idRole, status, email, Roll);
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
        return p;
    }

    public static boolean editPatient(String fullName, String email, String password, String phoneNumber, String Roll, boolean status) {
        Connection cn = null;
        int kq = 0;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "update dbo.tblUser\n"
                        + "set fullName=?,email=?,password=?,phoneNumber=?,Roll=?,status=?\n"
                        + " where id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullName);
                pst.setString(2, email);
                pst.setString(3, password);
                pst.setString(4, phoneNumber);
                pst.setString(5, Roll);
                pst.setBoolean(6, status);
                kq = pst.executeUpdate();
                if (kq != 0) {
                    return true;
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
        return false;
    }

    public ArrayList<User> getCountPatient(int from) {
        ArrayList<User> list = new ArrayList<>();
        Util dbu = new Util();

        String sql = " select *\n"
                + "from tblUser where idRole =5 and status =1\n"
                + "order by id DESC\n"
                + "offset ? row\n"
                + "fetch next 7 row only";
        try {
            Connection connection = dbu.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, from);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User c = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean deletePatient(String id, int status) {
        boolean kq = false;
        User den = null;
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblUser\n"
                        + "SET status = ?\n"
                        + "WHERE id = ?;\n";

                PreparedStatement pst = cn.prepareStatement(sql);

                pst.setInt(1, status);

                pst.setString(2, id);

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

    public boolean checkEmailExists(String email) {
        Connection cn = null;
        boolean emailExists = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from  tblUser where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    emailExists = (count > 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return emailExists;
    }

    public boolean checkRollExists(String roll) {
        Connection cn = null;
        int kq = 0;
        boolean rollExists = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from  tblUser where Roll = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, roll);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    rollExists = (count > 0);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rollExists;
    }
//    public boolean checkPhoneNumberExists(String phoneNumber) {
//        Connection cn = null;
//        int kq = 0;
//        boolean rollExists = false;
//        try {
//            cn = Util.getConnection();
//            if (cn != null) {
//                String sql = "select * from  tblUser where phoneNumber = ?";
//                PreparedStatement pst = cn.prepareStatement(sql);
//                pst.setString(1, phoneNumber);
//                ResultSet rs = pst.executeQuery();
//                if (rs.next()) {
//                    int count = rs.getInt(1);
//                    rollExists = (count > 0);
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return rollExists;
//    }

    public void editMyProfile(int id, String name, String phoneNumer, String gender) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "update tblUser set fullName = ?, phoneNumber = ?, gender = ? where id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, phoneNumer);
                stm.setString(3, gender);
                stm.setInt(4, id);
                stm.executeUpdate();
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
    }

    public String signup(String name, String email, String password, String phoneNumber) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String success = "";
        try {
            con = Util.getConnection();
            if (con != null) {
                boolean emailExist = checkEmailExists(email);
                if (!emailExist) {
                    String sql1 = "select top(1) Roll from tblUser where idRole = 5 order by id desc";
                    stm = con.prepareStatement(sql1);
                    rs = stm.executeQuery();
                    String rawRoll1 = "";
                    if (rs.next()) {
                        rawRoll1 = rs.getString("Roll");
                    }
                    int rawRoll2 = Integer.parseInt(rawRoll1.substring(1)) + 1;
                    String Roll = "P" + rawRoll2;
                    String sql2 = "insert into tblUser values(?,?,?,5,1,?,?,'Nam')";
                    stm = con.prepareStatement(sql2);
                    stm.setString(1, name);
                    stm.setString(2, password);
                    stm.setString(3, phoneNumber);
                    stm.setString(4, email);
                    stm.setString(5, Roll);
                    int row = stm.executeUpdate();
                    if (row > 0) {
                        success = Roll;
                    }
                }
            }
        } catch (Exception e) {
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
        return success;
    }

    public static ArrayList<Bill> getBill() {
        ArrayList<Bill> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT tblTreatmentCourse.id AS id, usertable.fullName AS username, datetable.treatmentDate AS treatmentDate,datetable.description as description, servicetable.price AS price, tblTreatmentCourse.status as status\n"
                        + "FROM tblTreatmentCourse\n"
                        + "JOIN (SELECT id, fullName FROM tblUser WHERE idRole = 5) AS usertable ON tblTreatmentCourse.userID = usertable.id\n"
                        + "JOIN (SELECT id, price FROM tblService) AS servicetable ON tblTreatmentCourse.id = servicetable.id\n"
                        + "JOIN (SELECT id, treatmentDate, description, statusPaid  FROM tblTreatmentCourseDetail) AS datetable ON tblTreatmentCourse.id = datetable.id";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String treatmentDate = rs.getString("treatmentDate");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        boolean status = rs.getBoolean("status");
                        Bill bill = new Bill(id, username, treatmentDate, description, price, status);
                        list.add(bill);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static ArrayList<Bill> getUnpaidBills() {
        ArrayList<Bill> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT tblTreatmentCourse.id AS id, usertable.fullName AS username, datetable.treatmentDate AS treatmentDate,datetable.description as description, servicetable.price AS price, tblTreatmentCourse.status as status\n"
                        + "FROM tblTreatmentCourse\n"
                        + "JOIN (SELECT id, fullName FROM tblUser WHERE idRole = 5) AS usertable ON tblTreatmentCourse.userID = usertable.id\n"
                        + "JOIN (SELECT id, price FROM tblService) AS servicetable ON tblTreatmentCourse.id = servicetable.id\n"
                        + "JOIN (SELECT id, treatmentDate, description, statusPaid  FROM tblTreatmentCourseDetail) AS datetable ON tblTreatmentCourse.id = datetable.id and tblTreatmentCourse.status = 0";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String treatmentDate = rs.getString("treatmentDate");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        boolean status = rs.getBoolean("status");
                        Bill bill = new Bill(id, username, treatmentDate, username, price, status);
                        list.add(bill);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;

    }

    public static ArrayList<Bill> getpaidBills() {
        ArrayList<Bill> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT tblTreatmentCourse.id AS id, usertable.fullName AS username, datetable.treatmentDate AS treatmentDate,datetable.description as description, servicetable.price AS price, tblTreatmentCourse.status as status\n"
                        + "FROM tblTreatmentCourse\n"
                        + "JOIN (SELECT id, fullName FROM tblUser WHERE idRole = 5) AS usertable ON tblTreatmentCourse.userID = usertable.id\n"
                        + "JOIN (SELECT id, price FROM tblService) AS servicetable ON tblTreatmentCourse.id = servicetable.id\n"
                        + "JOIN (SELECT id, treatmentDate, description, statusPaid  FROM tblTreatmentCourseDetail) AS datetable ON tblTreatmentCourse.id = datetable.id and tblTreatmentCourse.status = 1";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String treatmentDate = rs.getString("treatmentDate");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        boolean status = rs.getBoolean("status");
                        Bill bill = new Bill(id, username, treatmentDate, username, price, status);
                        list.add(bill);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public ArrayList<Bill> getCountBill(int from) {
//        ArrayList<Bill> list = new ArrayList<>();
//        Util dbu = new Util();
//
//        String sql = " select tblTreatmentCourse.id as id, usertable.fullName as username,datetable.treatmentDate as treatmentDate,servicetable.price as price, tblTreatmentCourse.PaidStatus\n"
//                + "from tblTreatmentCourse, (select id, fullName from tblUser where idRole = 5) as usertable, (select id, price from tblService) as servicetable, (select id, treatmentDate from tblTreatmentCourseDetail) as datetable\n"
//                + "where tblTreatmentCourse.userID = usertable.id and tblTreatmentCourse.serviceID = servicetable.id and  tblTreatmentCourse.id = datetable.id\n"
//                + "order by id DESC\n"
//                + "offset ? row\n"
//                + "fetch next 4 row only";
//        try {
//            Connection connection = dbu.getConnection();
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, from);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Bill c = new Bill(from, sql, sql, from, true);
//                list.add(c);
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return list;
//    }
    public static ArrayList<Bill> searchUserByDate(String fromDate, String toDate) {
        ArrayList< Bill> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT tblTreatmentCourse.id AS id, usertable.fullName AS username, datetable.treatmentDate AS treatmentDate,datetable.description as description, servicetable.price AS price, tblTreatmentCourse.status as status\n"
                        + "FROM tblTreatmentCourse\n"
                        + "JOIN (SELECT id, fullName FROM tblUser WHERE idRole = 5) AS usertable ON tblTreatmentCourse.userID = usertable.id\n"
                        + "JOIN (SELECT id, price FROM tblService) AS servicetable ON tblTreatmentCourse.id = servicetable.id\n"
                        + "JOIN (SELECT id, treatmentDate, description, statusPaid  FROM tblTreatmentCourseDetail) AS datetable ON tblTreatmentCourse.id = datetable.id\n"
                        + "where (datetable.treatmentDate BETWEEN ?  AND ?)";

                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fromDate);
                pst.setString(2, toDate);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String username = rs.getString("username");
                        String treatmentDate = rs.getString("treatmentDate");
                        String description = rs.getString("description");
                        float price = rs.getFloat("price");
                        boolean status = rs.getBoolean("status");
                        Bill bill = new Bill(id, username, treatmentDate, description, price, status);
                        list.add(bill);
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


    public int searchUserByRoll(String Roll) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int id = 0;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select id from tblUser where Roll = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, Roll);
                rs = stm.executeQuery();
                if (rs.next()) {
                    id = rs.getInt(1);
                }
            }
        } catch (Exception e) {
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
        return id;
    }

    public static User getUserLoginByGoogle(String idGg) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        User user = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from  tblUser where idGoogle = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, idGg);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String name = rs.getString("fullName");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phoneNumber");
                    int idRole = rs.getInt("idRole");
                    boolean status = rs.getBoolean("status");
                    String email = rs.getString("email");
                    String roll = rs.getString("Roll");
                    String gender = rs.getString("gender");
                    user = new User(idRole, name, password, phoneNumber, idRole, status, email, roll, gender);
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
        return user;
    }

    public static User getUserLoginByFacebook(String idFb) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        User user = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from  tblUser where idFacebook = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, idFb);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String name = rs.getString("fullName");
                    String password = rs.getString("password");
                    String phoneNumber = rs.getString("phoneNumber");
                    int idRole = rs.getInt("idRole");
                    boolean status = rs.getBoolean("status");
                    String email = rs.getString("email");
                    String roll = rs.getString("Roll");
                    String gender = rs.getString("gender");
                    user = new User(idRole, name, password, phoneNumber, idRole, status, email, roll, gender);
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
        return user;
    }

    public static boolean insertUserLoginByGoogle(String idGoogle, String name, String email, String phone, String gender) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select top(1) Roll from tblUser where idRole = 5 order by id desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                String rawRoll = "";
                if (rs.next()) {
                    rawRoll = rs.getString("Roll");
                }
                int nextRoll = Integer.parseInt(rawRoll.substring(1)) + 1;
                String Roll = "P" + nextRoll;
                sql = "insert into dbo.tblUser(fullName, email,phoneNumber,status,idRole,Roll,gender,idGoogle)\n"
                        + "                        values (?,?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, phone);
                pst.setInt(4, 1);
                pst.setInt(5, 5);
                pst.setString(6, Roll);
                pst.setString(7, gender);
                pst.setString(8, idGoogle);
                pst.executeUpdate();
                result = true;
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

    public static boolean insertUserLoginByFacebook(String idFacebook, String name, String email, String phone, String gender) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select top(1) Roll from tblUser where idRole = 5 order by id desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                String rawRoll = "";
                if (rs.next()) {
                    rawRoll = rs.getString("Roll");
                }
                int nextRoll = Integer.parseInt(rawRoll.substring(1)) + 1;
                String Roll = "P" + nextRoll;
                sql = "insert into dbo.tblUser(fullName, email,phoneNumber,status,idRole,Roll,gender,idFacebook)\n"
                        + "                        values (?,?,?,?,?,?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, email);
                pst.setString(3, phone);
                pst.setInt(4, 1);
                pst.setInt(5, 5);
                pst.setString(6, Roll);
                pst.setString(7, gender);
                pst.setString(8, idFacebook);
                pst.executeUpdate();
                result = true;
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

    public static boolean isExistAccountLoginByGoogle(String idGoogle) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT COUNT(*) FROM tblUser WHERE idGoogle = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, idGoogle);
                rs = pst.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                if (count != 0) {
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

    public static boolean isExistAccountLoginByFacebook(String idFacebook) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT COUNT(*) FROM tblUser WHERE idFacebook = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, idFacebook);
                rs = pst.executeQuery();
                rs.next();
                int count = rs.getInt(1);
                if (count != 0) {
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

    public static boolean updateProfileUser(int id,String fullName, String phone, String email, String gender) {
        boolean kq = false;
        User den = null;
        Connection cn = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblUser\n"
                        + "SET fullName =?, phoneNumber = ?, email = ?, gender = ?\n"
                        + "where id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullName);
                pst.setString(2, phone);
                pst.setString(3, email);
                pst.setString(4, gender);
                pst.setInt(5, id);

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
    
    public static boolean checkEmail(String email) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "SELECT COUNT(*) FROM tblUser WHERE email = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, email);
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
     
        return result;
    }    
}

    public static User getUserByID(String id)  {
        User user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblUser where id = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    public static void main(String[] args) throws SQLException {
        User q = UserDAO.getUserByID("1");
        System.out.println(q.getFullName());
    }

}
