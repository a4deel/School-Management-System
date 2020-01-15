<%@ page language = "java" import = "java.sql.*" %>
<html>
<title>REGISTER-USER-PAGE</title>

<head>


</head>

<body>
    <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://127.0.0.1/java_test";
                Connection con = DriverManager.getConnection(url, "root", "");
                
                String name = request.getParameter("name");
                String password = request.getParameter("password");
                Statement st = con.createStatement();
                String query = "select count(*) from login_info where name = '" + name + "' ";
                ResultSet rs = st.executeQuery(query);
                rs.next();
                String row = rs.getString(1);
                if(row.equals("0")){
                    int i = st.executeUpdate("insert into login_info (name,password) values ('" + name + "' , '" + password + "') ");
                    response.sendRedirect("loginPage.jsp");
                } else {
                    session.setAttribute("errorMessage", "*Username Already Exists");
                    response.sendRedirect("./registerPage.jsp");
                }
                    
                st.close();
                con.close();
        
                } catch (Exception e) {
                    out.println(e);
            }
        %>

</body>

</html>
