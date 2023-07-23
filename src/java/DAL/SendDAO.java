/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import Models.User;
import Util.Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;


/**
 *
 * @author Admin
 */
public class SendDAO {

    

    public static String getSoNgauNhien() {
        Random rd = new Random();
        String s1 = rd.nextInt(10000) + "";
        if (Integer.parseInt(s1) < 1000 || Integer.parseInt(s1) == 10000) {
            return getSoNgauNhien();
        }


        return s1;
    }

    public User checkMail(String Mail) throws SQLException {
        User user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql1 = "select * from tblUser where email = ?";
                stm = con.prepareStatement(sql1);
                stm.setString(1, Mail);
                rs = stm.executeQuery();
                if (rs.next()) {

                    user = new User(rs.getInt(1), rs.getString(2), "*********", rs.getString(4), rs.getInt(5), rs.getBoolean(6), rs.getString(7), rs.getString(8), rs.getString(9));

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

    public static boolean forgotPass(String pass, String email) {
        Connection cn = null;
        int kq = 0;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "update dbo.tblUser\n"
                        + "set password = ?\n"
                        + "where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, pass);
                pst.setString(2, email);

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
}
