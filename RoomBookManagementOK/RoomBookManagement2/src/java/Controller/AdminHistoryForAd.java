/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;
import Model.*;
import Business.RoomBusiness;
import java.io.IOException;
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
@WebServlet(urlPatterns = {"/historyforadmin"})
public class AdminHistoryForAd extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RoomBusiness rb = new RoomBusiness();
        History[] history;
        history = rb.getHistory();
        req.setAttribute("history", history);
         String booking = "/AdminHistoryForAdmin.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(booking);
        dispatcher.forward(req, resp);
    }
    
}
