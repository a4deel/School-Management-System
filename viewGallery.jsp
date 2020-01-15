<%@ include file = "viewHeader.jsp" %>
<center>
    <div class="wraper" style="width: 72%;
    padding: 0px 20px 10px 10px;
    height: 100%;
    margin: 50px auto;
    background: transparent;
    opacity: 0.9;
    border-radius: 10px;
    box-shadow: 0px 0px 40px black;">
        <div class="row" style="margin-top: 70px;margin-left: -60px;">
            <ul style="margin-top: 20px;">
                <button type="text" class="btn btn-info btn-lg" onclick="window.location.href = './dashboard.jsp';"
                    style="border-radius:30px;">Dashboard</button>
                <% if((name != null) && name.equals("admin")) { %>
                <button type="text" class="btn btn-primary btn-lg" onclick="window.location.href = './addImage.jsp';"
                    style="border-radius:30px;">Add
                    New Image</button>
                <% } else { %>
                <button type="text" class="btn btn-primary btn-lg" disabled style="border-radius:30px;">Add New
                    Image</button>
                <% } %>
                <button type="text" class="btn btn-danger btn-lg" onclick="window.location.href = './logout.jsp';"
                    style="border-radius:30px;">Logout</button>
            </ul>
        </div>


        <div class="row">
            <div class="heading">
                <h1><b><img src="styles/resources/table_icons/document_layout.png"> School Gallery</b></h1>
            </div>



            <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://127.0.0.1/java_test";
                Connection con = DriverManager.getConnection(url, "root", "");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("Select * from gallery");
    
                while (rs.next()) { 
                    String img_id = rs.getString(1);
                    String img_name = rs.getString(2);
                    %>

            <div class="col-md-3" style="margin-bottom:10px;">
                <div class="box" style="padding: 8px;">
                    <a href="./styles/pics/<%= img_name %>"><img src="./styles/pics/<%= img_name %>"></a>
                    <hr>
                    <!-- <td>
                        <a href="#"><button type="submit" class="btn btn-primary"><i
                                    class="glyphicon glyphicon-pencil"></i></button></a>-->
                    <a href="viewGallery.jsp?id=<%=img_id%>"><button type="submit" class="btn btn-danger"><i class=" glyphicon
                            glyphicon-remove"></i></button></a>
                    </td>
                </div>
            </div>
            <% } 
                    rs.close();
                    st.close();
                    con.close();
                }
                catch(Exception e) {
                    out.println(e);
                }
                %>
        </div>
        <div class=" row" style="margin-top: 10px;margin-left: -60px;">
            <ul>
                <button type="text" onclick="window.location.href = './viewNotifications.jsp';"
                    class="btn btn-info btn-lg" style="border-radius:30px;">Previous</button>
                <button type="text" onclick="window.location.href = './dashboard.jsp';" class="btn btn-primary btn-lg"
                    style="border-radius:30px;">Next</button>
            </ul>
        </div>
    </div>
</center>
</body>

</html>

<style>
    .box img {
        width: 200px;
        height: 170px;
        border-radius: 10px;
    }

    .header_logo img {
        width: 125%;
        margin-top: 25px;
        margin-left: 20px;
        float: left;
    }

    .box {
        margin-top: 10px;
        padding: 5px;
        background: white;
        line-height: 1.5em;
        border-radius: 5px;
        float: left;
        width: 223px;
    }

    .btn {
        border-radius: 30px;
    }

    .footer {
        margin-top: 10px;
        margin-left: -60px;
    }

    .header {
        margin-top: 30px;
        float: left;
        margin-left: 60px;
    }
</style>
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
                String path = "C:/apache-tomcat-8.5.40/webapps/School-Management-System/styles/pics/"+rs.getString(1);
                out.println(path);
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
