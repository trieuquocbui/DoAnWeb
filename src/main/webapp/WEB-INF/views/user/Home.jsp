<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
</head>
<body>
	<div class="col l-2">
		<%@ include file="/common/user/nav.jsp"%>
	</div>
	<div class="col l-10">
		<div class="row">
			<div class="col l-12">
				<div class="tool">
					<div class="row">
						<div class="col l-2">
							<div class="dropdown">
								<button class="dropbtn">Sắp xếp giá</button>
								<div class="dropdown-content">
									<a href="#">Tăng dần</a> <a href="#">Giảm dần</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col l-12 mt-20">
				<div class="listProdcuct">
					<div class="row">
						<c:forEach var="product" items="${listOfProduct}">
							<div class="col l-3">
								<div class="product">
									<img class="product__img"
										src="https://cdn.tgdd.vn/Products/Images/42/22701/dien-thoai-di-dong-Nokia-1280-dienmay.com-l.jpg"
										alt="">
									<h1 class="roduct__bracnh">${product.branch}</h1>
									<h2 class="roduct__name">${product.name}</h2>
									<div class="product__price">
										<strong> 
											${product.getPrice()}
										</strong>
									</div>
									 <div class="product__tooltip">
                                            <button class="product__tooltip--btn" onclick="">
                                                <span class="product__tooltip--text" onclick="redirectPage(`<c:url value='/user/product/${product.id}'/>`)">Chi tiết sản phẩm</span>
                                            </button>
                                      </div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<div class="col l-12">
				
				<c:choose>
   					<c:when test="${checkCategoryId != null}">
   						<form action="<c:url value='/user/home/${checkCategoryId}'/>" id="formSubmit" method="get">
								<div class="card-footer clearfix">
								<ul id="pagination-demo" class="pagination-lg"></ul>
								<input type="hidden" value="1" id="page" name="page" /> <input
									type="hidden" value="1" id="limit" name="limit" />
							</div>
						</form>
   					</c:when>
   					
   					<c:when test="${checkSearch != null}">
   						<form action="<c:url value='/user/home?search=${checkSearch}'/>" id="formSubmit" method="get">
								<div class="card-footer clearfix">
								<ul id="pagination-demo" class="pagination-lg"></ul>
								<input type="hidden" value="1" id="page" name="page" /> <input
									type="hidden" value="1" id="limit" name="limit" />
							</div>
						</form>
   					</c:when> 
   					
   					<c:otherwise>
   						<form action="<c:url value='/user/home'/>" id="formSubmit" method="get">
							<div class="card-footer clearfix">
								<ul id="pagination-demo" class="pagination-lg"></ul>
								<input type="hidden" value="1" id="page" name="page" /> <input
									type="hidden" value="1" id="limit" name="limit" />
							</div>
						</form>
   					</c:otherwise>    
				</c:choose>
			
				
			</div>
		</div>
	</div>
	
	
	<script>
		
		var totalPages = ${paging.totalPage};
		var currentPage = ${paging.page};
	
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
	
</body>
</html>