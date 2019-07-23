<%-- 
    Document   : SignIn.jsp
    Created on : Jul 4, 2018, 3:44:39 PM
    Author     : Don OzOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>BRM</title>
        <meta charset="utf-8">
        <link rel="icon" href="./picture/book.png"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


    </head>
    <body style="background-color:orangered">
          <%@include file="HeaderLoginAndRegis.jsp" %>
        <div class="container" style="background-color:#fefefe;
             width:794px ;height: 750px;margin-top:150px;
             webkit-border-radius: 5px;
             moz-border-radius: 5px;
             border-radius: 5px">
            <h1 class="text-center"style="margin-top: 80px;font-size:26px;color:orangered"><strong>Register</strong></h1>
            <form action="Register"method="post"
                  class="form-horizontal"style="margin: 50px 0px 0px 200px">
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="text" value="<%=request.getAttribute("Fullname") == null ? "" : request.getAttribute("Fullname")%>"
                               name="fnInput"class="form-control"id="inputFullName"placeholder="FullName">
                        <%if (request.getAttribute("Nameerror") != null) {%>

                        <span style="color: red"><%=request.getAttribute("Nameerror")%></span>

                        <% }%>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="email"value="<%= request.getAttribute("Email") == null ? "" : request.getAttribute("Email")%>"
                               name="emailInput"class="form-control"id="inputEmail"placeholder="Email">
                        <%
                            if (request.getAttribute("Emailerror") != null) {


                        %> 
                        <span style="color: red"><%=request.getAttribute("Emailerror")%></span>

                        <% }%>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="text"value="<%= request.getAttribute("Phone") == null ? "" : request.getAttribute("Phone")%>"
                               name="phoneNumberInput" class="form-control"id="inputPhoneNumber"placeholder="PhoneNumber">
                        <%
                            if (request.getAttribute("Phoneerror") != null) {


                        %> 
                        <span style="color: red"><%=request.getAttribute("Phoneerror")%></span>

                        <% }%>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="text"value="<%= request.getAttribute("username") == null ? "" : request.getAttribute("username")%>"
                               name="userNameInput" class="form-control"id="inputUsername"placeholder="Username">
                        <%
                            if (request.getAttribute("UserNameerror") != null) {


                        %> 
                        <span style="color: red"><%=request.getAttribute("UserNameerror")%></span>

                        <% }%>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="password"value="<%= request.getAttribute("Password") == null ? "" : request.getAttribute("Password")%>"
                               name="passInput" class="form-control"id="inputPass"placeholder="Password">
                        <%
                            if (request.getAttribute("Passerror") != null) {


                        %> 
                        <span style="color: red"><%=request.getAttribute("Passerror")%></span>

                        <% }%>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="password"value="<%= request.getAttribute("Repassword") == null ? "" : request.getAttribute("Repassword")%>"
                               name="repassInput" class="form-control"id="inputRePass"placeholder="ReEnterPassword">
                        <%
                            if (request.getAttribute("Repasserror") != null) {


                        %> 
                        <span style="color: red"><%=request.getAttribute("Repasserror")%></span>

                        <% }%>
                    </div>
                </div>
                <div class="checkbox-inline"style="margin-left:-20px">
                    <div class="col-sm-15">
                        <label class="checkbox-inline">
                            <input type="checkbox" name="checkBoxRegister">I agree to the 
                            <a href="#">Terms of Service </a>
                            and 
                            <a href="#">Privacy Policy</a>

                        </label>
                        <%
                            if (request.getAttribute("CheckBoxerror") != null) {


                        %> 
                        <br>
                        <span style="color: red"><%=request.getAttribute("CheckBoxerror")%></span>
                        <br><br>
                        <% }%>
                    </div>
                </div>
                <%if (request.getAttribute("OK") == "Register Failed") {%>

                <p style="color: red"><%=request.getAttribute("OK")%></p>

                <% }
                    if (request.getAttribute("OK") == "Register successfull") {%>
                <p style="color: green"><%=request.getAttribute("OK")%></p>
                <%}%>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10"style="margin: 30px 0px 0px -50px">
                        <input  type="submit" class="btn btn-info btn-block"
                                style="background-color:  orangered;webkit-border-radius: 5px;
                                moz-border-radius: 5px;
                                border-radius: 5px" value="Register Now">
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>
