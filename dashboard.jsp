<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="styles/assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="styles/assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>Al-Hammd-School Management System</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    <link href="styles/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="styles/assets/css/paper-dashboard.css" rel="stylesheet" />
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="styles/assets/css/themify-icons.css" rel="stylesheet">
</head>
<%@ page language = "java" import = "java.sql.*" %>
<style>
    *.icon-blue {
        color: #0088cc
    }

    *.icon-grey {
        color: grey
    }

    i {
        width: 100px;
        text-align: center;
        vertical-align: middle;
        position: relative;
    }

    .badge:after {
        content: "100";
        position: absolute;
        background: rgba(0, 0, 255, 1);
        height: 2rem;
        top: 1rem;
        right: 1.5rem;
        width: 2rem;
        text-align: center;
        line-height: 2rem;
        ;
        font-size: 1rem;
        border-radius: 50%;
        color: white;
        border: 1px solid blue;
    }
</style>

<body>
    <%
        String name = (String)session.getAttribute("name");
        if (name == null) {
            response.sendRedirect("loginPage.jsp");
        }
    %>
    <div class="wrapper">
        <div class="sidebar" data-background-color="black" data-active-color="danger">
            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="dashboard.jsp"><img src="styles/pics/logo.jpg" width="50"
                            style="border-radius:10px;margin-left:80px;">
                        <a href="dashboard.jsp" class="simple-text"> Al-Hammd-School</a>
                </div>
                <ul class="nav">
                    <li class="active">
                        <a href="dashboard.jsp">
                            <button class="btn btn-danger" type="button"><i class="ti-dashboard"></i>Dashboard</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewStudents.jsp">
                            <button class="btn btn-success" type="button"><i class="ti-user"></i>Students</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewTeachers.jsp">
                            <button class="btn btn-success" type="button"><i class="ti-id-badge"></i>Teachers</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewUsers.jsp">
                            <button class="btn btn-success" type="button"><i class="ti-user"></i>Users</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewClasses.jsp">
                            <button class="btn btn-success" type="button"><i class="ti-crown"></i>Classes</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewTimeTable.jsp">
                            <button class="btn btn-success" type="button"><i
                                    class="ti-layers-alt"></i>TimeTable</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewNotifications.jsp">
                            <button class="btn btn-success" type="button"><i
                                    class="ti-clipboard"></i>Notifications</button>
                        </a>
                    </li>
                    <li>
                        <a href="viewGallery.jsp">
                            <button class="btn btn-success" type="button"><i class="ti-image"></i>Gallery</button>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <div class="main-panel" style="background:url(styles/pics/signup.jpg);background-size:cover;">
            <nav class="navbar navbar-default" style="background:url(styles/pics/signup.jpg);background-size:cover;">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar bar1"></span>
                            <span class="icon-bar bar2"></span>
                            <span class="icon-bar bar3"></span>
                        </button>
                        <a href="dashboard.jsp">
                            <button class="btn btn-danger active" style="font-size:20px;color:white;">Al-Hammd-Grammar
                                School</button></a>
                        <a href=""><i class="fa fa-envelope fa-5x fa-border icon-grey badge"></i></a>
                        <button class="btn btn-danger active" onclick="window.location.href = './logout.jsp';"
                            style="font-size:20px;color:white;margin-left: 600px;">Logout</button>
                    </div>
                </div>
            </nav>
            <div class="content">
                <div class="container-fluid">
                    <div class="alert">
                        <% if((name != null) && name.equals("admin")) { %>
                        <h1 class="super-size">
                            <center><a href="dashboard.jsp"><button class="btn btn-info active"
                                        style="font-size:40px;color:white;"><%=session.getAttribute("name")%>
                                        Wellcome To Dashboard</button></a></center>
                        </h1>
                        <h1 class="super-size">
                            <center><a href="dashboard.jsp"><button class="btn btn-info active"
                                        style="font-size:40px;color:white;">
                                        Admin can access Every Feature Here</button></a></center>
                        </h1>
                        <%} else { %>
                        <h1 class="super-size">
                            <center><a href="dashboard.jsp"><button class="btn btn-info active"
                                        style="font-size:40px;color:white;"><%=session.getAttribute("name")%>
                                        Wellcome To Dashboard</button></a></center>
                        </h1>
                        <h1 class="super-size">
                            <center><a href="dashboard.jsp"><button class="btn btn-info active"
                                        style="font-size:40px;color:white;">
                                        Simple Users cannot access Every Feature</button></a></center>
                        </h1>
                        <%}%>

                    </div>
                    <div class="row">
                        <div class="col-lg-3 col-sm-6">
                            <div class="card">
                                <div class="content">
                                    <div class="row">
                                        <div class="col-xs-5">
                                            <div class="icon-big icon-warning text-center">
                                                <i class="ti-user"></i>
                                            </div>
                                        </div>
                                        <div class="col-xs-7">
                                            <div class="numbers">
                            <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con = DriverManager.getConnection(url, "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select count(*) from student_record");
                                while (rs.next()) {
                            %>
                        <p><strong>Students</strong></p>
                        <%= rs.getString(1) %>
                        <% } 
                            rs.close();
                            st.close();
                            con.close();
                        } catch(Exception e) {
                        out.println(e);
                        }
                    %>
                    </div>
                </div>
            </div>
            <hr />
            <a href="viewStudents.jsp">
                <div class="footer">
                    <div class="stats">
                        <i class="ti-arrow-right"></i>View
                    </div>
                </div>
            </a>
        </div>
    </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="content">
                <div class="row">
                    <div class="col-xs-5">
                        <div class="icon-big icon-info text-center">
                            <i class="ti-id-badge"></i>
                        </div>
                    </div>
                    <div class="col-xs-7">
                        <div class="numbers">
                            <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con = DriverManager.getConnection(url, "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select count(*) from teacher_record");
                                while (rs.next()) {
                            %>
                            <p><strong>Teachers</strong></p>
                            <%= rs.getString(1) %>
                            <% } 
                                rs.close();
                                st.close();
                                con.close();
                            } catch(Exception e) {
                            out.println(e);
                            }
                        %>
                        </div>
                    </div>
                </div>
                <hr />
                <a href="viewTeachers.jsp">
                    <div class="footer">
                        <div class="stats">
                            <i class="ti-arrow-right"></i>View
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="content">
                <div class="row">
                    <div class="col-xs-5">
                        <div class="icon-big icon-warning text-center">
                            <i class="ti-user"></i>
                        </div>
                    </div>
                    <div class="col-xs-7">
                        <div class="numbers">
                            <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con = DriverManager.getConnection(url, "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select count(*) from login_info");
                                while (rs.next()) {
                            %>
                            <p><strong>Users</strong></p>
                            <%= rs.getString(1) %>
                            <% } 
                                rs.close();
                                st.close();
                                con.close();
                            } catch(Exception e) {
                            out.println(e);
                            }
                        %>
                        </div>
                    </div>
                </div>
                <hr />
                <a href="viewUsers.jsp">
                    <div class="footer">
                        <div class="stats">
                            <i class="ti-arrow-right"></i>View
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <div class="col-lg-3 col-sm-6">
        <div class="card">
            <div class="content">
                <div class="row">
                    <div class="col-xs-5">
                        <div class="icon-big icon-success text-center">
                            <i class="ti-crown"></i>
                        </div>
                    </div>
                    <div class="col-xs-7">
                        <div class="numbers">
                            <%
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                String url = "jdbc:mysql://127.0.0.1/java_test";
                                Connection con = DriverManager.getConnection(url, "root", "");
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("select count(*) from class_record");
                                while (rs.next()) {
                            %>
                            <p><strong>Classes</strong></p>
                            <%= rs.getString(1) %>
                            <% } 
                                rs.close();
                                st.close();
                                con.close();
                            } catch(Exception e) {
                            out.println(e);
                            }
                        %>
                        </div>
                    </div>
                </div>
                <hr />
                <a href="viewClasses.jsp">
                    <div class="footer">
                        <div class="stats">
                            <i class="ti-arrow-right"></i>View
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    </div>
    <div class="row">
        <div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-warning text-center">
                                <i class="ti-layers-alt"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <p><strong>Timetable</strong></p>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <a href="viewTimeTable.jsp">
                        <div class="footer">
                            <div class="stats">
                                <i class="ti-arrow-right"></i>View
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-warning text-center">
                                <i class="ti-clipboard"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String url = "jdbc:mysql://127.0.0.1/java_test";
                                        Connection con = DriverManager.getConnection(url, "root", "");
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("select count(*) from notification_record");
                                        while (rs.next()) {
                                    %>
                                <p><strong>Notifications</strong></p>
                                <%= rs.getString(1) %>
                                <% } 
                                        rs.close();
                                        st.close();
                                        con.close();
                                    } catch(Exception e) {
                                    out.println(e);
                                    }
                                %>

                            </div>
                        </div>
                    </div>
                    <hr />
                    <a href="viewNotifications.jsp">
                        <div class="footer">
                            <div class="stats">
                                <i class="ti-arrow-right"></i>View
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-warning text-center">
                                <i class="ti-image"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <%
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String url = "jdbc:mysql://127.0.0.1/java_test";
                                        Connection con = DriverManager.getConnection(url, "root", "");
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("select count(*) from gallery");
                                        while (rs.next()) {
                                    %>
                                <p><strong>Gallery</strong></p>
                                <%= rs.getString(1) %>
                                <% } 
                                    rs.close();
                                    st.close();
                                    con.close();
                                } catch(Exception e) {
                                out.println(e);
                                }
                            %>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <a href="viewGallery.jsp">
                        <div class="footer">
                            <div class="stats">
                                <i class="ti-arrow-right"></i>View
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>
</body>

</html>
