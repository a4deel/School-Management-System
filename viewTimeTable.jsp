<%@ include file = "viewHeader.jsp" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement st = con.createStatement();
        String id = request.getParameter("id");
        if(id != null) {
            int rs = st.executeUpdate("delete from timetable_record where id = '" + id + "' ");
             if (rs > 0) {
            response.sendRedirect("viewTimeTable.jsp");

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
<center>
    <div class="wraper" style="width: 90%;
    height: auto;
    margin: 50px auto;
    background: lightgrey;
    opacity: 0.9;
    border-radius: 10px;
    box-shadow: 0px 0px 40px black;">
        <div class="row" style="margin-top: 70px;margin-left: -60px;">
            <ul style="margin-top: 20px;">
                <button type="text" class="btn btn-info btn-lg" onclick="window.location.href = './dashboard.jsp';"
                    style="border-radius:30px;">Dashboard</button>
                <% if((name != null) && name.equals("admin")) { %>
                <button type="text" class="btn btn-primary btn-lg"
                    onclick="window.location.href = './addTimeTable.jsp';" style="border-radius:30px;">Add New Time
                    Table</button>
                <button type="text" class="btn btn-success btn-lg"
                    onclick="window.location.href = './exportTimeTable.jsp';" style="border-radius:30px;">Export Excel
                    File</button>
                <% } else { %>
                <button type="text" class="btn btn-primary btn-lg" disabled style=" border-radius:30px;">Add New
                    Time Table</button>
                <button type="text" class="btn btn-success btn-lg" disabled style="border-radius:30px;">Export Excel
                    File</button>
                <% } %>
                <button type="text" class="btn btn-danger btn-lg" onclick="window.location.href = './logout.jsp';"
                    style="border-radius:30px;">Logout</button>
            </ul>
        </div>

        <div class="row">
            <div class="heading">
                <h1><b><img src="styles/resources/table_icons/data_chooser.png"> Time Table Information</b></h1>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <table id="mytable" class="table table-striped">
                    <thead>
                        <tr>
                            <th style="font-size:20px;"></th>
                            <th style="font-size:17px;">08:30 AM-09:15 AM</th>
                            <th style="font-size:17px;">09:15 AM-10:00 AM</th>
                            <th style="font-size:17px;">10:00 AM-10:45 AM</th>
                            <th style="font-size:17px;">10:45 AM-11:30 AM</th>
                            <th style="font-size:17px;">11:30 AM-12:15 PM</th>
                            <th style="font-size:17px;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con1 = DriverManager.getConnection(url, "root", "");
                                Statement st1 = con1.createStatement();
                                ResultSet rs = st1.executeQuery("Select * from timetable_record");
                            while (rs.next()) { %>
                        <tr>
                            <th style="font-size:20px;">Class <%= rs.getString(7) %></th>
                            <td style="font-size:20px;"><%= rs.getString(2) %></td>
                            <td style="font-size:20px;"><%= rs.getString(3) %></td>
                            <td style="font-size:20px;"><%= rs.getString(4) %></td>
                            <td style="font-size:20px;"><%= rs.getString(5) %></td>
                            <td style="font-size:20px;"><%= rs.getString(6) %></td>
                            <td>
                                <% if((name != null) && name.equals("admin")) { %>
                                <a href="editTimeTable.jsp?id=<%= rs.getInt(1) %>"><button type="button"
                                        class="btn btn-primary" style="border-radius:30px;"><i
                                            class="glyphicon glyphicon-pencil"></i></button></a>
                                <a href="viewTimeTable.jsp?id=<%= rs.getInt(1) %>"><button type="button"
                                        class="btn btn-danger" style="border-radius:30px;"><i
                                            class="glyphicon glyphicon-remove"></i></button></a>
                                <% } else { %>
                                <button type="button" class="btn btn-primary" disabled style="border-radius:30px;"><i
                                        class="glyphicon glyphicon-pencil"></i></button></a>
                                <button type="button" class="btn btn-danger" disabled style="border-radius:30px;"><i
                                        class="glyphicon glyphicon-remove"></i></button></a>
                                <% } %>
                            </td>
                        </tr>
                        <% } 
                            rs.close();
                            st1.close();
                            con1.close();
                        }
                        catch(Exception e) {
                            out.println(e);
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div class=" row" style="margin-top: 10px;margin-left: -60px;">
            <ul>
                <button type="text" onclick="window.location.href = './viewClasses.jsp';" class="btn btn-info btn-lg"
                    style="border-radius:30px;">Previous</button>
                <button type="text" onclick="window.location.href = './viewNotifications.jsp';"
                    class="btn btn-primary btn-lg" style="border-radius:30px;">Next</button>
            </ul>
        </div>
    </div>
</center>
</body>

</html>
