<%-- 
    Document   : home.jsp
    Created on : Jul 3, 2018, 11:49:57 PM
    Author     : Don OzOn
--%>
<%@page import="Model.Room"%>
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
    #section1 {padding-top:50px;height:270px;color: #fff; background-color: #1E88E5;margin:50px 35px 0px 35px;webkit-border-radius: 5px;
               moz-border-radius: 5px;
               border-radius: 30px}
    #section2 {padding-top:50px;height:270px;color: #fff; background-color: #34ce57;margin:63px 35px 0px 35px;
               webkit-border-radius: 5px;
               moz-border-radius: 5px;
               border-radius: 30px}
    #section3 {padding-top:50px;height:270px;color: #fff; background-color: orangered;margin:63px 35px 0px 35px;
               webkit-border-radius: 5px;
               moz-border-radius: 5px;
               border-radius: 30px}
    #section4 {padding-top:50px;height:270px;color: #fff; background-color: #ff9800;margin:63px 35px 0px 35px;
               webkit-border-radius: 5px;
               moz-border-radius: 5px;
               border-radius: 30px}
    .affix {
        top: 0;
        width: 100%;
        z-index: 9999 !important;
    }

    .affix + .container-fluid {
        padding-top: 70px;
    }
</style>
<html lang="en">
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
    <body data-spy="scroll" data-target=".navbar" data-offset="50">

        <div class='container-fluid' style="background-color: white ">
            <div class="row" >
                <div class="logo col-md-6 col-sm-6">
                    <h1 style="margin-left:27px;font-size: 50px;color:#17a2b8"><a href="./home.jsp">
                            <img src="./picture/book.png"style="border:0;width: 40px ;margin-left: 40px ;margin: -10px 0px 0px 0px"></a>
                        BRM
                        <a href="http://daihoc.fpt.edu.vn/">
                            <img src="./picture/Logo.png"style="width: 150px ;margin-left: 120px"></a>  
                    </h1>
                    <p><em>Book Room Easy, Fast, Convenient</em></p> 
                </div>
                <div class="col-md-6 col-sm-6 ">
                    <ul class="nav navbar-nav navbar-right" style=" margin-top: 25px">
                        <li style="margin-top: -10px ;font-size: 45px ;margin-right: 20px"> 
                            <h1><a href="#"> <i class="fa fa-envelope"style="color:#bd2130"></i></a></h1>

                        </li>
                        <li style="margin-top: -10px ;font-size: 45px ;margin-right: 60px"> 
                            <h1><a href="UserInformation.jsp"> <i class="fa fa-facebook-square" style="color:#007bff"></i></a></h1>
                        </li>
                        <li style="background-color:#71dd8a ;margin-right: 20px;
                            webkit-border-radius: 5px;
                            moz-border-radius: 5px;
                            border-radius: 20px">
                            <a href="./SignIn.jsp">Sign in</a>
                        </li>
                        <li style="background-color: #71dd8a ;margin-right: 20px ;
                            webkit-border-radius: 5px;
                            moz-border-radius: 5px;
                            border-radius: 20px">
                            <a href="./Register.jsp">Register</a>
                        </li>
                    </ul>
                </div>
            </div>
            <nav  data-spy="affix" data-offset-top="197">
                <div id="myVar" class="container-fluid "style="background-color:orangered;
                     margin-left: -15px;margin-right: -15px;">

                    <ul class="nav navbar-nav " style="font-size: 15px ;margin-left:-20px;
                        ">
                        <li id="menuItem1" ><a class="active" href="#" style="color: white ;">Home</a></li>
                        <li id="menuItem2"><a href="#section1"style="color: white">Book Room</a></li>
                        <li id="menuItem3"><a href="#section2"style="color: white">List Room</a></li>
                        <li id="menuItem4"><a href="#section3"style="color: white">Cancel Room</a></li>
                        <li id="menuItem5"><a href="#section4"style="color: white">History</a></li>
                    </ul>
                </div>
            </nav>

        </div>

        <!--<nav class="navbar navbar-default navbar-fixed-top"></nav>-->

        <div class="container-fluid"style="margin-left: -15px;margin-right: -15px;">



            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">

                    <div class="item active">
                        <center><img src="./picture/1.jpg" style="width:850px;height:450px"></center>
                    </div>

                    <div class="item">
                        <center><img src="./picture/2.jpg" style="width:850px;height:450px"></center>
                    </div>

                    <div class="item">
                        <center><img src="./picture/3.jpg" style="width:850px;height:450px"></center>
                    </div>

                    <div class="item">
                        <center><img src="./picture/4.jpg"style="width:850px;height:450px"></center>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <div class="container-fluid">
            <h1 class="text-center"style="margin: 30px 0px -50px 0px;font-size:40px;color:orangered">
                <strong>WELCOME TO BRM</strong></h1>
            <br>
            <p class="text-center"style="font-size:18px ;margin-top: 50px;">
                Sign in to experience the full range of our services!</p>
            <div id="section1" class="container-fluid">
                <h1>Book Room</h1>
                <p>Book room you want</p>
            </div>
            <div id="section2" class="container-fluid">
                <h1>List Room</h1>
                <p>It's help your find or check room which not zero slot</p>
            </div>
            <div id="section3" class="container-fluid">
                <h1>Cancel Room</h1>
                <p>You don't want use room which ordered , Cancel to others use it.</p>

            </div>

            <div id="section4" class="container-fluid">
                <h1>History</h1>
                <p>View your history booking</p>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
