<%-- 
    Document   : create_account
    Created on : Jun 9, 2023, 7:36:43 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create account</title>
        
        <link rel="stylesheet" href="css_and_js/repo_signup/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">

        <!-- STYLE CSS -->
        <link rel="stylesheet" href="css_and_js/repo_signup/css/style.css">
        
        <%
            String message= (String) request.getAttribute("message");
        %>
    
    </head>
    <body>

		<div class="wrapper" style="background-image: url('css_and_js/repo_signup/images/bg-registration-form-1.jpg');">
			<div class="inner">
				<div class="image-holder">
					<img src="css_and_js/repo_signup/images/registration-form-1.jpg" alt="">
				</div>
                            
                            <form action="/UserController?action=createAccount" method="Post">
					<h3>Registration Form</h3>
                                        <article style="color: red"><%=message!= null? message: ""%></article>
					<div class="form-group">
						<input type="text" name="firstName" placeholder="First Name" class="form-control">
						<input type="text" name="lastName" placeholder="Last Name" class="form-control">
					</div>
                                        <div class="form-wrapper">
						<input type="text" name="address" placeholder="Address" class="form-control">
						<i class="zmdi zmdi-address"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" name="username" placeholder="Username" class="form-control">
						<i class="zmdi zmdi-account"></i>
					</div>
					<div class="form-wrapper">
						<input type="text" name="email" placeholder="Email Address" class="form-control">
						<i class="zmdi zmdi-email"></i>
					</div>
                                        <div class="form-wrapper">
						<input type="text" name="phone" placeholder="Phone Number" class="form-control">
						<i class="zmdi zmdi-home"></i>
					</div>
					
					<div class="form-wrapper">
						<input type="password" name="password" placeholder="Password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
					<div class="form-wrapper">
						<input type="password" name="confirmPassword" placeholder="Confirm Password" class="form-control">
						<i class="zmdi zmdi-lock"></i>
					</div>
                                        <div class="form-wrapper">
						<select name="role" id="role" class="form-control">
                                                    <option value="" disabled="" selected="">Choose your role...</option>
                                                    <option value="1">ADMIN</option>
                                                    <option value="2">USER</option>
						</select>
						<i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
					</div>
                                        <div>
                                            <button type="submit">Register
                                                <i class="zmdi zmdi-arrow-right"></i>
                                            </button>
                                            
                                        </div>
                                        <br>
                                        <a href="/UserController">Already have account?</a>
				</form>
			</div>
		</div>
		
	</body>
</html>
