/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Customer;

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
public class LoadMoreDentistByCustomerController extends HttpServlet {

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
        /* TODO output your page here. You may use following sample code. */
        PrintWriter out = response.getWriter();
        int amount = Integer.parseInt(request.getParameter("exits"));
        HttpSession session = request.getSession();
        
        DentistDAO dentDAO = new DentistDAO();
        
        ArrayList<Dentist> list = dentDAO.getNext3Dentist(amount);
        for (Dentist dentist : list) {
            out.println("<div class=\"col-lg-4 wow slideInUp\" data-wow-delay=\"0.3s\"  style=\"\">\n"
+ "                        <div class=\"team-item\">\n"
+ "                            <div class=\"position-relative rounded-top\" style=\"z-index: 1;\">\n"
+ "                                <img class=\"img-fluid rounded-top w-100 fixed-image\" src=\"" + dentist.getImg() + "\" alt=\"\">\n"
+ "                                <div class=\"position-absolute top-100 start-50 translate-middle bg-light rounded p-2 d-flex\">\n"
+ "                                    <a href=\"MainController?action=showProfileDentistController&iddentist="+ dentist.getId() +"\" class=\"btn btn-primary px-1\">Xem chi tiết</a>\n"
+ "                                </div> \n"
+ "                            </div>\n"
+ "                            <div class=\"team-text position-relative bg-light text-center rounded-bottom p-4 pt-5\">\n"
+ "                                <h4 class=\"mb-2\">" + dentist.getFullName() + "</h4>\n"
+ "                                <p class=\"text-primary mb-0\">"+ dentist.getRoleDentist() +"</p>\n"
+ "                            </div>\n"
+ "                        </div>\n"
+ "                    </div> ");
            
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
