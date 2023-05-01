<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hoá đơn</title>
</head>
<body>
	 			
	 <div class="col l-12">
	 		<div>	${sumMoney}</div>
                   
                   	
                   	<c:forEach items="${listProduct}" var="p">
                   		<div>${p.id}</div>
            
                   	</c:forEach>
       </div>
</body>
</html>