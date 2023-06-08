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
<title>Khuyến mãi sản phẩm</title>
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
							<h1>Danh sách sản phẩm khuyến mãi</h1>
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
								</div>
								<div class="card-body table-responsive p-2">
									<table id="example1"
										class="table table-bordered table-striped text-nowrap">
										<thead>
											<tr>
												<th scope="col">Mã sản phẩm</th>
												<th scope="col">Mã khuyến mãi</th>
												<th scope="col"></th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="pr" items="${listDetailsPromotion}">

												<tr>
													<td>${pr.product.getId()}</td>
													<td>${pr.promotion.getId()}</td>
													<td><c:if test="${pr.isStatus() == false}">
															<a class="btn btn-info float-right"
																style="margin: 0 2px;" data-toggle="modal"
																data-target="#modal-updateStatusTrue-${pr.product.getId()}-${pr.promotion.getId()}">
																<i class="fas fa-edit">Áp dụng</i>
															</a>
														</c:if> <c:if test="${pr.isStatus() == true}">
															<a class="btn btn  btn-success float-right"
																style="margin: 0 2px;" data-toggle="modal"
																data-target="#modal-updateStatusFalse-${pr.product.getId()}-${pr.promotion.getId()}"><i
																class="fas fa-edit" style="cursor: default;">Đã
																	áp dụng</i></a>
														</c:if></td>
												</tr>
												<div class="modal fade"
													id="modal-updateStatusTrue-${pr.product.getId()}-${pr.promotion.getId()}"
													tabindex="-1" role="dialog" aria-hidden="true">
													<div class="modal-dialog modal-lg modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header"
																style="background: #eb7512; color: white;">
																<h4 class="modal-title" id="myCenterModalLabel">Áp
																	dụng khuyến mãi cho sản phẩm</h4>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Đóng</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col-12">
																		<div class="bg-primary-dark block block-h-auto">
																			<div class="row edit-product-row">
																				<form class="contener1-fix" method="POST"
																					action="/management/admin/promotionForProduct/UpdateStatusTruePromotionForProduct">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="masp">Mã sản phẩm</label> <input
																								type="text" name="masp"
																								value="${pr.product.getId()}"
																								class="form-control" readonly>
																						</div>
																					</div>
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="makm">Mã khuyến mãi</label> <input
																								type="text" name="makm"
																								value="${pr.promotion.getId()}"
																								class="form-control" readonly>
																						</div>
																						<div class="col-md-auto">
																							<button type="submit"
																								class="btn btn-primary btn-block" name="update"
																								value="update"
																								onclick="return confirm('Bạn có chắc muốn áp dụng khuyến mãi cho sản phẩm này ?')">Áp dụng</button>
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
												<div class="modal fade"
													id="modal-updateStatusFalse-${pr.product.getId()}-${pr.promotion.getId()}"
													tabindex="-1" role="dialog" aria-hidden="true">
													<div class="modal-dialog modal-lg modal-dialog-centered">
														<div class="modal-content">
															<div class="modal-header"
																style="background: #eb7512; color: white;">
																<h4 class="modal-title" id="myCenterModalLabel">Hủy áp
																	dụng khuyến mãi cho sản phẩm</h4>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Đóng</button>
															</div>
															<div class="modal-body">
																<div class="row">
																	<div class="col-12">
																		<div class="bg-primary-dark block block-h-auto">
																			<div class="row edit-product-row">
																				<form class="contener1-fix" method="POST"
																					action="/management/admin/promotionForProduct/UpdateStatusFalsePromotionForProduct">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="masp">Mã sản phẩm</label> <input
																								type="text" name="masp"
																								value="${pr.product.getId()}"
																								class="form-control" readonly>
																						</div>
																					</div>
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="makm">Mã khuyến mãi</label> <input
																								type="text" name="makm"
																								value="${pr.promotion.getId()}"
																								class="form-control" readonly>
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