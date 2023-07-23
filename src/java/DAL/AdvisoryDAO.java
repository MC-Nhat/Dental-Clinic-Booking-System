/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Advisory;
import Models.User;
import Util.Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalDate;
/**
 *
 * @author Admin
 */
public class AdvisoryDAO {

    public List<Advisory> getAddvisory() throws SQLException {
        List<Advisory> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblAdvisory where status = 0";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Advisory(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getBoolean(6)));
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

    public void CompletedAdvisory(int id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "update tblAdvisory set status = 1 where id = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, id);
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

    public List<Advisory> sortByDateAdvisory(String orderBy) throws SQLException {
        List<Advisory> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "";
                if (orderBy.equals("ASC")) {
                    sql = "select * from tblAdvisory where status = 0 order by advisoryDate ASC";
                } else if (orderBy.equals("DESC")) {
                    sql = "select * from tblAdvisory where status = 0 order by advisoryDate DESC";
                }
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Advisory(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getBoolean(6)));
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

    public void insertAdvisory(String name, int phoneNumber, String description) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "insert into tblAdvisory values(?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                LocalDate today =  LocalDate.now();
                stm.setDate(1, java.sql.Date.valueOf(today));
                stm.setString(2, name);
                stm.setInt(3, phoneNumber);
                stm.setString(4, description);
                stm.setBoolean(5, false);
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

}
