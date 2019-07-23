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
    <%
        session = request.getSession();
        session.setAttribute("USERNAME", null);
    %>
    <body style="background-color:orangered">
          <%@include file="HeaderLoginAndRegis.jsp" %>
        <div class="container" style="background-color:#fefefe;
             width:794px ;height: 500px;margin-top:150px;
             webkit-border-radius: 5px;
             moz-border-radius: 5px;
             border-radius: 5px">
            <h1 class="text-center"style="margin-top: 80px;font-size:26px ;color:orangered"><strong>Login</strong></h1>
            <%if (request.getAttribute("errorMessage") != null) {
            %>
            <p class="text-center"style="margin-top: 80px;font-size:26px ;color:red">errorMessage: <%=request.getAttribute("errorMessage")%></p>

            <%
                }
            %>
            <form action="login" method="post" class="form-horizontal"style="margin: 50px 0px 0px 200px">
                <div class="form-group">
                    <div class="col-sm-8">
                        <%if (request.getAttribute("userInput") != null) {
                        %>
                        <input type="text" name="userInput"class="form-control"id="inputName"
                               value="<%=request.getAttribute("username")%>">
                        <%} else {
                        %>
                        <input type="text"
                               name="userInput"class="form-control"id="inputName"placeholder="Username">
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <input type="password"
                               name="PassInput" class="form-control"id="inputPass"placeholder="Password">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8">
                        <span><input type="checkbox" name="rememberMeCB"value="check"> Remember me</span>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10"style="margin: 13px 0px 0px -50px">
                        <input  type="submit" class="btn btn-info btn-block"
                                style="background-color:  orangered;webkit-border-radius: 5px;
                                moz-border-radius: 5px;
                                border-radius: 5px" value="Login Now">
                    </div>
                </div>
            </form>
        </div>

    </body>
</html>
