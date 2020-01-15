<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADD-TEACHER-PAGE</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="styles/validations.js"></script>
</head>
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
                    <form method="POST" onsubmit="return addTeacherformValidation()" action="addTeacher.jsp">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Add Teacher*</h2>
                        <div id="errors-content">
                            <div id="nameError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name"
                                onkeypress="return alphabetValidation(event);" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="ageError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="age" id="age" placeholder="Your Age" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="phoneError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="phone" id="phone" placeholder="Your Phone"
                                onkeypress="return numbersValidation(event);" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="addressError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="address" id="address" placeholder="Your Address"
                                autofocus>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Add Teacher" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewTeachers.jsp';" name="submit"
                                id="submit" class="form-submit" value="Go Back" />
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
            
            String uname = request.getParameter("name");
            String age = request.getParameter("age");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            
            Statement st = con.createStatement();
            if(uname != null && age != null && phone != null && address != null) {
            String query = "select count(*) from teacher_record where name = '" + uname + "' ";
            ResultSet rs = st.executeQuery(query);
            rs.next();
            String Countrow = rs.getString(1);
            if(Countrow.equals("0")){
                int i = st.executeUpdate("insert into teacher_record (name,age,phone,address) values ('" + uname + "' , '" + age + "' , '" + phone + "' , '" + address + "') ");
                response.sendRedirect("viewTeachers.jsp");
            } else {
                response.sendRedirect("addTeacher.jsp");
            }
        }
            
        st.close();
        con.close();

        } catch (Exception e) {
            out.println(e);
    }
    %>
