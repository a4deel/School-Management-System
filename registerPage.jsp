<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>REGISTER-PAGE</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="styles/validations.js"></script>
</head>
<%@ page language = "java" import = "java.sql.*" %>

<body style="background:url(styles/pics/signup.jpg);background-size:cover;">
    <div class="main">
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" onsubmit="return registerformValidation()" class="signup-form"
                        action="registerPageDatabase.jsp">
                        <h2 style="color:red;"><%
                            if(null!=session.getAttribute("errorMessage"))
                            {
                                out.println(session.getAttribute("errorMessage"));
                                session.invalidate();
                            }
                        %></h2>
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Register Yourself*
                        </h2>
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
                                placeholder="Your Password" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="confirmPasswordError"></div>
                        </div>
                        <div id="success-content">
                            <div id="confirmPasswordSucces"></div>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-input" name="confirm_password" id="confirm_password"
                                placeholder="Confirm Password" autofocus>
                        </div>
                        <div id="errors-content">
                            <div id="typeError"></div>
                        </div>
                        <!-- <div id="success-content">
                            <div id="typeSucces"></div>
                        </div>
                        <div class="form-group">
                            <select name="UserType" id="UserType" class="form-input" autofocus>
                                <option id="UserType" value="">Select Type</option>
                                <option id="UserType" value="admin">admin</option>
                                <option id="UserType" value="admin">user</option>
                            </select>
                        </div> -->
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit"
                                value="Register Yourself" />
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="./loginPage.jsp" class="loginhere-link">Login here</a>
                    </p>
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
