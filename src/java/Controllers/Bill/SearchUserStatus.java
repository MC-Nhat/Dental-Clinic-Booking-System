/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Bill;

import DAL.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class SearchUserStatus extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String searchstatus = request.getParameter("status");
            String fromDate = request.getParameter("from");
            String toDate = request.getParameter("to");
            
            java.util.Date datenow = new java.util.Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String date = dateFormat.format(datenow);
            
          
            ArrayList list = new ArrayList();

            if (searchstatus.equals("bynot")) {
                list = UserDAO.getUnpaidBills();
            } else if (searchstatus.equals("bydone")) {
                list = UserDAO.getpaidBills();
//            } else if (searchstatus.equals("byall")) {
//                list = UserDAO.getBill();
            } else if ((fromDate == null || fromDate.isEmpty()) && (toString() == null || toDate.isEmpty())) {                
                list = UserDAO.getBill();
//            } else if (toDate == null || toDate.isEmpty()) {
//                list = UserDAO.searchUserByDate(fromDate, date);
//            } else if (fromDate == null || fromDate.isEmpty()) {
//                list = UserDAO.searchUserByDate(fromDate, toDate);
            } else if(fromDate !=null && toDate !=null){                
                list = UserDAO.searchUserByDate(fromDate, toDate);
            }
            request.setAttribute("loadbill", list);
            request.getRequestDispatcher("bill.jsp").forward(request, response);
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
