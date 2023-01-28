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
<script>
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


function cancleOrder(frm){
	//alert("주문취소 클릭");
	var orderNum = frm["orderNum"].value;
	var status = frm["status"].value;
	var paymentType = frm["paymentType"].value;
	//alert("오더넘버: " + orderNum + "\n배송상태: " + status + "\n결제타입 : " + paymentType);
	if(confirm("주문을 취소하시겠습니까?")){
		if(status == "결제완료" || status == "입금확인중"){
			if(paymentType == "카드결제"){
				//alert("이벤트 발생");
				cancleCard(orderNum);
			} else {
				cancelCash(orderNum);
			}
		} else {
			alert('배송상태가 "'+ status + '"입니다.\n고객센터로 문의해주세요.');
		}
	} 
	
}
function cancleCard(orderNum) {
	$.ajax("orderCancel.do",{
		type:"POST",
		data:{"orderNum": orderNum},
		dataType: "text",
		async : false,
		success: function(result){
					if(result == "o"){
						alert("결제 취소가 완료되었습니다.\n취소/반품 내역에서 확인해주세요.");
						location.href="mp_order_online.do";
					} else if(result == "ox"){
						alert("결제 취소가 완료되었습니다.");
						location.href="mp_order_online.do";
					} else if(result == "x"){
						alert("결제 취소가 정상적으로 처리되지 않았습니다.\n관리자에게 문의해주세요.");
					} else {
						alert(result);
					}
				},
		error: function(){
			alert("orderCancel.do 오류가 발생하였습니다.");
		}
	});	
}
function cancelCash(orderNum) {
	$.ajax("deleteOrder.do",{
		type:"POST",
		data:{"orderNum": orderNum},
		dataType: "text",
		async : false,
		success: function(result){
					if(result == "o"){
						alert("주문 취소가 완료되었습니다.\n취소/반품 내역에서 확인해주세요.");
						location.href="mp_order_online.do";
					} else if(result == "x"){
						alert("주문 취소가 정상적으로 처리되지 않았습니다.\n관리자에게 문의해주세요.");
					} else {
						alert(result);
					}
				},
		error: function(){
			alert("orderCancel.do 오류가 발생하였습니다.");
		}
	});	
}


 </script>
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

#deliveryInfo .form-group1{
	margin-bottom: 10;}

</style>


<script>
function numberWithCommas(val) {
	   return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


//var result1 = str.substr(0, 2);
</script>
<body>
<%-- ${vo} --%>
<%-- ${productList } --%>

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
			<p class="title py-5 my-5">주문 내역 상세</p>
			<div style="display:inline;">
				<div style="display:inline; ">
					<span class="subtitle">주문 상품</span> 총 <span
						style="font-weight: bold;">${productListCnt }</span>건
				</div>
				<div style="float: right; display:inline; margin-top:20px;">주문번호 : ${vo.orderNum}</div>
			</div>
			
<!-- 상품정보 form name="productListForm"--------------------------------------------------------------------->		

				<div class="productlist">
					<table>
						<thead>
							<tr>
								<th style="width: 50%;">상품정보</th>
								<th>상품금액</th>
								<th>합계</th>
								<th style="width: 150px;">주문관리</th>
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
								<td>
									<div class="right">
									<input type="button" class="blackbtn my-1" value="반품신청" style="width: 150px; height: 40px; font-size: 16px;" onclick=""><br>
									<input type="button"  class="whitebtn my-1" style="width: 150px; height: 40px; font-size: 16px;" value="구매확정" onclick="">
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<br>
						<div class="right">
						<form method="get">
							<input type="button" class="whitebtn" style="width:200px; height:50px;"value="주문취소" onclick="cancleOrder(this.form)">
							<input type="button" class="whitebtn" style="width:200px; height:50px;"value="목록보기" onclick="location.href='mp_order_online.do'">
							<input type="hidden" id="orderNum" name="orderNum" value="${vo.orderNum }">
							<input type="hidden" name="paymentType" value="${vo.paymentType }">
							<input type="hidden" name="status" value="${vo.status }">
						</form>
						</div>
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
									<td>주문상태 </td>
									<td>${vo.status}</td>
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
									<td>결제 금액</td>
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
					<p>
						<span class="subtitle">배송 조회</span>
					</p>
					<div class="delivery">
						<table >
							<thead>
								<tr>
									<th style="width: 40%;">택배사</th>
									<th style="width: 40%;">송장번호</th>
									<th style="width: 20%;">배송조회</th>
									
								</tr>
							
							</thead>
							<tbody>
								<tr>
									<c:choose>
										<c:when test="${vo.shipCompany ne null}">
											<td>${vo.shipCompany}</td>
											<td>${vo.shipNum}</td>
										</c:when>
										<c:otherwise>
											<td colspan="2" style="text-align: center;">배송 준비중입니다.</td>
										</c:otherwise>
									</c:choose>
									<td>
										<a href='https://www.cjlogistics.com/ko/tool/parcel/tracking' target='_blank'>
										<input type="button" class="whitebtn" style="width:200px; height:50px;"value="배송조회" ></a>
										</td>
								</tr>
							</tbody>
						</table>
					</div>
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
<script>

</script>
</body>

</html>