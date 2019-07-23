/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business;

import DAO.RoomManage;
import DAO.UserDao;
import Model.Admin;
import Model.History;
import Model.Order;
import Model.Room;
import Model.User;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DLPC
 */
public class RoomBusiness {

    public Room[] getAllRooms() {
        try {
            RoomManage roomDao = new RoomManage();
            return roomDao.getAllRooms();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new Room[0];
        }
    }
    public History[] getHistory() {
        try {
            RoomManage roomDao = new RoomManage();
            return roomDao.getHistory();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new History[0];
        }
    
    }
     public History[] getHistoryForUser(int id) {
        try {
            RoomManage roomDao = new RoomManage();
            return roomDao.getHistoryForUser(id);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new History[0];
        }
    }
    public Order[] getAllOrders() {
        try {
            RoomManage roomDao = new RoomManage();
            return roomDao.getAllOrders();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new Order[0];
        }
    }
    //Get User From DataBase
    public User[] getAllUsers() {
        try {
            RoomManage roomDao = new RoomManage();
            return roomDao.getAllUsers();
        } catch (Exception ex) {
            ex.printStackTrace();
            return new User[0];
        }
    }
    
    public User getUserByUsername(String username) {
        try {
            UserDao userDao = new UserDao();
            return userDao.getUser(username);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

//get Email User from database
    public ArrayList<String> getEmailfromDB() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            UserDao userDao = new UserDao();
            return userDao.getEmail();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }
//get Email Admin from database

    public ArrayList<String> getEmailAdminfromDB() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            UserDao userDao = new UserDao();
            return userDao.getEmailAdmin();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }

    //get Username from database
    public ArrayList<String> getUsernamefromDB() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            UserDao userDao = new UserDao();
            return userDao.getUsername();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }

    //get adminname from database

    public ArrayList<String> getAdminnamefromDB() {
        try {
            ArrayList<String> arr = new ArrayList<>();
            UserDao userDao = new UserDao();
            return userDao.getAdminName();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }
    //get admin from database

    public Admin getAdminfromDB(String username) {
        try {
            ArrayList<String> arr = new ArrayList<>();
            UserDao userDao = new UserDao();
            return userDao.getAdmin(username);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }

    }
//Update user

    public User UpdateUserByUsername(String fullName, String email, String phoneNumber, String username, String password) {
        try {
            UserDao userDao = new UserDao();
            return userDao.UpdateUser(fullName, email, phoneNumber, username, password);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public User UpdateAdminByAdminName(String fullName, String email, String phoneNumber, String username, String password) {
        try {
            UserDao userDao = new UserDao();
            return userDao.UpdateAdmin(fullName, email, phoneNumber, username, password);
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    public void insertToOrder(int id, String roomNo, Date date, String slot,String mess, boolean status) {
        try {
            RoomManage rm = new RoomManage();
            rm.insertToOrder(id, roomNo, date, slot,mess, status);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
     public void insertHistory(int userid, String roomNo, Date date, String slot,String mess) {
        try {
            RoomManage rm = new RoomManage();
            rm.insertHistory(userid, roomNo, date, slot,mess);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public int getUserID(String username) {
        int id = 0;
        try {
            RoomManage rm = new RoomManage();
            id = rm.getUserID(username);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return id;
    }
    public int checkSameDateAndSlot(Date date, String slot, String roomNo) {
        int id = 0;
        try {
            RoomManage rm = new RoomManage();
            id = rm.checkSameDateAndSlot(date, slot, roomNo);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return id;
    }
      public Order[] getAllHistory(int userid) {
        try {
            RoomManage roomDao = new RoomManage();
            return roomDao.getHistory(userid);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new Order[0];
        }
    }
      public void deleteOrder(int userId, Date date, String slot, String roomNo){
          try{
          RoomManage rm = new RoomManage();
          rm.deleteOrder(userId, date, slot, roomNo);
          }catch(Exception ex){
              ex.printStackTrace();
          }
      }
}
