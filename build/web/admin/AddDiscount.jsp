<%@page import="java.util.List"%>
<%@page import="com.oss.entities.Category"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--header-->
<%@include file="header.jsp" %>
<!--end of header-->
<%            Message dmsg = (Message) session.getAttribute("dmsg");
    if (dmsg != null) {
%>
<div class="alert <%=dmsg.getMsgClass()%>" role="alert" id="confirmmsg">
    <%=dmsg.getContent()%>
</div>
<%
        session.removeAttribute("dmsg");
    }
%>
<section class="container-fluid">
    <div class="col-md-2">

    </div>
    <div class="col-md-10">
        <div class="row" style="justify-content: center;">
            <img width="50px" height="50px" src=".././images/discount.png" alt="discount">
        </div>
        <h5 class="text-center" style="color: orange;">Add Discount</h5>
        <div class="row" style="justify-content: center;">
            <form id="pd01" action=".././AddDiscountServlet" method="post" style="width: 50%;">

                <div class="form-group">
                    <label for="category">Select Category</label>
                    <select class="form-control" id="category" name="categoryid">
                        <%
                            CategoryDao dao = new CategoryDao(ConnectionProvider.getConnection());
                            List<Category> cats = dao.getAllCategory();
                            for (Category c : cats) {
                        %>
                        <option value="<%=c.getCategoryid()%>"><%=c.getCategorytitle()%></option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="discountval">Discount(in %)</label>
                    <input type="text" class="form-control" id="discountval"  name="discount" required>
                </div>
                <div class="form-group">
                    <label for="discountdesc">Discount Description</label>
                    <textarea class="form-control" id="discountdesc" rows="3" name="discountdescription"></textarea>
                </div>
                <button type="submit" class="btn btn-primary" id="addproduct01">Add Discount</button>
                <button type="reset" class="btn btn-primary" id="addproduct02">Cancel</button>
            </form>
        </div>
    </div>
</section>
                    <%@include file="./footer.jsp" %>
</body>
</html>
