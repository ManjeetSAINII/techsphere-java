<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Register &mdash; TechSphere</title>
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
		<div class="col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1">
			<div class="auth-card">

				<!-- Icon -->
				<div class="text-center" style="margin-bottom:18px;">
					<div style="width:56px;height:56px;background:linear-gradient(135deg,#059669,#06b6d4);border-radius:16px;display:inline-flex;align-items:center;justify-content:center;box-shadow:0 8px 24px rgba(5,150,105,0.35);">
						<i class="fa fa-user-plus" style="width:auto;height:auto;font-size:22px;color:white;"></i>
					</div>
				</div>

				<h2 class="text-center">Create Account</h2>
				<p class="auth-subtitle text-center">Join TechSphere and start shopping</p>

				<%
				if (message != null) {
				%>
				<div class="auth-message">
					<i class="fa fa-info-circle" style="width:auto;height:auto;font-size:13px;margin-right:6px;"></i><%=message%>
				</div>
				<%
				}
				%>

				<form action="./RegisterSrv" method="post">

					<div class="row">
						<div class="col-md-6 form-group">
							<label for="reg_name">
								<i class="fa fa-user-o" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Full Name
							</label>
							<input type="text" class="form-control" id="reg_name"
								name="username" placeholder="John Doe" required>
						</div>
						<div class="col-md-6 form-group">
							<label for="reg_email">
								<i class="fa fa-envelope-o" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Email
							</label>
							<input type="email" class="form-control" id="reg_email"
								name="email" placeholder="you@example.com" required>
						</div>
					</div>

					<div class="form-group">
						<label for="reg_address">
							<i class="fa fa-map-marker" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Delivery Address
						</label>
						<textarea class="form-control" id="reg_address" name="address"
							placeholder="Full address for delivery" rows="3" required></textarea>
					</div>

					<div class="row">
						<div class="col-md-6 form-group">
							<label for="reg_mobile">
								<i class="fa fa-phone" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Mobile
							</label>
							<input type="number" class="form-control" id="reg_mobile"
								name="mobile" placeholder="9876543210" required>
						</div>
						<div class="col-md-6 form-group">
							<label for="reg_pin">
								<i class="fa fa-map-pin" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Pin Code
							</label>
							<input type="number" class="form-control" id="reg_pin"
								name="pincode" placeholder="400001" required>
						</div>
					</div>

					<div class="row">
						<div class="col-md-6 form-group">
							<label for="reg_pass">
								<i class="fa fa-lock" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Password
							</label>
							<input type="password" class="form-control" id="reg_pass"
								name="password" placeholder="Min. 8 characters" required>
						</div>
						<div class="col-md-6 form-group">
							<label for="reg_confirm">
								<i class="fa fa-check-circle-o" style="width:auto;height:auto;font-size:12px;margin-right:5px;"></i>Confirm Password
							</label>
							<input type="password" class="form-control" id="reg_confirm"
								name="confirmPassword" placeholder="Repeat password" required>
						</div>
					</div>

					<div class="row" style="margin-top:8px;">
						<div class="col-md-5 form-group">
							<button type="reset" class="btn btn-danger"
								style="width:100%;padding:10px;font-size:13px;border-radius:10px;">
								<i class="fa fa-refresh" style="width:auto;height:auto;font-size:13px;margin-right:6px;"></i>Reset
							</button>
						</div>
						<div class="col-md-7 form-group">
							<button type="submit" class="btn btn-success"
								style="width:100%;padding:10px;font-size:13px;border-radius:10px;">
								<i class="fa fa-user-plus" style="width:auto;height:auto;font-size:13px;margin-right:6px;"></i>Create Account
							</button>
						</div>
					</div>

				</form>

				<hr style="border-color:#e2e8f0;margin:16px 0;">
				<p class="text-center" style="font-size:13px;color:#64748b;margin:0;">
					Already have an account?&nbsp;
					<a href="login.jsp" style="color:#4f46e5;font-weight:600;text-decoration:none;">Sign in</a>
				</p>

			</div>
		</div>
	</div>
</div>

<%@ include file="footer.html"%>

</body>
</html>
