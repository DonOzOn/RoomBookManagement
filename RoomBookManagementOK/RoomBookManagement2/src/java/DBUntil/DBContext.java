/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUntil;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {

    private static Connection connection = null;
    public static Connection getConnection() throws ClassNotFoundException, SQLException, IOException {
        if (connection != null)
            return connection;
        else {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            
            String url = "jdbc:sqlserver://localhost:1433;databaseName=BRM";
            String user = "sa";
            String password = "ngovandon123";
            Class.forName(driver);
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        }
        
    }
    
}


