package src.main.java.model.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import src.main.java.model.classBase.Prevision;
import src.main.java.model.classBase.PrevisionService;
import src.main.java.util.MaConnection;

public class PrevisionServlet extends HttpServlet {
    public void init() throws ServletException {
        try {
            MaConnection.getSqlConnection("db_s2_ETU003213", "ETU003213", "1OzWoFzX");
        } catch (Exception e) {
            throw new ServletException("Failed to initialize database connection", e);
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");
        if (user == null || (user != null && !user.equals("userIsLogedIn"))) {
            res.sendRedirect("login");
        } else {
            RequestDispatcher dispat = req.getRequestDispatcher("/prevision.jsp");
            dispat.forward(req, res);
        }

    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            MaConnection.getSqlConnection("db_s2_ETU003213", "ETU003213", "1OzWoFzX");
            String libele = req.getParameter("libele");
            int montant = Integer.parseInt(req.getParameter("montant"));
            Prevision prevision = new Prevision(libele, montant);
            PrevisionService.save(prevision);
            res.sendRedirect("prevision");
        } catch (Exception e) {
            throw new ServletException("Error processing POST request", e);
        }
    }
}