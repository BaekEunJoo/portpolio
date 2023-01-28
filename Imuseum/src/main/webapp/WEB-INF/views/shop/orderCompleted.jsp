<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="stylesheet" href="css/mystyle.css">
</head>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<script>
function numberWithCommas(val) {
	   return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
window.onload = function(){
	const date = new Date('${order.orderDate }');
	console.log("주문일:" + date);
	console.log('date : ${vo.orderDate}');
	date.setDate(date.getDate() + 2);
	console.log(date);
	var strDate = date.toISOString();
	var subDate = strDate.substr(0, 10);
	subDate += ' 23:59 까지'
	console.log(subDate);
	document.getElementById('date').innerHTML= subDate;
	
	$.ajax("getCartCnt.do",{
		type:"post",
		success: function(result){
					$('#navCartCnt').html(result);
				},
		error: function(){
			alert("getCartCnt 오류가 발생하였습니다.");
		}
	});
	
}
</script>
<style>
#contentAll {
	font-size: 18px;
	text-align: center;
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
	border-bottom: 3px solid #F7F7F7;
}

.subtitle {
	font-size: 2em;
	font-weight: 600;
}

.subtitleline {
	border-bottom: 3px solid black;
	padding-top: 2px;
	padding-bottom: 13px;
}

.blackbtn {
	background-color: black;
	color: white;
	margin-top: 30px;
	width: 300px;
	height: 65px;
	font-size: 20px;
}

.blackbtn:hover {
	border: 1px solid black;
	background-color: white;
	color: black;
}
</style>
<body >
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
	
	
	
	<%@ include file="/common/store.jspf"%>
	<div class="container-filid notosanskr" id="contentAll">
		<div class="col-8 offset-2">
			<div style="border-bottom: 3px solid #F7F7F7;">
				<p class="title py-5 my-5">주문 완료</p>
				<br>
				<br>
				<br>
				<p style="font-size: 2em;">주문이 완료되었습니다.</p>
				주문번호 : ${order.orderNum } <br>
				<br>
				<br>
				<button type="button" class="blackbtn" onclick="location.href='mypage_main.do'">마이페이지</button>
				<br>
				<br>
				<br>
				<br>
			</div>


			<br>
			
			<c:set var="cardQuota" value="${order.cardQuota}"/>
			<c:choose>
			    <c:when test="${cardQuota eq 0}" >
			      	<c:set var="cardQuota" value="일시불"/>
			    </c:when>
			    <c:otherwise>
					<c:set var="cardQuota" value="${order.cardQuota}개월"/>
				</c:otherwise>
		    </c:choose>
			
			<div class="row my-5 left">
				<div class="col">
					<div>
						<p class="subtitleline">
							<span class="subtitle">결제 정보</span>
						</p>
						<div style="line-height: 15px;">
						<c:if test="${order.paymentType eq '카드결제'}">
							<p>카드결제</p>
							<p>${order.cardName } ${order.cardNum } ${cardQuota }</p>
							<p>결제금액 : <fmt:formatNumber value="${order.totalPrice }" pattern="#,###"/>원</p>
						</c:if>	
						<c:if test="${order.paymentType eq '무통장입금'}">
							<p>무통장입금</p>
							<p>하나은행 775-123456-12345 (예금주: 아이뮤지엄)</p>
							<p>주문금액 : <fmt:formatNumber value="${order.totalPrice }" pattern="#,###"/>원</p>
							<p>입금기한 : <span id="date"></span></p>
							<p>(입금 기한 내 확인되지 않은 주문은 취소됩니다.)</p>
						</c:if>

							
	  	
						</div>
					</div>
				</div>


				<div class="col">
					<p class="subtitleline">
						<span class="subtitle">배송지 정보</span>
					</p>
					<div style="line-height: 15px;">
						<p>${order.orderName }</p>
						<p>${order.orderPhone }</p>
						<p>${order.orderAddr }</p>
						<p>${order.orderReq}</p>
					</div>

				</div>
			</div>
			<br>
			<br>
			<br>
		</div>
	</div>
	<%@ include file="/common/footer.jspf"%>
</body>
</html>