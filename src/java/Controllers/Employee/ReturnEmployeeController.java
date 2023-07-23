/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Employee;

import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ReturnEmployeeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            List<User> list = (List<User>)request.getAttribute("LIST_EMPLOYEE");
            PrintWriter out = response.getWriter();
            for (User user : list) {
                String role = "";
                if (user.getRoleID() == 1) {
                    role = "<span style=\"border: none; background: none; font-size: 13px; text-align: left;font-weight: 500 \" class=\"custom-badge status-green\">Admin</span>";
                } else if (user.getRoleID() == 3) {
                    role = "<span style=\"border: none; background: none; font-size: 13px; text-align: left;font-weight: 500\" class=\"custom-badge status-orange\">Marketing</span>";
                } else {
                    role = "<span style=\"border: none; background: none; font-size: 13px; text-align: left;font-weight: 500\" class=\"custom-badge status-purple\">Chăm sóc Khách Hàng</span>";
                }
                String gender = user.getGender()!=null? user.getGender():"";
                out.println("<tr>\n"
                        + "                                                <td>\n"
                        + "                                                    <img width=\"28\" height=\"28\" src=\"assets/img/user.jpg\" class=\"rounded-circle\" alt=\"\"> <h2>" + user.getFullName() + "</h2>\n"
                        + "                                                </td>\n"
                        + "                                                <td>" + user.getId() + "</td>\n"
                        + "                                                <td>" + user.getEmail() + "</td>\n"
                        + "                                                <td>" + user.getPhoneNumber() + "</td>\n"
                        + "                                                <td>" + role + "</td>\n"
                        + "                                                <td>" + gender +"</td>\n"
                        + "                                                <td class=\"text-right\">\n"
                        + "                                                    <div class=\"dropdown dropdown-action\">\n"
                        + "                                                        <a href=\"#\" class=\"action-icon dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"fa fa-ellipsis-v\"></i></a>\n"
                        + "                                                        <div class=\"dropdown-menu dropdown-menu-right\">\n"
                        + "                                                            <a class=\"dropdown-item\" href=\"MainController?action=GetEmPloyeeByID&id="+user.getId()+"\"><i class=\"fa fa-pencil m-r-5\"></i>Chỉnh Sửa</a>\n"
                        + "                                                            <a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#delete_employee\"><i class=\"fa fa-trash-o m-r-5\"></i>Delete</a>\n"
                        + "                                                        </div>\n"
                        + "                                                    </div>\n"
                        + "                                                </td>\n"
                        + "                                            </tr>");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
