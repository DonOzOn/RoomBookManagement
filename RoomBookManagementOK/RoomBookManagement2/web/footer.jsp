<%-- 
    Document   : footer.jsp
    Created on : Jul 25, 2018, 9:42:39 PM
    Author     : Don OzOn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <p style="margin:25px 0px 0px 75px;font-size: 18px">
        Copyright © 1996–2018 BRM™. All rights reserved</p>
    <hr class="container"style="margin-top: 30px;border-color: orangered">
    <!-- Container (Contact Section) -->
    <div id="contact" class="container">
        <h3 class="text-center"style="color:orangered;margin-bottom: 40px">Contact & Feedback</h3>
        <%
            if (request.getAttribute("success") != null) {

        %>
        <center> <p style="color:green"><%=request.getAttribute("success")%></p></center>
            <%}%>
            <%
                if (request.getAttribute("error") != null) {

            %>
        <center> <p style="color:red"><%=request.getAttribute("error")%></p></center>
            <%}%>
        <div class="row">
            <div class="col-md-4">
                <p><span class="glyphicon glyphicon-map-marker">
                    </span> DAI HOC FPT KM29 KHU CN CAO LANG HOA LAC ,THACH HOA ,THACH THAT,HA NOI CITY</p>
                <p><span class="glyphicon glyphicon-phone"></span>Phone: +00 1515151515</p>
                <p><span class="glyphicon glyphicon-envelope"></span>Email: DONNVSE0511@FPT.EDU.VN</p>
            </div>
            <div class="col-md-8">
                <form action="mail" method="post">
                    <div class="row">
                        <div class="col-sm-6 form-group">
                            <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
                        </div>
                        <!--                        <div class="col-sm-6 form-group">
                                                    <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
                                                </div>-->
                    </div>
                    <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
                    <br>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <input class="btn pull-right " style="background-color:orangered;color:white" type="submit"value="send">
                        </div>
                    </div>
                </form>

            </div>
        </div>
    </div>
</html>
