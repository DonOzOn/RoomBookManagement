<%-- 
    Document   : AddAdmin.jsp
    Created on : Jul 23, 2018, 11:26:41 PM
    Author     : Don OzOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    #myVar ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        background-color: orangered;
    }

    #myVar li {
        float: left;
    }
    #myVar li a:hover:not(.active) {
        background-color: #e4606d;
    }
    #myVar .active {
        background-color: #e4606d;
    }
    .affix {
        top: 0;
        width: 100%;
        z-index: 9999 !important;
    }

    .affix + .container-fluid {
        padding-top: 70px;
    }
    #textUnder{
        color: black;
    }
    #textUnder:hover{
        color: orangered;
        text-decoration: none;  
    }
    #ImageUserIcon img {
        opacity: 1.0;
        filter: alpha(opacity=50); /* For IE8 and earlier */
    }

    #ImageUserIcon img:hover {
        opacity: 0.9;
        filter: alpha(opacity=100); /* For IE8 and earlier */
    }

</style>
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
    <body style="background-color:orange">
        <div class='container-fluid' style="background-color: white ">
            <%@include file="HeaderUserPage.jsp" %>
            <nav  data-spy="affix" data-offset-top="197">
                <div id="myVar" class="container-fluid "style="background-color:orangered;
                     margin-left: -15px;margin-right: -15px;">

                    <ul class="nav navbar-nav " style="font-size: 15px ;margin-left:-20px;
                        ">
                       <li id="menuItem1" ><a  href="AdminPage.jsp" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a href="denyorder"style="color: white">Check Order</a></li>
                        <li id="menuItem5"><a href="admineditroom"style="color: white">Edit Room</a></li>
                        <li id="menuItem5"><a class="active" href="AdminAddAdmin.jsp"style="color: white">Add Admin</a></li>
                        <li id="menuItem5"><a href="historyforadmin"style="color: white">History Booking</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container-fluid" style="background-color:#fefefe;
             width:750px ;height: 650px;margin-top:10px;
             webkit-border-radius: 5px;
             moz-border-radius: 5px;
             border-radius: 5px">
            <h1 class="text-center"style="margin-top: 80px;font-size:26px;color:orangered"><strong>New Admin</strong></h1>
            <form action="AddAdmin"method="post"
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
                <%if (request.getAttribute("OK") == "Register Failed") {%>

                <p style="color: red"><%=request.getAttribute("OK")%></p>

                <% }
                    if (request.getAttribute("OK") == "Register successfull") {%>
                <p style="color: green"><%=request.getAttribute("OK")%></p>
                <%}%>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10"style="margin: 20px 0px 0px -50px">
                        <input  type="submit" class="btn btn-info btn-block"
                                style="background-color:  orangered;webkit-border-radius: 5px;
                                moz-border-radius: 5px;
                                border-radius: 5px" value="Add">
                    </div>
                </div>
            </form>
        </div>

<%@include file="footer.jsp" %>

    </body>
</html>
