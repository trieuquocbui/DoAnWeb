<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
									<input type="text" name="" class="form-control table-search" placeholder="Tìm kiếm Nhà Cung Cấp">
								</div>
								<h1 class="table-title text-center">Bảng danh sách nhà cung cấp</h1>
								<div class="table-wrap">
									<table class="table table-striped">
										<thead>
											<tr>
												<th>Mã Nhà Cung Cấp</th>
												<th>Tên</th>
												<th>Số điện thoại</th>
												<th>Địa chỉ</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="ncc" items="${suppliers}">
												<tr>
													<td>${ncc.id}</td>
													<td>${ncc.name}</td>
													<td>${ncc.phoneNumber}</td>
													<td>${ncc.address}</td>
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