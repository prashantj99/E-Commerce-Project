<%@page import="com.oss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--header-->
<%@include file="header.jsp" %>
<!--end of header-->
<%            Message pmsg = (Message) session.getAttribute("pmsg");
    if (pmsg != null) {
%>
<div class="alert <%=pmsg.getMsgClass()%>" role="alert" id="confirmmsg">
    <%=pmsg.getContent()%>
</div>
<%
        session.removeAttribute("pmsg");
    }
%>
<section class="container-fluid">
    <div class="col-md-2">

    </div>
    <div class="col-md-10">
        <div class="row" style="justify-content: center;">
            <img width="50px" height="50px" src=".././images/producticon.png" alt="Product">
        </div>
        <h5 class="text-center" style="color: orange;">Add Product</h5>
        <div class="row" style="justify-content: center;">
            <form id="pd01" action=".././AddProductServlet" method="post" style="width: 50%;" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="exampleFormControlInput1">Product Name</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1"  name="productname" required>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlSelect1">Select Category</label>
                    <select class="form-control" id="exampleFormControlSelect1" name="categoryid">
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
                    <label for="exampleFormControlInput1">Product Price(in &#8377)</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1"  name="productprice" required>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlInput1">Product Quantity</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1"  name="quantity" required>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="customFile" name="productimage">
                    <label class="custom-file-label" for="customFile">Choose Product Image</label>
                </div>
                <br>
                <br>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Product Description</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="productdescription"></textarea>
                </div>
                <button type="submit" class="btn btn-primary" id="addproduct01">Add Product</button>
                <button type="reset" class="btn btn-primary" id="addproduct02">Cancel</button>
            </form>
        </div>
    </div>
</section>
                    <%@include file="./footer.jsp" %>
</body>
</html>
