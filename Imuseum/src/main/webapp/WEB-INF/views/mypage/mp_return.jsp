<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>취소/반품 내역</title>
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
		height:40px;
		border: 1px solid black;
		background-color: white;
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
	#mp_return {color: black;}
	.whitebtn {
		border: 1px solid black;
		background-color: white;
	}
	.whitebtn:hover {
		border: 1px solid grey;
		background-color: grey;
		color: white;
	}
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
						<h5 style="font-weight:bold;">취소/반품 내역</h5>
						
						<!-- 취소 내역 리스트 시작 -->
						<table class="rvtable" style="width: 100%;">
							<colgroup>
								<col style="width: 30%;">
								<col style="width: 40%;">
								<col style="width: 30%;">
							</colgroup>
							<thead>
							  <tr style="text-align: center; height: 50px; background: black; color: white;">
							    <th>주문번호</th>
							    <th>주문날짜</th>
							    <th>상세보기</th>
							  </tr>
							</thead>
							<tbody>
							  <tr>
							  	<c:choose>
									<c:when test="${empty returnList }">
										<tr>
											<td colspan="4" style="padding:25px; text-align: center;">예매 내역이 없습니다.</td>
										</tr>
									</c:when>
								<c:otherwise>
									<c:forEach var="returnList" items="${returnList }">
										<tr style="text-align: center; height: 50px; border-bottom: 1px solid gray;">
										    <th class="align-middle">${returnList.orderNum }</th>
										    <th class="align-middle">${returnList.orderDate.substring(0,10) }</th>
											<th class="align-middle">
												<button type="button"  class="whitebtn" onClick="location.href='mp_orderReturnDetail.do?orderNum=${returnList.orderNum }'" 
												style="width:150px; height:40px;">상세보기 &gt;</button>
											</th>
										</tr>
									</c:forEach>
								</c:otherwise>
								</c:choose>
							  </tr>
							</tbody>
						</table>
						
								
						<!-- 취소 내역 리스트 끝 -->
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