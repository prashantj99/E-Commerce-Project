<%-- 
    Document   : forgotpassword
--%>
<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="./errorPage.jsp"%>
<!DOCTYPE html>
<html>
    <head>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Online Shopping Site | Forgot Page</title>
    </head>
    <body style="background-color: #ecf0f1;">
        <%
            Message msg = (Message) session.getAttribute("forgotmsg");
            if (msg != null) {
        %>
        <div class="alert <%=msg.getMsgClass()%>" role="alert">
            <%=msg.getContent()%>
        </div>
        <%
                session.removeAttribute("forgotmsg");
            }
        %>
        <section style="padding:30px; width:100%; min-height:100vh; display:flex; flex-direction: column; justify-content: center; align-items: center;">
            <div><img width="100px" height="100px" src="./images/user.png" alt="user"></div>
            <h3 class="text-center" style="color: orange; line-height: 100px;">Forgot Password</h3>
            <form onsubmit="return checkEmptyField()" action="./GenerateOTPServlet" method="post" style="width: 46%!important ; ">
                <div class="form-group">
                    <label for="eamil">Email Address</label>
                    <input type="email" class="form-control" id="email" aria-describedby="emailHelp" required name="useremail">
                    <small id="emailHelp" class="form-text text-muted">we will send OTP on this email Please verify email before submit!!!</small>
                </div>
                <button type="submit" class="text-center btn btn-success" style="width: 100%">Submit</button>
            </form>
        </section>
    </body>
    <script>
        function checkEmptyField() {
            for (i = 0; i < 1; i++) {
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
