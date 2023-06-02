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
										id="customer-searchField" placeholder="Tìm kiếm Phiếu Nhập"
										onkeyup="searchTable('customer-searchField', 'table_Customer')" />

								</div>
								<h1 class="table-title">Bảng danh sách Phiếu Nhập</h1>
								<div class="table-wrap">
									<table class="table table-striped">
										<tr class="table-row">
											<th class="table-heading">Mã Phiếu Nhập</th>
											<th class="table-heading">Ngày nhập</th>
											<th class="table-heading">Nhà cung cấp</th>

										</tr>
										<c:forEach var="pn" items="${receipts}">
											<tr class="table-row">
												<td class="table-data">${pn.id}</td>
												<td class="table-data">${pn.importDate}</td>
												<td class="table-data">${pn.supplier.name}</td>
												<td><a type="button"
													class="btn btn  btn-success float-right"
													style="color: white" data-toggle="modal"
													data-target="#modal-${pn.id}"> Chi tiết </a>

													<div class="modal fade" id="modal-${pn.id}">
														<div class="modal-dialog modal-lg">
															<div class="modal-content ">
																<div class="  modal-header "
																	style="background: #2c83e0; color: white;">
																	<h4 class="modal-title ">Thông Tin Phiếu Nhập</h4>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<div class="card card-primary card-outline">
																		<div class="card-body box-profile">

																			<div class="container">
																				<div class="row">
																					<div class="col col-sm-12" style="margin-top: 40px;">
																						<div class="table-wrap">
																							<table class="table table-striped">
																								<tr class="table-row">
																									<th class="table-heading">Tên Sản Phẩm</th>
																									<th class="table-heading">Số lượng</th>
																									<th class="table-heading">Giá nhập</th>

																								</tr>
																								<c:forEach var="sp" items="${receiptDao.getListProduct_From_Reeipt(pn.getId())}">
																									<tr class="table-row">
																										<td class="table-data">${sp.getKey().getName()}</td>
																										<td class="table-data">${sp.getValue()}</td>
																										<td class="table-data">${receiptDao.getPriceofSeri(pn.getId(), sp.getKey().getId())}</td>
																									</tr>
																								</c:forEach>
																							</table>

																						</div>
																					</div>

																				</div>
																			</div>


																		</div>
																		<!-- /.card-body -->
																	</div>
																</div>
																<!-- <div class="modal-footer ">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">Đóng</button>
														</div> -->

															</div>
															<!-- /.modal-content -->
														</div>
														<!-- /.modal-dialog -->
													</div></td>

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