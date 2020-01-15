<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADD-TIMETABLE-PAGE</title>
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
                    <form method="POST" id="signup-form" class="signup-form" onsubmit="return addTimeformValidation();"
                        action="addTimeTable.jsp">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Add Time Table*</h2>
                        <div id="errors-content">
                            <div id="oneError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="one" id="one"
                                placeholder="Lecture 1 Subject/Teacher" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="twoError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="two" id="two"
                                placeholder="Lecture 2 Subject/Teacher" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="threeError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="three" id="three"
                                placeholder="Lecture 3 Subject/Teacher" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="fourError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="four" id="four"
                                placeholder="Lecture 4 Subject/Teacher" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="fiveError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="five" id="five"
                                placeholder="Lecture 5 Subject/Teacher" autofocus>
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
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Save Record" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewTimeTable.jsp';" name="submit"
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
        
        String one = request.getParameter("one");
        String two = request.getParameter("two");
        String three = request.getParameter("three");
        String four = request.getParameter("four");
        String five = request.getParameter("five");
        String className = request.getParameter("className");

        Statement st = con.createStatement();
        if(one != null && two != null && three != null && four != null && five != null && className != null) {
            String query = "select count(*) from timetable_record where class = '" + className + "' ";
            ResultSet rs = st.executeQuery(query);
            rs.next();
            String Countrow = rs.getString(1);
            if(Countrow.equals("0")){
                int i = st.executeUpdate("insert into timetable_record (period_1,period_2,period_3,period_4,period_5,class) values ('" + one + "' , '" + two + "' , '" + three + "' , '" + four + "' , '" + five + "' , '" + className + "') ");
            response.sendRedirect("viewTimeTable.jsp");
            } else {
                response.sendRedirect("addTimeTable.jsp");
            }
        }
        
        st.close();
        con.close();

    } catch (Exception e) {
        out.println(e);
}
%>
