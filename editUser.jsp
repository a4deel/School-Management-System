<%@ page language = "java" import = "java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        
        String id = request.getParameter("id");
        
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from login_info where id = '" + id + "' ");

        while (rs.next()) {%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EDIT-USER-PAGE</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="styles/validations.js"></script>
</head>

<body style="background:url(styles/pics/signup.jpg);background-size:cover;">
    <%
        String name = (String)session.getAttribute("name");
        if (name == null) {
            response.sendRedirect("loginPage.jsp");
        }
    %>
    <div class="main">
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" onsubmit="return registerformValidation()" class="signup-form"
                        action="editUser.jsp">
                        <h2 class="form-title">Update User</h2>
                        <input type="hidden" name="id" value="<%= rs.getString(1) %>">
                        <div id="errors-content">
                            <div id="nameError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" value="<%= rs.getString(2) %>"
                                onkeypress="return alphabetValidation(event);" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="passwordError"></div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password"
                                value="<%= rs.getString(3) %>" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="confirmPasswordError"></div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="confirm_password" id="confirm_password"
                                value="<%= rs.getString(3) %>" autofocus>
                        </div>
                        <div class=" form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Update User" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewUsers.jsp';" name="submit"
                                id="submit" class="form-submit" value="Go Back" />
                        </div>
                    </form>
                    <% 
                        }
                        con.close();
                    }catch(Exception e) {
                        out.println(e);
                    }
                    %>
                </div>
            </div>
        </section>
    </div>

</html>
<script>
    $(function () {
        $('input[type="text"]').change(function () {
            this.value = $.trim(this.value);
        });
    });
</script>


<%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/java_test";
            Connection con = DriverManager.getConnection(url, "root", "");
            
            String id = request.getParameter("id");
            String uname = request.getParameter("name");
            String password = request.getParameter("password");
            
            Statement st = con.createStatement();
            if(uname != null && password != null) {
                int rs = st.executeUpdate("update login_info set name = '" + uname + "' , password = '" + password
                    + "' where id = '" + id + "' ");
                if (rs == 1) {
                    response.sendRedirect("viewUsers.jsp");
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
