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
														src="<c:url value='/templates/admin/dist/img/${up.product.getImage()}'/>"></td>
													<td>${up.getPrice()}</td>
													<td><fmt:formatDate value="${up.id.applicableDate}"
															pattern="dd-MM-yyyy" /></td>
													<td><a
														class="btn btn-primary float-right" style="color: white"
														data-toggle="modal"
														data-target="#modal-${up.product.getId()}"><i>Xem chi tiết</i>
													</a></td>
													<td>
														<button type="button" class="btn btn  btn-success float-right" style="color: white"
															data-toggle="modal"
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
																							src="<c:url value='/templates/admin/dist/img/${up.product.getImage()}'/>"
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
																						<li class="list-group-item"><b>Giá</b> <a
																							class="float-right text-primary">${up.getPrice()}</a>
																						</li>
																						<li class="list-group-item"><b>Thời gian
																								bảo hành</b> <a class="float-right text-primary">${up.product.getWarrantyPeriod()}</a>
																						</li>
																						<li class="list-group-item"><b>Thời gian
																								trả hàng</b> <a class="float-right text-primary">${up.product.getDeliveryTime()}</a>
																						</li>
																						<li class="list-group-item"><b>Người cập nhật</b>
																							<a class="float-right text-primary">${up.staff.getName()}</a>
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
																	action="/management/admin/updatePrice/Update">
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
																			src="<c:url value='/templates/admin/dist/img/${up.product.getImage()}'/>">
																	</div>
																	<div class="form-group">
																		<label for="ngayapdunggiasp">Ngày áp dụng</label> <input
																			type="date" name="ngayapdung"
																			value="<fmt:formatDate value='${up.id.applicableDate}' pattern='yyyy-MM-dd' />"
																			class="form-control" readonly>
																	</div>
																	<div class="form-group">
																		<label for="giaht">Giá hiện tại</label> <input
																			type="text" name="giaht" value="${up.getPrice()}"
																			class="form-control" readonly>
																	</div>
																	<div class="form-group">
																		<label for="giasp">Giá mới</label> <input type="text"
																			name="gia" placeholder="Nhập giá mới sản phẩm"
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

	</div>
</body>
</html>