<html>

<head>
    <title>LOGOUT-PAGE</title>
</head>

<%@ page language = "java" import = "java.sql.*" %>

<body>

    <% 
    session.invalidate(); 
    response.sendRedirect("loginPage.jsp"); 
    %>
</body>

</html>
