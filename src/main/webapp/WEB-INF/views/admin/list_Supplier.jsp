<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrapper">

		<section class="content">
 
			<div class="container-fluid">
				<div class="row" style="justify-content: center;"></div>
				<div class="col-md-12">
					<div class="card">

						<div class="card-body">
							<div class="table-container">
								<div class="table-search-group">
									<input type="text" name="" class="table-search"
										placeholder="Tìm kiếm Nhà Cung Cấp" />

								</div>
								<h1 class="table-title">Bảng danh sách nhà cung cấp</h1>
								<div class="table-wrap">
									<table class="table table-striped">
										<tr class="table-row">
											<th class="table-heading">Mã Nhà Cung Cấp</th>
											<th class="table-heading">Tên</th>
											<th class="table-heading">Số điện thoại</th>
											<th class="table-heading">Địa chỉ</th>
											
										</tr>
										<c:forEach var="ncc" items="${suppliers}">
											<tr class="table-row">
												<td class="table-data">${ncc.id}</td>
												<td class="table-data">${ncc.name}</td>
												<td class="table-data">${ncc.phoneNumber}</td>
												<td class="table-data">${ncc.address}</td>
												
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<!-- /.card-body -->

					</div>
					<!-- /.card -->
				</div>
			</div>

		</section>

	</div>
</body>
</html>