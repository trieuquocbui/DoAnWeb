<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height: auto;">
<head>
<meta charset="UTF-8">
<title><decorator:title default="Home"></decorator:title></title>


	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href='<c:url value="/templates/admin/plugins/fontawesome-free/css/all.min.css" />' >
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href='<c:url value="/templates/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css" />'>
 	
 
  <!-- Theme style -->
  <link rel="stylesheet" href='<c:url value="/templates/admin/dist/css/adminlte.min.css" />'>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="<c:url value='/templates/admin/paging/jquery.twbsPagination.js'/>"></script>
   
    <!-- Vẽ biểu đồ -->
    <!-- Tải các tệp CSS của Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<!-- Tải thư viện Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
	<!-- Tải các tệp JavaScript của Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
   
</head>
<body class="sidebar-mini sidebar-closed sidebar-collapse" style="height: auto;">
	
	<div class="wrapper">
		
		<%@ include file="/common/admin/nav.jsp" %>	
		
		<decorator:body></decorator:body>
		
		<%@ include file="/common/admin/sidebar.jsp" %>
		
		<%@ include file="/common/admin/footer.jsp" %>	
		
	</div>

	<script src="<c:url value='/templates/admin/plugins/jquery/jquery.min.js'/>"></script>
<!-- Bootstrap -->
<script src="<c:url value='/templates/admin/plugins/bootstrap/js/bootstrap.bundle.min.js'/>"></script>
<!-- overlayScrollbars -->
<script src="<c:url value='/templates/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js'/>"></script>
<!-- AdminLTE App -->
<script src="<c:url value='/templates/admin/dist/js/adminlte.js'/>"></script>


<!-- jQuery Mapael -->
<script src="<c:url value='/templates/admin/plugins/jquery-mousewheel/jquery.mousewheel.js'/>"></script>
<script src="<c:url value='/templates/admin/plugins/raphael/raphael.min.js'/>"></script>
<script src="<c:url value='/templates/admin/plugins/jquery-mapael/jquery.mapael.min.js'/>"></script>
<script src="<c:url value='/templates/admin/plugins/jquery-mapael/maps/usa_states.min.js'/>"></script>
<!-- ChartJS -->
<script src="<c:url value='/templates/admin/plugins/chart.js/Chart.min.js'/>"></script>

<!-- AdminLTE for demo purposes -->
<script src="<c:url value='/templates/admin/dist/js/demo.js'/>"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="<c:url value='/templates/admin/dist/js/pages/dashboard2.js'/>"></script>
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
</body>
</html>