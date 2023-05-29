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
<title>Quản lý sản phẩm</title>
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
							<h1>Danh sách sản phẩm</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Product</li>
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
												<th scope="col">Loại</th>
												<th scope="col">Hãng</th>
												<th scope="col">Màu sắc</th>
												<th scope="col">Thời gian bảo hành</th>
												<th scope="col">Thời gian trả hàng</th>
												<th><button type="button"
														class="btn btn  btn-success float-right" style="color: white" data-toggle="modal"
														data-target="#add-product-modal">Thêm</button></th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="sp" items="${productlist}">

												<tr>
													<td>${sp.getId()}</td>
													<td>${sp.getName()}</td>
													<td><img width="50" height="50"
														src="<c:url value='/templates/admin/dist/img/${sp.getImage()}'/>"></td>
													<td>${sp.category.getName()}</td>
													<td>${sp.getBranch()}</td>
													<td>${sp.getColor()}</td>
													<td>${sp.getWarrantyPeriod()}</td>
													<td>${sp.getDeliveryTime()}</td>

													<td><a class="btn btn-danger float-right"
														style="margin: 0 2px;" data-toggle="modal"
														data-target="#modal-delete-${sp.getId()}"> <i
															class="fas fa-trash"></i></a> <a
														class="btn btn-info float-right" style="margin: 0 2px;"
														data-toggle="modal"
														data-target="#modal-edit-${sp.getId()}"> <i
															class="fas fa-edit"></i></a> <a
														class="btn btn-primary float-right" style="margin: 0 2px;"
														data-toggle="modal" data-target="#modal-${sp.getId()}">
															<i class="fas fa-info-circle"></i>
													</a></td>

													<td>
														<button type="button" class="btn btn-primary float-right"
															data-toggle="modal" data-target="#sell-product-modal">Đăng
															bán</button>
													</td>
												</tr>

												<div class="modal fade" id="add-product-modal" tabindex="-1"
													role="dialog" aria-labelledby="add-product-modal-label"
													aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="add-product-modal-label">Thêm
																	sản phẩm</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form method="POST"
																	action="/management/admin/product/Add">
																	<div class="form-group">
																		<label for="masp">Mã</label> <input type="text"
																			name="masp" class="form-control" required>
																	</div>
																	<div class="form-group">
																		<label for="tensp">Tên</label> <input type="text"
																			name="ten" class="form-control" required>
																	</div>
																	<div class="form-group">
																		<label for="hinhanhsp">Ảnh</label>
																		<div class="custom-file">
																			<input type="file" name="hinhanh" id="hinhanh"
																				class="custom-file-input" accept="image/*">
																			<label class="custom-file-label text-muted"
																				for="hinhanhsp">Chọn ảnh</label>
																		</div>
																	</div>
																	<div class="form-group">
																		<label for="hangsp">Hãng</label> <input type="text"
																			name="hang" class="form-control" required>
																	</div>
																	<div class="form-group">
																		<label for="loaisp">Loại</label> <br> <select
																			name="loaichon" id="loaichon">
																			<c:forEach items="${categorylist}" var="lo">
																				<c:if test="${lo.getId() == sp.category.getId()}">
																					<option value="${lo.getId()}" selected>${lo.getName()}</option>
																				</c:if>
																				<c:if test="${lo.getId() != sp.category.getId()}">
																					<option value="${lo.getId()}">${lo.getName()}</option>
																				</c:if>
																			</c:forEach>
																		</select>
																	</div>
																	<div class="form-group">
																		<label for="mausacsp">Màu sắc</label> <input
																			type="text" name="mausac" class="form-control"
																			required>
																	</div>
																	<div class="form-group">
																		<label for="thoigianbhsp">Thời gian bảo hành</label> <input
																			type="text" name="thoigianbh" class="form-control"
																			required>
																	</div>
																	<div class="form-group">
																		<label for="thoigianthsp">Thời gian trả hàng</label> <input
																			type="text" name="thoigianth" class="form-control"
																			required>
																	</div>
																	<button type="submit" class="btn btn-primary btn-block"
																		name="add"
																		onclick="return confirm('Bạn có chắc muốn thêm sản phẩm không ?')">Thêm</button>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
															</div>
														</div>
													</div>
												</div>

												<div class="modal fade" id="sell-product-modal"
													tabindex="-1" role="dialog"
													aria-labelledby="sell-product-modal-label"
													aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title" id="sell-product-modal-label">Đăng
																	bán sản phẩm</h5>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<form method="POST"
																	action="/management/admin/product/Post-Sell-SP">
																	<div class="form-group">
																		<label for="masp">Mã</label> <input type="text"
																			name="masp" value="${sp.getId()}"
																			class="form-control" readonly>
																	</div>
																	<div class="form-group">
																		<label for="tensp">Tên</label> <input type="text"
																			name="ten" value="${sp.getName()}"
																			class="form-control" readonly>
																	</div>
																	<label for="hinhanhsp">Ảnh</label>
																	<div class="form-group">
																		<img width="70" height="70"
																			src="<c:url value='/templates/admin/dist/img/${sp.getImage()}'/>">
																	</div>

																	<div class="form-group">
																		<label for="giasp">Giá</label> <input type="text"
																			name="gia" placeholder="Nhập giá sản phẩm"
																			class="form-control" required>
																	</div>
																	<div class="form-group">
																		<label for="ngayapdungsp">Ngày áp dụng</label> <input
																			type="date" name="ngayapdung" class="form-control"
																			required>
																	</div>
																	<button type="submit" class="btn btn-primary btn-block"
																		name="sell"
																		onclick="return confirm('Bạn có chắc muốn đăng bán sản phẩm không ?')">Đăng</button>
																</form>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
															</div>
														</div>
													</div>
												</div>

												<div class="modal fade" id="modal-delete-${sp.getId()}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header "
																style="background: #ef2d3f; color: white;">
																<h4 class="modal-title">Thông báo</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<p>Xác nhận xóa sản phẩm</p>
															</div>
															<div class="modal-footer  ">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
																<a href="product/Delete?masp=${sp.getId()}"
																	type="button" class="btn btn-primary float-right">Đồng
																	ý</a>

															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>

												<div class="modal fade" id="modal-${sp.getId()}">
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
																							src="<c:url value='/templates/admin/dist/img/${sp.getImage()}'/>"
																							alt=""> <br> <br>
																					</div>

																				</div>
																				<div class="col col-sm-7">
																					<ul class="list-group list-group-unbordered ">
																						<li class="list-group-item"><b>Mã sản
																								phẩm </b> <a class="float-right text-primary">${sp.getId()}</a>
																						</li>
																						<li class="list-group-item"><b>Tên</b> <a
																							class="float-right text-primary">${sp.getName()}</a>
																						</li>
																						<li class="list-group-item"><b>Loại</b> <a
																							class="float-right text-primary">${sp.category.getName()}</a>
																						</li>
																						<li class="list-group-item"><b>Hãng</b> <a
																							class="float-right text-primary">${sp.getBranch()}</a>
																						</li>
																						<li class="list-group-item"><b>Màu sắc</b> <a
																							class="float-right text-primary">${sp.getColor()}</a>
																						</li>
																						<li class="list-group-item"><b>Thời gian
																								bảo hành</b> <a class="float-right text-primary">${sp.getWarrantyPeriod()}</a>
																						</li>
																						<li class="list-group-item"><b>Thời gian
																								trả hàng</b> <a class="float-right text-primary">${sp.getDeliveryTime()}</a>
																						</li>
																						<li class="list-group-item"><b>Người đăng</b>
																							<a class="float-right text-primary"></a>
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

												<div class="modal fade" id="modal-edit-${sp.getId()}"
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
																					action="/management/admin/product/Edit">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="masp">Mã</label> <input type="text"
																								name="masp" value="${sp.getId()}"
																								class="form-control" readonly>
																						</div>
																						<div class="form-group">
																							<label for="tensp">Tên</label> <input type="text"
																								name="ten" value="${sp.getName()}"
																								class="form-control" required>
																						</div>
																						<div class="form-group">
																							<label for="hinhanhsp">Ảnh</label>
																							<div class="custom-file">
																								<input type="file" name="hinhanh" id="hinhanh"
																									class="custom-file-input" accept="image/*">
																								<label class="custom-file-label text-muted"
																									for="hinhanhsp">${sp.getImage()}</label>
																							</div>
																						</div>
																						<div class="form-group">
																							<label for="hangsp">Hãng</label> <input
																								type="text" name="hang"
																								value="${sp.getBranch()}" class="form-control"
																								required>
																						</div>
																					</div>
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="loaisp">Loại</label> <br> <select
																								name="loaichon" id="loaichon">
																								<c:forEach items="${categorylist}" var="lo">
																									<c:if
																										test="${lo.getId() == sp.category.getId()}">
																										<option value="${lo.getId()}" selected>${lo.getName()}</option>
																									</c:if>
																									<c:if
																										test="${lo.getId() != sp.category.getId()}">
																										<option value="${lo.getId()}">${lo.getName()}</option>
																									</c:if>
																								</c:forEach>
																							</select>
																						</div>
																						<div class="form-group">
																							<label for="mausacsp">Màu sắc</label> <input
																								type="text" name="mausac"
																								value="${sp.getColor()}" class="form-control"
																								required>
																						</div>
																						<div class="form-group">
																							<label for="thoigianbhsp">Thời gian bảo
																								hành</label> <input type="text" name="thoigianbh"
																								value="${fn:split(sp.getWarrantyPeriod(), ' ')[0]}"
																								class="form-control" required> <select
																								name="thoigianbhUnit">
																								<option value="ngày"
																									<c:if test="${fn:split(sp.getWarrantyPeriod(), ' ')[1] eq 'ngày'}">selected</c:if>>Ngày</option>
																								<option value="tháng"
																									<c:if test="${fn:split(sp.getWarrantyPeriod(), ' ')[1] eq 'tháng'}">selected</c:if>>Tháng</option>
																								<option value="năm"
																									<c:if test="${fn:split(sp.getWarrantyPeriod(), ' ')[1] eq 'năm'}">selected</c:if>>Năm</option>
																							</select>
																						</div>
																						<div class="form-group">
																							<label for="thoigianthsp">Thời gian trả
																								hàng</label> <input type="text" name="thoigianth"
																								value="${fn:split(sp.getDeliveryTime(), ' ')[0]}"
																								class="form-control" required> <select
																								name="thoigianthUnit">
																								<option value="ngày"
																									<c:if test="${fn:split(sp.getDeliveryTime(), ' ')[1] eq 'ngày'}">selected</c:if>>Ngày</option>
																								<option value="tháng"
																									<c:if test="${fn:split(sp.getDeliveryTime(), ' ')[1] eq 'tháng'}">selected</c:if>>Tháng</option>
																								<option value="năm"
																									<c:if test="${fn:split(sp.getDeliveryTime(), ' ')[1] eq 'năm'}">selected</c:if>>Năm</option>
																							</select>
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

	</div>
</body>
</html>