<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật giá sản phẩm</title>
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
									<p>${errorMessage}</p>
								</div>
							</c:if>
							<h1>Danh sách sản phẩm đăng bán</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Update Price</li>
							</ol>
						</div>
					</div>
				</div>
			</section>

			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<div>
										<form class="d-inline-flex">
											<input name="searchInput" id="myInput"
												class="form-control me-2" type="search" placeholder="Search"
												aria-label="Search">
										</form>
									</div>
								</div>
								<div class="card-body table-responsive p-2">
									<table id="example1"
										class="table table-bordered table-striped text-nowrap">
										<thead>
											<tr>
												<th scope="col">Mã</th>
												<th scope="col">Tên Sản Phẩm</th>
												<th scope="col">Hình ảnh</th>
												<th scope="col">Giá hiện tại</th>
												<th scope="col">Ngày áp dụng</th>
												<th></th>
												<th></th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="up" items="${listDetailsUpdatePrice}">
												<tr>
													<td>${up.product.getId()}</td>
													<td>${up.product.getName()}</td>
													<td><img width="50" height="50"
														src="<c:url value='/templates/image/product/${up.product.getId()}.jpg'/>"></td>
													<td>${up.getPrice()}VND</td>
													<td><fmt:formatDate value="${up.id.applicableDate}"
															pattern="dd-MM-yyyy" /></td>
													<td><a class="btn btn-primary float-right"
														style="color: white" data-toggle="modal"
														data-target="#modal-${up.product.getId()}"><i>Xem
																chi tiết</i> </a></td>
													<td><a class="btn btn-danger float-right"
														style="margin: 0 2px;" data-toggle="modal"
														data-target="#modal-edit-${up.product.getId()}"> <i>Sửa
																thông tin</i>
													</a></td>
													<td>
														<button type="button"
															class="btn btn  btn-success float-right"
															style="color: white" data-toggle="modal"
															data-target="#update-priceproduct-modal">Cập
															nhật giá</button>
													</td>
												</tr>

												<div class="modal fade" id="modal-${up.product.getId()}">
													<div class="modal-dialog modal-lg">
														<div class="modal-content ">
															<div class="  modal-header "
																style="background: #2c83e0; color: white;">
																<h4 class="modal-title ">Thông Tin Sản Phẩm</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="card card-primary card-outline">
																	<div class="card-body box-profile">

																		<div class="container">
																			<div class="row">
																				<div class="col col-sm-5" style="margin-top: 40px;">


																					<div class="text-center">
																						<img width="250" height="250"
																							src="<c:url value='/templates/image/product/${up.product.getId()}.jpg'/>"
																							alt=""> <br> <br>
																					</div>

																				</div>
																				<div class="col col-sm-7">
																					<ul class="list-group list-group-unbordered ">
																						<li class="list-group-item"><b>Mã sản
																								phẩm </b> <a class="float-right text-primary">${up.product.getId()}</a>
																						</li>
																						<li class="list-group-item"><b>Tên</b> <a
																							class="float-right text-primary">${up.product.getName()}</a>
																						</li>
																						<li class="list-group-item"><b>Loại</b> <a
																							class="float-right text-primary">${up.product.category.getName()}</a>
																						</li>
																						<li class="list-group-item"><b>Hãng</b> <a
																							class="float-right text-primary">${up.product.getBranch()}</a>
																						</li>
																						<li class="list-group-item"><b>Màu sắc</b> <a
																							class="float-right text-primary">${up.product.getColor()}</a>
																						</li>
																						<li class="list-group-item"><b>Chất liệu</b>
																							<a class="float-right text-primary">${up.product.getMaterial()}</a>
																						</li>
																						<li class="list-group-item"><b>Kích thước</b>
																							<a class="float-right text-primary">${up.product.getSize()}
																								mm</a></li>
																						<li class="list-group-item"><b>Thời gian
																								bảo hành</b> <a class="float-right text-primary">${up.product.getWarrantyPeriod()}
																								tháng</a></li>
																						<li class="list-group-item"><b>Thời gian
																								trả hàng</b> <a class="float-right text-primary">${up.product.getDeliveryTime()}
																								tháng</a></li>
																						<li class="list-group-item"><b>Mô tả</b> <textarea
																								class="textarea"
																								style="width: 100%; height: 50px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${up.product.getDescription()}</textarea>
																						</li>
																						<li class="list-group-item"><b>Số lượng
																								tồn</b> <a class="float-right text-primary">${productAdminDao.countSeriByMasp(up.product.getId())}</a>
																						</li>
																						<li class="list-group-item"><b>Giá</b> <a
																							class="float-right text-primary">${up.getPrice()}
																								VND</a></li>
																						<li class="list-group-item"><b>Người cập
																								nhật</b> <a class="float-right text-primary">${up.staff.getName()}</a>
																					</ul>
																				</div>

																			</div>
																		</div>


																	</div>
																	<!-- /.card-body -->
																</div>
															</div>
															<!-- <div class="modal-footer ">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Đóng</button>
														</div> -->

														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>

												<div class="modal fade"
													id="modal-edit-${up.product.getId()}" tabindex="-1"
													role="dialog" aria-hidden="true">
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
																					action="/WebBanKinh/admin/updatePrice/updatePriceAgain"
																					enctype="multipart/form-data">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="masp">Mã</label> <input type="text"
																								name="masp" value="${up.product.getId()}"
																								class="form-control" readonly>
																						</div>
																						<div class="form-group">
																							<label for="tensp">Tên</label> <input type="text"
																								name="ten" value="${up.product.getName()}"
																								class="form-control" required>
																						</div>
																						<input type="hidden" name="anhGoc"
																							value="${up.product.getId()}.jpg" required>
																						<div class="form-group">
																							<label for="hinhanhsp">Ảnh</label>
																							<div class="custom-file">
																								<input type="file" name="file"
																									value="${up.product.getId()}.jpg"
																									id="imageInput" onchange="previewImage()"
																									class="custom-file-input" accept="image/*">
																								<label class="custom-file-label text-muted"
																									for="hinhanhsp">${up.product.getId()}</label>
																							</div>
																						</div>
																						<div class="form-group">
																							<label for="hangsp">Hãng</label> <input
																								type="text" name="hang"
																								value="${up.product.getBranch()}"
																								class="form-control" required>
																						</div>
																						<div class="form-group">
																							<label for="loaisp">Loại</label> <br> <select
																								name="loaichon" id="loaichon">
																								<c:forEach items="${categorylist}" var="lo">
																									<c:if
																										test="${lo.getId() == up.product.category.getId()}">
																										<option value="${lo.getId()}" selected>${lo.getName()}</option>
																									</c:if>
																									<c:if
																										test="${lo.getId() != up.product.category.getId()}">
																										<option value="${lo.getId()}">${lo.getName()}</option>
																									</c:if>
																								</c:forEach>
																							</select>
																						</div>																						
																					</div>

																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="mausacsp">Màu sắc</label> <input
																								type="text" name="mausac"
																								value="${up.product.getColor()}"
																								class="form-control" required>
																						</div>
																						<div class="form-group">
																							<label for="chatlieusp">Chất liệu</label> <input
																								type="text" name="chatlieu"
																								value="${up.product.getMaterial()}"
																								class="form-control" required>
																						</div>
																						<div class="form-group">
																							<label for="kichthuocsp">Kích thước</label>
																							<div class="form-inline">
																								<input type="text" name="kichthuoc"
																									value="${up.product.getSize()}"
																									class="form-control" required><select
																									class="form-control">
																									<option value="mm" selected>mm</option>
																								</select>
																							</div>
																						</div>

																						<div class="form-group">
																							<label for="thoigianbhsp">Thời gian bảo
																								hành</label>
																							<div class="form-inline">
																								<input type="text" name="thoigianbh"
																									value="${fn:split(up.product.getWarrantyPeriod(), ' ')[0]}"
																									class="form-control" required> <select
																									name="thoigianbhUnit" class="form-control">
																									<option value="tháng" selected>Tháng</option>
																								</select>
																							</div>
																						</div>
																						<div class="form-group">
																							<label for="thoigianthsp">Thời gian trả
																								hàng</label>
																							<div class="form-inline">
																								<input type="text" name="thoigianth"
																									value="${fn:split(up.product.getDeliveryTime(), ' ')[0]}"
																									class="form-control" required> <select
																									name="thoigianthUnit" class="form-control">
																									<option value="tháng" selected>Tháng</option>
																								</select>
																							</div>
																						</div>

																						<div class="form-group">
																							<label>Mô tả</label>
																							<textarea class="textarea" name="mota"
																								placeholder="Mô tả sản phẩm"
																								style="width: 100%; height: 50px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;">${up.product.getDescription()}</textarea>
																						</div>


																						<button type="submit"
																							class="btn btn-primary btn-block" name="update"
																							onclick="return confirm('Bạn có chắc muốn cập nhật ?')">Cập
																							nhật</button>
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

												<div class="modal fade" id="update-priceproduct-modal"
													tabindex="-1" role="dialog"
													aria-labelledby="update-priceproduct-modal-label"
													aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title"
																	id="update-priceproduct-modal-label">Cập nhật giá
																	sản phẩm</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form method="POST"
																	action="/WebBanKinh/admin/updatePrice/Update">
																	<div class="form-group">
																		<label for="masp">Mã</label> <input type="text"
																			name="masp" value="${up.product.getId()}"
																			class="form-control" readonly>
																	</div>
																	<div class="form-group">
																		<label for="tensp">Tên</label> <input type="text"
																			name="ten" value="${up.product.getName()}"
																			class="form-control" readonly>
																	</div>
																	<label for="hinhanhsp">Ảnh</label>
																	<div class="form-group">
																		<img width="70" height="70"
																			src="<c:url value='/templates/image/product/${up.product.getId()}.jpg'/>">
																	</div>
																	<div class="form-group">
																		<label for="ngayapdunggiasp">Ngày áp dụng</label> <input
																			type="date" name="ngayapdung"
																			value="<fmt:formatDate value='${up.id.applicableDate}' pattern='yyyy-MM-dd' />"
																			class="form-control" readonly>
																	</div>
																	<div class="form-group">
																		<label for="giaht">Giá hiện tại</label> <input
																			type="text" name="giaht" value="${up.getPrice()} VND"
																			class="form-control" readonly>
																	</div>
																	<div class="form-group">
																		<label for="giasp">Giá mới</label> <input type="text"
																			name="gia"
																			placeholder="Nhập giá mới sản phẩm (đơn giá: VND)"
																			class="form-control" required>
																	</div>
																	<input type="hidden" name="manv"
																		value="${up.staff.getId()}">

																	<button type="submit" class="btn btn-primary btn-block"
																		name="sell"
																		onclick="return confirm('Bạn có chắc muốn cập nhật giá mới cho sản phẩm không ?')">Cập
																		nhật</button>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>

						</div>

					</div>

				</div>

			</section>
		</div>

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
		<script>
			$(function() {
				$("#example1").DataTable(
						{
							"lengthMenu" : [ [ 10, 25, 50, 150, 200 ],
									[ 10, 25, 50, 150, 200 ] ]
						}); //Cái [] ngoài cùng hiện tên vd:"Tất cả" thì = -1
			});
		</script>
		<script type="text/javascript">
			$(document).ready(function() {
				bsCustomFileInput.init();
			});
		</script>
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
	</div>
</body>
</html>