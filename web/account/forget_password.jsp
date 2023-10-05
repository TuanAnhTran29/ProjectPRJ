<%-- 
    Document   : forget_password
    Created on : Jun 9, 2023, 7:32:44 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget password</title>
        <!-- Font Icon -->
        <link rel="stylesheet" href="css_and_js/repo_forgot/fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="css_and_js/repo_forgot/css/style.css">
        
        <%
            String message= (String) request.getAttribute("message");
        %>
    </head>
    <body>
        <div class="main">

            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Forgot Password</h2>
                            <article style="color: red"><%=message!= null? message: ""%></article>
                            <form action="/UserController?action=forgetPassword" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="username" id="name" placeholder="Username"/>
                                </div>
                                <div class="form-group">
                                    <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                    <input type="password" name="password" id="pass" placeholder="Password"/>
                                </div>
                                <div class="form-group">
                                    <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                    <input type="password" name="confirmPassword" id="re_pass" placeholder="Repeat your password"/>
                                </div>
                                <div class="form-group form-button">
                                    <input type="submit" name="forgetPassword" id="signup" class="form-submit" value="Change password"/>
                                </div>
                            </form>
                        </div>
                        <div class="signup-image">
                            <figure><img src="css_and_js/repo_forgot/images/signup-image.jpg" alt="sing up image"></figure>
                            <a href="/UserController" class="signup-image-link">I am already member</a>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        
        <!-- JS -->
    <script src="css_and_js/repo_forgot/vendor/jquery/jquery.min.js"></script>
    <script src="css_and_js/repo_forgot/js/mai1.js"></script>
    </body>
</html>
