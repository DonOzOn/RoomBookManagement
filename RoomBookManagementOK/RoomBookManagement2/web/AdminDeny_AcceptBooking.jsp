<%-- 
    Document   : UserPage.jsp
    Created on : Jul 5, 2018, 11:30:32 PM
    Author     : Don OzOn
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Model.Room"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<%
    if (session.getAttribute("success") != null) {
        String success = (String) session.getAttribute("success");
        session.removeAttribute("success");
        request.setAttribute("success", success);
    }
%>
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
    <body>
        <div class='container-fluid' style="background-color: white ">
            <%@include file="HeaderUserPage.jsp" %>
            <nav  data-spy="affix" data-offset-top="197">
                <div id="myVar" class="container-fluid "style="background-color:orangered;
                     margin-left: -15px;margin-right: -15px;">

                    <ul class="nav navbar-nav " style="font-size: 15px ;margin-left:-20px;">
                        <li id="menuItem1" ><a href="AdminPage.jsp" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a class="active" href="denyorder"style="color: white">Check Order</a></li>
                        <li id="menuItem5"><a href="admineditroom"style="color: white">Edit Room</a></li>
                        <li id="menuItem5"><a href="AdminAddAdmin.jsp"style="color: white">Add Admin</a></li>
                        <li id="menuItem5"><a href="historyforadmin"style="color: white">History Booking</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container-fluid">
            <h1 class="text-center"style="margin: 40px 0px -50px 0px;font-size:40px;color:orangered">
                <strong>CHECK ORDER</strong></h1>
        </div><br/><br/><br/>

    <center> <h3 style="color: red ;margin-left: 50px">
            ${error}</h3></center>  

    <center><h3 style="color: green;margin-left: 50px"> 
        ${success}</h3></center> 
    <div class="container"style="margin-top: -70px">

        <br/><br/><br/>
        <table border="1" class="table">
            <tbody>
                <tr>
                    <td><center>UserID</center></td>
            <td><center>RoomNo</center></td>
            <td><center>BookDate</center></td>
            <td><center>BookSlot</center></td>
            <td><center>ReasonBook</center></td>
            <td><center>StatusBook</center></td>
            <td><center>AcceptOrder</center></td>
            <td><center>Cancel Order</center></td>
            </tr>

            <c:forEach var = "item" items="${ordered}">
                <tr class="info">
                    <td><center>${item.userID}</center></td>
                <td><center>${item.roomNo}</center></td>
                <td><center>${item.date}</center></td>
                <td><center>${item.slot}</center></td>
                <td><center>${item.mess}</center></td>
                <td><center><%= request.getParameter("item.status") == "true" ? "Đã xác nhận" : "Chưa xác nhận"%></center></td>
                <td>
                <center>
                    <form action = "denyorder" method = "post">
                        <input name="userid" value="${item.userID}" type="hidden"/>
                        <input name="roomno" value="${item.roomNo}" type="hidden"/>
                        <input name="date" value="${item.date}" type="hidden"/>
                        <input name="slot" value="${item.slot}" type="hidden"/>
                        <input type="submit" value = "Deny" class="btn btn-primary btn-md"/>
                    </form>
                </center>
                </td>
                <td>
                <center>
                    <form action = "acceptorder" method = "post">
                        <input name="userid" value="${item.userID}" type="hidden"/>
                        <input name="roomno" value="${item.roomNo}" type="hidden"/>
                        <input name="date" value="${item.date}" type="hidden"/>
                        <input name="slot" value="${item.slot}" type="hidden"/>
                        <input name="mess" value="${item.mess}" type="hidden"/>
                        <input type="submit" value = "Accept" class="btn btn-primary btn-md"/>

                    </form>
                </center>
                </td>
                </tr>
            </c:forEach>

            <c:choose>
                <c:when test="${fn:length(ordered) > 1}">
                    <p>Have ${fn:length(ordered)} orders</p>
                </c:when>
                <c:when test="${fn:length(ordered) <= 1}">
                    <p>Have ${fn:length(ordered)} order</p>
                </c:when>
                <c:otherwise>
                    <p>No order</p>
                </c:otherwise>
            </c:choose>


            </tbody>
        </table>
        <br/><br/><br/>


        <table border="1" class="table">
            <tbody>
                <tr>
                    <td><center>UserID</center></td>
            <td><center>UserName</center></td>
            <td><center>Email</center></td>
            <td><center>PhoneNumber</center></td>
            <td><center>LoginName</center></td>
            <td><center>PassWord</center></td>
            </tr>

            <c:forEach var = "item" items="${users}">
                <tr class="info">
                    <td><center>${item.userID}</center></td>
                <td><center>${item.name}</center></td>
                <td><center>${item.email}</center></td>
                <td><center>${item.phoneNumber}</center></td>
                <td><center>${item.loginName}</center></td>
                <td><center>${item.password}</center></td>
                </tr>
            </c:forEach>

            <c:choose>
                <c:when test="${fn:length(users) > 1}">
                    <p>Have ${fn:length(users)} users</p>
                </c:when>
                <c:when test="${fn:length(users) <= 1}">
                    <p>Have ${fn:length(users)} user</p>
                </c:when>
                <c:otherwise>
                    <p>No user</p>
                </c:otherwise>
            </c:choose>


            </tbody>
        </table>
    </div>
<%@include file="footer.jsp" %>
</body>
</html>
