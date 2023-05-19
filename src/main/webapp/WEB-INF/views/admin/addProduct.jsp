<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm sản phẩm</title>
</head>
<body>
	<%@ include file="/common/admin/nav.jsp" %>
	<div class="content-wrapper">
		 <!-- Content Header (Page header) -->
		 <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Thêm sản phẩm mới vào cơ sở dữ liệu</h1>
          </div>
         </div>
      </div>
    </section>
     <!-- end Content Header (Page header) -->
     
     <!-- Main content -->
     <section class="content">
     	 <div class="container-fluid">
     	 	 <div class="row" style="justify-content: center;">
     	 	 		<div class="col-md-8">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tạo sản phẩm</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form:form modelAttribute="addProdcut"  method="POST" enctype="multipart/form-data">
                <div class="card-body">
                
               
				<spring:bind path="name">
					<div class="form-group">
                    <label for="exampleInputEmail1">Tên sản phẩm</label>
                    <form:input type="text" class="form-control" path="name" id="exampleInputEmail1" placeholder=""/>
                  </div>
                  <form:errors path="name"></form:errors>
				</spring:bind>

				<spring:bind path="description">
					<div class="form-group">
                    <label for="exampleInputEmail1">Mô tả</label>
                    <form:textarea class="form-control" path="description" id="exampleInputEmail1" placeholder=""/>
                  </div>
                  <form:errors path="description"></form:errors>
				</spring:bind>
				
				
				
				<spring:bind path="category">
				<div class="form-group" style="display: flex;flex-direction: column;">
				<label for="exampleInputEmail1">Loại sản phẩm</label>
					<form:select style="height: 40px;font-size: 20px;" path="category" items="${categorys}" itemLabel="id" itemValue="id"></form:select>
                  </div>
                  <form:errors path="category"></form:errors>
				</spring:bind>
                
                </div>
                <!-- /.card-body -->
 				<c:if test="${not empty message}"><div>${message}</div> </c:if>
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Tạo</button>
                </div>
              </form:form>
              
             
             
            </div>
            <!-- /.card -->
     	 	 </div>
     	 </div>
     </div>
     </section>
    
	</div>
	
	
</body>
</html>