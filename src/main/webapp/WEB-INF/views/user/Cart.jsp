<%@ include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:url var="newURL" value="/user/cart?checkboxValues="/>
<c:url var="confirmBuyURL" value="/user/confirm?checkboxValues="/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Giỏ hàng</title>
</head>
<body>
	 			
	 <div class="col l-12">
                    <table class="listSanPham" id="table">
                        <tbody>
                            <tr>
                                <th>Chọn mua</th>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Thành tiền</th>
                                
                                <th>Xóa</th>
                            </tr>
                            <tr>
                            	
                            	
                            	<c:choose>
    								<c:when test="${NoDetailsCart}">
       									<td colspan="7"> 
                                    		<h1 style="color:green; background-color:white; font-weight:bold; text-align:center; padding: 15px 0;">
                                       		 Giỏ hàng trống !!
                                    		</h1> 
                               		 	</td>
       	
   									 </c:when>    
    								<c:otherwise>
    								
    								<c:forEach items="${cart}" var="dc">
    								 <tr>
    									<td>	
    											<input type="checkbox" id="selectBuy" name="selectBuy" value="${dc.id}" onclick="updateCheckbox(this)">
    										
    									</td>
                                    <td class="noPadding imgHide">
                                        <a target="_blank" href="chitietsanpham.html?Huawei-Nova-2i" title="Xem chi tiết">
                                            ${dc.getDetailsUpdatePrice().getProduct().getName()}
                                            <img src="https://cdn.tgdd.vn/Products/Images/42/157031/samsung-galaxy-a6-2018-2-600x600.jpg">
                                        </a>
                                    </td>
                                    <td class="alignRight">${dc.getDetailsUpdatePrice().getPrice()} ₫</td>
                                    <td class="soluong">
                                        <button ><i class="fa fa-minus" onclick="redirectPage(`<c:url value='/user/cart/${dc.id}/except'/>`)"></i></button>
                                        <input size="1" onchange="capNhatSoLuongFromInput(this, 'Hua3')" value="${dc.quantity }">
                                        <button ><i class="fa fa-plus"  onclick="redirectPage(`<c:url value='/user/cart/${dc.id}/add'/>`)"></i></button>
                                    </td>
                                    <td class="alignRight">${dc.getDetailsUpdatePrice().getPrice() * dc.getQuantity()} ₫</td>
                                    
                                    <td class="noPadding"> <i class="fa fa-trash" onclick="redirectPage(`<c:url value='/user/cart/remove/${dc.id}'/>`)"></i> </td>
    								 </tr>
    								</c:forEach>
    								
    						
       									<tr style="font-weight:bold; text-align:center">
                                			
                                			<td colspan="5" class="thanhtoan" onclick="confirmBuyProducts()"> Xác nhận </td>
                                			<td class="xoaHet" onclick="redirectPage(`<c:url value='/user/cart/remove/all'/>`)"> Xóa hết </td>
                            			</tr>	
       										
    								</c:otherwise>
								</c:choose>
                                
                            </tr>

                            
                        </tbody></table>
                    
                </div>
                
                <script type="text/javascript">
                
                function confirmBuyProducts(){
                	var selectedCheckboxes = $('input[name="selectBuy"]:checked').map(function() {
                	    return $(this).val();
                	}).get();
                	
                	window.location.href = '${confirmBuyURL}' + selectedCheckboxes
                }
               
                 
                
                function updateCheckbox(checkbox) {
                	
                	var selectedCheckboxes = $('input[name="selectBuy"]:checked').map(function() {
                	    return $(this).val();
                	}).get();
                	
                	$.ajax({
                        type: "GET",
                        url: '${newURL}' + selectedCheckboxes,
                        success: function(response) {
                       
                        }
                    });

                        
                }
                
                </script>
        
</body>
</html>