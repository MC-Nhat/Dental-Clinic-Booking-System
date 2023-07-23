/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Role;
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
public class RoleDAO {
    public List getEmployeeRole() throws SQLException{
        List<Role> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = Util.getConnection();
            if(con!=null){
                String sql = "select * from tblRole where id!=5 and id!=2";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {                    
                    list.add(new Role(rs.getInt(1), rs.getString(2)));
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                rs.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }
}
