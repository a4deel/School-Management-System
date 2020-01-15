<html>

<head>
    <title>STUDENT-LOGIN-PAGE</title>
</head>

<%@ page language = "java" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>

<body>

    <%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/java_test";
            Connection con = DriverManager.getConnection(url, "root", "");
            
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * from login_info where name = '" + name + "' and password = '" + password + "' ");

            if (rs.next()) {
                session.setAttribute("name",name);
                response.sendRedirect("dashboard.jsp");

            } else {
                session.setAttribute("errorMessage", "*Invalid user or password");
                response.sendRedirect("./loginPage.jsp");        
            }

            
            st.close();
            con.close();

        } catch (Exception e) {
            out.println(e);
    }
%>

</body>

</html>
