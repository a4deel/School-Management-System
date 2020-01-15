<html>

<head>
    <title>UPLOAD-IMAGE-PAGE</title>
</head>

<%@ page import="java.sql.*,javax.servlet.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<body>

    <%
        String name = (String)session.getAttribute("name");
        if (name == null) {
            response.sendRedirect("loginPage.jsp");
        }
    %>

    <%
        String image = "";
        String path = "F:/Study/5th-semester/Web-Engineering/apache-tomcat-8.5.40/webapps/java_project/styles/pics";
        MultipartRequest req = new MultipartRequest(request,path);
        Enumeration fname = req.getFileNames();
        
        while(fname.hasMoreElements()) {
            String next = (String)fname.nextElement();
            image =  req.getFilesystemName(next);
        }
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        
        Statement st = con.createStatement();

        String query = "select count(*) from gallery where image = '" + image + "' ";
        ResultSet rs = st.executeQuery(query);
        rs.next();
        String Countrow = rs.getString(1);
        if(Countrow.equals("0")){
            int n = st.executeUpdate("insert into gallery (image) values ('" + image + "')");
            if (n > 0) {
                response.sendRedirect("./viewGallery.jsp");
            }
            else {
            response.sendRedirect("error.html");
            }
        }
    
    %>

</body>

</html>
