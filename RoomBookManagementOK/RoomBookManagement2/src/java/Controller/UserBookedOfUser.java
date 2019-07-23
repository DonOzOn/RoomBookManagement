/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.RoomBusiness;
import Model.Order;
import Model.Room;
import java.io.IOException;
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
@WebServlet(urlPatterns = {"/history"})
public class UserBookedOfUser extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RoomBusiness rb = new RoomBusiness();
        String username = req.getParameter("name");
        int id = rb.getUserID(username);
        Order[] ordered;
        ordered = rb.getAllHistory(id);
        req.setAttribute("history", ordered);
        req.setAttribute("username", username);
        req.setAttribute("userid", id);
        String booking = "/UserBookedOfUser.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(booking);
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String d = req.getParameter("date");
        Date date = Date.valueOf(d);
        String slot = req.getParameter("slot");
        String roomNo = req.getParameter("roomNo");
        int userId = Integer.parseInt(req.getParameter("userid"));
           RoomBusiness rb = new RoomBusiness();
           rb.deleteOrder(userId,date, slot, roomNo);
           req.setAttribute("success", "Bạn đã xóa order thành công!");
           doGet(req, resp);
    }
    
    
}
