<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Lập Phiếu Nhập</title>
</head>

<body>
	<div class="content-wrapper">

		<section class="content">

			<div>
				<h1 style="display: flex; justify-content: center">Lập Phiếu
					Nhập Hàng</h1>
			</div>

			<div class="container-fluid">
				<div class="row" style="justify-content: center;"></div>
				<div class="col-md-12">
					<div class="card">
						<br>
						<div>
							<input style="display: flex; width: 400px" class="form-control" id="myInput"
								type="text" placeholder="Search..">
						</div>
						<%-- <div style="display: flex; justify-content: space-around;">
							<div>
								<input style="width: 200px" class="form-control" id="myInput"
									type="text" placeholder="Search..">
							</div>
							<div>
								<label>Ngày nhập </label> <input disabled="disabled" type="text"
									name="importDate" value="${ngaynhap}" />
							</div>

							<div>
								<label>Nhà cung cấp </label> <select style="width: 200px"
									name="supplier" id="id_supplier">
									<c:forEach items="${suppliers}" var="ncc">
										<option value="${ncc.id}">${ncc.name}</option>
									</c:forEach>
								</select>
							</div>

						</div> --%>

						<br>
						<div style="overflow: scroll; height: 300px">
							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>Mã Sản Phẩm</th>
										<th>Tên Sản Phẩm</th>
										<th>Hình Ảnh</th>
									</tr>
								</thead>
								<tbody id="myTable">
									<c:forEach var="sp" items="${products}">
										<tr>
											<td>${sp.id}</td>
											<td>${sp.name}</td>
											<td>
												<div>
													<img style="width: 70px; height: 50px" alt=""
														src="<c:url value='/templates/image/${sp.image}'/>">
												</div>
											</td>
											<td><a type="button"
												class=" btn btn-info btn-lg btn-success float-right"
												style="color: white" data-toggle="modal"
												data-target="#myModal"> <i
													class="fa fa-fw fa-plus-circle" aria-hidden="true"></i>
											</a>

												<div class="modal fade" id="myModal" role="dialog">
													<div class="modal-dialog">

														<!-- Modal content-->
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">Thông báo</h4>
															</div>
															<div class="modal-body">
																<p>Đã thêm vào CTPN</p>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">Close</button>
															</div>
														</div>

													</div>
												</div></td>
										</tr>









										<%-- <div class="modal fade" id="modal-add-${sp.id}" tabindex="-1"
											role="dialog" aria-hidden="true">
											<div class="modal-dialog modal-lg modal-dialog-centered">
												<div class="modal-content">
													<div class="modal-header"
														style="background: #0f982e; color: white;">
														<h4 class="modal-title" id="myCenterModalLabel">Nhập
															thêm sản phẩm đã có</h4>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Đóng</button>
													</div>
													<div class="modal-body">
														<div class="row">
															<div class="col-12">
																<div class="bg-primary-dark block block-h-auto">
																	<div class="row edit-product-row">
																		<form class="contener1-fix" method="POST"
																			action="/management/admin/add-receipt">
																			<div class="col-md-12">
																				<div class="form-group">
																					<label for="id">ID Sản Phẩm</label> <input
																						disabled="disabled" type="text" name="id"
																						value="${sp.id}" class="form-control" required>
																				</div>

																				<input type="hidden" name="importDate"
																					value="${ngaynhap}" /> <input type="hidden"
																					name="supplier" value="${ncc.id}" />


																				<div class="form-group">
																					<label for="id">Tên Sản Phẩm</label> <input
																						disabled="disabled" type="text" name="name"
																						value="${sp.name}" class="form-control" required>
																				</div>
																				<div class="form-group">
																					<label for="id">Số Lượng Cần Nhập</label> <input
																						type="text" name="soluong" value=""
																						class="form-control" required>
																				</div>
																				<div class="form-group">
																					<label for="id">Giá Nhập Vào</label> <input
																						type="text" name="gia" value=""
																						class="form-control" required>
																				</div>


																				<div class="form-group text-center">
																					<button type="submit"
																						class="btn btn-primary btn-lg btn-block">Xác
																						nhận</button>
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

				 --%>
									</c:forEach>

								</tbody>

							</table>

						</div>
						<div style="display: flex; justify-content: flex-end;">
							<button type="button" class="btn btn-success"
								style="margin-right: 20px">Thêm Sản Phẩm</button>
							<button type="button" class="btn btn-success">CT Phiếu
								Nhập</button>
						</div>
					</div>



				</div>
				<br>

			</div>
		</section>
	</div>
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
</body>

</html>
