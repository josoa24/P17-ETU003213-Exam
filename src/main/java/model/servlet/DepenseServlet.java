package src.main.java.model.servlet;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import src.main.java.model.classBase.Depense;
import src.main.java.model.classBase.DepenseService;
import src.main.java.model.classBase.Prevision;
import src.main.java.model.classBase.PrevisionService;
import src.main.java.util.MaConnection;

public class DepenseServlet extends HttpServlet {
    public void init() throws ServletException {
        try {
            MaConnection.getSqlConnection("db_s2_ETU003213", "ETU003213", "1OzWoFzX");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("user");
        if (user == null || (user != null && !user.equals("userIsLogedIn"))) {
            res.sendRedirect("login");
        } else {
            ArrayList<Prevision> prevs = null;
            try {
                prevs = PrevisionService.findAll();
            } catch (SQLException e) {
                throw new ServletException(e);
            }
            req.setAttribute("prevs", prevs);
            RequestDispatcher dispat = req.getRequestDispatcher("/depense.jsp");
            dispat.forward(req, res);
        }

    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            MaConnection.getSqlConnection("db_s2_ETU003213", "ETU003213", "1OzWoFzX");
            int idPrev = Integer.parseInt(req.getParameter("id"));
            int realisation = Integer.parseInt(req.getParameter("montant"));
            Depense depense = new Depense(idPrev, realisation);
            Prevision prev = PrevisionService.getById(idPrev);
            if (prev.getReste() >= realisation) {
                DepenseService.save(depense);
                res.sendRedirect("depense");
            } else if (realisation < 0) {
                req.setAttribute("message", "Votre montant doit etre superieur a 0");
                RequestDispatcher dispat = req.getRequestDispatcher("/error.jsp");
                dispat.forward(req, res);
            } else {
                req.setAttribute("message", "Votre solde est insuffisant");
                RequestDispatcher dispat = req.getRequestDispatcher("/error.jsp");
                dispat.forward(req, res);
            }

        } catch (Exception e) {
            throw new ServletException("Error processing POST request", e);
        }
    }

}