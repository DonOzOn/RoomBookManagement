/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Business.RoomBusiness;
import Model.Admin;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Don OzOn
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String loginPage = "/Register.jsp";
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(loginPage);
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public boolean isValidEmail(String s) {
        Pattern pattern = Pattern.compile("\\b[A-Z0-9a-z._]+"
                + "@[A-Z0-9a-z._]+"
                + "\\.[A-Za-z]{2,10}\\b");

        Matcher matcher = pattern.matcher(s);
        if (!matcher.matches()) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isValidName(String name) {
        Pattern pattern = Pattern.compile("[A-za-z\\s]+");
        Matcher matcher = pattern.matcher(name);
        if (!matcher.matches()) {
            return false;
        } else {
            return true;
        }
    }

    public boolean isValidNum(String name) {
        Pattern pattern = Pattern.compile(".*[^0-9].*");
        Matcher matcher = pattern.matcher(name);
        if (!matcher.matches()) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean checkEmail = false;
        boolean checkFName = false;
        boolean checkPhone = false;
        boolean checkUsername = false;
        boolean checkPass = false;
        boolean checkRepass = false;
        boolean checkbox=false;
        HttpSession session = request.getSession();
        String fname = request.getParameter("fnInput");
        String email = request.getParameter("emailInput");
        String phoneNum = request.getParameter("phoneNumberInput");
        String username = request.getParameter("userNameInput");
        String password = request.getParameter("passInput");
        String repass = request.getParameter("repassInput");
        //check full name
        if (fname.isEmpty()) {
            request.setAttribute("Nameerror", "Please enter name");
        } else {
            if (!isValidName(fname)) {
                request.setAttribute("Nameerror", "just character and name space");

            } else {
                checkFName = true;
                request.setAttribute("Fullname", fname);

            }
        }

        //check mail
        if (email.isEmpty()) {
            request.setAttribute("Emailerror", "Please enter Email");

        } else {
            ArrayList<String> arr = new ArrayList<>();
             RoomBusiness rb = new RoomBusiness();
            arr = rb.getEmailfromDB();
            if (!isValidEmail(email)) {
                request.setAttribute("Emailerror", "Email in fromat abc@abc.abc");

            } else {
                if (arr.contains(email)) {
                    request.setAttribute("Emailerror", "Email existed,please enter other");

                } else {
                    checkEmail = true;
                    request.setAttribute("Email", email);
                }
            }
        }
        //check phone Number

        if (phoneNum.isEmpty()) {
            request.setAttribute("Phoneerror", "Please enter phoneNumber");
        } else {
            try {
                int num = Integer.parseInt(phoneNum);
            } catch (Exception e) {
                request.setAttribute("Phoneerror", "just numerric 0-9");
            }
            checkPhone = true;
            request.setAttribute("Phone", phoneNum);
        }
        //check username
        if (username.isEmpty()) {
            request.setAttribute("UserNameerror", "Please enter name");
        } else {
          
            RoomBusiness rb = new RoomBusiness();
           User user = rb.getUserByUsername(username);
            Admin admin = rb.getAdminfromDB(username);
            ArrayList<String> arrUser = rb.getUsernamefromDB();
            ArrayList<String> arrAdmin = rb.getAdminnamefromDB();
     
            if (arrUser.contains(username)||arrAdmin.contains(username)) {
                request.setAttribute("UserNameerror", "Username existed ,Please Enter other");
            }
            checkUsername = true;
            request.setAttribute("username", username);

        }
        //check password
        if (password.isEmpty()) {
            request.setAttribute("Passerror", "Please enter password");
        } else {
            if (password.length() < 8) {
                request.setAttribute("Passerror", "Password must equal or longer than 8 character");

            } else {
                checkPass = true;
                request.setAttribute("Password", password);
            }
        }
        //check repassword
        if (repass.isEmpty()) {
            request.setAttribute("Repasserror", "Please enter repassword");

        } else {
            if (!repass.equals(password)) {
                request.setAttribute("Repasserror", "repassword must equal password");

            } else {
                checkRepass = true;
                request.setAttribute("Repassword", repass);

            }
        }
        //check tick check box
        if(request.getParameter("checkBoxRegister")!=null){
            checkbox=true;
        }else{
            request.setAttribute("CheckBoxerror", "You need agree to the Terms of Service and Privacy Policy ");
        }
        //register success
        if (checkEmail == true && checkFName == true && checkPass == true && checkRepass == true
                && checkPhone == true && checkUsername == true&&checkbox==true) {
            
            request.setAttribute("OK", "Register successfull");
            session.setAttribute("USERNAME",username);
            session.setAttribute("PASSWORD",password);
              RoomBusiness rb = new RoomBusiness();
             rb.UpdateUserByUsername(fname, email, phoneNum, username, password);
            
        } else {
            request.setAttribute("OK", "Register Failed");

        }
        doGet(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
