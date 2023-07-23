/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Service;

import DAL.ServiceDAO;
import Models.Service;
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
 * @author Admin
 */
public class loadServiceController extends HttpServlet {

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

        HttpSession session = request.getSession();
        try {
            ServiceDAO sdao = new ServiceDAO();
            int count = sdao.countService();
            int totalPages = (int) Math.ceil((double) count / 10);
            if (totalPages >= 1) {
                request.setAttribute("begin1", 1);
                request.setAttribute("end1", totalPages);
            } if (totalPages >= 4 ) {
                request.setAttribute("end1", 3);
                request.setAttribute("begin2", 4);
                request.setAttribute("end2", totalPages);
            } if (totalPages >= 7) {
                request.setAttribute("end2", 6);
                request.setAttribute("begin3", 7);
                request.setAttribute("end3", totalPages);
            }
            request.setAttribute("totalPages", totalPages);
            if (request.getParameter("click") == null) {
                ArrayList<Service> slist = sdao.getService(0);
                session.setAttribute("ServiceList", slist);
                request.setAttribute("current", 1);
                request.setAttribute("click", 1);
                request.setAttribute("count", "true");
            } else {
                request.setAttribute("click", request.getParameter("page"));
                int page = Integer.parseInt(request.getParameter("page"));
                request.setAttribute("current", page);
                request.setAttribute("count", "true");
                int offset = (page - 1) * 10;
                ArrayList<Service> slist = sdao.getService(offset);
                session.setAttribute("ServiceList", slist);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.setAttribute("activeLink", "serviceLink");
            request.getRequestDispatcher("service-2.jsp").forward(request, response);
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
