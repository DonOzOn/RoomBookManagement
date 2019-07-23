<%-- 
    Document   : EditRoom.jsp
    Created on : Jul 24, 2018, 12:21:28 AM
    Author     : Don OzOn
--%>

<%@page import="java.util.List"%>
<%@page import="Model.Room"%>
<%@page import="DAO.RoomManage"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
    body {
        position: relative; 
    }
    .affix {
        top: 0;
        width: 100%;
        z-index: 9999 !important;
    }

    .affix + .container-fluid {
        padding-top: 70px;
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
    <body>
        <div class='container-fluid' style="background-color: white ">
            <%@include file="HeaderUserPage.jsp" %>
            <nav  data-spy="affix" data-offset-top="197">
                <div id="myVar" class="container-fluid "style="background-color:orangered;
                     margin-left: -15px;margin-right: -15px;">

                    <ul class="nav navbar-nav " style="font-size: 15px ;margin-left:-20px;
                        ">
                        <li id="menuItem1" ><a href="AdminPage.jsp" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a href="denyorder"style="color: white">Check Order</a></li>
                        <li id="menuItem5"><a class="active" href="admineditroom"style="color: white">Edit Room</a></li>
                         <li id="menuItem5"><a href="AdminAddAdmin.jsp"style="color: white">Add Admin</a></li>
                        <li id="menuItem5"><a href="historyforadmin"style="color: white">History Booking</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container">
            <br/><br/>
            <table border="1" class="table">
                <tbody>
                
                    <tr>
                        <td><center>RoomNo</center></td>
                        <td><center>RoomSize</center></td>
                        <td><center>Edit</center></td>
                    </tr>
                
                <c:forEach var = "item" items="${room}">
                    <tr class="info">
                        <td><center>${item.roomNo}</center></td>
                        <td><center>${item.roomSize}</center></td>
                        <td><center><input type="submit" value="Edit" style="color: white;background-color:orangered ;margin-right: 20px"/></center></td>
                    </tr>
                </c:forEach>

                <c:choose>
                    <c:when test="${fn:length(room)>0}">
                        <h3>Have ${fn:length(room)} rooms</h3>
                    </c:when>
                    <c:otherwise>
                        <h3>No room</h3>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>

        </div>
    <%@include file="footer.jsp" %>

    </body>
</html>
