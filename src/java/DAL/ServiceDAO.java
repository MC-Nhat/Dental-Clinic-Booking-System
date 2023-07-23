/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAL;

import static DAL.FeedbackServiceDAO.getFeedbackService;
import Models.FeedbackService;
import Models.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import Util.Util;

/**
 *
 * @author Admin
 */
public class ServiceDAO {

    public ArrayList<Service> getService(int from) {
        ArrayList<Service> list = new ArrayList<>();
        Util dbu = new Util();

        String sql = " SELECT *\n"
                + "FROM tblService\n"
                + "ORDER BY id DESC\n"
                + "OFFSET ? ROWS\n"
                + "FETCH NEXT 10 ROWS ONLY;";
        try {
            Connection connection = dbu.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, from);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service c = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getBoolean(5));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static ArrayList<Service> getAllService() {
        ArrayList<Service> list = new ArrayList<>();
        Util dbu = new Util();

        String sql = " SELECT *\n"
                + "FROM tblService\n";
        try {
            Connection connection = dbu.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service c = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getBoolean(5));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public ArrayList<Service> sortService(int from, String option) {
        ArrayList<Service> list = new ArrayList<>();
        Util dbu = new Util();

        String sql = "SELECT * FROM tblService\n"
                + "WHERE id BETWEEN (SELECT MAX(id) -? FROM tblService) AND (SELECT MAX(id) -? FROM tblService)"
                + "ORDER BY price " + option + ";";
        try {
            Connection connection = dbu.getConnection();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, from);
            ps.setInt(2, from - 9);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Service c = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getBoolean(5));
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static boolean insert(String name, String mota, float price, boolean status) {
        Connection cn = null;
        int kq = 0;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String s = "insert into dbo.tblService (serviceName, description,price,status)\n"
                        + "                values (?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(s);
                pst.setString(1, name);
                pst.setString(2, mota);
                pst.setFloat(3, price);
                pst.setBoolean(4, status);
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

    public static boolean edit(int id, String name, String mota, float price, boolean status) {
        Connection cn = null;
        int kq = 0;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "update dbo.tblService\n"
                        + "set serviceName=?,description=?,price=?,status=?\n"
                        + " where id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, name);
                pst.setString(2, mota);
                pst.setFloat(3, price);
                pst.setBoolean(4, status);
                pst.setInt(5, id);
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

    public static Service getServiceById(int sid) {
        Connection cn = null;
        Service p = null;
        try {
            cn = Util.getConnection();
            if (cn != null) {
                String sql = "select * from  tblService\n"
                        + "where id = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, sid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    String name = rs.getString("serviceName");
                    String mota = rs.getString("description");
                    float price = rs.getFloat("price");
                    boolean status = rs.getBoolean("status");
                    p = new Service(sid, name, mota, price, status);
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

    public void deleteService(int id) {
        Connection cn = null;
        String sql = "update dbo.tblService\n"
                + "set status=0\n"
                + "where id = ?";

        try {
            cn = Util.getConnection();//mo ket noi voi sql
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, id);
            pst.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countService() {
        Connection cn = null;
        String sql = "SELECT COUNT(*) AS total_rows FROM tblService;";
        int totalRows = 0;

        try {
            cn = Util.getConnection();
            PreparedStatement pst = cn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                totalRows = rs.getInt("total_rows");
            }

            rs.close();
            pst.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return totalRows;
    }

    public List<Service> searchServiceByName(String name) {
        List<Service> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = Util.getConnection();
            if (con != null) {
                String sql = "select * from tblService where serviceName like ? COLLATE SQL_Latin1_General_CP1_CI_AI";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    Service c = new Service(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getFloat(4), rs.getBoolean(5));
                    list.add(c);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

//    public static Service getServiceUser(String keyword) throws SQLException {
//        Service fbs = null;
//        Connection cn = null;
//        PreparedStatement pst = null;
//        ResultSet rs = null;
//        try {
//            cn = Util.getConnection();
//            if (cn != null) {
//                String sql = "select tblFeedBackService.id as id,serviceName, description,price, comment\n"
//                        + "from tblFeedBackService, tblUser, tblService\n"
//                        + "where tblFeedBackService.userID = tblUser.id and tblFeedBackService.serviceID = tblService.id and "
//                        + "tblService.id = ? ";
//                pst = cn.prepareStatement(sql);
//                pst.setString(1, keyword);
//                rs = pst.executeQuery();
//                if (rs != null) {
//                    while (rs.next()) {
//                        int id = rs.getInt("id");
//                        String servicename = rs.getString("serviceName");
//                        String description = rs.getString("description");
//                        float price = rs.getFloat("price");
//                        String cmt = rs.getString("comment");
//                        fbs = new Service(id, servicename, description, price, cmt);
//
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            if (rs != null) {
//                rs.close();
//            }
//            if (pst != null) {
//                rs.close();
//            }
//            if (cn != null) {
//                cn.close();
//            }
//        }
//        return fbs;
//    }
}
