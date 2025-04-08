package src.main.java.model.servlet;

import java.io.*;
import java.sql.SQLException;
import java.util.ArrayList;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import src.main.java.model.classBase.Prevision;
import src.main.java.model.classBase.PrevisionService;
import src.main.java.util.MaConnection;

public class GeneralServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        try {
            MaConnection.getSqlConnection("db_s2_ETU003213", "ETU003213", "1OzWoFzX");
        } catch (ClassNotFoundException | SQLException e) {
            throw new ServletException(e);
        }
        ArrayList<Prevision> prevs = null;
        try {
            prevs = PrevisionService.findAll();
        } catch (SQLException e) {
            throw new ServletException("Error retrieving employee list", e);
        }
        req.setAttribute("prevs", prevs);
        RequestDispatcher dispat = req.getRequestDispatcher("/listDepense.jsp");
        dispat.forward(req, res);
    }
}
