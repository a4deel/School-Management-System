<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADD-NOTIFICATION-PAGE</title>
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
                    <form method="POST" onsubmit="return addNotifformValidation()" action="addNotification.jsp">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Add Notification*</h2>

                        <div id="errors-content">
                            <div id="titleError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="title" id="title"
                                placeholder="Notification Title" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="detailError"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="detail" id="detail"
                                placeholder="Notification Detail" autofocus>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit"
                                value="Add Notification" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewNotifications.jsp';"
                                name="submit" id="submit" class="form-submit" value="Go Back" />
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</body>

</html>

<%
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/java_test";
            Connection con = DriverManager.getConnection(url, "root", "");
            
            String title = request.getParameter("title");
            String detail = request.getParameter("detail");
            String uname = name;
           
            Statement st = con.createStatement();
            if(title != null && detail != null && uname != null) {
                String query = "select count(*) from notification_record where title = '" + title + "' ";
                ResultSet rs = st.executeQuery(query);
                rs.next();
                String Countrow = rs.getString(1);
                if(Countrow.equals("0")){
                    int i = st.executeUpdate("insert into notification_record (title,detail,name) values ('" + title + "' , '" + detail + "' , '" + uname + "') ");
                    response.sendRedirect("viewNotifications.jsp");
                } else {
                    response.sendRedirect("addNotification.jsp");
                }
            } 
        st.close();
        con.close();

        } catch (Exception e) {
            out.println(e);
    }
    %>
