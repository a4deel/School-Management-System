<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADD-CLASS-PAGE</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="styles/validations.js"></script>
</head>
<script type="text/javascript">

</script>
<%@ page language = "java" import = "java.sql.*" %>

<body style="background-image: url(styles/pics/signup.jpg);">
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
                    <form method="POST" onsubmit="return addClassformValidation()" action="addClass.jsp">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Add Class*</h2>
                        <div id="errors-content">
                            <div id="classNameError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="className" id="className"
                                onkeypress="return alphabetValidation(event);" placeholder="Add Class" autofocus>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Add Class" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewClasses.jsp'; return false;"
                                name="submit" id="submit" class="form-submit" value="Go Back" />
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</body>

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
            
            String className = request.getParameter("className");
            
            Statement st = con.createStatement();
            if(className != null){
                String query = "select count(*) from class_record where class = '" + className + "' ";
                ResultSet rs = st.executeQuery(query);
                rs.next();
                String Countrow = rs.getString(1);
                if(Countrow.equals("0")){
                    int i = st.executeUpdate("insert into class_record (class) values ('" + className + "') ");
                response.sendRedirect("viewClasses.jsp");
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
