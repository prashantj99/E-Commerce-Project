<%@page errorPage="./Error.jsp" %>
<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%
    User currentuser = (User) session.getAttribute("user");
    if (currentuser == null) {
        Message msg = new Message("alert alert-danger text-center", "To Access this page you have to login as admin !!!");
        session.setAttribute("msg", msg);
        response.sendRedirect("./../LoginPage.jsp");
        return;
    }
%>
<%
    if (currentuser != null && currentuser.getUsertype().equals("normal")) {
        response.sendRedirect("../user/homepage.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="./../commonlinkpage.jsp" %>
        <link rel="stylesheet" href="./../css/commonstyle.css">
        <script src="./../javascript/jquery-3.6.0.js"></script>
        <title>Online Shopping Site | Admin Home Page</title>
    </head>
    <body>
        <nav class="container-fluid bg-primary text-white">
            <br>
            <div class="row">
                <div class="col-md-3">
                    <a class="navbar-brand text-white" href="./adminpage.jsp">Online Shopping Site</a>
                </div>
                <div class="col-md-6">
                    <div class="input-group" style="width: 100%; height: 75%;">
                        <input type="text" class="form-control" placeholder="features comming soon..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button style="background-color: orange;" class="btn btn-outline-white text-white" type="button">
                                <img style="width: 20px; height: 20px;" src="./../images/magnifying-glass.png" alt="search">
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <div class="dropdown">
                        <button class="dropbtn text-center p-2">
                            Hello <%= currentuser.getUsername()%>
                        </button>
                        <div class="dropdown-content">
                            <a href="#" class="text-center" title="<%= currentuser.getUsername()%>">
                                <img style="width: 20px; height: 20px;"
                                     src="./../images/userdefault.png" alt="logo">
                            </a>
                            <a href="./../LogoutServlet" class="text-center">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <!--end of navbar-->
        <!--manage link-->
        <%@include file="./commonadminmanagelink.jsp" %>
