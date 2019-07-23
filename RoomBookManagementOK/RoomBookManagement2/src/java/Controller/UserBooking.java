/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.RoomBusiness;
import Model.*;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
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
@WebServlet(urlPatterns = {"/booking"})
public class UserBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         String slot = req.getParameter("chon");
        String date = req.getParameter("datechoose");
        String roomNo = req.getParameter("roomNo");
        if (date == null || date.isEmpty() || date.equals("")) {
            req.setAttribute("error", "You must choose date!");
            doGet(req, resp);
        } else {

            Date datebook = Date.valueOf(date);
            RoomBusiness rb = new RoomBusiness();
            if (rb.checkSameDateAndSlot(datebook, slot, roomNo) >= 1) {
                req.setAttribute("error", "This room has booked " + slot + " on  " + datebook);
            } else {
                req.setAttribute("datebook", datebook);
                User user = new User();
                //Lấy các tham số 
                String username = req.getParameter("username");
                String reason = req.getParameter("purpose");
                if (reason == null || reason.isEmpty() || reason.equals("")) {
                    req.setAttribute("error", "You must answer why you book that room!");
                    doGet(req, resp);
                } else {
                    int id = rb.getUserID(username);
                    rb.insertToOrder(id, roomNo, datebook, slot, reason, false);
                    req.setAttribute("success", "Booking Successful!");
                }
            }
            doGet(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        RoomBusiness rb = new RoomBusiness();
        Room[] room;
        room = rb.getAllRooms();
        req.setAttribute("room", room);
        String username = req.getParameter("name");
        req.setAttribute("username", username);
        String booking = "/UserBookRoom.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(booking);
        dispatcher.forward(req, resp);
    }

}
