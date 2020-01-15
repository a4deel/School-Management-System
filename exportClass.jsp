<html>

<head>
    <title>EXPORT-CLASS-PAGE</title>
</head>

<%@ page language = "java" import = "java.sql.Statement,java.io.*,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>

<body>


    <%
            String name = (String)session.getAttribute("name");
            if (name == null) {
                response.sendRedirect("loginPage.jsp");
            }
        %>
    <%
        String file = "C:/apache-tomcat-8.5.40/webapps/School-Management-System/styles/Exported_Files/exportedClasses.csv";
        try {
            FileWriter cout = new FileWriter(file);
            
            cout.append("Id");
            cout.append(',');
            cout.append("Class");
            cout.append('\n');
            
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/java_test";
            Connection con = DriverManager.getConnection(url, "root", "");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from class_record");
            boolean flag = false;
            while(rs.next()) {
                cout.append(rs.getString(1));
                cout.append(',');
                cout.append(rs.getString(2));
                cout.append('\n');
                flag = true;
            }
            if(flag) {
                response.sendRedirect("viewClasses.jsp");
            } else {
                response.sendRedirect("error.html");
            }
            out.flush();
            cout.close();
            st.close();
            con.close();
        } catch (Exception e) {
            out.println(e);
        }%>

</body>

</html>
