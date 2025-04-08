package src.main.java.model.classBase;

import java.sql.ResultSet;

import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import src.main.java.util.MaConnection;

public class PrevisionService {
    public PrevisionService() {
    }

    public static void save(Prevision prevision) throws SQLException {
        try {
            Statement stmt = MaConnection.getMysqlStatement();
            stmt.executeUpdate(
                    "INSERT INTO prevision (libele,montant) VALUES ('" + prevision.getLibele() + "',"
                            + prevision.getMontant() + ")");
            stmt.close();
        } catch (SQLException e) {
            throw e;
        } finally {
        }
    }

    public static void deleteAll() throws SQLException {
        try {
            Statement stmt = MaConnection.getMysqlStatement();
            stmt.executeUpdate("DELETE FROM Prevision");
            stmt.close();
        } catch (SQLException e) {
            throw e;
        } finally {
            MaConnection.closeConnection();
        }
    }

    public static ArrayList<Prevision> findAll() throws SQLException {
        try {
            Statement stmt = MaConnection.getMysqlStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM prevision");
            ArrayList<Prevision> prevs = new ArrayList<>();
            while (rs.next()) {
                Prevision prev = new Prevision(rs.getString("libele"), rs.getInt("montant"));
                prev.setId(rs.getInt("id"));
                prev.setDepense(DepenseService.getDepense(prev.getId()));
                prevs.add(prev);
            }
            rs.close();
            stmt.close();
            return prevs;
        } catch (SQLException e) {
            throw e;
        } finally {
        }
    }

    public static Prevision getById(int id) throws SQLException {
        try {
            Statement stmt = MaConnection.getMysqlStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM prevision WHERE id = " + id);
            Prevision prev = null;
            if (rs.next()) {
                prev = new Prevision(rs.getString("libele"), rs.getInt("montant"));
                prev.setId(rs.getInt("id"));
                prev.setDepense(DepenseService.getDepense(prev.getId()));
            }
            rs.close();
            stmt.close();
            return prev;
        } catch (SQLException e) {
            throw e;
        } finally {
        }
    }

}
