<%-- 
    Document   : RegistrationPage
--%>

<%@page import="com.oss.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  errorPage="./errorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./commonlinkpage.jsp" %>
        <title>Online Shopping Site | Registration Page</title>
    </head>
    <body style="background-color: #ecf0f1;">
        <%
            Message msg = (Message) session.getAttribute("regmsg");
            if (msg != null) {
        %>
        <div class="alert <%=msg.getMsgClass()%>" role="alert">
            <%=msg.getContent()%>
        </div>
        <%
                session.removeAttribute("regmsg");
            }
        %>
        <section style="padding:10px; width:100%;  min-height:100vh; display:flex; flex-direction: column; justify-content: center; align-items: center">
            <form onsubmit="return checkEmptyField()" id="form" style="width: 46%!important ; " action="./RegistrationServlet" method="POST">
                <h3 class="text-center border-round p-2 text-secondary" style="width: 100%;">
                    Sign Up
                </h3>
                <div class="form-row">
                    <div class="form-group col-md-12">
                        <label for="username">Name</label>
                        <input type="text" name="username" class="form-control" id="username" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="eamil">Email</label>
                        <input type="email" name="useremail" class="form-control" id="eamil" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="password">Password</label>
                        <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" type="password" name="userpassword" class="form-control" id="password" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="chkpass">Repeat Password</label>
                    <input pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" type="password" class="form-control" name="chkpass" id="chkpass" required>
                    <small>Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters</small>
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" id="address" placeholder="1234 Main St" required>
                </div>
                <div class="form-group">
                    <label for="inputPhone">Phone Number</label>
                    <input type="tel" name="phone" class="form-control" id="inputPhone" pattern="[0-9]{10}" required>
                </div>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" name="confirmtc" id="gridCheck" required>
                        <label class="form-check-label" for="gridCheck">
                            I agree with <a href="#">Term &amp;Conditions</a>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    ? <span class="text-danger">Existing User</span> <a href="./LoginPage.jsp">Login</a>
                </div>
                <button type="submit" class="btn btn-success" id="submitrg01" style="width: 100%;">Register Now</button>
            </form>
        </section>
    </body>
    <script>
        function checkEmptyField() {
            for (i = 0; i <=6; i++) {
                var inputval = document.forms[0].elements[i].value;
                if (inputval === "") {
                    alert("please fill all fields");
                    return false;
                }
            }
            return true;
        }
    </script>
</html>
