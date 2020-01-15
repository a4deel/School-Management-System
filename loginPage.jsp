<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>LOGIN-PAGE</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="styles/validations.js"></script>

</head>
<%@ page language = "java" import = "java.sql.*" %>

<body style="background:url(styles/pics/signup.jpg);background-size:cover;">
    <div class="main">
        <section class="login">
            <div class="container">
                <div class="login-content">
                    <form method="POST" id="login-form" onsubmit="return loginformValidation()" class="login-form"
                        action="loginPageDatabase.jsp">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Login Into Account*</h2>
                        <h2 style="color:red;"><%
                            if(null!=session.getAttribute("errorMessage"))
                            {
                                out.println(session.getAttribute("errorMessage"));
                                session.invalidate();
                            }
                        %></h2>
                        <div id="errors-content">
                            <div id="nameError"></div>
                        </div>
                        <div id="success-content">
                            <div id="nameSuccess"></div>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-input" name="name" id="name" placeholder="Your Name"
                                onkeypress="return alphabetValidation(event)" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="passwordError"></div>
                        </div>
                        <div id="success-content">
                            <div id="passwordSuccess"></div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" id="password"
                                placeholder="Password" autofocus>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Sign In" />
                        </div>
                    </form>
                    <p class="signuphere">
                        If already don't have an account ? <a href="./registerPage.jsp" class="signuphere-link">Register
                            here</a>
                    </p>
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
