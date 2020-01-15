<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ADD-IMAGE-PAGE</title>
    <link rel="stylesheet" href="styles/style.css">
    <script src="styles/validations.js"></script>
</head>

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
                    <form method="POST" onsubmit="return imageformValidation()" action="addImageToDatabase.jsp"
                        enctype="multipart/form-data">
                        <h2 class="form-title"
                            style="font-family: Source Sans Pro, Calibri, Candara, Arial, sans-serif;font-size: 40px;color: blue;">
                            *Add Image In Gallery*</h2>
                        <div id="errors-content">
                            <div id="fileError"></div>
                        </div>
                        <div class="form-group">
                            <input type="file" class="form-input" name="file" id="file" autofocus>
                        </div>
                        <div class="form-group">
                            <input type="submit" name="submit" id="submit" class="form-submit" value="Upload Image" />
                        </div>
                        <h2 class="form-title">OR</h2>
                        <div class="form-group">
                            <input type="submit" onclick="window.location.href = './viewGallery.jsp';" name="submit"
                                id="submit" class="form-submit" value="Go Back" />
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </div>
</body>

</html>
