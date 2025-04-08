package src.main.java.model.classBase;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import src.main.java.util.MaConnection;

public class DepenseService {
    public DepenseService() {
    }

    public static void save(Depense depense) throws SQLException {
        try {
            Statement stmt = MaConnection.getMysqlStatement();
            
            stmt.executeUpdate("INSERT INTO depense (id_prevision,realisation) VALUES (" + depense.getId() + ","
                    + depense.getMontant() + ")");
            stmt.close();
        } catch (SQLException e) {
            throw e;
        } finally {
        }
    }

    public static int getDepense(int id) throws SQLException {
        try {
            Statement stmt = MaConnection.getMysqlStatement();
            ResultSet rs = stmt
                    .executeQuery("SELECT SUM(realisation) as somme FROM depense WHERE id_prevision = " + id);

            if (rs.next()) {

                return rs.getInt("somme");

            }
            rs.close();
            stmt.close();
            return 0;
        } catch (SQLException e) {
            throw e;
        } finally {
        }
    }

}
