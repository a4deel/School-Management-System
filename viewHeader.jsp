<!DOCTYPE html>
<html>

<head>
    <link id="browser_favicon" rel="shortcut icon" href="styles/resources/table_icons/group_add.png">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RECORDS-PAGE</title>
    <link rel="stylesheet" href="styles/resources/initializr/css/cosmo.css">
    <script src="styles/resources/jquery/js/jquery-1.12.4.min.js"></script>
    <script src="styles/resources/initializr/js/vendor/bootstrap.min.js"></script>
</head>
<%@ page language = "java" import = "java.sql.*,java.util.*,java.io.*" %>
<style>
    .container {
        width: 660px;
        position: relative;
        margin: 0 auto;
    }

    .signup-content {
        background: whitesmoke;
        border-radius: 10px;
        padding: 10px 35px;
    }

    .form-input {
        width: 70%;
        border: 1px solid #ebebeb;
        border-radius: 5px;
        padding: 17px 20px;
        box-sizing: border-box;
        font-size: 18px;
        font-weight: 500;
        color: #222;
    }

    .form-submit {
        width: 70%;
        border-radius: 5px;
        -moz-border-radius: 5px;
        -webkit-border-radius: 5px;
        -o-border-radius: 5px;
        -ms-border-radius: 5px;
        padding: 17px 20px;
        box-sizing: border-box;
        font-size: 14px;
        font-weight: 700;
        color: #fff;
        text-transform: uppercase;
        border: none;
        background-image: -moz-linear-gradient(to left, #74ebd5, #9face6);
        background-image: -ms-linear-gradient(to left, #74ebd5, #9face6);
        background-image: -o-linear-gradient(to left, #74ebd5, #9face6);
        background-image: -webkit-linear-gradient(to left, #74ebd5, #9face6);
        background-image: linear-gradient(to left, #74ebd5, #9face6);
    }

    .form-input.error {
        border-color: red;
    }

    .form-input.success {
        border-color: green;
    }
</style>

<body style="background:url(styles/pics/signup.jpg);background-size:cover;">
    <%
        String name = (String)session.getAttribute("name");
        if (name == null) {
            response.sendRedirect("loginPage.jsp");
        }
    %>
    <nav class="navbar navbar navbar-default navbar-fixed-top hidden-print" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="dashboard.jsp" class="navbar-brand"><i class="glyphicon glyphicon-home"></i> Al-Hammd-School
                Admin</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown" display="none">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        Go To
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li>
                            <a href="viewStudents.jsp">
                                <img src="styles/resources/table_icons/group_add.png" height="32">
                                "Students"
                            </a>
                        </li>
                        <li>
                            <a href="viewTeachers.jsp">
                                <img src="styles/resources/table_icons/blackboard_drawing.png" height="32">
                                "Teachers"
                            </a>
                        </li>
                        <li>
                            <a href="viewUsers.jsp">
                                <img src="styles/resources/table_icons/reseller_programm.png" height="32">
                                "Users"
                            </a>
                        </li>
                        <li>
                            <a href="viewClasses.jsp">
                                <img src="styles/resources/table_icons/door_open.png" height="32">
                                "Classes"
                            </a>
                        </li>
                        <li>
                            <a href="viewTimeTable.jsp">
                                <img src="styles/resources/table_icons/data_chooser.png" height="32">"TimeTable"
                            </a>
                        </li>
                        <li>
                            <a href="viewNotifications.jsp">
                                <img src="styles/resources/table_icons/clipboard_empty.png" height="32">"Notifications"
                            </a>
                        </li>
                        <li>
                            <a href="viewGallery.jsp">
                                <img src="styles/resources/table_icons/administrator.png" height="32">"Gallery"
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
