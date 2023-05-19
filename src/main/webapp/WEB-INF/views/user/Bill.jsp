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
		<table class="listSanPham" id="table">
			<tbody>
				<tr>
					<th colspan="6">
						<h3 style="text-align: center;">Phiếu đặt hàng ngày: ${date}</h3>
					</th>
				</tr>
				<tr>
					<th>STT</th>
					<th>Sản phẩm</th>
					<th>Giá</th>
					<th>Số lượng</th>
					<th>Thành tiền</th>
				</tr>
				<c:forEach var="dc" items="${listProduct}" varStatus="loop">
					<tr>
						<td>${loop.index + 1 }</td>
						<td class="noPadding imgHide"><a target="_blank"
							href="chitietsanpham.html?Xiaomi-Redmi-Note-5"
							title="Xem chi tiết">
								${dc.getDetailsUpdatePrice().getProduct().getName()} <img
								src="img/products/xiaomi-redmi-note-5-pro-600x600.jpg">
						</a></td>
						<td class="alignRight">${dc.getDetailsUpdatePrice().getPrice()}
							₫</td>
						<td class="soluong">${dc.quantity }</td>
						<td class="alignRight">${dc.getDetailsUpdatePrice().getPrice() * dc.getQuantity()}₫</td>

					</tr>
				</c:forEach>
				<tr style="font-weight: bold; text-align: center; height: 4em;">
					<td colspan="4">TỔNG TIỀN:</td>
					<td class="alignRight">${sumMoney}</td>

				</tr>
			</tbody>
		</table>
		<div class="body-lienhe">
			<div class="lienhe-info">
				<div class="guithongtin">
					<p style="font-size: 22px; color: gray">Gửi thông tin liên lạc
						cho chúng tôi:</p>
					<hr>
					<form name="formlh" action="/user/bill/confirm" method="post">
						<table cellspacing="10px"
							style="display: flex; justify-content: center;">
							<tbody>
								<tr>
									<td>Họ</td>
									<td><input type="text" name="h" size="40" maxlength="40"
										value="${customer.surname}" placeholder="Họ tên"
										autocomplete="off" required
										style="width: 100%; border: 1px solid;"></td>
								</tr>
								<tr>
									<td>Tên</td>
									<td><input type="text" name="t" size="40" maxlength="40"
										value="${customer.name}" placeholder="Họ tên"
										autocomplete="off" required
										style="width: 100%; border: 1px solid;"></td>
								</tr>
								<tr>
									<td>Điện thoại liên hệ</td>
									<td><input type="text" name="sdt" size="40" maxlength="11"
										value="${customer.phoneNumber}" minlength="10"
										placeholder="Điện thoại" required
										style="width: 100%; border: 1px solid;"></td>
								</tr>

								<tr">
									<td>Địa chỉ</td>
									<td><textarea name="dc" rows="5" cols="42" maxlength="500"
											value="${customer.address}" wrap="physical"
											placeholder="Địa chỉ" required style="width: 100%"></textarea></td>
								</tr>
								<tr>
									<td>Ghi chú</td>
									<td><textarea name="nd" rows="5" cols="42" maxlength="500"
											wrap="physical" placeholder="Nội dung liên hệ" required=""
											style="width: 100%"></textarea></td>
								</tr>
								<tr>
									<td></td>
									<td><button style="height: 40px; width: 100%;">Gửi
											thông tin</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="col l-12">
		Ship nội thành 35k,Ship ngoại thành 50
	</div>
</body>
</html>