<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.swing.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Khuyến mãi sản phẩm</title>
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
							<h1>Danh sách sản phẩm</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Product</li>
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
								<div class="card-header">
									<div>
										<form class="d-inline-flex">
											<input name="searchInput" id="myInput"
												class="form-control me-2" type="search" placeholder="Search"
												aria-label="Search">
										</form>
									</div>
								</div>
								<div class="card-body table-responsive p-2">
									<table id="example1"
										class="table table-bordered table-striped text-nowrap">
										<thead>
											<tr>
												<th scope="col">Mã sản phẩm</th>
												<th scope="col">Mã khuyến mãi</th>
												<th></th>
											</tr>
										</thead>
										<tbody id="myTable">
											<c:forEach var="pr" items="${listDetailsPromotion}">

												<tr>
													<td>${pr.product.getId()}</td>
													<td>${pr.promotion.getId()}</td>

													<td>
														
													</td>
												</tr>
							
											</c:forEach>
										</tbody>
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