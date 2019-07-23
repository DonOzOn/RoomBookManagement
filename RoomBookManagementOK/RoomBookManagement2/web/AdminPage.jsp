<%-- 
    Document   : AdminPage.jsp
    Created on : Jul 5, 2018, 11:31:19 PM
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
    <body>
        <div class='container-fluid' style="background-color: white ">
          <%@include file="HeaderUserPage.jsp" %>
            <nav  data-spy="affix" data-offset-top="197">
                <div id="myVar" class="container-fluid "style="background-color:orangered;
                     margin-left: -15px;margin-right: -15px;">

                    <ul class="nav navbar-nav " style="font-size: 15px ;margin-left:-20px;
                        ">
                        <li id="menuItem1" ><a class="active" href="AdminPage.jsp" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a href="denyorder"style="color: white">Check Order</a></li>
                        <li id="menuItem5"><a href="admineditroom"style="color: white">Edit Room</a></li>
                        <li id="menuItem5"><a href="AdminAddAdmin.jsp"style="color: white">Add Admin</a></li>
                        <li id="menuItem5"><a href="historyforadmin"style="color: white">History Booking</a></li>
                    </ul>
                </div>
            </nav>

        </div>
        <div class="container-fluid">
            <h1 class="text-center"style="margin: 40px 0px -50px 0px;font-size:40px;color:orangered">
                <strong>WELCOME ADMIN</strong></h1>
        </div>
        <div class="container">
            <div class="row" style="margin: 100px 0px 0px 38px">
                <div class="col-xs-4">
                    <a id="ImageUserIcon" href="denyorder?name=<%= session.getAttribute("USERNAME")%>"><img src="./picture/check.png"></a>
                </div>
                <div class="col-xs-4"> 
                    <a id="ImageUserIcon" href="admineditroom" ><img src="./picture/edit.png"></a>
                </div>   
                <div class="col-xs-4"> 
                    <a id="ImageUserIcon" href="AdminAddAdmin.jsp" ><img src="./picture/add.jpg"></a>
                </div>

            </div>
            <div class="row" style="margin: 0px 0px 0px 85px">
                <div class="col-xs-4 ">
                    <a id="textUnder" href="denyorder?name=<%= session.getAttribute("USERNAME")%>"><h3><strong> CHECK ORDER</strong></h3></a> 
                </div>
                <div class="col-xs-4 "style="margin-left:352px;margin-top: -54px">
                    <a id="textUnder" href="admineditroom"><h3><strong>EDIT ROOM's INFOR</strong></h3></a>
                </div>
                <div class="col-xs-4 "style="margin-left:770px;margin-top: -56px">
                    <a id="textUnder" href="AdminAddAdmin.jsp"><h3><strong>ADD ADMIN</strong></h3></a>
                </div>
            </div>
        </div>

                    <%@include file="footer.jsp" %>
    </body>
</html>
