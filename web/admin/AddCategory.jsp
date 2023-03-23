<%@page import="com.oss.entities.Message"%>
<%@page import="com.oss.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--header-->
<%@include file="header.jsp" %>
<!--end of header-->        <%
            Message cmsg = (Message) session.getAttribute("cmsg");
            if (cmsg != null) {
        %>
        <div class="alert <%=cmsg.getMsgClass()%>" role="alert" id="confirmmsg">
            <%=cmsg.getContent()%>
        </div>
        <%
                session.removeAttribute("cmsg");
            }
        %>
        <section class="container-fluid">
            <div class="col-md-2">
                
            </div>
            <div class="col-md-10">
                <div class="row" style="justify-content: center;">
                    <img width="50px" height="50px" src=".././images/category.png" alt="Category">
                </div>
                <h5 class="text-center" style="color: orange;">Add Category</h5>
                <div class="row" style="justify-content: center;">
                    <form id="admin01" action=".././AddCategoryServlet" method="post" style="width: 50%;" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="exampleFormControlInput1">Category Title</label>
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="categorytitle" required>
                        </div>

                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="categoryimage" id="customFile">
                            <label class="custom-file-label" for="customFile" >Choose Category Image</label>
                        </div>
                        <br>
                        <br>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea1">Category Description</label>
                            <textarea class="form-control" name="categorydescription" id="exampleFormControlTextarea1" rows="3"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" id="addproduct01">Add Category</button>
                        <button type="reset" class="btn btn-primary" id="addproduct02">Cancel</button>
                    </form>
                </div>
            </div>
        </section>
        <%@include file="./footer.jsp" %>
    </body>
</html>
