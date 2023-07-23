/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Util.Util;
import Models.FeedbackService;
import Models.FeedbackService;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class FeedbackServiceDAO {

    public static ArrayList<FeedbackService> getFeedbackService() throws SQLException {
        ArrayList<FeedbackService> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select top 5 tblFeedBackService.id as id, tblService.serviceName as serviceName, tblUser.fullName as customerName, tblFeedBackService.rate as rate, tblFeedBackService.comment as comment\n"
                        + "from tblFeedBackService, tblService, tblUser\n"
                        + "where tblFeedBackService.userID = tblUser.id and tblFeedBackService.serviceID = tblService.id and tblFeedBackService.status = 1";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String cusname = rs.getString("customerName");
                        String sername = rs.getString("serviceName");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("comment");
                        FeedbackService fbs = new FeedbackService(id, cusname, sername, rate, cmt);
                        list.add(fbs);
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

    public static ArrayList<FeedbackService> getNext5FeedbackService(int position) throws SQLException {
        ArrayList<FeedbackService> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select tblFeedBackService.id as id, tblService.serviceName as serviceName, tblUser.fullName as customerName, tblFeedBackService.rate as rate, tblFeedBackService.comment as comment\n"
                        + "from tblFeedBackService, tblService, tblUser\n"
                        + "where tblFeedBackService.userID = tblUser.id and tblFeedBackService.serviceID = tblService.id and tblFeedBackService.status = 1\n"
                        + "order by id offset ? rows\n"
                        + "fetch next 5 rows only";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, position);
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String cusname = rs.getString("customerName");
                        String sername = rs.getString("serviceName");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("comment");
                        FeedbackService fbs = new FeedbackService(id, cusname, sername, rate, cmt);
                        list.add(fbs);
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

    public static ArrayList<FeedbackService> getNext5FeedbackService(String keyword, String searchby, int position) throws SQLException {
        ArrayList<FeedbackService> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null && searchby != null) {
                String sql = "select tblFeedBackService.id as id, tblUser.fullName as customername, serviceName, rate, comment\n"
                        + "from tblFeedBackService, tblUser, tblService\n"
                        + "where tblFeedBackService.userID = tblUser.id and tblFeedBackService.serviceID = tblService.id and tblFeedBackService.status = 1 and";
                if (searchby.equalsIgnoreCase("bycustomername")) {
                    sql = sql + " tblUser.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI\n";
                } else {
                    sql = sql + " tblService.serviceName like ? COLLATE SQL_Latin1_General_CP1_CI_AI\n";
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
                        String servicename = rs.getString("serviceName");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("comment");
                        FeedbackService fbs = new FeedbackService(id, customername, servicename, rate, cmt);
                        list.add(fbs);
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

    public static ArrayList<FeedbackService> getFeedbackService(String keyword, String searchby) throws SQLException {
        ArrayList<FeedbackService> list = new ArrayList<>();
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = Util.getConnection();
            if (cn != null && searchby != null) {
                String sql = "select top 5 tblFeedBackService.id as id, tblUser.fullName as customername, serviceName, rate, comment\n"
                        + "from tblFeedBackService, tblUser, tblService\n"
                        + "where tblFeedBackService.userID = tblUser.id and tblFeedBackService.serviceID = tblService.id and tblFeedBackService.status = 1 and";
                if (searchby.equalsIgnoreCase("bycustomername")) {
                    sql = sql + " tblUser.fullName like ? COLLATE SQL_Latin1_General_CP1_CI_AI";
                } else {
                    sql = sql + " tblService.serviceName like ? COLLATE SQL_Latin1_General_CP1_CI_AI";
                }
                pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String customername = rs.getString("customername");
                        String servicename = rs.getString("serviceName");
                        int rate = rs.getInt("rate");
                        String cmt = rs.getString("comment");
                        FeedbackService fbs = new FeedbackService(id, customername, servicename, rate, cmt);
                        list.add(fbs);
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

    public static boolean deleteFeedbackService(int feedbackid) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        boolean result = false;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "UPDATE tblFeedBackService\n"
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

    public void addFeedBackService(int userID, int serviceID, int rate, String content) throws SQLException {
        Connection cn = null;
        PreparedStatement pst = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "insert into tblFeedBackService values(?,?,?,?,1)";
                pst = cn.prepareStatement(sql);
                pst.setInt(1, userID);
                pst.setInt(2, serviceID);
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

    public static ArrayList<Integer> getRates() throws SQLException {
        ArrayList<Integer> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                for (int i = 1; i <= 5; i++) {
                    String sql = "select Count(*) as fivestars from tblFeedBackService where rate = ?";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, i);
                    rs = stm.executeQuery();
                    if (rs.next()) {
                        list.add(rs.getInt(1));
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
        return list;
    }
}
