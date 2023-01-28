<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 상세</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

</head>
<style>
#contentAll {
	font-size: 18px;
}

.center {
	text-align: center;
}

.right {
	text-align: right;
}

.left {
	text-align: left;
}

.title {
	font-size: 3em;
	font-weight: bold;
	text-align: center;
}

.subtitle {
	font-size: 2em;
	font-weight: 600;
}

.subtitleline {
	border-bottom: 2px solid black;
	padding-top: 2px;
	padding-bottom: 13px;
}

.productlist table, .delivery table, .payInfo table {
	width: 100%;
	border-top: 2px solid black;
	text-align: center;
	vertical-align: middle;
}

.productlist th, .delivery th {
	height: 55px;
	font-weight: normal;
	background-color: #F7F7F7;
}

.productlist td {
	border-bottom: 2px solid #F7F7F7;
	height: 160px;
	padding: 10px;
}

.delivery td {
	height: 70px;
}
.payment tbody>tr {
	font-size: 25px;
	height: 100px;
	
}

.payInfo td {
	height: 70px;
	border-bottom: 2px solid #F7F7F7;
	text-align: left;
	padding-left: 30px;
}

.real-price{
	text-decoration: line-through;
	color: grey;
	font-weight: 700;
	font-size: 15px;
	margin: 0;
}
.price-style{
	font-weight: 700;
	font-size: 25px;
}

.blackbtn {
	background-color: black;
	color: white;
	margin-top: 30px;
	font-size: 20px;
}

.blackbtn:hover {
	border: 1px solid black;
	background-color: white;
	color: black;
}

.whitebtn {
	border: 1px solid black;
	background-color: white;
}

.whitebtn:hover {
	border: 1px solid grey;
	background-color: grey;
	color: white;
}

#deliveryInfo input, .phoneSelect select {
	height: 60px;
	display: inline-block;
	margin-bottom: 5px;
	border-radius: 0;
}

.red {color: red;}

/* #modal-addr.modal-dialog {
  width: 100%;
  height: 100%;
  border-radius: 0; 
}
#modal-addr.modal-content {
  height: auto;
  min-height: 50%;
  border-radius: 0; 
} */
.modal-header {
	background-color: black;
	color: white;
	height: 65px;
}

#modal-addr .modal-footer {
	height: 130px;
	border-top: none;
	text-align: center;
}

#modal-addr table {
	width: 100%;
	border-top: 2px solid black;
}
#modal-addr td {
	
	border-bottom: 2px solid #F7F7F7;
	
}
#modal-addr tr{
	height: 160px;
}

#modal-addr .whitebtn,#modal-addr .blackbtn {
	width: 300px; height: 50px;
}

#modal-addr input[type=radio] {
	height: 100px;
	margin-right: 20px;
}

#modal-addr label {
	position: relative;
	margin-top: 15px;
}
#deliveryInfo .form-group1{
	margin-bottom: 10;}

</style>


<script>
function numberWithCommas(val) {
	   return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

window.onload = function(){
	const date = new Date('${vo.orderDate}');
	console.log("주문일:" + date);
	console.log('date : ${vo.orderDate}');
	date.setDate(date.getDate() + 2);
	console.log(date);
	var strDate = date.toISOString();
	var subDate = strDate.substr(0, 10);
	subDate += ' 23:59 까지'
	console.log(subDate);
	document.getElementById('date').innerHTML= subDate;
}


//var result1 = str.substr(0, 2);
</script>
<body>
<%---${vo} --%>
<%--${productList } --%> 

<%@ include file="/common/style.jspf"%>

<c:choose>
	<c:when test="${empty member }">
		<%@include file = "/common/guestMenu.jspf" %>	
	</c:when>	
	<c:when test="${not empty member }">
		<c:if test="${member.admin eq 'ADMIN' }">
			<%@include file = "/common/adminMenu.jspf" %>
		</c:if>
		<c:if test="${member.admin eq 'NORMAL' }">
			<%@include file = "/common/MemberMenu.jspf" %>
		</c:if>
	</c:when>
</c:choose>

	<%@include file = "/common/main.jspf" %>
	<div class="container-filid notosanskr" id="contentAll">
		<div class="col-8 offset-2">
			<p class="title py-5 my-5">주문 취소 내역</p>
			<div style="display:inline;">
				<div style="display:inline; ">
					<span class="subtitle">주문 상품</span> 총 <span
						style="font-weight: bold;">${productListCnt }</span>건
				</div>
				<div style="float: right; display:inline; margin-top: 20px;">주문번호 : ${vo.orderNum}</div>
			</div>
			
<!-- 상품정보 form name="productListForm"--------------------------------------------------------------------->		

				<div class="productlist">
					<table>
						<thead>
							<tr>
								<th style="width: 55%;">상품정보</th>
								<th>상품금액</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="pvo" items="${productList }">
							<tr>
								<td>
									<div class="left" style="vertical-align: middle;">
										<img class="mx-3" style="display: inline-block; float: left;"
											src="${pageContext.request.contextPath}/imgs/${pvo.photo }"
											width="90" height="90" alt="상품사진">
										<div class="my-3" style="display: inline; font-size: 15px; ">
											<p style="font-weight: bold;">${pvo.productName}</p>
											<p>옵션<span style="color:grey;"> ${pvo.productOption }</span> &nbsp;&nbsp;&nbsp;&nbsp;수량<span style="color:grey;"> ${pvo.productCnt }</span></p>
										</div>
									</div>
								</td>
								<td>
									<c:if test="${pvo.discount eq '0' }"> <!-- 할인율이 0일때 -->
										<span class="price-style" ><fmt:formatNumber value="${pvo.price }" pattern="#,###"/></span>원
									</c:if>
												
									<c:if test="${pvo.discount ne '0' }"> <!-- 할인율이 있을때 -->
												
									<p class="real-price"><fmt:formatNumber pattern="#,###" value="${pvo.price }" />원</p>
									<p><span class="price-style"><fmt:formatNumber pattern="#,###" value="${pvo.price * (100 - pvo.discount) / 100 }" /></span>원</p>
									</c:if>
									
								</td>
								<td><span class="price-style"><fmt:formatNumber value="${pvo.price * ((100 - pvo.discount) / 100) * pvo.productCnt }" pattern="#,###"/></span>원</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<br>
				</div>

				<br>
				<br>
				<br>
				<br>
				
<!-- 결제정보 -------------------------------------------------------------------------------->					
				<div class="row">
					<div class="col">
						<p>
							<span class="subtitle">결제 정보</span>
						</p>
						<div class="payInfo">
							<table>
								<tr>
									<td style="width: 25%;">주문 일시</td>
									<td>${vo.orderDate}</td>
								</tr>
								<tr>
									<td style="height: 150px;">결제 수단</td>
									<td >${vo.paymentType}
										<c:if test="${vo.paymentType eq '무통장입금'}">
											<p style="font-size: 14px; margin-top:10px; margin-bottom:10px;">&lt;입금 계좌 안내&gt;<br>
											하나은행 775-123456-12345 (예금주: 아이뮤지엄)<br>
											입금기한 : <span id="date"></span>
										</p>
										</c:if>
										<c:if test="${vo.paymentType eq '카드결제'}">
											<c:set var="cardQuota" value="${vo.cardQuota}"/>
											<c:choose>
											    <c:when test="${cardQuota eq 0}" >
											      	<c:set var="cardQuota" value="일시불"/>
											    </c:when>
											    <c:otherwise>
													<c:set var="cardQuota" value="${vo.cardQuota}개월"/>
												</c:otherwise>
										    </c:choose>
								    		<p style="font-size: 15px; margin-top:10px; margin-bottom:10px;">${vo.cardName } ${vo.cardNum } ${cardQuota }</p>
								    	</c:if>
									</td>
								</tr>
								
								<tr>
									<td>주문상태</td>
									<c:if test="${vo.status eq '입금확인중'}">
										<td>취소완료</td>
									</c:if>
									<c:if test="${vo.status eq '결제완료'}">
										<td>환불완료</td>
									</c:if>
								</tr>
								<tr>
									<td>상품 금액 </td>
									<td ><fmt:formatNumber pattern="#,###" value="${vo.totalPrice - vo.shipping}" />원</td>
								</tr>
								<tr>
									<td>배송비 </td>
									<td ><fmt:formatNumber pattern="#,###" value="${vo.shipping}" />원</td>
								</tr>
								<tr>
									<td>총 환불 금액</td>
									<td ><fmt:formatNumber pattern="#,###" value="${vo.totalPrice}" />원</td>
								</tr>
								
							</table>
						</div>
					</div>
<!-- 배송지 정보 form name="deliveryInfoForm"--------------------------------------------------------------------->					
					<div class="col">
						<p class="subtitleline">
							<span class="subtitle">배송지 정보</span>
						</p>
							<form name="deliveryInfoForm" >
								<div id="deliveryInfo">
									<div class="form-group1" id="form-group1" >
										<label for="orderName">받으시는 분<span class='red'> &#42;</span></label> 
										<input type="text" class="form-control" id="orderName" value="${vo.orderName }" readonly="readonly">
									</div>
									<div class="form-group2" id="form-group2">
										<label for="postcode">주소<span class='red'> &#42;</span></label>
										<div>
											<input type="text" class="form-control" id="postcode" value="${vo.postcode }"
												placeholder="우편번호" readonly="readonly" style="width: 200px;">
											
										</div>
										<input type="text" class="form-control" id="addr1" value="${vo.orderAddr }"
											placeholder="주소" readonly="readonly" readonly="readonly"> 
		
									</div>
									<div class="form-group3">
										<label for="phone">휴대전화<span class='red'> &#42;</span></label>
										<input type="text" id="phone" class="form-control" style="width: 100%;" value="${vo.orderPhone }" readonly="readonly">
									</div>
									<div class="form-group">
										<label for="orderReq">배송요청사항</label> 
										<input type="text" class="form-control" id="orderReq" value="${vo.orderReq }" readonly="readonly">
									</div>
								</div>
							
						</form>
					</div>
				</div>
				
				<br>
				<br>
				<br>
				
				<div>
				
				</div>
				<br>
				<br>



			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>
	<%@ include file="/common/footer.jspf"%>

</body>

</html>