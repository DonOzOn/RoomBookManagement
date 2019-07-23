/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.RoomBusiness;
import Model.Order;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DLPC
 */
@WebServlet(urlPatterns = {"/acceptorder"})
public class AdminAcceptOrder extends HttpServlet {

 
    
 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         RoomBusiness rb = new RoomBusiness();
         Order[] ordered;
        ordered = rb.getAllOrders();
        User[] users;
        users = rb.getAllUsers();
        req.setAttribute("ordered", ordered);
        req.setAttribute("users", users);
        String checkOrder = "/AdminDeny_AcceptBooking.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(checkOrder);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String d = req.getParameter("date");
        Date date = Date.valueOf(d);
        String slot = req.getParameter("slot");
        String roomNo = req.getParameter("roomno");
        String mess = req.getParameter("mess");
        int userId = Integer.parseInt(req.getParameter("userid"));
        RoomBusiness rb = new RoomBusiness();
        rb.insertHistory(userId, roomNo, date, slot, mess);
        rb.deleteOrder(userId, date, slot, roomNo);
        req.setAttribute("success", "Order Saved!");
        doGet(req, resp);
      
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
