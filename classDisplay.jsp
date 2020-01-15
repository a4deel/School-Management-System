<%@ include file = "viewHeader.jsp" %>
<center>
    <div class="wraper" style="width: 70%;
    height: 100%;
    margin: 50px auto;
    background: lightgrey;
    opacity: 0.9;
    border-radius: 10px;
    box-shadow: 0px 0px 40px black;">
        <div class="row" style="margin-top: 70px;margin-left: -60px;">
            <ul style="margin-top: 20px;">
                <button type="text" class="btn btn-info btn-lg" onclick="window.location.href = './dashboard.jsp';"
                    style="border-radius:30px;">Dashboard</button>
                <%  if((name != null) && name.equals("admin")) { %>
                <button type="text" class="btn btn-primary btn-lg" onclick="window.location.href = './addClass.html';"
                    style="border-radius:30px;">Add
                    New Class</button>
                <% } else { %>
                <button type="text" class="btn btn-primary btn-lg" disabled style=" border-radius:30px;">Add New
                    Class</button>
                <% } %>
                <button type="text" class="btn btn-danger btn-lg" onclick="window.location.href = './loginPage.html';"
                    style="border-radius:30px;">Logout</button>
            </ul>
        </div>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://127.0.0.1/java_test";
                Connection con = DriverManager.getConnection(url, "root", "");
                String className = request.getParameter("class");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("Select * from student_record where class = '" + className + "' "); %>
        <div class="row">
            <div class="heading">
                <h1><b><img src="styles/resources/table_icons/group_add.png"> Record of <%= className %> Class Students
                    </b>
                </h1>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <table id="mytable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Roll-Number</th>
                            <th>Class</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <% while (rs.next()) { %>
                            <td style="font-size:19px"><%= rs.getInt(1) %></td>
                            <td style="font-size:19px"><%= rs.getString(2) %></td>
                            <td style="font-size:19px"><%= rs.getString(3) %></a></td>
                            <td style="font-size:19px"><%= rs.getString(4) %></td>
                            <td style="font-size:19px"><%= rs.getString(5) %></td>
                            <td style="font-size:19px"><%= rs.getString(6) %></td>
                            <td>
                                <%  if((name != null) && name.equals("admin")) { %>
                                <a href="editStudent.jsp?id=<%= rs.getInt(1) %>"><button type="button"
                                        class="btn btn-primary" style="border-radius:30px;"><i
                                            class="glyphicon glyphicon-pencil"></i></button></a>
                                <a href="deleteStudent.jsp?id=<%= rs.getInt(1) %>"><button type="button"
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
                <button type="text" onclick="window.location.href = './viewClasses.jsp';" class="btn btn-info btn-lg"
                    style="border-radius:30px;">Go Back</button>
            </ul>
        </div>
    </div>
</center>
</body>

</html>
