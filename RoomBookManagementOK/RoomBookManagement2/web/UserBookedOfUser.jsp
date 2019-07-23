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
    if (session.getAttribute("error") != null) {
        String error = (String) session.getAttribute("error");
        session.removeAttribute("error");
        request.setAttribute("error", error);
    }
    if (session.getAttribute("success") != null) {
        String success = (String) session.getAttribute("success");
        session.removeAttribute("success");
        request.setAttribute("success", success);
    }
    String slot = request.getParameter("choose");
    request.setAttribute("slot", slot);
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
                        <li id="menuItem1" ><a href="UserPage.jsp" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a  href="booking?name=<%= session.getAttribute("USERNAME")%>"style="color: white">Book Room</a></li>
                         <li id="menuItem5"><a class="active" href="history?name=<%= session.getAttribute("USERNAME")%>"style="color: white">Booked Room</a></li>
                         <li id="menuItem5"><a  href="historyforuser?name=<%= session.getAttribute("USERNAME")%>" style="color: white">History</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container-fluid">
            <h1 class="text-center"style="margin: 40px 0px -50px 0px;font-size:40px;color:orangered">
                <strong>BOOKED ROOM</strong></h1>
        </div><br/><br/><br/>

        <h3 style="color: green"><center> ${error}${success}</center></h3>
        <div class="container"style="margin-top: -70px">
            <br/><br/><br/>
            <table border="1" class="table">
                <tbody>
                    <tr>
                        <td><center>RoomNo</center></td>
                <td><center>BookDate</center></td>
                <td><center>BookSlot</center></td>
                <td><center>ReasonBook</center></td>
                <td><center>StatusBook</center></td>
                <td><center>Cancel Order</center></td>
                </tr>
                
                <c:forEach var = "item" items="${history}">
                  <tr class="info">
                        <td><center>${item.roomNo}</center></td>
                    <td><center>${item.date}</center></td>
                    <td><center>${item.slot}</center></td>
                    <td><center>${item.mess}</center></td>
                    <td><center><%= request.getParameter("item.status") == "true" ? "Đã xác nhận" : "Chưa xác nhận"%></center></td>
                    <td>
                    <center>
                        <form action = "history" method = "post">
                            <input name="date" value="${item.date}" type="hidden"/>
                            <input name="slot" value="${item.slot}" type="hidden"/>
                            <input name="roomNo" value="${item.roomNo}" type="hidden"/>
                            <input name="name" value="${username}" type="hidden"/>
                            <input name="userid" value="${userid}" type="hidden"/>
                            <input type="submit" value = "Cancel" class="btn btn-primary btn-md"/>
                            
                        </form>
                    </center>
        </td>
        </tr>
                </c:forEach>

                <c:choose>
                    <c:when test="${fn:length(history) > 1}">
                        <p>Have ${fn:length(history)} orders</p>
                    </c:when>
                    <c:when test="${fn:length(history) <= 1}">
                        <p>Have ${fn:length(history)} order</p>
                    </c:when>
                    <c:otherwise>
                        <p>No order</p>
                    </c:otherwise>
                </c:choose>


                </tbody>
            </table>

        </div>
    <%@include file="footer.jsp" %>
    </body>
</html>
