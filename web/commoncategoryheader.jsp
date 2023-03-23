<%@page import="com.oss.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.oss.dao.CategoryDao"%>
<%@page import="com.oss.helper.ConnectionProvider"%>
<div class="container-fluid bg-dark" style="align-items: center; justify-content: center;">
            <ul class="nav bg-dark text-white" style="width: 100%">
            <%
                CategoryDao commoncategorydao = new CategoryDao(ConnectionProvider.getConnection());
                List<Category> commoncats = commoncategorydao.getAllCategory();
                for(Category c : commoncats){
              %>
                <li class="nav-item">
                    <a class="nav-link text-white text-center" href="./ViewProduct.jsp?categoryid=<%=c.getCategoryid()%>"><%=c.getCategorytitle()%></a>
                </li>
                <%
                    }
                %>
            </ul>
        </div>