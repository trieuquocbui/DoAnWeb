<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Khách Hàng</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
	.table-container {
		margin-top: 20px;
	}
	.table-search-group {
		margin-bottom: 10px;
	}
	.table-title {
		margin-bottom: 10px;
	}
</style>
</head>
<body>
<div class="content-wrapper">
	<section class="content">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body">
							<div class="table-container">
								<div class="table-search-group">
									<input type="text" name="" class="form-control table-search" id="customer-searchField" placeholder="Tìm kiếm thông tin Khách Hàng" onkeyup="searchTable('customer-searchField', 'table_Customer')">
								</div>
								<h1 class="table-title text-center">Bảng danh sách khách hàng</h1>
								<div class="table-wrap">
									<table class="table table-striped" id="table_Customer">
										<thead>
											<tr>
												<th>Mã khách hàng</th>
												<th>Họ và tên</th>
												<th>Giới tính</th>
												<th>Email</th>
												<th>Số điện thoại</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="kh" items="${customers}">
												<tr>
													<td>${kh.id}</td>
													<td>${kh.surname}${kh.name}</td>
													<td>${kh.gender}</td>
													<td>${kh.account.email}</td>
													<td>${kh.phoneNumber}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->
				</div>
			</div>
		</div>
	</section>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>