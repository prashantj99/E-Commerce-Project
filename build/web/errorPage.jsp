 <!--Page: errorPage-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
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
        <title>Online Shopping Site | Error 404 Page</title>
    </head>
    </head>
    <body>
        <div class="container text-center">
            <img src="./images/404-error.png" width="30%" height="30%">
            <h4 class="display-3">Sorry! Something went wrong ...</h4>
            <h5 style="text-transform: capitalize;"><%=
                exception
                %>
            </h5>
        </div>
    </body>
</html>
