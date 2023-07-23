/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;
import Models.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import Util.Util;
/**
 *
 * @author Admin
 */
public class ServiesDAO {
    public List<Service> getAllServies() throws SQLException{
        List<Service> list = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try{
            con = Util.getConnection();
            if(con!=null){
                String sql = "";
                
                
                
                
                
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally{
            if(rs!=null){
                rs.close();
            }
            if(stm!=null){
                stm.close();
            }
            if(con!=null){
                con.close();
            }
        }
        return list;
    }
}
