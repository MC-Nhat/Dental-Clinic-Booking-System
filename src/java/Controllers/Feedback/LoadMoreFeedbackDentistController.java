/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Feedback;

import DAL.FeedbackDentistDAO;
import Models.FeedbackDentist;
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
public class LoadMoreFeedbackDentistController extends HttpServlet {

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
            HttpSession session = request.getSession();
            session.setAttribute("activeLink", "feedbackLink");
            session.setAttribute("option", "feedbackDentistLink");
            try {
                int position = Integer.parseInt(request.getParameter("exits"));
                boolean isSearch = Boolean.parseBoolean(request.getParameter("issearch"));
                String txtSearch = request.getParameter("txt");
                String searchby = request.getParameter("searchby");
                ArrayList<FeedbackDentist> list = new ArrayList<>();
                if (isSearch) {
                    list = FeedbackDentistDAO.getNext5FeedbackDentist(txtSearch, searchby, position);
                } else {
                    list = FeedbackDentistDAO.getNext5FeedbackDentist(position);
                }
                int roleid = (int) session.getAttribute("role");
                if (list != null && !list.isEmpty()) {
                    for (FeedbackDentist feedbackDentist : list) {
                        out.println("<tr class='feedbackDentistList'>\n"
                                + "    <td>" + feedbackDentist.getId() + "</td>\n"
                                + "    <td>" + feedbackDentist.getNamecustomer() + "</td>\n"
                                + "    <td>" + feedbackDentist.getNamedentist() + "</td>\n"
                                + "    <td class=\"rating\">\n");

                        int rating = feedbackDentist.getRate(); // Lấy giá trị rating

                        for (int star = 1; star <= 5; star++) {
                            out.println("        <span class=\"star\">");

                            if (star <= rating) {
                                out.println("            <span style='color: gold;'>★</span>"); // Hiển thị ngôi sao đã chọn
                            } else {
                                out.println("            &#9734;"); // Hiển thị ngôi sao chưa chọn
                            }

                            out.println("        </span>");
                        }

                        out.println("    </td>\n"
                                + "    <td>" + feedbackDentist.getComment() + "</td>\n");
                        if (roleid == 1) {
                            out.println("    <td class=\"text-right\">\n"
                                    + "        <div class=\"dropdown dropdown-action\">\n"
                                    + "            <a href=\"#\" class=\"action-icon dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"fa fa-ellipsis-v\"></i></a>\n"
                                    + "            <div class=\"dropdown-menu dropdown-menu-right\">\n"
                                    + "                <a class=\"dropdown-item delete-schedule\" href=\"#\" data-toggle=\"modal\" data-target=\"#delete_schedule\"><i class=\"fa fa-trash-o m-r-5\"></i> Delete</a>\n"
                                    + "            </div>\n"
                                    + "        </div>\n"
                                    + "    </td>"
                                    + "</tr>");
                        } else {
                            out.println("</tr>");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
