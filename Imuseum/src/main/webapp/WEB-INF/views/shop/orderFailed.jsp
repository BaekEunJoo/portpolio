<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문실패</title>
<link rel="stylesheet" href="css/mystyle.css">
</head>
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
<body>
	<%@ include file="/common/style.jspf"%>
	<%@ include file="/common/store.jspf"%>
	<div class="container-filid notosanskr" id="contentAll">
		<div class="col-8 offset-2">
			<div style="border-bottom: 3px solid #F7F7F7;">
				<p class="title py-5 my-5">주문 실패</p>
				<br>
				<br>
				<br>
				<p style="font-size: 2em;">주문이 정상적으로 완료되지 않았습니다.</p>
				<p style="color: grey;">결제 실패 사유 : ${errorMsg}</p>
				<p style="color: grey;">이용에 불편을 드려 죄송합니다.</p>
				<p style="color: grey;">확인 후 다시 주문해주세요.</p>
				<br>
				<br>
				<br>
				<button type="button" class="blackbtn" onclick="location.href='getCartList.do'">장바구니로 가기</button>
				<br>
				<br>
				<br>
				<br>
			</div>


			<br>
			
			<br>
			<br>
			<br>
		</div>
	</div>
	<%@ include file="/common/footer.jspf"%>
</body>
</html>