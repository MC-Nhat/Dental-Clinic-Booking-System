/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Facebook;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.restfb.types.User;
import DAL.FacebookDAO;
import DAL.UserDAO;
import javax.servlet.http.HttpSession;

@WebServlet("/login-facebook")
public class LoginFacebookController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public LoginFacebookController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String code = request.getParameter("code");

            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("login.jsp");
                dis.forward(request, response);
            } else {
                String accessToken = FacebookDAO.getToken(code);
                User user = FacebookDAO.getUserInfo(accessToken);
                boolean result = UserDAO.isExistAccountLoginByFacebook(user.getId());
                if (result) {
                    Models.User customer = UserDAO.getUserLoginByFacebook(user.getId());
                    HttpSession session = request.getSession();
                    session.setAttribute("User", customer);
                    RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
                    dis.forward(request, response);
                } else {
                request.setAttribute("id", user.getId());
                request.setAttribute("name", user.getName());
                request.setAttribute("logbyfb", true);
                RequestDispatcher dis = request.getRequestDispatcher("additional-info.jsp");
                dis.forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
