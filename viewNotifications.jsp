<%@ include file = "viewHeader.jsp" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement st = con.createStatement();
        String id = request.getParameter("id");
        if(id != null) {
            int rs = st.executeUpdate("delete from notification_record where id = '" + id + "' ");
             if (rs > 0) {
            response.sendRedirect("viewNotifications.jsp");

        } else {
            response.sendRedirect("error.html");
        }
        }
        
        st.close();
        con.close();

        } catch (Exception e) {
            out.println(e);
    }
%>
<link rel="stylesheet" href="styles/test.css">
<div class="wraper" style="width: 70%;
height: auto;
margin: 50px auto;
background: lightgrey;
opacity: 0.9;
border-radius: 10px;
box-shadow: 0px 0px 40px black;">
    <center>
        <div class="row" style="margin-top: 70px;margin-left: -60px;">
            <ul style="margin-top: 20px;">
                <button type="text" class="btn btn-info btn-lg" onclick="window.location.href = './dashboard.jsp';"
                    style="border-radius:30px;">Dashboard</button>
                <% if((name != null) && name.equals("admin")) { %>
                <button type="text" class="btn btn-primary btn-lg"
                    onclick="window.location.href = './addNotification.jsp';" style="border-radius:30px;">Add New
                    Notification</button>
                <% } else { %>
                <button type="text" class="btn btn-primary btn-lg" disabled style=" border-radius:30px;">Add New
                    Notification</button>
                <% } %>
                <button type="text" class="btn btn-danger btn-lg" onclick="window.location.href = './logout.jsp';"
                    style="border-radius:30px;">Logout</button>
            </ul>
        </div>
        <div class="row">
            <div class="heading" style="margin-top: 20px;">
                <h1><b><img src="styles/resources/table_icons/clipboard_empty.png"> Notice Board</b></h1>
            </div>
        </div>
    </center>
    <div class="col-8-xxxl col-12" style="margin-top: 20px;">
        <div class="card height-auto">
            <div class="card-body">
                <div class="notice-board-wrap">
                    <div class="notice-list">
                        <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                            String url = "jdbc:mysql://127.0.0.1/java_test";
                            Connection con = DriverManager.getConnection(url, "root", "");
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("Select * from notification_record order by id desc");
                            while (rs.next()) { %>
                        <div class="post-date bg-skyblue"><%String date = rs.getString(5);
                            out.print(date); %></div>
                        <h3><strong><%=rs.getString(2) %></strong></h3>
                        <h6 class="notice-title"><a href="#"><%=rs.getString(3) %></a></h6>
                        <div class="entry-meta"><%=rs.getString(4) %> / <span>5 min ago</span></div>
                        <% if((name != null) && name.equals("admin")) { %>
                        <div class="marks" style="float: right;margin-top: -71px;">
                            <a href="editNotification.jsp?id=<%= rs.getString(1) %>"><button type="button"
                                    class="btn btn-primary" style="border-radius:30px;"><i
                                        class="glyphicon glyphicon-pencil"></i></button></a>
                            <a href="viewNotifications.jsp?id=<%= rs.getString(1) %>"><button type="button"
                                    class="btn btn-danger" style="border-radius:30px;"><i
                                        class="glyphicon glyphicon-remove"></i></button></a>
                        </div>
                        <hr>
                        <% } else { %>
                        <div class="marks" style="float: right;margin-top: -71px;">
                            <button type="button" class="btn btn-primary" disabled style="border-radius:30px;"><i
                                    class="glyphicon glyphicon-pencil"></i></button></a>
                            <button type="button" class="btn btn-danger" disabled style="border-radius:30px;"><i
                                    class="glyphicon glyphicon-remove"></i></button></a>
                        </div>
                        <% } %>
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
                </div>
            </div>
        </div>
    </div>
    <center>
        <div class=" row" style="padding-bottom: 10px;">
            <ul>
                <button type="text" onclick="window.location.href = './viewTimeTable.jsp';" class="btn btn-info btn-lg"
                    style="border-radius:30px;">Previous</button>
                <button type="text" onclick="window.location.href = './viewGallery.jsp';" class="btn btn-primary btn-lg"
                    style="border-radius:30px;">Next</button>
            </ul>
        </div>
    </center>
</div>
</body>

</html>
