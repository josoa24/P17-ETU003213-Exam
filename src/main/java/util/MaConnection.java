package src.main.java.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MaConnection {
    private static Connection sqlConnection = null;

    public static Connection getSqlConnection(String baseName, String userName, String password)
            throws ClassNotFoundException, SQLException {
        if (sqlConnection == null) {
            String url = "jdbc:mysql://localhost:3306/" + baseName;
            Class.forName("com.mysql.cj.jdbc.Driver");
            sqlConnection = DriverManager.getConnection(url, userName, password);
        }
        return sqlConnection;
    }

    public static Statement getMysqlStatement() throws SQLException {
        if (sqlConnection == null || sqlConnection.isClosed()) {
            throw new SQLException("La connexion SQL n'est pas initialisée ou est fermée.");
        }
        return sqlConnection.createStatement();
    }

    public static void closeConnection() throws SQLException {
        if (sqlConnection != null && !sqlConnection.isClosed()) {
            sqlConnection.close();
        }
    }
}
