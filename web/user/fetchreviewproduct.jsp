<%@page import="com.oss.entities.User"%>
<%@page import="com.oss.entities.OrderProduct"%>
<%@page import="com.oss.dao.OrderDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%
    User currentuser = (User) session.getAttribute("user");
    String orderid = request.getParameter("orderid");
    int productid = Integer.parseInt(request.getParameter("productid").trim());
    OrderDao orderdao = new OrderDao(ConnectionProvider.getConnection());
    OrderProduct orderproduct = orderdao.getOrderProductByOrderidAndProductid(orderid, productid);
%>
<div class="row" style="justify-content: center;">
    <div class="col-md-2">
        <img style="width: 50px; height: 50px;" src="./../productimg/<%=orderproduct.getProductimage()%>">
    </div>
    <div class="col-md-10">
        <p class="text-justify"><%=orderproduct.getProductdescription()%></p>
    </div>
</div>
<div class="container">
    <p><br></p>
</div>
<div class="container">
    <div class="form-group">
        <label for="comment">Comment</label>
        <textarea name="comment" class="form-control" id="comment" rows="3" required></textarea>
    </div>
    <div class="container">
        <!--<p><br></p>-->
    </div>
    <!--<div class="container">-->
    <div clas="row" style="justify-content: flex-start;">
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="star" id="star1" value="1">
            <label class="form-check-label" for="star1">Very Bad</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="star" id="star2" value="2">
            <label class="form-check-label" for="star2">Bad</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="star" id="star3" value="3" checked>
            <label class="form-check-label" for="star3">Better</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="star" id="star4" value="4">
            <label class="form-check-label" for="star4">Good</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="star" id="star5" value="5">
            <label class="form-check-label" for="star5">Very Good</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="star" id="star6" value="6">
            <label class="form-check-label" for="star6">Excellent</label>
        </div>
    </div>
    <div class="row" style="justify-content: flex-end">
        <button class="btn btn-warning" onclick="addReview(<%=orderproduct.getProductid()%>,<%=currentuser.getUserid()%>)">Submit</button>
    </div>
</form>
