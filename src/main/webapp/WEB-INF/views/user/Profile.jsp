<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>


<meta charset="utf-8">
<title>Thông tin cá nhân</title>
</head>
<body>
	<div class="container background_img_profile">
		<div class="row center header_profile">
			<strong><code>Thông tin bản thân</code></strong>
		</div>

		<div class="col-sm-10 col-sm-push-1 khung_chua_profile">
			<div class="row">
				<div class="col-sm-5">
					<img class="avatar_profile" alt="Ảnh đại diện"
						src="/management/templates/user/assets/image/1.gif">
				</div>

				<div class="col-sm-6 col-sm-push-1">
					<ul class="list-group info_profile">
						<li class="list-group-item"><b>Họ và tên</b>:
							${customer.surname} ${customer.name}</li>
						<li class="list-group-item"><b>Giới tính</b>:
							${customer.gender}</li>
						<li class="list-group-item"><b>Ngày sinh</b>:
							${customer.dateOfBirth}</li>
						<li class="list-group-item"><b>Số điện thoại</b>:
							${customer.phoneNumber}</li>
						<li class="list-group-item"><b>Địa chỉ</b>:
							${customer.address}</li>
						<li class="list-group-item"><b>Email</b>:
							${customer.account.email}</li>
					</ul>
					<button type="button" class="btn_edit_profile" data-toggle="modal"
						data-target="#modalUpdate">Chỉnh sửa thông tin</button>
					<br>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal update staff -->

	<div class="modal fade" id="modalUpdate">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header modal_header_profile">
					Cập nhật thông tin
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<form class="contener1-fix" method="post"
						action="/management/user/profile">

						<div class="col-md-6">
							<div class="form-group">
								<label for="anh">Ảnh</label>
								<div class="custom-file">
									<input type="file" name="anh" id="anh"
										class="custom-file-input" value=".../img"> <label
										class="custom-file-label" for="anh">Chọn ảnh</label>
								</div>
								<div id="thongbao" class="mt-2"></div>
								<!-- Thêm đoạn mã HTML để hiển thị thông báo -->
							</div>
						</div>

						<div class="col-md-6">
							<div class="form-group">
								<label for="hoTen">Họ và tên</label> <input type="text"
									name="hoTen" class="form-control" required>
							</div>

							<div class="form-group">
								<label for="gioiTinh">Giới Tính</label>
								 <select name="gioiTinh" class="form-control">
									<option value="Nam">Nam</option>
									<option value="Nữ">Nữ</option>
								</select>
							</div>
							<div class="form-group">
								<label for="ngaySinh">Ngày Sinh</label>
								<input type="date" name="ngaySinh" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="diaChi">Địa chỉ</label> 
								<input type="text" name="diaChi" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="sdt">Số điện thoại</label> <input type="number"
									name="sdt" class="form-control" required>
							</div>
							<div class="form-group">
								<label for="email">Email Tài Khoản</label> <input type="email"
									name="email" class="form-control" required>
							</div>

								<button type="submit" class="btn btn-primary btn-lg btn-block">Cập
									nhật</button>
	
						</div>
					</form>




				</div>
				<div class="modal-footer  ">
					<button type="submit" class="btn btn-primary btn-lg btn-block">Cập
									nhật</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<!------------------------------->

	<div class="modal fade" id="tttttt" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Cập Nhật Thông Tin</h4>
					<button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-12">
							<div class="bg-primary-dark block block-h-auto">
								<div class="row edit-product-row">
									<form class="contener1-fix" method="POST"
										action="/managenment/user/profile" modelAttribute="taikhoan">
										<div></div>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>