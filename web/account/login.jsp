<%-- 
    Document   : login
    Created on : Jun 9, 2023, 3:13:06 PM
    Author     : tuana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="css_and_js/repo_login/images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/vendor/animate/animate.css">
        <!--===============================================================================================-->	
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/css/util.css">
        <link rel="stylesheet" type="text/css" href="css_and_js/repo_login/css/main.css">
        <!--===============================================================================================-->
        <%
            String message= (String) request.getAttribute("message");
            String username= (String) request.getAttribute("username");
        %>
    
    </head>
    <body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="css_and_js/repo_login/images/img-01.png" alt="IMG">
				</div>

                            <form action="/UserController?action=loginAccount" method="Post" class="login100-form validate-form">
					<span class="login100-form-title">
						Member Login
					</span>
                                        <article style="color: red"><%=message!= null? message: ""%></article>
					<div class="wrap-input100 validate-input" data-validate = "<%=message!= null? message: ""%>">
                                            <input class="input100" type="text" name="username" placeholder="Username"<%=username!= null? username: ""%>>
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button type="submit" class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="/UserController?action=forgetPassword">
							Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="/UserController?action=createAccount">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	

	
<!--===============================================================================================-->	
	<script src="css_and_js/repo_login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="css_and_js/repo_login/vendor/bootstrap/js/popper.js"></script>
	<script src="css_and_js/repo_login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="css_and_js/repo_login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="css_and_js/repo_login/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
<!--===============================================================================================-->
	<script src="css_and_js/repo_login/js/main.js"></script>

</body>
</html>
