package com.user;

import java.io.IOException;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserLogin")
public class UserLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("email");
            String password = req.getParameter("password");

            HttpSession session = req.getSession();

            UserDao dao = new UserDao(DBConnect.getConn());
            User user = dao.login(email, password);

            if (user != null) {
                // Set the User object in the session attribute userObj
                session.setAttribute("userObj", user);
                resp.sendRedirect("index.jsp");
                System.out.println("USER INFO "+user.getId()+user.getName());
            } else {
                // Handle case where user is not found (null returned by UserDao)
                session.setAttribute("errorMsg", "Invalid email & password.");
                resp.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle other exceptions if necessary
        }
    }
}
