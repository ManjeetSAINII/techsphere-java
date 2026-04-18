<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login &mdash; TechSphere</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/changes.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<%@ include file="header.jsp"%>

<%
String message = request.getParameter("message");
%>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">
			<div class="auth-card">

				<!-- Icon -->
				<div class="text-center" style="margin-bottom:18px;">
					<div style="width:56px;height:56px;background:linear-gradient(135deg,#4f46e5,#7c3aed);border-radius:16px;display:inline-flex;align-items:center;justify-content:center;box-shadow:0 8px 24px rgba(79,70,229,0.35);">
						<i class="fa fa-lock" style="width:auto;height:auto;font-size:22px;color:white;"></i>
					</div>
				</div>

				<h2 class="text-center">Welcome Back</h2>
				<p class="auth-subtitle text-center">Sign in to your TechSphere account</p>

				<%
				if (message != null) {
				%>
				<div class="auth-message">
					<i class="fa fa-info-circle" style="width:auto;height:auto;font-size:13px;margin-right:6px;"></i><%=message%>
				</div>
				<%
				}
				%>

				<form action="./LoginSrv" method="post">
					<div class="form-group">
						<label for="login_email">
							<i class="fa fa-envelope-o" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Email Address
						</label>
						<input type="email" class="form-control" id="login_email"
							name="username" placeholder="you@example.com" required>
					</div>

					<div class="form-group">
						<label for="login_pass">
							<i class="fa fa-lock" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Password
						</label>
						<input type="password" class="form-control" id="login_pass"
							name="password" placeholder="Enter your password" required>
					</div>

					<div class="form-group">
						<label for="login_role">
							<i class="fa fa-id-badge" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Login As
						</label>
						<select name="usertype" id="login_role" class="form-control" required>
							<option value="customer" selected>Customer</option>
							<option value="admin">Admin</option>
						</select>
					</div>

					<div class="form-group" style="margin-top:22px;">
						<button type="submit" class="btn btn-primary"
							style="width:100%;padding:11px;font-size:14px;border-radius:10px;">
							<i class="fa fa-sign-in" style="width:auto;height:auto;font-size:14px;margin-right:7px;"></i>Sign In
						</button>
					</div>
				</form>

				<hr style="border-color:#e2e8f0;margin:18px 0;">
				<p class="text-center" style="font-size:13px;color:#64748b;margin:0;">
					Don&rsquo;t have an account?&nbsp;
					<a href="register.jsp" style="color:#4f46e5;font-weight:600;text-decoration:none;">Create one</a>
				</p>

			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>

</body>
</html>
