<%@ include file="/common/taglib.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="confirmBuyURL" value="receipt/confirm?listQuantity=" />
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
				<label for="state">Nhà cung cấp</label> <select name="supplier"
					id="mySelect" class="custom-select d-block w-100" id="state"
					required>
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
					<label for="ngaySinh">Ngày Nhập</label> <input name="date"
						id="date" value="${ngaynhap}" class="form-control" required
						readonly>

				</div>
			</div>

		</div>


		<hr>

		<div class="col-sm-12">

			<table id="id_table" class="table table-head-fixed text-nowrap">
				<thead>
					<tr>
						<th>Tên sản phẩm</th>
						<th>Số lượng</th>
						<th>Giá nhập</th>
						
					</tr>
				</thead>

				<c:forEach items="${detail_receipt}" var="dr" varStatus="loop">
					<tr>
						<td>${dr.product.name}<input type="text" class=""
							name="id" hidden="true" value="${dr.product.id}">
						</td>
						<td><input type="number" class="soLuongInput" name="soLuong"
							value="1"></td>
						<td><input type="number" class="giaInput" name="gia"
							value="10.0"></td>

					</tr>
					

				</c:forEach>
				<!-- <tr>
					<td></td>
					<td></td>
					<td>Tổng tiền: <span id="total"></span></td>
				</tr> -->
			</table>

		</div>
		<div class=row style="justify-content: end;">

			<div class="col-2">
				<button class="btn btn-primary" onclick="confirm()">Xác
					nhập</button>

			</div>
		</div>



	</div>
	<script type="text/javascript">
		function layGiaTri() {
			var selectElement = document.getElementById("mySelect"); // Lấy phần tử select bằng id
			var giaTri = selectElement.value; // Lấy giá trị của phần tử select
			return giaTri;
		}

		function getIds() {
			let inputs = document.getElementsByName("id");
			var giaTri = [];
			for (var i = 0; i < inputs.length; i++) {
				giaTri.push(inputs[i].value);
			}
			return giaTri;
		}

		function getQuantities() {
			let inputs = document.getElementsByName("soLuong");
			var giaTri = [];
			for (var i = 0; i < inputs.length; i++) {
				giaTri.push(inputs[i].value);
			}

			return giaTri;
		}

		function getPrices() {
			let inputs = document.getElementsByName("gia");
			var giaTri = [];
			for (var i = 0; i < inputs.length; i++) {
				giaTri.push(inputs[i].value);
			}

			return giaTri;
		}

		function getDate() {
			let input = document.getElementById("date");
			return input.value;
		}

		function confirm() {
			let listQuantitys = this.getQuantities();
			let listPrices = this.getPrices();
			let ids = this.getIds();
			let date = this.getDate();
			let supplier = this.layGiaTri();
			console.log(listQuantitys);
			console.log(listPrices);

			window.location.href = '${confirmBuyURL}' + listQuantitys
					+ "&listPrice=" + listPrices + "&ids=" + ids + "&date="
					+ date + "&supplier=" + supplier

			/* $.ajax({
			 type: "POST",
			 url: '${confirmBuyURL}' + listQuantitys + "&listPrice=" + listPrices + "&ids=" + ids + "&date=" + date,
			 success: function(response) {
			
			}}) */
		}

		
	</script>

</body>

</html>