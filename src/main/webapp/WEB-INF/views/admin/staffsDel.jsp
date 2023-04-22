<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Danh sách nhân viên</title>
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
  
  
  
  
  
  
  
  
  <link rel="stylesheet" href="<c:url value='/templates/css/alertify.min.css'/>" />
  
  
  
</head>
<body>
	
	<div class="content-wrapper">
	
		<section class="content-header">
			<div class="container-fluid">
				<div class="row mb-2">
					<div class="col-sm-6">
						<a href="/admin/management/staff/list"><h1>Danh Sách Nhân Viên</h1></a>
					</div>
					<div class="col-sm-6">
						<ol class="breadcrumb float-sm-right">
							<li class="breadcrumb-item"><a href="/admin/home">Trang Chủ</a></li>
							<li class="breadcrumb-item active">Danh sách nhân viên</li>
						</ol>
					</div>

				</div>
			</div>
		</section>


		<section class="content">
			<div >
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
											<th>HỌ VÀ TÊN</th>
											<th>GIỚI TÍNH</th>
											<th>SĐT</th>
											<th>EMAIL</th>
											<th>CHỨC VỤ</th>
											<th></th>
										</tr>
									</thead>

									<tbody id="myTable">
										<c:forEach var="staff" items="${listStaff}">
											<tr>
												<td>${staff.getId()}</td>
												<td>${staff.getName()}</td>
												<td>${staff.getGender()?"Nam":"Nữ"}</td>
												
												
												<td>${staff.getPhoneNumber()}</td>
												<td>${staff.account.getEmail()}</td>
												<td>${staff.account.role.getName()}</td>
												<td>
												<!-- href="/admin/management/staff/edit?id=${staff.getAccount().getEmail()}" -->
												 <a
													class="btn btn-success float-right" style="margin: 0 2px;" data-toggle="modal"
													data-target="#modal-default-${staff.getId()} "> <i class="fas fa-trash-restore"></i></a>
											</tr>
											
											
								<div class="modal fade" id="modal-default-${staff.getId()}">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header " style="background: #3ba453;color: white;">
												<h4 class="modal-title">Thông báo</h4>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
											<div class="modal-body">
												<h5>Khôi phục cho nhân viên <strong> ${staff.getName()}</strong> tiếp tục làm việc</h5>
											</div>
											

															<form method="post" "
																action="/management/admin/staff/restore/${staff.getAccount().getEmail()}">
																<div class="modal-footer">

																	<button type="submit" class="btn-green btn btn-primary">Đồng Ý</button>


																</div>
															</form>
																												
												
											
										</div>
										<!-- /.modal-content -->
									</div>
									<!-- /.modal-dialog -->
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
				
			</div>

		</section>

	
	
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
document.querySelector('.custom-file-input').addEventListener('change', function(e) {
  var fileName = e.target.files[0].name; // Lấy tên tệp vừa chọn
  document.getElementById('thongbao').innerHTML = 'Đã chọn file: ' + fileName; // Hiển thị thông báo
});
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