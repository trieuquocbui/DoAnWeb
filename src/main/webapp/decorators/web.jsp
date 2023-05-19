<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href='<c:url value="/templates/user/assets/css/grid.css" />'>
<link rel="stylesheet" href='<c:url value="/templates/user/assets/css/base.css" />'>
<link rel="stylesheet" href='<c:url value="/templates/user/assets/css/index.css" />'>
<link rel="stylesheet" href='<c:url value="/templates/user/assets/css/detailsProduct.css"/>'>
<link rel="stylesheet" href='<c:url value="/templates/user/assets/css/cart.css"/>'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" crossorigin="anonymous" />
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<c:url value='/templates/admin/paging/jquery.twbsPagination.js'/>"></script>

<link href='https://fonts.googleapis.com/css?family=Lato:300,400|Montserrat:700' rel='stylesheet' type='text/css'>
	

</head>
<body>
	<div class="main">
		<div class="grid wide">
			<%@ include file="/common/user/header.jsp"%>

			<div class="content">
				<div class="row">
					
					<decorator:body></decorator:body>
					
				</div>
			</div>

			<%@ include file="/common/user/footer.jsp"%>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script src="<c:url value='/templates/user/assets/js/handlePageHome.js'/>"></script>
</body>
</html>