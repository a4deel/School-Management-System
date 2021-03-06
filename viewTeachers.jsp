<%@ include file = "viewHeader.jsp" %>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        Statement st = con.createStatement();
        String id = request.getParameter("id");
        if(id != null) {
            int rs = st.executeUpdate("delete from teacher_record where id = '" + id + "' ");
             if (rs > 0) {
            response.sendRedirect("viewTeachers.jsp");

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
    <div class="wraper" style="width: 80%;
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
                <button type="text" class="btn btn-primary btn-lg" onclick="window.location.href = './addTeacher.jsp';"
                    style="border-radius:30px;">Add
                    New Teacher</button>
                <button type="text" class="btn btn-success btn-lg"
                    onclick="window.location.href = './exportTeacher.jsp';" style="border-radius:30px;">Export Excel
                    File</button>
                <% } else { %>
                <button type="text" class="btn btn-primary btn-lg" disabled style=" border-radius:30px;">Add New
                    Teacher</button>
                <button type="text" class="btn btn-success btn-lg" disabled style="border-radius:30px;">Export Excel
                    File</button>
                <% } %>
                <button type="text" class="btn btn-danger btn-lg" onclick="window.location.href = './logout.jsp';"
                    style="border-radius:30px;">Logout</button>
            </ul>
        </div>
        <div class="main">
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <form method="POST" action="viewTeachers.jsp">
                            <h2 class="form-title"><strong>Search Teacher</strong></h2>
                            <div class="form-group">
                                <input type="text" class="form-input" name="name" id="name" placeholder="Search name"
                                    value="<% 
                                        if(request.getParameter("name") != null) {
                                            out.println(request.getParameter("name")); 
                                        }
                                    %>" autofocus>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" id="submit" class="form-submit"
                                    value="Search Teacher" />
                            </div>
                        </form>
                    </div>
                </div>
            </section>
        </div>
        <div class="row">
            <div class="heading">
                <h1><b><img src="styles/resources/table_icons/blackboard_drawing.png"> Teachers Record</b></h1>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <table id="mytable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con = DriverManager.getConnection(url, "root", "");
                                Statement st = con.createStatement();
                                String teacher_name = request.getParameter("name");
                                String query = "Select * from teacher_record";
                                if(teacher_name != "" && teacher_name != null ){
                                    query+= " where name = '"+teacher_name+"'";
                                } 
                                ResultSet rs = st.executeQuery(query);
                    
                                while (rs.next()) { %>
                        <tr>
                            <td style="font-size:19px"><%= rs.getInt(1) %></td>
                            <td style="font-size:19px"><a href="#" class="link"
                                    style="text-decoration: none;"><%= rs.getString(2) %></a></td>
                            <td style="font-size:19px"><%= rs.getString(3) %></td>
                            <td style="font-size:19px"><%= rs.getString(4) %></td>
                            <td style="font-size:19px"><%= rs.getString(5) %></td>
                            <td>
                                <% if((name != null) && name.equals("admin")) { %>
                                <a href="editTeacher.jsp?id=<%= rs.getInt(1) %>"><button type="button"
                                        class="btn btn-primary" style="border-radius:30px;"><i
                                            class="glyphicon glyphicon-pencil"></i></button></a>
                                <a href="viewTeachers.jsp?id=<%= rs.getInt(1) %>"><button type="button"
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
                                st.close();
                                con.close();
                            }
                            catch(Exception e) {
                                out.println(e);
                            }
                            %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row" style="margin-top: 10px;margin-left: -60px;">
            <ul>
                <button type="text" onclick="window.location.href = './viewStudents.jsp';" class="btn btn-info btn-lg"
                    style="border-radius:30px;">Previous</button>
                <button type="text" onclick="window.location.href = './viewUsers.jsp';" class="btn btn-primary btn-lg"
                    style="border-radius:30px;">Next</button>
            </ul>
        </div>
    </div>
</center>
</body>

</html>
<script>
    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
