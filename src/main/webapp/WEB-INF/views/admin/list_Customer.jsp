<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>


<script src="<c:url value='/WEB-INF/tool_js/' />"></script>
<meta charset="UTF-8">
<!-- <title>Danh Sách Khách Hàng</title> -->
<!-- <link
	href="/Web/src/main/webapp/WEB-INF/resources/common/table.css'/>"
	rel="stylesheet" /> -->
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
										id="customer-searchField"
										placeholder="Tìm kiếm thông tin Khách Hàng"
										onkeyup="searchTable('customer-searchField', 'table_Customer')" />
									
								</div>
								<h1 class="table-title">Bảng danh sách khách hàng</h1>
								<div class="table-wrap">
									<table class="table table-striped">
										<tr class="table-row">
											<th class="table-heading">Mã khách hàng</th>
											<th class="table-heading">Họ và tên</th>
											<th class="table-heading">Giới tính</th>
											<th class="table-heading">Email</th>
											<th class="table-heading">Số điện thoại</th>
										</tr>
										<c:forEach var="kh" items="${customers}">
											<tr class="table-row">
												<td class="table-data">${kh.id}</td>
												<td class="table-data">${kh.surname}${kh.name }</td>
												<td class="table-data">${kh.gender}</td>
												<td class="table-data">${kh.account.email}</td>
												<td class="table-data">${kh.phoneNumber}</td>
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