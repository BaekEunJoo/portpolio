<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>주문내역</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	input[type=date] { 
		border-radius: 0;
		border: 1px solid silver;
		width: 210px;
		height: 50px;
		margin: 0;
		vertical-align: middle;
	}
	.btn {
		border-radius: 0;
		width: 100px;
		height: 50px;
		margin-right:5px;
	}
	.bt {
		width:180px;
		height:50px;
		border: 1px solid black;
		background-color: white;
	}
	.hover:hover {
		color:black;	
		background-color: white;
	}
	.bt:hover, .bt:active {
		color:white;
		background-color: black;
	}
	.dateBtn {
		width:100px;
		height:40px;
		border: 1px solid black;
		background-color: white;
	}
	.boldBorder:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 3px solid black;
		margin-top : 15px;
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
	#mp_order {color: black;}
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
				<!-- row div 시작 -->
				<div class="row">
				
					<!-- body 시작 -->
					<div class="container-fluid mt-5">
						<h5 style="font-weight:bold;" class="line">주문내역</h5>
						<!-- 타이틀 부분 시작 -->
						<div class="pt-2">
						  <ul class="row p-0" style="list-style:none;">
						  	<li class="col-4 m-0 p-0">
						  		<a>
							  		<button onclick="location.href='mp_order_online.do'" type="button" style="width:100%; " class="bt hover py-2 m-0">온라인 주문내역</button>
						  		</a>
					  		</li>
						  	<li class="col-4 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button onclick="location.href='mp_order_offline.do'" type="button" style="width:100%; color:white; background-color:black;" class="bt py-2 m-0">오프라인 주문내역</button>
						  		</a>
					  		</li>
					  		<li class="col-4 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button onclick="location.href='mp_order_team.do'" type="button" style="width:100%;" class="bt py-2 m-0">기업 및 단체 주문내역</button>
						  		</a>
					  		</li>
						  </ul>
						</div>
						<!-- 타이틀 부분 끝 -->
						
						<!-- 주문 내역 리스트 시작 -->
						<table class="rvtable" style="width: 100%;">
							<colgroup>
								<col style="width:25%">
								<col style="width:25%">
								<col style="width:25%">
								<col style="width:25%">
							</colgroup>
							<tr style="text-align: center; height: 50px; background: black; color: white;">
								<th>주문번호</th>
								<th>주문날짜</th>
								<th>결제금액</th>
								<th>상세보기</th>
							</tr>
							<tr>
								<td colspan="4" style="padding:25px; text-align: center;">오프라인 주문 내역이 없습니다.</td>
							</tr>
						</table>
						<!-- 주문 내역 리스트 끝 -->
						
						<!-- 기타 안내사항 시작 -->
						<div class="my-4">
							<strong class="mb-2" style="font-size:20px;">오프라인 구매내역 안내</strong>
							<p style="color:gray">
								- 디뮤지엄, 대림미술관 뮤지업샵 그리고 구슬모아당구장에서 상품을 구매한 내역을 확인하실 수 있습니다.<br>
								- 구매하신 내역에 대한 영수증 확인이 가능합니다.
							</p>
						</div>
						<!-- 기타 안내사항 끝 -->
					</div>
					<!-- body 끝 -->
					
				</div>
				<!-- row div 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>