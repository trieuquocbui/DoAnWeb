<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chi tiết sản phẩm</title>
</head>
<body>
	<div class="col l-12">
	<h2>${product.name}</h2>
	
	</div>
	<div class="col l-4">
		<div class="dp_image">
			<img
				src="">
		</div>
	</div>
	<div class="col l-4">
		<div class="dp_sale">
			<div class="dp_area_price">
				<strong>${product.getPrice() }</strong>
			</div>
			<div class="dp_area_promo">
				<strong>khuyến mãi</strong>
				<div class="dp_promo">
					<img src="./image/icon-tick.png">
					<div id="detailPromo">Khách hàng sẽ được thử máy miễn phí tại
						cửa hàng. Có thể đổi trả lỗi trong vòng 2 tháng.</div>
				</div>
			</div>
			<div class="dp_policy">
				<div class="dp_policy_infor">
					<img src="./image/box.png">
					<p>Trong hộp có: Sạc,Sách hướng dẫn...</p>
				</div>
				<div class="dp_policy_infor">
					<img src="./image/box.png">
					<p>Bảo hành chính hãng 12 tháng.</p>
				</div>
				<div class="dp_policy_infor">
					<img src="./image/box.png">
					<p>1 đổi 1 trong 1 tháng nếu lỗi, đổi sản phẩm tại nhà trong 1
						ngày.</p>
				</div>
			</div>

			<div class="dp_area_order">
				<a href="<c:url value='/user/cart/${product.id}'/>" class="dp_buy_now"> <b><i class="fa fa-cart-plus"></i>
						Thêm vào giỏ hàng</b>
					
				</a>
			</div>
		</div>
	</div>
	<div class="col l-4">
		<div class="info_product">
			<h2>Thông tin sản phẩm</h2>
			<ul class="info">
				<li>
					<p>Hãng</p>
					<div>${product.branch}</div>
				</li>
				<li>
					<p>Màu màu sắc</p>
					<div>${product.color}</div>
				</li>
				<li>
					<p>Số lượng</p>
					<div>${quantity}</div>
				</li>
			
			</ul>
		</div>
	</div>
</body>
</html>