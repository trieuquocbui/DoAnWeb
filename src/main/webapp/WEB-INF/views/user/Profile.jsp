<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<base href = "${pageContext.servletContext.contextPath}/" >
<meta charset="utf-8">
<title>Thông tin cá nhân</title>
</head>
<body>
	<div class="container background_img_profile">
		<div class="row center header_profile">
			<strong><code>Thông tin bản thân</code></strong>
		</div>

		<div class="col-sm-12 khung_chua_profile input_profile">
			<div class="row">
				<div class="col-sm-6 center">
					<img class="avatar_profile" alt="Ảnh đại diện"
						src="<c:url value='/templates/user/assets/image/${customer.getImage()}'/>">
				</div>
				<div class="col-sm-6 " style="margin-top: 20px;">
					<div class="form-group">
						<label for="ho">Họ</label> <input type="text" name="ho"
							value="${customer.getSurname()}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="ten">Tên</label> <input type="text" name="ten"
							value="${customer.getName()}" class="form-control" readonly>
					</div>

					<div class="form-group">
						<label for="gioiTinh">Giới Tính</label>
						<input value="${customer.getGender()}" class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="ngaySinh">Ngày Sinh</label> <input type="date"
							value="${customer.getBirthDaytoStringYMD()}" name="ngaySinh"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="diaChi">Địa chỉ</label> <input type="text"
							value="${customer.getAddress()}" name="diaChi"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="sdt">Số điện thoại</label> <input type="tel"
							name="sdt" value="${customer.getPhoneNumber()}"
							class="form-control" readonly>
					</div>
					<div class="form-group">
						<label for="email">Email Tài Khoản</label> <input type="email"
							name="email" value="${customer.getAccount().getEmail()}"
							class="form-control" readonly>							
					</div>
					
					<div>
						<button type="button" class="btn_edit_profile" data-toggle="modal"
							data-target="#modalUpdate">Chỉnh sửa thông tin</button>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- Modal update staff -->

	<div class="modal fade" id="modalUpdate">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header modal_header_profile text-center">
					<h4>Cập nhật thông tin</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="contener1-fix" method="post"  enctype="multipart/form-data"
						action="/management/user/profile">

						<div class="col-md-6">
							<div class="row">
								<div class="form-group" style= "margin-top:30px; margin-left:30px;" >
									<img class="avatar_update_profile"
										 src="<c:url value='/templates/user/assets/image/${customer.getImage()}'/>"
										 id="imgPreview" >
									<br>
								</div>
							</div>
							
							<div class="row" style="margin:center; weidth:40%;">
								<label for="imageInput">Chọn ảnh</label>
							</div>
							<div class="row" style="margin:center; weidth:40%;">
								<input type="file" name="file" value= "${customer.getImage()}"
									id="imageInput" onchange="previewImage()" accept="image/*">
							</div>
						</div>

						<div class="col-md-6 input_profile">
							<input type="hidden" name="id" value="${customer.getId()}" required>
							<input type="hidden" name="anhGoc" value= "${customer.getImage()}" required>
							
							<div class="form-group">
								<label for="ho">Họ</label> <input type="text" name="ho"
									value="${customer.getSurname()}" class="form-control" required>	
							</div>
							
							<div class="form-group">
								<label for="ten">Tên</label> <input type="text" name="ten"
									value="${customer.getName()}" class="form-control" required>
							</div>

							<div class="form-group">
								<label for="gioiTinh">Giới Tính</label> <select name="gioiTinh"
									class="form-control">
									<option value="Nam">Nam</option>
									<option value="Nu">Nữ</option>
								</select>
							</div>
							
							<div class="form-group">
								<label for="ngaySinh">Ngày Sinh</label> <input type="date"
									value="${customer.getBirthDaytoStringYMD()}" name="ngaySinh"
									class="form-control" required>
							</div>
							
							<div class="form-group">
								<label for="diaChi">Địa chỉ</label> <input type="text"
									value="${customer.getAddress()}" name="diaChi"
									class="form-control" required>
							</div>
							
							<div class="form-group">
								<label for="sdt">Số điện thoại</label> <input type="number"
									name="sdt" value="${customer.getPhoneNumber()}"
									class="form-control" required>
							</div>
							
							<div class="form-group">
								<label for="email">Email Tài Khoản</label> <input type="email"
									name="email" value="${customer.getAccount().getEmail()}"
									class="form-control" readonly>
							</div>
							
							<div>
								<button type="submit" class="btn btn-primary btn-lg btn-block" >
											Cập nhật</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
				</div>
			</div>
		</div>
	</div>

	<!------------------------------->


	<script>
		function previewImage() {
			var fileInput = document.getElementById('imageInput');
			var imgPreview = document.getElementById('imgPreview');

			// Đọc nội dung của tệp tin đã chọn
			var file = fileInput.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {
				// Đặt đường dẫn hình ảnh vào src của thẻ img để hiển thị
				imgPreview.src = e.target.result;
			}
			reader.readAsDataURL(file);
		}
	</script>

</body>
</html>