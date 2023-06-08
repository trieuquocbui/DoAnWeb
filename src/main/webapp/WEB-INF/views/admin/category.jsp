<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản lý danh mục</title>
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
							<h1>Danh sách danh mục</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Category</li>
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
								<div class="card-header"></div>
								<div class="card-body table-responsive p-2">
									<table id="example1"
										class="table table-bordered table-striped text-nowrap">
										<thead>
											<tr>
												<th scope="col">Mã</th>
												<th scope="col">Tên Danh Mục</th>
												<th><button type="button"
														class="btn btn-primary float-right" data-toggle="modal"
														data-target="#add-category-modal">Thêm</button></th>

											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="dm" items="${categorylist}">

												<tr>
													<td><h5 class="product-name">${dm.getName()}</h5>
														<p class="product-id" style="font-style: bold;">Mã danh mục: ${dm.getId()}</p></td>

													<td><a class="btn btn-danger float-right"
														style="margin: 0 2px;" data-toggle="modal"
														data-target="#modal-delete-${dm.getId()}"> <i
															class="fas fa-trash"></i></a> <a
														class="btn btn-info float-right" style="margin: 0 2px;"
														data-toggle="modal"
														data-target="#modal-edit-${dm.getId()}"> <i
															class="fas fa-edit"></i></a></td>
												</tr>

												<div class="modal fade" id="modal-delete-${dm.getId()}">
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
																<p>Xác nhận xóa danh mục</p>
															</div>
															<div class="modal-footer  ">
																<button type="button" class="btn btn-secondary"
																	data-dismiss="modal">Đóng</button>
																<a href="category/Delete?madm=${dm.getId()}"
																	type="button" class="btn btn-primary float-right">Đồng
																	ý</a>

															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal-dialog -->
												</div>

												<div class="modal fade" id="modal-edit-${dm.getId()}"
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
																					action="/management/admin/category/Edit">
																					<div class="col-md-6">
																						<div class="form-group">
																							<label for="madm">Mã</label> <input type="text"
																								name="madm" value="${dm.getId()}"
																								class="form-control" readonly>
																						</div>
																						<div class="form-group">
																							<label for="tendm">Tên</label> <input type="text"
																								name="ten" value="${dm.getName()}"
																								class="form-control" required>
																						</div>
																					</div>
																					<button type="submit"
																						class="btn btn-primary btn-block" name="update"
																						onclick="return confirm('Bạn có chắc muốn cập nhật ?')">Cập
																						nhật</button>
																					<br>
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
										<div class="modal fade" id="add-category-modal" tabindex="-1"
											role="dialog" aria-labelledby="add-category-modal-label"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="add-category-modal-label">Thêm
															danh mục sản phẩm</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form method="POST"
															action="/management/admin/category/Add">
															<div class="form-group">
																<label for="madm">Mã</label> <input type="text"
																	name="madm" placeholder="Nhập mã danh mục"
																	class="form-control" required>
															</div>
															<div class="form-group">
																<label for="tendm">Tên</label> <input type="text"
																	name="ten" placeholder="Nhập tên danh mục"
																	class="form-control" required>
															</div>
															<button type="submit" class="btn btn-primary btn-block"
																name="add"
																onclick="return confirm('Bạn có chắc muốn thêm danh mục không ?')">Thêm</button>
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
		<script type="text/javascript">
			$(document).ready(function() {
				bsCustomFileInput.init();
			});
		</script>
	</div>
</body>
</html>