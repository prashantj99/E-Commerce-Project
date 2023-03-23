
<%@page import="com.oss.entities.Message"%>
<%-- 
    Document   : ContactUs  
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./commonheader.jsp" %>
<%    User cuser = (User) session.getAttribute("user");
    if (cuser == null) {
        response.sendRedirect("./homepage.jsp");
        return;
    }
%>
<style>
    * {
        box-sizing: border-box;
    }

    /* Style inputs */
    input[type=text], select, textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
    }

    input[type=submit] {
        background-color: #4CAF50;
        color: white;
        padding: 12px 20px;
        border: none;
        cursor: pointer;
    }
    #hideoncontact{
        display: none!important;
    }
    input[type=submit]:hover {
        background-color: #45a049;
    }

    /* Style the container/contact section */
    .container {
        border-radius: 5px;
        background-color: #f2f2f2;
        padding: 10px;
    }

    /* Create two columns that float next to eachother */
    .column {
        float: left;
        width: 50%;
        margin-top: 6px;
        padding: 20px;
    }

    /* Clear floats after the columns */
    .row:after {
        content: "";
        display: table;
        clear: both;
    }

    @media screen and (max-width: 600px) {
        .column, input[type=submit] {
            width: 100%;
            margin-top: 0;
        }
    }

</style>
<%
    Message contactmsg = (Message) session.getAttribute("contactmsg");
    if (contactmsg != null) {
%>
<div class="text-center  <%=contactmsg.getMsgClass()%>" role="alert">
    <%=contactmsg.getContent()%>
</div>
<%
        session.removeAttribute("contactmsg");
    }
%>
<p><br></p>
<p><br></p>
<div class="container">
    <div style="text-align:center">
        <h2>Contact Us</h2>
        <p>Swing by for a cup of coffee, or leave us a message:</p>
    </div>
    <div class="row">
        <div class="column">
            <img src="./../images/map.jpg" style="width:100%">
        </div>
        <div class="column">
            <form action="./../ContactUsServlet">
                <label for="fname">First Name</label>
                <input type="text" name="fname" id="fname" placeholder="Your name.." value="<%=cuser.getUsername()%>" required>
                <label for="lname">Last Name</label>
                <input type="text" name="lname" id="lname"  placeholder="Your last name..">
                <label for="email">Email Address</label>
                <input type="text" name="email" id="email"  placeholder="Your email address..">
                <label for="country">Country</label>
                <select id="country" name="country" required>
                    <option value="India">India</option>
                </select>
                <label for="subject">Subject</label>
                <textarea id="subject" name="subject" placeholder="Write something.." style="height:170px" required></textarea>
                <input type="submit" value="Submit">
            </form>
        </div>
    </div>
</div>
