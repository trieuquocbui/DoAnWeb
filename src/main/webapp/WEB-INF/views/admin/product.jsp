<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý sản phẩm</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->    
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<div class="content-wrapper">
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Danh sách sản phẩm</h1>
							${message}
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
								<div class="card-body">
									<table class="table table-bordered table-hover">
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
												<th><a type="button"
													class="btn btn  btn-success float-right"
													style="color: white"> Thêm </a></th>
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

												</tr>
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
																								class="form-control" required>
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
																									class="custom-file-input"> <label
																									class="custom-file-label" for="hinhanhsp">${sp.getImage()}</label>
																							</div>
																							<div id="thongbao1" class="mt-2"></div>
																							<!-- Thêm đoạn mã HTML để hiển thị thông báo -->
																						</div>
																						<div class="form-group">
																							<label for="loaisp">Loại</label> <input
																								type="text" name="loai"
																								value="${sp.category.getName()}"
																								class="form-control" required>
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
																							<label for="mausacsp">Màu sắc</label> <input
																								type="text" name="mausac"
																								value="${sp.getColor()}" class="form-control"
																								required>
																						</div>
																						<div class="form-group">
																							<label for="thoigianbhsp">Thời gian bảo
																								hành</label> <input type="text" name="thoigianbh"
																								value="${sp.getWarrantyPeriod()}"
																								class="form-control" required>
																						</div>
																						<div class="form-group">
																							<label for="thoigianthsp">Thời gian trả
																								hàng</label> <input type="text" name="thoigianth"
																								value="${sp.getDeliveryTime()}"
																								class="form-control" required>
																						</div>

																						<div class="form-group text-center">
																							<input type="submit" value="Cập nhật">
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
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
	</div>
</body>
</html>