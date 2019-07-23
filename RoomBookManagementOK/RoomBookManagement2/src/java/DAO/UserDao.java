/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUntil.DBContext;
import Model.Admin;
import Model.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

/**
 *
 * @author Admin
 */
public class UserDao {

    private Connection connection;

    public UserDao() throws IOException, ClassNotFoundException, SQLException {
        connection = DBUntil.DBContext.getConnection();
    }

    public User getUser(String username) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from [User] where LoginName=?");
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setName(rs.getString("Name"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setPhoneNumber(rs.getString("LoginName"));
                user.setPassword(rs.getString("Password"));
                return user;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return null;
    }

    public User UpdateUser(String fullName, String email, String phoneNumber, String username, String password) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("INSERT INTO [User]"
                            + "VALUES (?,?,?,?,?)");
            // System.out.println(String.valueOf(username));
            preparedStatement.setString(1, String.valueOf(fullName));
            preparedStatement.setString(2, String.valueOf(email));
            preparedStatement.setString(3, String.valueOf(phoneNumber));
            preparedStatement.setString(4, String.valueOf(username));
            preparedStatement.setString(5, String.valueOf(password));

            ResultSet rs = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<String> getEmail() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select Email from [User]");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                arr.add(rs.getString("Email"));
            }
            for (String string : arr) {
                System.out.println(string);
            }
            return arr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    public ArrayList<String> getUsername() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select LoginName from [User]");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                arr.add(rs.getString("LoginName"));
            }
            for (String string : arr) {
                System.out.println(string);
            }
            return arr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public ArrayList<String> getAdminName() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select LoginName from Admin");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                arr.add(rs.getString("LoginName"));
            }
            for (String string : arr) {
                System.out.println(string);
            }
            return arr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Admin getAdmin(String username) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select * from Admin where LoginName=?");
            preparedStatement.setString(1, username);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                Admin admin = new Admin();
                admin.setAdminID(rs.getInt("AdminID"));
                admin.setName(rs.getString("Name"));
                admin.setEmail(rs.getString("Email"));
                admin.setPhoneNumber(rs.getString("PhoneNumber"));
                admin.setLoginName(rs.getString("LoginName"));
                admin.setPassword(rs.getString("Password"));
                return admin;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return null;
    }

    public ArrayList<String> getEmailAdmin() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            PreparedStatement preparedStatement = connection.
                    prepareStatement("select Email from Admin");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                arr.add(rs.getString("Email"));
            }
            for (String string : arr) {
                System.out.println(string);
            }
            return arr;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public User UpdateAdmin(String fullName, String email, String phoneNumber, String username, String password) {
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("INSERT INTO Admin"
                            + "VALUES (?,?,?,?,?)");
            // System.out.println(String.valueOf(username));
            preparedStatement.setString(1, String.valueOf(fullName));
            preparedStatement.setString(2, String.valueOf(email));
            preparedStatement.setString(3, String.valueOf(phoneNumber));
            preparedStatement.setString(4, String.valueOf(username));
            preparedStatement.setString(5, String.valueOf(password));

            ResultSet rs = preparedStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
