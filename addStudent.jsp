<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADD-STUDENT-PAGE</title>
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
                    <form method="POST" onsubmit="return addStudentformValidation()" action="addStudent.jsp">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Add Student*</h2>
                        <div id="errors-content">
                            <div id="nameError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name"
                                onkeypress="return alphabetValidation(event);" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="rollError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="roll" id="roll" placeholder="Your Roll-Number"
                                autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="classNameError"></div>
                        </div>
                        <div class="form-group">
                            <select name="className" id="className" class="form-input" autofocus>
                                <option id="className" value="">Select Class</option>
                                <%
                                try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con = DriverManager.getConnection(url, "root", "");
                                Statement st = con.createStatement();
                                String query = "select * from class_record ";
                                ResultSet rs = st.executeQuery(query);
                                while(rs.next()) { %>
                                <option id="className" value="<%= rs.getString(2) %>"><%= rs.getString(2) %></option>
                                <%}
                                st.close();
                                con.close();

                                } catch (Exception e) {
                                out.println(e);
                                }%>
                            </select>
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
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Add Student" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewStudents.jsp'; return false;"
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
;

<%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/java_test";
            Connection con = DriverManager.getConnection(url, "root", "");
            
            String uname = request.getParameter("name");
            String roll = request.getParameter("roll");
            String className = request.getParameter("className");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            Statement st = con.createStatement();
            if(uname != null && roll != null && className != null && phone != null && address != null) {
            String query = "select count(*) from student_record where roll = '" + roll + "' ";
            ResultSet rs = st.executeQuery(query);
            rs.next();
            String Countrow = rs.getString(1);
            if(Countrow.equals("0")){
                int i = st.executeUpdate("insert into student_record (name,roll,class,phone,address) values ('" + uname + "' , '" + roll + "' , '" + className + "' , '" + phone + "' , '" + address + "') ");
                response.sendRedirect("viewStudents.jsp");
            } else {
                response.sendRedirect("addStudent.jsp");
            }
        }
            
            st.close();
            con.close();

        } catch (Exception e) {
            out.println(e);
        }
    %>
