package src.main.java.model.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class MainServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        RequestDispatcher dispat = req.getRequestDispatcher("/login.jsp");
        dispat.forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        if (email.equals("etu003213@gmail.com") && password.equals("123")) {
            HttpSession session = req.getSession();
            session.setAttribute("user", "userIsLogedIn");
            RequestDispatcher dispat = req.getRequestDispatcher("/index.jsp");
            dispat.forward(req, res);
        } else {
            res.sendRedirect("login");
        }
    }
}