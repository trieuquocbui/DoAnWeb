<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh Sách Đơn Hàng</title>
<!-- Google Font: Source Sans Pro -->
 <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.min.css">
  
  
  <link rel="stylesheet" href="css/style.min.css">
  
  
  
  
  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  
  
</head>
<body>

	
	<div class="content-wrapper">
	
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<a href="/admin/management/staff/list"><h1>Danh Sách Đơn Hàng</h1></a>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/admin/home">Trang Chủ</a></li>
							<li class="breadcrumb-item active">Danh sách nhân viên</li>
						</ol>
						
						
					</div>

				</div>
				
				<div class="row mb-2">
					<div class="col-sm-6">
					
					
						<div class="btn-group">
						
						
						<a type="submit"   class="btn btn-primary"  data-toggle="tab" href="#menu0" >Đang Xử Lý</a>
						<a  type="submit" class="btn btn-primary"  data-toggle="tab" href="#menu1"  >Đã Duyệt</a>
						<a  type="submit" class="btn btn-primary"  data-toggle="tab" href="#menu2">Đã Hủy</a>
						<a  type="submit" class="btn btn-success" onclick="reloadPage()" ><i class="fas fa-bolt"></i></a>
					</div>
					</div>
					

				</div>
				
			</div>
			
		</section>
		
<div class="tab-content">
    <div id="menu0" class="tab-pane fade in active">
		
		<section class="content">
			<form  id="formSubmit" method="get">
				<div class="container-fluid">
					<div class="row" style="justify-content: center;"></div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Tìm Kiếm</h3>

								<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 250px;">
										<input type="text" name="search" id="search"
											value="${paging.search}" class="form-control float-right"
											placeholder="Search">
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table class="table  table-striped table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>NGÀY LẬP</th>
											<th>TRẠNG THÁI</th>
											<th>TÊN KHÁCH HÀNG</th>
											<th>TỔNG TIỀN</th>
											
											<th><a type="text"
												class=" float-right" style="color: red"> Cập Nhật Trạng Thái </a></th>
										</tr>
									</thead>

									<tbody id="myTable">
										<c:forEach var="bill" items="${listBill0}">
											<tr>
												<td>${bill.getId()}</td>
												<td>${bill.getApplicableDate()}</td>
												<td>Chờ Xử Lý</td>
												<td></td>
												<td></td>
												
												<td><a class="btn btn-primary float-right" style="margin: 0 2px; background: #eb7512;color: white;" data-toggle="modal"
													data-target="#modal-edit-${bill.getId()}"> <i class="fas fa-edit"></i>
												</a> 
												
											</tr>
											
											<!--  000000000000000000000000000 -->
											<div class="modal fade" id="modal-edit-${bill.getId()}" tabindex="-1"
												role="dialog" aria-hidden="true">
												<div class="modal-dialog  modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header" style="background: #eb7512;color: white;" >
															<h4 class="modal-title" id="myCenterModalLabel">Cập Nhật Trạng Thái Đơn Hàng	</h4>
															<button type="button" class="btn btn-default" 
																data-dismiss="modal">Đóng</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<div class="col-12">
																	<div class="bg-primary-dark block block-h-auto">
																		<div class="row edit-product-row">

																					<form class="contener1-fix" action="/management/admin/order/update" modelAttribute="billUpdate" method="POST">
																						<div class="col-sm-12">
																							<!-- Các trường dữ liệu đơn hàng -->
																							<h1>/admin/order/update/${bill.getId()} </h1>
																							<div class="form-group">
																								<label for="maDonHang">Mã đơn hàng</label> <input
																									type="text" class="form-control" id="maDonHang"
																									name="maDonHang" readonly
																									value="${bill.getId()}">
																							</div>
																							<div class="form-group">
																								<label for="tenKhachHang">Tên khách hàng</label>
																								<input type="text" class="form-control"
																									id="tenKhachHang" name="tenKhachHang"
																									value="Nguyễn Thành Trung">
																							</div>
																							<div class="form-group">
																								<label for="trangThai">Trạng thái</label> 
																								<select 
																									class="form-control" id="trangThai"
																									name="trangThai">
																									<option value="1">Duyệt Đơn Hàng</option>
																									<option value="2">Hủy Đơn Hàng</option>

																								</select>
																							</div>
																							<!-- Nút cập nhật đơn hàng -->
																							<button type="submit"
																								class="btn btn-primary float-right btn-lg">Cập
																								nhật</button>
																						</div>

																					</form>

																				</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
										
							
										</c:forEach>
									
									</tbody>
								</table>
								


							</div>

						</div>
						<!-- /.card-body -->
							<div class="card-footer clearfix">
								<ul id="pagination-demo" class="pagination-lg"></ul>
								<input type="hidden" value="1" id="page" name="page" /> <input
									type="hidden" value="1" id="limit" name="limit" />
							</div>
						</div>
						<!-- /.card -->
					</div>
				
			</form>

		</section>

    </div>
    
    <div id="menu1" class="tab-pane fade ">
     
     
		<section class="content">
			<form  id="formSubmit" method="get">
				<div class="container-fluid">
					<div class="row" style="justify-content: center;"></div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Tìm Kiếm</h3>

								<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 250px;">
										<input type="text" name="search" id="search"
											value="${paging.search}" class="form-control float-right"
											placeholder="Search">
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table class="table  table-striped table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>NGÀY LẬP</th>
											<th>TRẠNG THÁI</th>
											<th>TÊN KHÁCH HÀNG</th>
											<th>TỔNG TIỀN</th>
											
											<th><a type="text"
												class=" float-right" style="color: red"> Cập Nhật Trạng Thái </a></th>
										</tr>
									</thead>

									<tbody id="myTable">
										<c:forEach var="bill" items="${listBill1}">
										
											<tr>
											
												<td>${bill.getId()}</td>
												<td>${bill.getApplicableDate()}</td>
												<td>Đã Duyệt</td>
												<td></td>
												<td></td>
												
												<td><a class="btn btn-primary float-right" style="margin: 0 2px; background: #eb7512;color: white;" data-toggle="modal"
													data-target="#modal-edit-${bill.getId()}"> <i class="fas fa-edit"></i>
												</a> 
												
											</tr>
											
											<!--  000000000000000000000000000 -->
											<div class="modal fade" id="modal-edit-${bill.getId()}" tabindex="-1"
												role="dialog" aria-hidden="true"> 
												<div class="modal-dialog  modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header" style="background: #eb7512;color: white;" >
															<h4 class="modal-title" id="myCenterModalLabel">Cập Nhật Trạng Thái Đơn Hàng	</h4>
															<button type="button" class="btn btn-default" 
																data-dismiss="modal">Đóng</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<div class="col-12">
																	<div class="bg-primary-dark block block-h-auto">
																		<div class="row edit-product-row">
																		
																		
																			<form class="contener1-fix"  action="/management/admin/order/update" modelAttribute="billUpdate"  method="POST">
																				<div class="col-sm-12">
																					<!-- Các trường dữ liệu đơn hàng -->
																					<div class="form-group">
																						<label for="maDonHang">Mã đơn hàng</label> <input
																							type="text" class="form-control" id="maDonHang"
																							name="maDonHang" readonly
																							value="${bill.getId()}">
																					</div>
																					<div class="form-group">
																						<label for="tenKhachHang">Tên khách hàng</label> <input
																							type="text" class="form-control"
																							id="tenKhachHang" name="tenKhachHang"
																							value="Nguyễn Thành Trung">
																					</div>
																					<div class="form-group">
																						<label for="trangThai">Trạng thái</label> <select
																							class="form-control" id="trangThai"
																							name="trangThai">
																							<option value="1">Duyệt Đơn Hàng</option>
																							<option value="2">Hủy Đơn Hàng</option>

																						</select>
																					</div>
																					<!-- Nút cập nhật đơn hàng -->
																					<button type="submit"
																						class="btn btn-primary float-right btn-lg">Cập
																						nhật</button>
																				</div>
																				
																			</form>

																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
										
							
										</c:forEach>
									
									</tbody>
								</table>
								


							</div>

						</div>
						<!-- /.card-body -->
							<div class="card-footer clearfix">
								<ul id="pagination-demo" class="pagination-lg"></ul>
								<input type="hidden" value="1" id="page" name="page" /> <input
									type="hidden" value="1" id="limit" name="limit" />
							</div>
						</div>
						<!-- /.card -->
					</div>
				
			</form>

		</section>
     
    </div>
    
    <div id="menu2" class="tab-pane fade">
    
		<section class="content">
			<form  id="formSubmit" method="get">
				<div class="container-fluid">
					<div class="row" style="justify-content: center;"></div>
					<div class="col-md-12">
						<div class="card">
							<div class="card-header">
								<h3 class="card-title">Tìm Kiếm</h3>

								<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 250px;">
										<input type="text" name="search" id="search"
											value="${paging.search}" class="form-control float-right"
											placeholder="Search">
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
								<table class="table  table-striped table-hover">
									<thead>
										<tr>
											<th>ID</th>
											<th>NGÀY LẬP</th>
											<th>TRẠNG THÁI</th>
											<th>TÊN KHÁCH HÀNG</th>
											<th>TỔNG TIỀN</th>
											
											<th><a type="text"
												class=" float-right" style="color: red"> Cập Nhật Trạng Thái </a></th>
										</tr>
									</thead>

									<tbody id="myTable">
										<c:forEach var="bill" items="${listBill2}">
											<tr>
												<td>${bill.getId()}</td>
												<td>${bill.getApplicableDate()}</td>
												<td>Đã Hủy</td>
												<td></td>
												<td></td>
												
												<td><a class="btn btn-primary float-right" style="margin: 0 2px; background: #eb7512;color: white;" data-toggle="modal"
													data-target="#modal-edit-${bill.getId()}"> <i class="fas fa-edit"></i>
												</a> 
												
											</tr>
											
											<!--  000000000000000000000000000 -->
											<div class="modal fade" id="modal-edit-${bill.getId()}" tabindex="-1"
												role="dialog" aria-hidden="true">
												<div class="modal-dialog  modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-header" style="background: #eb7512;color: white;" >
															<h4 class="modal-title" id="myCenterModalLabel">Cập Nhật Trạng Thái Đơn Hàng	</h4>
															<button type="button" class="btn btn-default" 
																data-dismiss="modal">Đóng</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<div class="col-12">
																	<div class="bg-primary-dark block block-h-auto">
																		<div class="row edit-product-row">
																		
																			<form class="contener1-fix"  action="/management/admin/order/update" modelAttribute="billUpdate" method="POST">
																				<div class="col-sm-12">
																					<!-- Các trường dữ liệu đơn hàng -->
																					<div class="form-group">
																						<label for="maDonHang">Mã đơn hàng</label> <input
																							type="text" class="form-control" id="maDonHang"
																							name="maDonHang" readonly
																							value="${bill.getId()}">
																					</div>
																					<div class="form-group">
																						<label for="tenKhachHang">Tên khách hàng</label> <input
																							type="text" class="form-control"
																							id="tenKhachHang" name="tenKhachHang"
																							value="Nguyễn Thành Trung">
																					</div>
																					<div class="form-group">
																						<label for="trangThai">Trạng thái</label> <select
																							class="form-control" id="trangThai"
																							name="trangThai">
																							<option value="1">Duyệt Đơn Hàng</option>
																							<option value="2">Hủy Đơn Hàng</option>

																						</select>
																					</div>
																					<!-- Nút cập nhật đơn hàng -->
																					<button type="submit"
																						class="btn btn-primary float-right btn-lg">Cập
																						nhật</button>
																				</div>
																				
																			</form>

																		</div>
																	</div>
																</div>

															</div>
														</div>
													</div>
												</div>
											</div>
										
							
										</c:forEach>
									
									</tbody>
								</table>
								


							</div>

						</div>
						<!-- /.card-body -->
							<div class="card-footer clearfix">
								<ul id="pagination-demo" class="pagination-lg"></ul>
								<input type="hidden" value="1" id="page" name="page" /> <input
									type="hidden" value="1" id="limit" name="limit" />
							</div>
						</div>
						<!-- /.card -->
					</div>
				
			</form>

		</section>
     
     
    </div>
    
  </div>
</div>


	
	

	<script>
		var totalPages = $
		{
			paging.totalPage
		};
		var currentPage = $
		{
			paging.page
		};
		$('#pagination-demo').twbsPagination({
			totalPages : totalPages,
			visiblePages : 10,
			startPage : currentPage,
			onPageClick : function(event, page) {
				if (currentPage != page) {
					$('#limit').val(1);
					$('#page').val(page);
					$('#formSubmit').submit();
				}
			}
		});
	</script>
<script>
    function reloadPage() {
      location.reload();
    }
  </script>

<script>
$(document).ready(function(){
  $("#search").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>

	<script
		src="<c:url value='/templates/admin/plugins/jquery/jquery.min.js'/>"></script>
	<!-- Bootstrap 4 -->
	<script
		src="<c:url value='/templates/admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
	<!-- SweetAlert2 -->
	<script
		src="<c:url value='/templates/admin/plugins/sweetalert2/sweetalert2.min.js'/>"></script>
	<!-- Toastr -->
	<script
		src="<c:url value='/templates/admin/plugins/toastr/toastr.min.js'/>"></script>
	<!-- AdminLTE App -->
	<script src="<c:url value='/templates/admin/dist/js/adminlte.min.js'/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<c:url value='/templates/admin/dist/js/demo.js'/>"></script>
	<!-- Page specific script -->
</body>
</html>