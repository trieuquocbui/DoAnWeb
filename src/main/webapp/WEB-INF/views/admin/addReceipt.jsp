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
							<input style="display: flex; width: 400px" class="form-control"
								id="myInput" type="text" placeholder="Search..">
						</div>

						<br>
						<form action="/management/admin/detail_Receipt" method="post">
							<div style="overflow: scroll; height: 300px;">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Mã Sản Phẩm</th>
											<th>Tên Sản Phẩm</th>
											<th>Hình Ảnh</th>
											<th>Chọn</th>
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
												<td><input type="checkbox" name="selectedProducts"
													value="${sp.id}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div style="display: flex; justify-content: flex-end;">
						<button type="button" class="btn btn-success" id="btnThemSP"
							style="margin-right: 20px">Thêm Sản Phẩm</button>

						<button type="submit"  class="btn btn-success" id="btnCTPhieuNhap">CT
							Phiếu Nhập</button>
					</div>
						</form>
					</div>
					
				</div>



			</div>
			<br>
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

	<!-- sự kiện bấm nút sẽ chuyển sang view khác -->
	<script>
		$(document).ready(function() {
			$("#btnCTPhieuNhap").click(function() {
				window.location.href = "detail_Receipt";
			});
		});
	</script>

	<script>
		$(document).ready(function() {
			$("#btnThemSP").click(function() {
				window.location.href = "detail_Receipt";
			});
		});
	</script>
</body>

</html>
