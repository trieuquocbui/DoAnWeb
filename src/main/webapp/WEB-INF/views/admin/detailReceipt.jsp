<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section class="content">

			<div class="container-fluid">
				<div class="row" style="justify-content: center;"></div>
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							<h3 class="card-title">Chi Phiếu nhập hàng</h3>
						</div>
						<!-- /.card-header -->



						<!-- select -->
						<div class="card-body">
							<form:form modelAttribute="receipt" method="POST" id="receipt"
								action="/admin/management/receipt/add">
								<div class="col-sm-6">
									<div class="form-group">
										<spring:bind path="id">
											<div class="form-group">
												<label for="exampleInputEmail1">Mã phiếu nhập</label>
												<form:input type="text" path="id" />
											</div>
											<form:errors path="id"></form:errors>
											<c:if test="${error != '' }">
											${error}</c:if>
										</spring:bind>

									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<spring:bind path="supplier">
											<div class="form-group">
												<label for="exampleInputEmail1">Nhà cung cấp</label>
												<form:select class="custom-select" path="supplier"
													items="${suppliers}" itemLabel="name" itemValue="id"></form:select>
											</div>
											<form:errors path="supplier"></form:errors>
										</spring:bind>

									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<spring:bind path="date">
											<div class="form-group">
												<label for="exampleInputEmail1">Ngày lập</label>
												<form:input type="date" path="date" />
											</div>
											<form:errors path="date"></form:errors>
										</spring:bind>
									</div>
								</div>


								<div class="col-sm-12">

									<table id="id_table" class="table table-head-fixed text-nowrap">
										<thead>
											<tr>
												<th>Tên sản phẩm</th>
												<th>Số lượng</th>
												<th>Đơn giá</th>

											</tr>
										</thead>

										<c:forEach items="${receipt.getDetailsReceipts()}" var="dr"
											varStatus="loop">
											<tr>
												<td><spring:bind
														path="detailsReceipts[${loop.index}].product">
														<div class="form-group">

															<form:select class="custom-select"
																path="detailsReceipts[${loop.index}].product"
																items="${products}" itemLabel="name" itemValue="id"></form:select>
														</div>
														<form:errors path="detailsReceipts[${loop.index}].product"></form:errors>
													</spring:bind></td>

												<td><spring:bind
														path="detailsReceipts[${loop.index}].quantity">
														<div class="form-group">
															<form:input class="form-control" type="number"
																path="detailsReceipts[${loop.index}].quantity" />
														</div>
														<form:errors
															path="detailsReceipts[${loop.index}].quantity"></form:errors>
													</spring:bind></td>

												<td><spring:bind
														path="detailsReceipts[${loop.index}].priceImport">
														<div class="form-group">
															<form:input class="form-control" type="text"
																path="detailsReceipts[${loop.index}].priceImport" />
														</div>
														<form:errors
															path="detailsReceipts[${loop.index}].priceImport"></form:errors>
													</spring:bind></td>
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
							</form:form>

						</div>

					</div>
				</div>
			</div>


		</section>
</body>
</html>