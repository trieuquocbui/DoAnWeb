<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ page import="javax.swing.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý khuyến mãi</title>
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
							<h1>Danh sách khuyến mãi</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Promotion</li>
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
										<form action="/WebBanKinh/admin/promotionForProduct">
											<button type="submit" class="btn btn-primary float-right">Áp
												dụng khuyến mãi</button>
										</form>
									</div>
								</div>
								<div class="card-body table-responsive p-2">
									<table id="example1"
										class="table table-bordered table-striped text-nowrap">
										<thead>
											<tr>
												<th scope="col">Mã</th>
												<th scope="col">Tên Khuyến Mãi</th>
												<th scope="col">Ngày Bắt Đầu</th>
												<th scope="col">Ngày Kết Thúc</th>
												<th scope="col">Mức Khuyến Mãi</th>
												<th><button type="button"
														class="btn btn  btn-success float-right"
														style="color: white" data-toggle="modal"
														data-target="#add-promotion-modal">Thêm Khuyến
														Mãi</button></th>
												<th scope="col"></th>
											</tr>
										</thead>

										<tbody id="myTable">
											<c:forEach var="km" items="${promotionlist}">
												<tr>
													<td>${km.getId()}</td>
													<td>${km.getName()}</td>
													<td><fmt:formatDate value="${km.getStartDate()}"
															pattern="dd-MM-yyyy" /></td>
													<td><fmt:formatDate value="${km.getEndDate()}"
															pattern="dd-MM-yyyy" /></td>
													<td>${km.getPromotionLitmit()*100}%</td>
													<td><a class="btn btn-danger float-right"
														style="margin: 0 2px;" data-toggle="modal"
														data-target="#modal-delete-${km.getId()}"> <i
															class="fas fa-trash"></i></a> <a
														class="btn btn-info float-right" style="margin: 0 2px;"
														data-toggle="modal"
														data-target="#modal-edit-${km.getId()}"> <i
															class="fas fa-edit"></i></a></td>
													<td><button type="button"
															class="btn btn-primary float-right" data-toggle="modal"
															data-target="#modal-${km.getId()}">Xem sản phẩm</button></td>
												</tr>

												<div class="modal fade" id="modal-delete-${km.getId()}">
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
																<p>Xác nhận xóa khuyến mãi</p>
															</div>
															<div class="modal-footer  ">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
																<a href="promotion/Delete?makm=${km.getId()}"
																	type="button" class="btn btn-primary float-right">Đồng
																	ý</a>

															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>



												<div class="modal fade" id="modal-edit-${km.getId()}"
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
																					action="/WebBanKinh/admin/promotion/Edit">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="makm">Mã</label> <input type="text"
																								name="makm" value="${km.getId()}"
																								class="form-control" readonly>
																						</div>
																						<div class="form-group">
																							<label for="tenkm">Tên</label> <input type="text"
																								name="ten" value="${km.getName()}"
																								class="form-control" required>
																						</div>
																						<div class="form-group">
																							<label for="muckm">Mức Khuyến Mãi</label> <input
																								type="text" name="muckm"
																								value="${km.getPromotionLitmit()}"
																								class="form-control" required>
																						</div>

																					</div>
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="ngaybd">Ngày Bắt Đầu</label> <input
																								type="date" name="ngaybd" class="form-control"
																								value="<fmt:formatDate value='${km.getStartDate()}' pattern='yyyy-MM-dd' />">
																						</div>
																						<div class="form-group">
																							<label for="ngaykt">Ngày Kết Thúc</label> <input
																								type="date" name="ngaykt" class="form-control"
																								value="<fmt:formatDate value='${km.getEndDate()}' pattern='yyyy-MM-dd' />">
																						</div>

																						<div class="col-md-auto">
																							<button type="submit"
																								class="btn btn-primary btn-block" name="update"
																								value="update"
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

												<div class="modal fade" id="modal-${km.getId()}"
													tabindex="-1" role="dialog"
													aria-labelledby="modalLabel-${km.getId()}"
													aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content ">
															<div class="  modal-header "
																style="background: #2c83e0; color: white;">
																<h4 class="modal-title ">Danh sách sản phẩm được áp
																	dụng khuyến mãi</h4>
																<button type="button" class="close" data-dismiss="modal"
																	aria-label="Close">
																	<span aria-hidden="true">&times;</span>
																</button>
															</div>
															<div class="modal-body">
																<div class="product-list">
																	<c:forEach var="up" items="${listDetailsUpdatePrice}">
																		<div class="product-item">
																			<div class="product-thumbnail">
																				<img width="50" height="50"
																					src="<c:url value='/templates/image/product/${up.product.getId()}.jpg'/>">
																			</div>
																			<div class="product-details">
																				<h5 class="product-name">${up.product.getName()}</h5>
																				<p class="product-id">Mã sản phẩm:
																					${up.product.getId()}</p>
																				<form class="contener1-fix" method="POST"
																					action="/WebBanKinh/admin/promotionForProduct/AddPromotionForProduct">
																					<input type="hidden" name="makm"
																						value="${km.getId()}"> <input
																						type="hidden" name="masp"
																						value="${up.product.getId()}">
																					<button type="submit" class="btn btn-primary">Thêm
																						sản phẩm</button>
																				</form>
																			</div>
																		</div>
																	</c:forEach>
																</div>

															</div>

														</div>
													</div>
												</div>




											</c:forEach>
										</tbody>
										<div class="modal fade" id="add-promotion-modal" tabindex="-1"
											role="dialog" aria-labelledby="add-promotion-modal-label"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="add-product-modal-label">Thêm
															khuyến mãi</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form method="POST"
															action="/WebBanKinh/admin/promotion/Add">
															<div class="form-group">
																<label for="makm">Mã</label> <input type="text"
																	name="makm" placeholder="Nhập mã khuyến mãi"
																	class="form-control" required>
															</div>
															<div class="form-group">
																<label for="tenkm">Tên</label> <input type="text"
																	name="ten" placeholder="Nhập tên khuyến mãi"
																	class="form-control" required>
															</div>
															<div class="form-group">
																<label for="muckm">Mức Khuyến Mãi</label> <input
																	type="text" name="muckm"
																	placeholder="Nhập mức khuyến mãi (tính theo phần trăm)"
																	class="form-control" required>
															</div>
															<div class="form-group">
																<label for="ngaybd">Ngày Bắt Đầu</label> <input
																	type="date" name="ngaybd" class="form-control">
															</div>
															<div class="form-group">
																<label for="ngaykt">Ngày Kết Thúc</label> <input
																	type="date" name="ngaykt" class="form-control">
															</div>
															<button type="submit" class="btn btn-primary btn-block"
																name="add"
																onclick="return confirm('Bạn có chắc muốn thêm khuyến mãi không ?')">Thêm</button>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Đóng</button>
													</div>
												</div>
											</div>
										</div>
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
	</div>
</body>
</html>