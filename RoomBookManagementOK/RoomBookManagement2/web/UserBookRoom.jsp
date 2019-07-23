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
<script language="javascript"type="text/javascript">
    function  validateForm() {
        var x = document.forms["myform"]["purpose"].value;
        var y = document.forms["myform"]["datechoose"].value;
        if (y == "") {
            alert("Date must be fill");
            return false;
        } else if (x == "") {
            alert("Reason must be fill");
            return false;
        }
        return true;
    }



</script>
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

                    <ul class="nav navbar-nav " style="font-size: 15px ;margin-left:-20px;
                        ">
                        <li id="menuItem1" ><a href="UserPage.jsp" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a class="active"  href="booking?name=<%= session.getAttribute("USERNAME")%>"style="color: white">Book Room</a></li>
                        <li id="menuItem5"><a href="history?name=<%= session.getAttribute("USERNAME")%>"style="color: white">Booked Room</a></li>
                        <li id="menuItem5"><a href="historyforuser?name=<%= session.getAttribute("USERNAME")%>" style="color: white">History</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container-fluid">
            <h1 class="text-center"style="margin: 40px 0px -50px 0px;font-size:40px;color:orangered">
                <strong>BOOKING ROOM</strong></h1>
        </div><br/><br/><br/>

        <h3 style="color: red ;margin-left: 50px"> 
            ${error}</h3>

        <h3 style="color: green;margin-left: 50px"> 
            ${success}</h3>
        <div class="container" style="margin-top: -70px">
            <br/><br/><br/>
            <div class="table-responsive"> 
                <table border="1" class="table">
                    <tbody>

                        <tr>
                            <td><center>RoomNo</center></td>
                    <td><center>RoomSize</center></td>
                    <td><center>Booking</center></td>
                    </tr>

                    <c:forEach var = "item" items="${room}">
                        <tr class="info">
                            <td><center>${item.roomNo}</center></td>
                        <td><center>${item.roomSize}</center></td>
                        <td>
                            <form action="booking" method="post"  name="myform"
                                  onsubmit="return validateForm()">
                                <center>
                                    <select name = "chon"style="height:30px">
                                        <option value = "Slot 1">Slot 1(7h30-9h)</option>
                                        <option value = "Slot 2">Slot 2(9h10-10h40)</option>
                                        <option value = "Slot 3">Slot 3(10h50-12h20)</option>
                                        <option value = "Slot 4">Slot 4(12h50-14h20)</option>
                                        <option value = "Slot 5">Slot 5(14h30-16h)</option>
                                        <option value = "Slot 6">Slot 6(16h10-17h40)</option>
                                    </select>
                                    <%--<%
                                        Date currentDate = new Date();
                                        long currentTimestamp = currentDate.getTime();
                                        long next30dayTimestamp = currentTimestamp + 30*24*60*60;
                                        Date next30Date = new Date(next30dayTimestamp);
                                        %>
                                        <%=currentDate.toString()%>
                                        <%=next30Date.toString()%>
                                    --%>
                                    <%
                                        String date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
                                        String dateDD = new SimpleDateFormat("dd").format(Calendar.getInstance().getTime());
                                        String dateMM = new SimpleDateFormat("MM").format(Calendar.getInstance().getTime());
                                        request.setAttribute("date", date);
                                        request.setAttribute("date2", dateDD);
                                        request.setAttribute("date3", dateMM);


                                    %>
                                    *<input style="height:30px" type = "date" name="datechoose" min="2018-${date3}-${date2}" 
                                           max="2018-<%= (Integer.parseInt(dateMM) + 1) <= 9 ? ("0".concat(String.valueOf(Integer.parseInt(dateMM) + 1))) : (String.valueOf(Integer.parseInt(dateMM) + 1))%>-${date2}"
                                           />

                                    <input name="roomNo" value="${item.roomNo}" type="hidden"/>
                                    <input name="username" value="${sessionScope.USERNAME}" type="hidden"/>
                                    *<input type="text" style="width: 50%;height: 30px" name="purpose" placeholder="Reason booking....">
                                    <input type="submit" value="Choose" style="height:30px;color: white;background-color:orangered ;margin-right: 20px"/>

                                </center>
                            </form>
                        </td>
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
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
