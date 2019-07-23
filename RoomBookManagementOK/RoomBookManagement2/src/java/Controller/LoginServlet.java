/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Business.RoomBusiness;
import Model.Admin;
import Model.User;
import java.util.ArrayList;

/**
 *
 * @author Don OzOn
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("USERNAME");
        if (username != null) {
            response.sendRedirect("login");
            return;
        }

        String loginPage = "/SignIn.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String usernameInSession = (String) session.getAttribute("USERNAME");
        if (usernameInSession != null) {
            response.sendRedirect("/login");
            return;
        }
        session = request.getSession();
        session.setAttribute("USERNAME", null);
        //Get value from input
        String username = request.getParameter("userInput");
        String password = request.getParameter("PassInput");
        //check username , password
        if (username.trim() == null || password.trim() == null || username.trim().equals("") || password.trim().equals("")) {
            request.setAttribute("errorMessage", "Username and Password is null");
            doGet(request, response);
            return;
        }//run when input not null 
        else {
            RoomBusiness rb = new RoomBusiness();
            User user = rb.getUserByUsername(username);
            Admin admin = rb.getAdminfromDB(username);
            ArrayList<String> arrUser = rb.getUsernamefromDB();
            ArrayList<String> arrAdmin = rb.getAdminnamefromDB();
            if (arrUser.contains(username)) {
                if (user == null) {
                    request.setAttribute("errorMessage", "Dont' have that user");
                    String loginPage = "/SignIn.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
                    dispatcher.forward(request, response);
                } else if (!user.getPassword().equals(password)) {
                    request.setAttribute("errorMessage", "Password is wrong!");
                    String loginPage = "/SignIn.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
                    dispatcher.forward(request, response);
                } else {
                    if (request.getParameter("rememberMeCB") == null || request.getParameter("rememberMeCB") != null) {
                        session = request.getSession();
                        session.setAttribute("USERNAME", username);
                    }

                    response.sendRedirect("UserPage");
                    return;
                }
            } else {
                request.setAttribute("errorMessage", "Dont' have that user");

            }
            if (arrAdmin.contains(username)) {
                if (admin == null) {
                    request.setAttribute("errorMessage", "Dont' have that user");
                    String loginPage = "/SignIn.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
                    dispatcher.forward(request, response);
                } else if (!admin.getPassword().equals(password)) {
                    request.setAttribute("errorMessage", "Password is wrong!");
                    String loginPage = "/SignIn.jsp";
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
                    dispatcher.forward(request, response);
                } else {
                    if (request.getParameter("rememberMeCB") == null || request.getParameter("rememberMeCB") != null) {
                        session = request.getSession();
                        session.setAttribute("USERNAME", username);
                    }

                    response.sendRedirect("AdminPage");
                    return;
                }
            } else {
                request.setAttribute("errorMessage", "Dont' have that user");
              
            }
            doGet(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
