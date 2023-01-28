<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>마이페이지 메인</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.bt {
		width:200px;
		height:50px;
		background-color: black;
		color:white;
	}
	.bt:hover {
		background-color: white;
		color:black;
	}
	.orderTitle:after { 
		content: "";
		display: block;
		width: 600px;
		border-bottom: 2px solid black;
	}
	.notosanskr * { 
	 	font-family: 'Noto Sans KR', sans-serif;
	}
	.mpName {
		font-size:1.2em;
		font-weight: bold;
	}
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
</style>
</head>
<body>
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<div class="row">
					<div class="body container-fluid mt-5">
						<!-- 상단 회색 박스 -->
						<div class="bg-light mb-5 p-auto">
							<div class="row">
								<div class="col-3 p-6 m-auto" style="text-align: center; vertical-align: center;">
									<p style="font-size:30px;">
	  								  <b>${member.name }</b>님<br>안녕하세요.<br>
									</p>
									<a href="#">
									  <button type="button" id="btn1" class="bt" onclick="location.href='mp_grade.do'">나의 회원등급</button><br>
									</a>
									<a href="#">
									  <button type="button" id="btn2" class="bt mt-2" onclick="location.href='mp_addrHome.do'">배송지관리</button>
									</a>
								</div>
								<div class="col-4 p-3 m-2">
									<img src="${pageContext.request.contextPath}/common/img/mainGrade.PNG" alt="회원등급" style="width:100%">
								</div>
								<div class="col-3 offset-2 p-6 m-auto" style="line-height: 50px; font-size: 1.5em;">
									<div class="border-bottom m-3">나의 티켓<b style="float:right;">${ticketCnt }</b></div>
									<div class="border-bottom m-3">상품 주문/배송<b style="float:right;">${orderCnt }</b></div>
									<div class="border-bottom m-3">나의 문의<b style="float:right;">${QnaBoardCount }</b></div>
								</div>
							</div>
						</div>
						
						<!-- 최근 내역 -->
						<%-- <div class="row">
							<!-- 예매 -->
							<div class="col-6">
								<div class="orderTitle">
									<h4><i class="bi bi-bookmark-check-fill"></i>&nbsp;<b>최근 예매 내역 ></b></h4>
									<h6>회원님께서 최근 전시 또는 프로그램 티켓을 예매하신 내역입니다.</h6>
								</div>
								<c:choose>
									<c:when test="${empty ticketList }">
										<div class="text-center m-auto border-bottom">
											최근 예매 내역이 없습니다.<br>빠른 시일 내에 다시 만나요.
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="ticketList" items="${ticketList }">
											<!-- 티켓 예매 내역 테이블 긁어오기 -->
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
							<!-- 주문 -->
							<div class="col-6">
								<div class="orderTitle">
									<h4><i class="bi bi-bookmark-check-fill"></i>&nbsp;<b>최근 주문 내역 ></b></h4>
									<h6>회원님께서 최근 상품을 구매하신 내역입니다.</h6>
								</div>
								<c:choose>
									<c:when test="${empty orderList }">
										<div class="text-center border-bottom">
											최근 주문 내역이 없습니다.
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="orderList" items="${orderList }">
											<!-- 주문 내역 테이블 긁어오기 -->
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</div>
						</div> --%>
						<!-- 최근 내역 끝 -->
					</div>
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>