<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<title>Nhập sản phẩm về kho</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>


	<div class="container">
		<div class="row">
			<div class="col col-sm-12">
				<h2 class="text-center my-4">Chi tiết phiếu nhập</h2>
			</div>


		</div>
		<hr>
		<div class="row">
			<div class="col-sm-5">
				<label for="state">Nhà cung cấp</label> <select
					class="custom-select d-block w-100" id="state" required>
					<option value="">-- Chọn nhà cung cấp --</option>
					<c:forEach var="ncc" items="${suppliers}">
					<option value="${ncc.id}">${ncc.name}</option>
					</c:forEach>
				</select>
			</div>


		</div>
		<hr>
		<div class="row">
			<div class="col col-sm-5">
				<div class="form-group">
					<label for="ngaySinh">Ngày Nhập</label> <input 
						name="ngaySinh" value="${ngaynhap}"
						class="form-control" required readonly>

				</div>
			</div>

		</div>


		<hr>

		<div class="col-sm-12">

									<table id="id_table"  class="table table-head-fixed text-nowrap">
										<thead>
											<tr>
												<th>Tên sản phẩm</th>
												<th>Số lượng</th>
												<th>Tổng tiền</th>
											</tr>
										</thead>

										<c:forEach items="${list_p}" var="p">
											<tr>
												<td >${p}</td>
												<td >${1}</td>
												<td >${1}</td>
											</tr>

										</c:forEach>
											<tr>
												<td></td>
												<td></td>
												<td>Tổng tiền: ${receipt.sumMoney}</td>
											</tr>
									</table>

								</div>
								<div class=row style="justify-content: end;">

									<div class="col-2">
										<button type="submit" class="btn btn-primary">Xác
											nhập</button>

									</div>
								</div>








	</div>
</body>

</html>