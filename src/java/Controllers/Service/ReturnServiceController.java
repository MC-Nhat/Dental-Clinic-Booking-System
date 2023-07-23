/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Service;

import Models.Service;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.jstl.fmt.*;
import java.text.NumberFormat;
import java.util.Locale;
/**
 *
 * @author Admin
 */
public class ReturnServiceController extends HttpServlet {

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
        try {
            NumberFormat fmt = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
            List<Service> list = (List<Service>) request.getAttribute("LIST_SERVICE");
            PrintWriter out = response.getWriter();
            for (Service s : list) {
                String status = "";
                if (s.isStatus() == true) {
                    status = "<span class=\"custom-badge status-green\">Đang Hoạt Động</span>";
                } else {
                    status = "<span class=\"custom-badge status-orange\">Ngường Hoạt Động</span>";
                }
                out.println("<tr>\n"
                        + "                                                        <td>" + s.getId() + "</td>\n"
                        + "                                                        <td>" + s.getName() + "</td>\n"
                        + "<!--                                                        <td>" + s.getMota() + "</td>-->\n"
                        + "                                                        <td>" + fmt.format(s.getPrice()) + "</td>\n"
                        + "                                                        <td>" + status + "</td>\n"
                        + "                                                        <td class=\"text-right\">\n"
                        + "                                                            <div class=\"dropdown dropdown-action\">\n"
                        + "                                                                <a href=\"#\" class=\"action-icon dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"fa fa-ellipsis-v\"></i></a>\n"
                        + "                                                                <div class=\"dropdown-menu dropdown-menu-right\">\n"
                        + "                                                                    <a class=\"dropdown-item\" href=\"MainController?action=EditService&id=" + s.getId() + "\"><i class=\"fa fa-pencil m-r-5\"></i> Edit</a>\n"
                        + "                                                                    <a class=\"dropdown-item\" href=\"deleteServiceController?id=${s.getId()}\"><i class=\"fa fa-pencil m-r-5\"></i> Delete</a>\n"
                        + "    <!--                                                                    <a class=\"dropdown-item\" data-toggle=\"modal\" data-target=\"#delete_schedule\" href=\"?id=${s.getId()}\"><i class=\"fa fa-trash-o m-r-5\"></i> Delete</a>-->\n"
                        + "                                                                </div>\n"
                        + "                                                            </div>\n"
                        + "                                                        </td>\n"
                        + "                                                    </tr>");
            }
        } catch (Exception e) {
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
