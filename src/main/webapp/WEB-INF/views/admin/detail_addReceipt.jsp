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
		<form:form class="a" action="/management/admin/detail_Receipt"
			modelAttribute="detail_receipt" method="POST">
			<div class="row">
				<div class="col-sm-5">
					<label for="state">Nhà cung cấp</label> <select name="supplier"
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
						<label for="ngaySinh">Ngày Nhập</label> <input name="ngaynhap"
							value="${ngaynhap}" class="form-control" required readonly>

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
							<td>${dr.product.name}</td>
							<td><input type="number" class="soLuongInput" name="soLuong"
								value="1"></td>
							<td><input type="number" class="giaInput" name="gia"
								value="10.0"></td>

						</tr>

					</c:forEach>
					<tr>
						<td></td>
						<td></td>
						<td>Tổng tiền: </td>
					</tr>
				</table>

			</div>
			<div class=row style="justify-content: end;">

				<div class="col-2">
					<button type="submit"  class="btn btn-primary">Xác nhập</button>

				</div>
			</div>






		</form:form>

	</div>
	<script>
    function getDetailReceipt() {
        var detailReceiptList = [];

        // Lấy tất cả các trường số lượng và giá nhập
        var soLuongInputs = document.getElementsByClassName("soLuongInput");
        var giaInputs = document.getElementsByClassName("giaInput");

        // Duyệt qua các trường số lượng và giá nhập
        for (var i = 0; i < soLuongInputs.length; i++) {
            var soLuong = parseInt(soLuongInputs[i].value);
            var gia = parseFloat(giaInputs[i].value);

            // Tạo đối tượng DetailReceiptItem và thêm vào danh sách
            var detailReceiptItem = {
                soLuong: soLuong,
                gia: gia
            };
            detailReceiptList.push(detailReceiptItem);
        }

        // Trả về danh sách số lượng và giá
        return detailReceiptList;
    }

    // Sử dụng hàm getDetailReceipt() để lấy danh sách số lượng và giá nhập khi cần thiết
    document.querySelector("a").addEventListener("submit", function (event) {
        // Ngăn chặn hành vi mặc định của form (không gửi request đi)
        event.preventDefault();

        // Gọi hàm getDetailReceipt() để lấy danh sách số lượng và giá nhập
        var detailReceiptList = getDetailReceipt();
        console.log(detailReceiptList);
        

        // Gửi form đi
        this.submit();
    });
    
    
</script>
	
</body>

</html>