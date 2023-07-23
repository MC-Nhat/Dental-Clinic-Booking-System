/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Dentist;

import DAL.DentistDAO;
import Models.Dentist;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class LoadMoreDentistController extends HttpServlet {

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
        
        PrintWriter out = response.getWriter();
        int amount = Integer.parseInt(request.getParameter("exits"));
        HttpSession session = request.getSession();
        DentistDAO dentDAO = new DentistDAO();
        ArrayList<Dentist> list = dentDAO.getNext4Dentist(amount);
        for (Dentist dentist : list) {
                out.println("<div class=\"dentistProduct col-md-4 col-sm-4  col-lg-3\">\n"
+ "                                <div class=\"profile-widget\">\n"
+ "                                    <div class=\"doctor-img\">\n"
+ "                                        <a class=\"avatar\" href=\"MainController?action=dentistProfile&dentistID="+ dentist.getId()+"\"><img alt=\"\" src=\"" +dentist.getImg() +"\"></a>\n"
+ "                                    </div>\n"
+ "                                    <div class=\"dropdown profile-action\">\n"
+ "                                        <a href=\"#\" class=\"action-icon dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"fa fa-ellipsis-v\"></i></a>\n"
+ "                                        <div class=\"dropdown-menu dropdown-menu-right\">\n"
+ "                                            <a class=\"dropdown-item\" href=\"editDentist.jsp?dentistID="+ dentist.getId()+"\"><i class=\"fa fa-pencil m-r-5\"></i> Chỉnh sửa</a>\n"
+ "                                            <a class=\"dropdown-item\" href=\"MainController?action=deleteDentist&dentistID="+ dentist.getId()+"\"><i class=\"fa fa-trash-o m-r-5\"></i> Xóa</a>\n"
+ "                                        </div>\n"
+ "                                    </div>\n"
+ "                                    <h4 class=\"doctor-name text-ellipsis\"><a href=\"MainController?action=dentistProfile&dentistID=" + dentist.getId() + "\">" + dentist.getFullName() + "</a></h4>\n"
+ "                                    <h4></h4>\n"    
+ "                                    <div class=\"user-country\">\n"   
+ "                                        <i class=\"fa fa-map-marker\"></i> "+ dentist.getDegree()+"\n"
+ "                                    </div>\n"
+ "                                </div>\n"
+ "                            </div>");
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
