<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>q
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="content-wrapper">

		<section class="content">

			<div class="container-fluid">
				<div class="row" style="justify-content: center;"></div>
				<div class="col-md-12">
					<div class="card">
 
						<div class="card-body">
						
	<div class="form-container">
		<form action="./add-supplier" id="form-supplier"
			class="form form-employee" method="POST">
			<h1 class="form-heading">Thêm Nhà Cung Cấp</h1>
			<div class="form-group">
				<label for="" class="form-label">Tên </label> <input type="text"
					name="name" class="form-input number"
					placeholder="Nhập tên Nhà Cung Cấp" /> 
					<span class="text--error"></span>
			</div>
			<div class="form-group">
				<label for="" class="form-label">Số điện thoại</label> <input
					type="text" name="phoneNumber" class="form-input number"
					placeholder="Nhập số điện thoại của NCC" /> <span
					class="text--error"></span>
			</div>
			<div class="form-group">
				<label for="" class="form-label">Địa chỉ</label> <input type="text"
					name="address" class="form-input"
					placeholder="Nhập địa chỉ của NCC" /> <span class="text--error"></span>
			</div>
			
			<div class="form-button-setting">
			<button class="form-button submit" type="submit">Hoàn thành</button>
			<button class="form-button reset" type="reset">Làm mới</button>
		</div>
			</form>
	</div>
	</div>
						<!-- /.card-body -->

					</div>
					<!-- /.card -->
				</div>
			</div>

		</section>

	</div>
	<script
	src="<c:url value='/WEB-INF/tool_js/validationForm.js' />"></script>
<script>
	handleSubmit('form-employee')
</script>
</body>
</html>