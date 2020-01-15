<%@ page language = "java" import = "java.sql.*" %>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://127.0.0.1/java_test";
        Connection con = DriverManager.getConnection(url, "root", "");
        
        String id = request.getParameter("id");
        
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from class_record where id = '" + id + "' ");

        while (rs.next()) {%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>EDIT-CLASS-PAGE</title>
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
                    <form method="POST" onsubmit="return addClassformValidation()" action="editClass.jsp">
                        <h2 class="form-title">Update Class</h2>
                        <input type="hidden" name="id" value="<%= rs.getString(1) %>">
                        <div id="errors-content">
                            <div id="classNameError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="className" id="className"
                                onkeypress="return alphabetValidation(event);" value=" <%= rs.getString(2) %>"
                                autofocus>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Update Class" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewClasses.jsp'; return false;"
                                name="submit" id="submit" class="form-submit" value="Go Back" />
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
            String className = request.getParameter("className");
            
            Statement st = con.createStatement();
            if(className != null){
                int rs = st.executeUpdate("update class_record set class = '" + className + "' where id = '" + id + "' ");
                if (rs == 1) {
                    response.sendRedirect("viewClasses.jsp");
                } else {
                    response.sendRedirect("error.html");
                }
            }
            
            st.close();
            con.close();

        } catch (Exception e) {
            out.println(e);
        }%>
