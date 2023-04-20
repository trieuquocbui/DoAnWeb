<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en">
<head>
<title>title</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/bootstrap/css/bootstrap.min.css>" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/font-awesome-4.7.0/css/font-awesome.min.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/fonts/Linearicons-Free-v1.0.0/icon-font.min.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/vendor/animate/animate.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/vendor/css-hamburgers/hamburgers.min.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/vendor/animsition/css/animsition.min.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/vendor/select2/select2.min.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/vendor/daterangepicker/daterangepicker.css" />'>
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/css/util.css" />'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/css/main.css" />'>
<link rel="stylesheet" type="text/css"
	href='<c:url value="/templates/auth/css/style.css" />'>
<!--===============================================================================================-->

<style>
.alert {
	padding: 20px;
	background-color: #f44336;
	color: white;
}

.closebtn {
	margin-left: 15px;
	color: white;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}
</style>
</head>
<body>

<div class="limiter">
	<div class="container-login100"
		style="background-image: url('templates/auth/images/bg-01.jpg');">
		<div class="wrap-login100 p-t-30 p-b-50">
			<span class="login100-form-title p-b-41"> Register </span>
			<form:form class="login100-form validate-form p-b-33 p-t-5"
				modelAttribute="userForm" method="post">

				<spring:bind path="email">
					<div class="wrap-input100 validate-input"
						data-validate="Enter email">
						<form:input class="input100" type="email" path="email"
							placeholder="Email" />
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
						<p class="error" style="color: red; margin-left: 10px">
							<form:errors path="email"></form:errors>
						</p>
					</div>
				</spring:bind>
				
				<spring:bind path="customer.surname">
					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<form:input class="input100" type="text" path="customer.surname"
							placeholder="Họ" />
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
						<p class="error" style="color: red; margin-left: 10px">
							<form:errors path="customer.surname"></form:errors>
						</p>
					</div>
				</spring:bind>
				
				<spring:bind path="customer.name">
					<div class="wrap-input100 validate-input"
						data-validate="Enter username">
						<form:input class="input100" type="text" path="customer.name"
							placeholder="Tên" />
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
						<p class="error" style="color: red; margin-left: 10px">
							<form:errors path="customer.name"></form:errors>
						</p>
					</div>
				</spring:bind>
				
				<spring:bind path="customer.phoneNumber">
					<div class="wrap-input100 validate-input"
						data-validate="Enter phone">
						<form:input class="input100" type="text" path="customer.phoneNumber"
							placeholder="Sdt" />
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
						<p class="error" style="color: red; margin-left: 10px">
							<form:errors path="customer.phoneNumber"></form:errors>
						</p>
					</div>
				</spring:bind>
				

				<spring:bind path="password">
					<div class="wrap-input100 validate-input"
						data-validate="Enter password">
						<form:input class="input100" type="password" path="password"
							placeholder="Mật khẩu" />
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
						<p class="error" style="color: red; margin-left: 10px">
							<form:errors path="password"></form:errors>
						</p>
					</div>
				</spring:bind>

				
					<div class="wrap-input100 validate-input"
						data-validate="Enter confirm passwrod">
						<input class="input100" type="password"
							name="passwordConfirm" placeholder="Xác nhận mật khẩu" />
						<span class="focus-input100" data-placeholder="&#xe80f;"></span>
						<p class="error" style="color: red; margin-left: 10px">
							<c:if test="${checkPassword}">
								${error}
							</c:if>
						</p>
					</div>
				
				<c:if test="${check}">
					<div class="alert">
						<span class="closebtn"
							onclick="this.parentElement.style.display='none';">&times;</span>
						${message}
					</div>
				</c:if>

				<div class="container-login100-form-btn m-t-32">
					<button type="submit" class="login100-form-btn">Đăng kí
						ngay</button>
				</div>

				<div class="redirec-link">
					<a href="/login">Đăng nhập</a>
				</div>
				
				

			</form:form>
		</div>
	</div>
</div>
<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/templates/auth/vendor/jquery/jquery-3.2.1.min.js'/>">
		
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/templates/auth/vendor/animsition/js/animsition.min.js'/>">
		
	</script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/templates/auth/vendor/bootstrap/js/popper.js'/>"></script>
	<script
		src="<c:url value='/templates/auth/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/templates/auth/vendor/select2/select2.min.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/templates/auth/vendor/daterangepicker/moment.min.js'/>"></script>
	<script
		src="<c:url value='/templates/auth/vendor/daterangepicker/daterangepicker.js'/>"></script>
	<!--===============================================================================================-->
	<script
		src="<c:url value='/templates/auth/vendor/countdowntime/countdowntime.js'/>"></script>
	<!--===============================================================================================-->
	<script src="<c:url value='/templates/auth/js/main.js'/>"></script>
</body>
</html>

