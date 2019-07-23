<%-- 
    Document   : HeaderUserAndAdminPage
    Created on : Jul 25, 2018, 10:00:50 PM
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
    <div class="row" >
        <div class="logo col-md-6 col-sm-6">
            <h1 style="margin-left:27px;font-size: 50px;color:#17a2b8"><a href="./UserPage.jsp">
                    <img src="./picture/book.png"style="border:0;width: 40px ;margin-left: 40px ;margin: -10px 0px 0px 0px"></a>
                BRM
                <a href="http://daihoc.fpt.edu.vn/"><img src="./picture/Logo.png"style="width: 150px ;margin-left: 120px"></a>  
            </h1>
            <p><em>Book Room Easy, Fast, Convenient</em></p> 
        </div>
        <div class="col-md-6 col-sm-6 ">
            <ul class="nav navbar-nav navbar-right" style=" margin-top: 25px">
                <li style="margin-top: -8px ;font-size: 45px ;margin-right: 20px"> 
                    <h1><a href="https://mail.google.com/mail/u/0/#sent?compose=new"> <i class="fa fa-envelope"style="color:#bd2130"></i></a></h1>

                </li>
                <li style="margin-top: -8px ;font-size: 45px ;margin-right: 60px"> 
                    <h1><a href="https://www.facebook.com/hiphopfptuniversity/"> <i class="fa fa-facebook-square" style="color:#007bff"></i></a></h1>
                </li>
                <li>
                    <h2 style="margin-top: 15px"> <a href="#">
                            <span class="glyphicon glyphicon-user"></span>
                        </a></h2>
                </li>
                <li style="margin-right: 20px;margin-top: 20px">
                    <p><%= session.getAttribute("USERNAME")%></p>
                </li>
                <li style="margin-right: 20px ;margin-top: 5px">
                    <a href="./SignIn.jsp">Sign out</a>

                </li>
            </ul>
        </div>
    </div>
</html>
