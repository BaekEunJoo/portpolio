<%@page import="com.mystudy.or.VO.orderDetailVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.project.vo.CartListVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
request.setCharacterEncoding("UTF-8");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>ORDER</title>
<script>


	function setPay() {
		var checkPay = document.getElementsByName('check');
		for (i = 0; i <checkPay.length; i++) {
			var disign = document.getElementById([i+1]);
			if(checkPay[i].checked == true) {
				disign.style.display = "block";
			} else if (checkPay[i].checked == false) {
				disign.style.display = "none";
			}
		}
	};
	
</script>
<style>
	.logo { text-align : center; }
	* {
		margin : 10px;
		padding : 2px;
	}
	.title {
		background-color : #0E0F37;
		color : white;
		padding : 10px 15px;
		text-align : center;
		margin-bottom : 20px;
		font-weight : bold;
		font-size : 1.5em;
	}
	.smallName { font-size : 1em; font-weight : bold; }
	.emailContent {
		font-size : 10px;
		color : gray;
	}
	.message {
		background-color : #EBECF0;
		margin-top : 10px;
		border : 1px solid #D3D3D3;
	}
	.message .messageInner {
		padding : 10px 20px;
		text-align : center;
	}
	.line {
		border-bottom : 1px solid gray;
	}
	.box {
		background-color : lightGray;
		height : 10px;
	}
	.order_finalPay {
		background-color : lightGray;
		margin : 0 auto;
	}
	.payment_choice {
		border : 1px solid gray;
		padding : 10px;
	}
	.payment_choice_title {
		font-size : 1em;
		font-weight : bold;
	}
	#finalPay { 
		background-color : #0E0F37;
		width : 100%;
		text-align : center;
	}
	#text {
		color : white;
		font : 2em;
		font-weight : bold;
		text-align : center;
	}
	#final p {
		color : gray;
		font-size : 15px;
	}
</style>
</head>
<body>

	<p class="logo">
		<a href="/ourHW/main/main.jsp"><img src="/ourHW/images/logo.jpg" alt="로고"></a>
	</p>
		<form action="controllerbb?type=orderList" method="post">
		<div class="title">주문/결제</div>
		<fieldset id="del">
			<div class="smallName">배송지</div>
			<div>
				<label for="getter">받는사람*</label><input type="text" class="delGetter_input" value="${user.name}" disabled>
			</div>
			<div>
				<label for="addr">주소*</label><input type="text" class="delAddr" value="${user.address }" disabled>
			</div>
			
			<div>
				<label for="phone">휴대전화*</label>
				<input type="text" value="${user.phone }" disabled>
			</div>
			<div>
				<label for="phone">이메일*</label>
				<input type="text" value="${user.email }" disabled>
				<div class="emailContent">
					이메일로 주문처리 과정을 보내드립니다.
					수신 가능한 이메일 주소를 입력해주세요.
				</div>
			</div>
			
		</fieldset>
		
		<fieldset id="message">
			<select name="message">
				<option value="m">--배송 메시지 선택--</option>
				<option value="m1">배송 전에 미리 연락 바랍니다.</option>
				<option value="m2">부재시 경비실에 맡겨주세요.</option>
				<option value="m3">부재시 문앞에 놓아주세요.</option>
				<option value="m4">빠른 배송 부탁드립니다.</option>
				<option value="m4">직접 입력</option>
			</select>
		</fieldset>
		
		<fieldset id="orderList">
			<div class="smallName">주문상품</div>
			<table class="w3-table w3-bordered">
				<colgroup>
					<col style="width: 10%;">
					<col style="width: 15%;">
					<col style="width: 25%;">
					<col style="width: 10%;">
					<col style="width: 15%;">
					<col style="width: 15%;">
					<col style="width: 10%;">
				</colgroup>
					<tr>
						<td>상품번호</td>
						<td>이미지</td>
						<td>상품명</td>
						<td>옵션</td>
						<td>판매가</td>
						<td>수량</td>
						<td>합계금액</td>
					</tr>
				<c:set var="totalTotal" value="" />
				<c:forEach var="item" items="${list}">
					<tr>
						<td><c:out value="${item.productNo}"></c:out></td>
						<td><img src="<c:out value="./img/${item.thumnail}"></c:out>" alt="img" width="100%"></td>
						<td><c:out value="${item.productName}"></c:out></td>
						<td><c:out value="${item.optionSize}"></c:out></td>
						<td><c:out value="${item.price}"></c:out></td>
						<td><c:out value="${item.amount}"></c:out></td>
						<td><c:out value="${item.total}"></c:out></td>
					</tr>
					<c:set var="totalTotal" value="${totalTotal + item.total}" />
				</c:forEach>
<!-- 
<%
	List<orderDetailVO> list =null; 
	orderDetailVO vo1 = null;
%>
 -->				
			</table>
		</fieldset>
	
		<fieldset id="payInfo">
			<div class="smallName">결제정보</div>
			<div>
				<label for="delPay">배송비 :
					<c:set var="shippingfee" value=" 0" /> 
					<c:if test="${totalTotal >= 70000 }">
						<c:set var="shippingfee" value="0" />
					</c:if>
					<c:if test="${totalTotal < 70000 }">
						<c:set var="shippingfee" value="3000" />
					</c:if>
					${shippingfee }원
				</label><br>
				<label for="finalPay">결제금액 : ${totalTotal }원 </label><br>
			</div>
		</fieldset>
		
		<fieldset id="payment_form">
			<div class="smallName">결제수단</div>
			<div class="payment_choice">
				<label for="choise" class="payment_choice_title">결제수단 선택</label><br>
				<input type="radio" name="check" value="무통장입금" checked="checked" id="payMu" onclick="setPay()">무통장입금
				<input type="radio" name="check" value="신용카드" id="payCard" onclick="setPay()">신용카드
				<input type="radio" name="check" value="휴대폰" id="payPhone" onclick="setPay()">휴대폰
				<input type="radio" name="check" value="가상계좌" id="payGa" onclick="setPay()">가상계좌
				<input type="radio" name="check" value="페이코" id="payco" onclick="setPay()">페이코
				<input type="radio" name="check" value="계좌이체" id="payEche" onclick="setPay()">계좌이체
			</div>
			<div id="1">
				입금은행*
				<select name="muBank">
					<option value="1">::: 선택해주세요. :::</option>
					<option value="2">농협:352-1818-1818-18 6조(6조)</option>
				</select>
				<br>
				입금자명*<input type="text">
				<div id="cashBill">
					<h5>현금영수증</h5>
					<input type="radio"> 현금영수증 신청
					<input type="radio" checked> 신청안함
				</div>
			</div>
			<div id="2" style="display:none;">
				- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
			</div>
			<div id="3" style="display:none;">
				- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
			</div>
			<div id="4" style="display:none;">
				- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
				<div id="cashBill">
					<h5>현금영수증</h5>
					<input type="radio"> 현금영수증 신청
					<input type="radio" checked="checked"> 신청안함
				</div>
			</div>
			<div id="5" style="display:none;">
				- 페이코(www.payco.com)에 회원가입 후, 최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.
			</div>
			<div id="6" style="display:none;">
				예금주명*<input type="text" id="eche_view_name"><br>
				- 소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.
				<div id="cashBill">
					<h5>현금영수증</h5>
					<input type="radio"> 현금영수증 신청
					<input type="radio" checked="checked"> 신청안함
				</div>
			</div>
		</fieldset>
		
		<fieldset id="check">
				<input type="checkbox" name="agree" required="required" >
				[필수] 쇼핑몰 이용약관 동의<br>
				<input type="checkbox" name="agree" required="required">
				[필수] 개인정보 처리방침 동의<br>
		</fieldset>
	
	<c:forEach var="item" items="${list}">
	<input type="hidden" value="${item.cartNo}" name="cartNo">
	</c:forEach>
			<button id="finalPay" type="submit">
				<div id=text>${totalTotal + shippingfee }원 결제하기</div>
			</button>
	</form>
			<p>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.<br> 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.<br>
			- 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
		
</body>
</html>