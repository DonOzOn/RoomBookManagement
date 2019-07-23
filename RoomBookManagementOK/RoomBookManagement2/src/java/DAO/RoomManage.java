/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import DBUntil.DBContext;
import Model.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DLPC
 */
public class RoomManage {

    private Connection connection;

    public RoomManage() throws IOException, ClassNotFoundException, SQLException, Exception {
        connection = DBContext.getConnection();
    }

    public Room[] getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Room");
            while (rs.next()) {
                Room room = new Room();
                room.setRoomNo(rs.getString("RoomNo"));
                room.setRoomSize(rs.getString("RoomSize"));

                rooms.add(room);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms.toArray(new Room[rooms.size()]);
    }
    public Order[] getAllOrders() {
        List<Order> orders = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from [Order]");
            while (rs.next()) {
                Order order = new Order();
                order.setUserID(rs.getInt("UserID"));
                order.setRoomNo(rs.getString("RoomNo"));
                order.setDate(rs.getDate("BookDate"));
                order.setSlot(rs.getString("BookSlot"));
                order.setMess(rs.getString("Mail"));
                order.setStatus(rs.getBoolean("StatusOrder"));
                orders.add(order);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders.toArray(new Order[orders.size()]);
    }
    
       public User[] getAllUsers() {
        List<User> users = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from [User]");
            while (rs.next()) {
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setName(rs.getString("Name"));
                user.setEmail(rs.getString("Email"));
                user.setPhoneNumber(rs.getString("PhoneNumber"));
                user.setLoginName(rs.getString("LoginName"));
                user.setPassword(rs.getString("Password"));
                users.add(user);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users.toArray(new User[users.size()]);
    }
       public History[] getHistory() {
        List<History> history = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from [History]");
            while (rs.next()) {
                History h = new History();
                h.setUserID(rs.getInt("UserID"));
                h.setRoomNo(rs.getString("RoomNo"));
                h.setDate(rs.getDate("BookDate"));
                h.setSlot(rs.getString("BookSlot"));
                h.setMail(rs.getString("Mail"));
                history.add(h);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return history.toArray(new History[history.size()]);
    }
       
       public History[] getHistoryForUser(int id) {
        List<History> history = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from [History] where UserID = " + id);
            while (rs.next()) {
                History h = new History();
                h.setUserID(rs.getInt("UserID"));
                h.setRoomNo(rs.getString("RoomNo"));
                h.setDate(rs.getDate("BookDate"));
                h.setSlot(rs.getString("BookSlot"));
                h.setMail(rs.getString("Mail"));
                history.add(h);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return history.toArray(new History[history.size()]);
    }
    public void insertToOrder(int id, String roomNo, Date date, String slot, String mess, boolean status) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "insert into [Order] values(? ,?,?,?,?,?)");
            preparedStatement.setString(1, String.valueOf(id));
            preparedStatement.setString(2, roomNo);
            preparedStatement.setDate(3, date);
            preparedStatement.setString(4, slot);
            preparedStatement.setString(5, mess);
            preparedStatement.setString(6, String.valueOf(status));
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void insertHistory(int userid, String roomNo, Date date, String slot, String mess) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "insert into [History] values(?,?,?,?,?)");
            preparedStatement.setInt(1, userid);
            preparedStatement.setString(2, roomNo);
            preparedStatement.setDate(3, date);
            preparedStatement.setString(4, slot);
            preparedStatement.setString(5, mess);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getUserID(String username) {
        User user = new User();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "select * from [User] where LoginName = ?");
            preparedStatement.setString(1, username.trim());
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user.setUserID(rs.getInt("UserID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user.getUserID();
    }

    public List<Room> getAllRoomforAdmin() {
        List<Room> room = new ArrayList<Room>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from Room");
            while (rs.next()) {
                Room rom = new Room();
                rom.setRoomNo(rs.getString("RoomNo"));
                rom.setRoomSize(rs.getString("RoomSize"));
                room.add(rom);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return room;
    }
    
    public int checkSameDateAndSlot(Date date, String slot, String roomNo) {
        int countOrder = 0;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select count(*) as 'Count' from [Order] where BookDate = ? and BookSlot = ? and RoomNo = ?");
            preparedStatement.setDate(1, date);
            preparedStatement.setString(2, slot.trim());
            preparedStatement.setString(3, roomNo.trim());
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                countOrder = rs.getInt("Count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return countOrder;
    }
    
     public Order[] getHistory(int userid) {
        List<Order> history = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select o.RoomNo, o.Bookdate, o.BookSlot, o.Mail, o.StatusOrder from [Order] o where o.UserID = " + userid);
            while (rs.next()) {
                Order ordered = new Order();
                ordered.setRoomNo(rs.getString("RoomNo"));
                ordered.setDate(rs.getDate("BookDate"));
                ordered.setSlot(rs.getString("BookSlot"));
                ordered.setMess(rs.getString("Mail"));
                ordered.setStatus(rs.getBoolean("StatusOrder"));
                history.add(ordered);
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return history.toArray(new Order[history.size()]);
    }
     
     public void deleteOrder(int userId, Date date, String slot, String roomNo){
         try {
            PreparedStatement preparedStatement = connection.prepareStatement(
                    "delete [Order] where UserID = ? and BookDate = ? and BookSlot = ? and RoomNo = ?");
            preparedStatement.setInt(1, userId);
            preparedStatement.setDate(2, date);
            preparedStatement.setString(3, slot);
             preparedStatement.setString(4, roomNo);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     }
}
