/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mail;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Don OzOn
 */
public class MailApp extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String to = "ngoisaomayman130798@gmail.com";
        String subject = request.getParameter("name");
        String message = request.getParameter("comments");
        if (SendMail.send(to, "Feedback", subject.concat(" : " + message))) {
            request.setAttribute("success", "Send feedback sucessfull");
        } else {
            request.setAttribute("error", "Send feedback fail");
        }
        String loginPage = "/home.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
        dispatcher.forward(request, response);
    }
}
