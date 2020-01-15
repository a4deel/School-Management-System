<%@ page language = "java" import = "java.sql.*,java.util.*,java.io.*" %>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement st = con.createStatement();
        String img_id = request.getParameter("id");
        ResultSet rs = st.executeQuery("select image from gallery where id = '" + img_id + "' ");
        if(rs.next()) {
            if(img_id != null) {
                Statement st1 = con.createStatement();
                int rs1 = st1.executeUpdate("delete from gallery where id = '" + img_id + "' ");
                String path = "F:/Study/5th-semester/Web-Engineering/apache-tomcat-8.5.40/webapps/java_project/styles/pics/"+rs.getString(1);
                File delete_img = new File(path);
                if (rs1 > 0 && delete_img.delete()) {
                    response.sendRedirect("viewGallery.jsp");
                } else {
                    response.sendRedirect("error.html");
                }
            }
        }
        rs.close();
        st.close();
        con.close();

        } catch (Exception e) {
            out.println(e);
    }
%>
