<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="javax.swing.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thông tin cá nhân</title>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<c:if test="${not empty successMessage}">
								<div class="alert alert-success" role="alert">
									<p>${successMessage}</p>
								</div>
							</c:if>
							<c:if test="${not empty errorMessage}">
								<div class="alert alert-danger" role="alert">
									<ul>
										<c:forEach items="${errorMessage}" var="error">
											<li>${error.defaultMessage}</li>
										</c:forEach>
									</ul>
								</div>
							</c:if>
							<h1>Thông tin cá nhân</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Profile</li>
							</ol>
						</div>
					</div>
				</div>
			</section>
			<section class="content">
				<div class="container-fluid">
					<div class="col-md-12">
						<div class="card">
							<div class="card-body register-card-body">
								<p class="login-box-msg">
									<b>THÔNG TIN CÁ NHÂN</b>
								</p>
								<label for="hinhanh">Ảnh</label>
								<div class="input-group mb-3">
									<img width="100" height="100"
										src="<c:url value='/templates/admin/dist/img/${staff.getId()}.jpg'/>">
								</div>
								<label for="manv">Mã</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getId()}" disabled>
								</div>
								<label for="ho">Họ</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getSurname()}" disabled>
									<div class="input-group-append">
										<div class="input-group-text">
											<span class="fas fa-user"></span>
										</div>
									</div>
								</div>
								<label for="ten">Tên</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getName()}" disabled>
									<div class="input-group-append">
										<div class="input-group-text">
											<span class="fas fa-user"></span>
										</div>
									</div>
								</div>
								<label for="ngaysinh">Ngày sinh</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="<fmt:formatDate value='${staff.getDateOfBirth()}' pattern='dd-MM-yyyy' />"
										disabled>
									<div class="input-group-append">
										<div class="input-group-text">
											<span class="fas fa-birthday-cake"></span>
										</div>
									</div>
								</div>
								<label for="sdt">Số điện thoại</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getPhoneNumber()}" disabled>
									<div class="input-group-append">
										<div class="input-group-text">
											<span class="fas fas fa-phone"></span>
										</div>
									</div>
								</div>
								<label for="gioitinh">Giới Tính</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getGender() == true ? 'Nam' : 'Nữ'}" disabled>
								</div>
								<label for="DiaChi">Địa chỉ</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getAddress()}" disabled>
								</div>
								<label for="email">Địa chỉ Email</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.account.getEmail()}" disabled>
									<div class="input-group-append">
										<div class="input-group-text">
											<span class="fas fa-envelope"></span>
										</div>
									</div>
								</div>
								<label>CMND</label>
								<div class="input-group mb-3">
									<input type="text" class="form-control"
										value="${staff.getcMND()}" disabled>
									<div class="input-group-append">
										<div class="input-group-text">
											<span class="fas fa-briefcase"></span>
										</div>
									</div>
								</div>

								<a class="btn btn-info float-right" style="margin: 0 2px;"
									data-toggle="modal" data-target="#modal-edit-${staff.getId()}">
									<i class="fas fa-edit">Chỉnh sửa</i>
								</a>

								<div class="modal fade" id="modal-edit-${staff.getId()}"
									tabindex="-1" role="dialog" aria-hidden="true">
									<div class="modal-dialog modal-lg modal-dialog-centered">
										<div class="modal-content">
											<div class="modal-header"
												style="background: #eb7512; color: white;">
												<h4 class="modal-title" id="myCenterModalLabel">Cập
													Nhật Thông Tin</h4>
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Đóng</button>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-12">
														<div class="bg-primary-dark block block-h-auto">
															<div class="row edit-product-row">
																<form class="contener1-fix" method="POST"
																	action="/WebBanKinh/admin/profile/Edit">
																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="manv">Mã</label> <input type="text"
																				name="manv" class="form-control"
																				value="${staff.getId()}" disabled>
																		</div>
																		<div class="form-group">
																			<label for="email">Email</label> <input type="email"
																				name="email"
																				value="${staff.getAccount().getEmail()}"
																				class="form-control" disabled>
																		</div>
																		<div class="form-group">
																			<label for="password">Password</label> <input
																				type="text" name="password"
																				value="${staff.getAccount().getPassword()}"
																				class="form-control" required>
																		</div>
																		<div class="form-group">
																			<label for="ho">Họ</label> <input type="text"
																				name="ho" value="${staff.getSurname()}"
																				class="form-control" required>
																		</div>
																		<div class="form-group">
																			<label for="ten">Tên</label> <input type="text"
																				name="ten" value="${staff.getName()}"
																				class="form-control" required>
																		</div>
																		<div class="form-group">
																			<label for="cmnd">CMND</label> <input type="text"
																				name="cmnd" value="${staff.getcMND()}"
																				class="form-control" required>
																		</div>
																		<div class="form-group">
																			<label for="sdt">SĐT</label> <input type="text"
																				name="sdt" value="${staff.getPhoneNumber()}"
																				class="form-control" required>
																		</div>
																		<div class="form-group">
																			<label for="diachi">Địa Chỉ</label> <input
																				type="text" name="diachi"
																				value="${staff.getAddress()}" class="form-control"
																				required>
																		</div>
																	</div>

																	<div class="col-md-6">
																		<div class="form-group">
																			<label for="ngaysinh">Ngày Sinh</label> <input
																				type="date" name="ngaysinh"
																				value="<fmt:formatDate value='${staff.getDateOfBirth()}' pattern='yyyy-MM-dd' />"
																				class="form-control" required>
																		</div>
																		<div class="form-group">
																			<label for="gioitinh">Giới Tính</label> <select
																				name="gioitinh" class="form-control">
																				<option value="true"
																					${staff.getGender() == true ? "selected" : ""}>Nam</option>
																				<option value="false"
																					${staff.getGender() == false ? "selected" : ""}>Nữ</option>
																			</select>
																		</div>
																		<div class="form-group">
																			<label for="role">Chức vụ</label> <select
																				class="custom-select" id="role" name="role">
																				<option value="NV">Nhân Viên</option>
																				<option value="QL">Quản Lý</option>
																			</select>
																		</div>
																		<div class="form-group">
																			<label for="hinhanh">Ảnh</label>
																			<div class="custom-file">
																				<input type="file" name="hinhanh" id="anh"
																					class="custom-file-input"> <label
																					class="custom-file-label" for="hinhanh"></label>
																			</div>
																		</div>
																		<div class="col-md-auto">
																			<button type="submit"
																				class="btn btn-primary btn-block" name="update"
																				onclick="return confirm('Bạn có chắc muốn cập nhật ?')">Cập
																				nhật</button>
																		</div>
																	</div>
																</form>
															</div>

														</div>

													</div>
												</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	</div>
	</section></div>

	<footer class="main-footer">
		<div class="float-right d-none d-sm-block">
			<b>TN-TT</b>
		</div>
	</footer>

	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			bsCustomFileInput.init();
		});
	</script>
	</div>
</body>
</html>