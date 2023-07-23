/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.util.ArrayList;
import Models.FeedbackDentist;
import Util.Util;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Admin
 */
public class FeedbackDentistDAO {

    public static ArrayList<FeedbackDentist> getFeedbackDentist() throws SQLException {
        ArrayList<FeedbackDentist> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select top 5 tblFeedBackDentist.id as id, dentisttable.fullName as dentistname, customertable.fullName as customername, tblFeedBackDentist.rate as rate, tblFeedBackDentist.cmt as comment\n"
                        + "from tblFeedBackDentist, (select id, fullName from tblUser where idRole = 2) as dentisttable, (select id, fullName from tblUser where idRole = 5) as customertable\n"
                        + "where tblFeedBackDentist.dentistID = dentisttable.id and tblFeedBackDentist.userID = customertable.id and tblFeedBackDentist.status = 1";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String denname = rs.getString("dentistname");
                        String cusname = rs.getString("customername");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("comment");
                        FeedbackDentist fbd = new FeedbackDentist(id, denname, cusname, rate, cmt);
                        list.add(fbd);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                rs.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list;
    }

    public static ArrayList<FeedbackDentist> getNext5FeedbackDentist(int position) throws SQLException {
        ArrayList<FeedbackDentist> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select tblFeedBackDentist.id as id, dentisttable.fullName as dentistname, customertable.fullName as customername, tblFeedBackDentist.rate as rate, tblFeedBackDentist.cmt as comment\n"
                        + "from tblFeedBackDentist, (select id, fullName from tblUser where idRole = 2) as dentisttable, (select id, fullName from tblUser where idRole = 5) as customertable\n"
                        + "where tblFeedBackDentist.dentistID = dentisttable.id and tblFeedBackDentist.userID = customertable.id and tblFeedBackDentist.status = 1\n"
                        + "order by tblFeedBackDentist.dentistID offset ? rows\n"
                        + "fetch next 5 rows only";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, position);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String denname = rs.getString("dentistname");
                        String cusname = rs.getString("customername");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("comment");
                        FeedbackDentist fbd = new FeedbackDentist(id, denname, cusname, rate, cmt);
                        list.add(fbd);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                rs.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list;
    }
    
    public static ArrayList<FeedbackDentist> getNext5FeedbackDentist(String keyword, String searchby, int position) throws SQLException {
        ArrayList<FeedbackDentist> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null && searchby != null) {
                String sql = "select tblFeedBackDentist.id as id, dentisttable.fullName as dentistname, customertable.fullName as customername, rate, cmt\n"
                        + "from tblFeedBackDentist, (select id, fullName from tblUser where tblUser.idRole = 5) as customertable, (select id, fullName from tblUser where tblUser.idRole = 2) as dentisttable\n"
                        + "where tblFeedBackDentist.userID = customertable.id and tblFeedBackDentist.dentistID = dentisttable.id and tblFeedBackDentist.status = 1 and";
                if (searchby.equalsIgnoreCase("bycustomername")) {
                    sql = sql + " customertable.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI\n";
                } else {
                    sql = sql + " dentisttable.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI\n";
                }
                sql += "order by id offset ? rows\n"
                        + "fetch next 5 rows only";
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                pst.setInt(2, position);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String customername = rs.getString("customername");
                        String dentistname = rs.getString("dentistname");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("cmt");
                        FeedbackDentist fbd = new FeedbackDentist(id, dentistname, customername, rate, cmt);
                        list.add(fbd);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                rs.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list;
    }    

    public static ArrayList<FeedbackDentist> getFeedbackDentist(String keyword, String searchby) throws SQLException {
        ArrayList<FeedbackDentist> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null && searchby != null) {
                String sql = "select top 5 tblFeedBackDentist.id as id, dentisttable.fullName as dentistname, customertable.fullName as customername, rate, cmt\n"
                        + "from tblFeedBackDentist, (select id, fullName from tblUser where tblUser.idRole = 5) as customertable, (select id, fullName from tblUser where tblUser.idRole = 2) as dentisttable\n"
                        + "where tblFeedBackDentist.userID = customertable.id and tblFeedBackDentist.dentistID = dentisttable.id and tblFeedBackDentist.status = 1 and";
                if (searchby.equalsIgnoreCase("bycustomername")) {
                    sql = sql + " customertable.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI";
                } else {
                    sql = sql + " dentisttable.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI";
                }
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String customername = rs.getString("customername");
                        String dentistname = rs.getString("dentistname");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("cmt");
                        FeedbackDentist fbd = new FeedbackDentist(id, dentistname, customername, rate, cmt);
                        list.add(fbd);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                rs.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list;
    }

    public static boolean deleteFeedbackDentist(int feedbackid) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblFeedBackDentist\n"
                        + "SET status = 0\n"
                        + " WHERE id = ?";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, feedbackid);
                pst.executeUpdate();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                rs.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return result;
    }

    public ArrayList<FeedbackDentist> getTop2FeedbackDentistOfDentistRate45(String iddentist) throws SQLException {
        ArrayList<FeedbackDentist> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select TOP 2 tblFeedBackDentist.id as id, dentisttable.fullName as dentistname, customertable.fullName as customername, rate, cmt\n"
                        + "from tblFeedBackDentist, (select id, fullName from tblUser where tblUser.idRole = 5) as customertable, (select id, fullName from tblUser where tblUser.idRole = 2) as dentisttable\n"
                        + "where tblFeedBackDentist.userID = customertable.id and tblFeedBackDentist.dentistID = dentisttable.id\n"
                        + "and (rate = 5 or rate = 4) and dentistID = ?";
                pst = cn.prepareStatement(sql);
                pst.setString(1, iddentist);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String denname = rs.getString("dentistname");
                        String cusname = rs.getString("customername");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("cmt");
                        FeedbackDentist fbd = new FeedbackDentist(id, denname, cusname, rate, cmt);
                        list.add(fbd);
                    }
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
        return list;
    }

    public void addFeedBackDentist(int userID, int dentistID, int rate, String content) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "insert into tblFeedBackDentist values(?,?,?,?,1)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, userID);
                pst.setInt(2, dentistID);
                pst.setInt(3, rate);
                pst.setString(4, content);
                pst.execute();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
    }
}
