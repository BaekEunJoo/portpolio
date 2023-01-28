<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container-fluid">
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
							  		<button type="button" style="width:100%; color:white; background-color:black;" class="bt hover py-2 m-0">온라인 주문내역</button>
						  		</a>
					  		</li>
						  	<li class="col-4 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button type="button" style="width:100%;" class="bt py-2 m-0">오프라인 주문내역</button>
						  		</a>
					  		</li>
					  		<li class="col-4 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button type="button" style="width:100%;" class="bt py-2 m-0">기업 및 단체 주문내역</button>
						  		</a>
					  		</li>
						  </ul>
						</div>
						<!-- 타이틀 부분 끝 -->
						
						<!-- 날짜로 검색 버튼 시작 -->
						<div class="row py-3 boldBorder">
							<div class="col-5">
								<button type="button" class="dateBtn">1주일</button>
								<button type="button" class="dateBtn">1개월</button>
								<button type="button" class="dateBtn">3개월</button>
								<button type="button" class="dateBtn">6개월</button>
							</div>
							
							<div class="col-5">
								<button type="button" class="bt">
									<span style="float:left;">
										2022-11-11
									</span>
									<i class="bi bi-calendar2-week" onclick="#" style="font-size: 20px; cursor: pointer; float:right;"></i>
								</button>
								<span>&nbsp;~&nbsp;</span>
								<button type="button" class="bt">
									<span style="float:left;">
										2022-11-22
									</span>
									<i class="bi bi-calendar2-week" onclick="#" style="font-size: 20px; cursor: pointer; float:right;"></i>
								</button>
							</div>
							
							<div class="col-2">
								<button type="submit" class="bt btn-outline-dark">검색</button>
							</div>
						</div>
						<!-- 날짜로 검색 버튼 끝 -->
						
						<!-- 주문 내역 리스트 시작 -->
						<div class="text-center py-5 border-bottom border-dark">
							<span class="my-5 py-5" style="color:gray;">주문 내역이 없습니다.</span>						
						</div>
						<!-- 주문 내역 리스트 끝 -->
						
						<!-- 기타 안내사항 시작 -->
						<div class="my-4">
							<strong class="mb-2" style="font-size:20px;">주문상태 및 취소기간 안내</strong>
							<p style="color:gray">
								- 배송완료 7일 후 자동으로 구매확정됩니다.<br>
								- 구매확정 후에는 반품 및 환불이 불가합니다.<br>
								- 구매확정 후 14일 이내 리뷰를 작성할 수 있습니다.
							</p>
						</div>
						<div class="my-4">
							<strong class="mb-2" style="font-size:20px;">주문/배송 절차 안내</strong>
							<p><img src="/Imuseum/common/img/del.JPG" alt="주문배송절차" style="width:100%"></p>
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