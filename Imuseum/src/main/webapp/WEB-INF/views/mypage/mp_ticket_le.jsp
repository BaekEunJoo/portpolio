<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>티켓 예매 내역</title>
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
	.btn:hover {
		background-color: black;
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
	#mp_ticket, #mp_ticket_le {color: black;}
	.deleteBtn:hover {
		background: white;
		color:black;
		border: 1px solid black;
	}
</style>
</head>
<body>
<script>
function cancleTicket(revNum, status){
	//alert("주문취소 클릭");
	var revNum = revNum;
	var status = status;
	if(confirm("예매를 취소하시겠습니까?")){
		if(status == "결제완료"){
			alert("예매가 취소되었습니다.");
			cancelPay(revNum);
			} else {
				alert("이미 예매취소 또는 사용완료 된 티켓입니다.");
				return;
			}
	}
}

 
function cancelPay(revNum) {
	location.href='deleteTicket_le.do?revNum='+revNum;
}
</script>


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
						<h5 style="font-weight:bold; margin-bottom:15px;">티켓 예매 목록</h5>
						<!-- 타이틀 부분 시작 -->
						<div>
						  <ul class="row p-0" style="list-style:none;">
						  	<li class="col-6 m-0 p-0">
						  		<a>
							  		<button onclick="location.href='mp_ticket_le.do'" type="button" style="width:100%; color:white; background-color:black;" class="bt hover py-2 m-0">개인예매</button>
						  		</a>
					  		</li>
						  	<li class="col-6 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button onclick="location.href='mp_ticket_team.do'" type="button" style="width:100%;" class="bt py-2 m-0">단체예매</button>
						  		</a>
					  		</li>
						  </ul>
						</div>
						<!-- 타이틀 부분 끝 -->
						
						<!-- 예매 내역 리스트 시작 -->
						<span style="float:right; color:blue; margin-bottom:5px; font-size:0.7em;">*예매내역 변경을 원하시면 예매를 취소하고 다시 구매해주세요.</span>
						<table class="rvtable" style="width: 100%; margin-bottom:100px;">
							<colgroup>
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:15%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
							</colgroup>
							<tr style="text-align: center; height: 50px; background: black; color: white;">
								<th>구분</th>
								<th>예매일</th>
								<th>예매번호</th>
								<th>티켓명</th>
								<th>관람일시</th>
								<th>결제금액</th>
								<th>상태</th>
								<th>예매취소</th>
							</tr>
							<c:choose>
								<c:when test="${empty learnlist}">
									<tr>
										<td colspan="8" style="padding:25px; text-align: center;">예매 내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="learnlist" items="${learnlist }">
										<tr style="text-align: center; height: 50px; border-bottom: 1px solid gray;">
											<td>교육</td>
											<td>${learnlist.regdate.substring(0,10) }</td>
											<td>${learnlist.revNum }</td>
											<td>${learnlist.title }</td>
											<td>${learnlist.revDate.substring(0,10) }</td>
											<td><fmt:formatNumber value="${learnlist.totalprice }" pattern="#,###"/>원</td>
											<td>${learnlist.status }</td>
											<td>
												<button onclick="cancleTicket('${learnlist.revNum }','${learnlist.status }')" type="button" class="deleteBtn" style="background-color:black; color:white; padding:2px;">예매취소</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
						<!-- 예매 내역 리스트 끝 -->
					</div>
					<!-- body 끝 -->
					
				</div>
				<!-- row div 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
<script>
//선택일 오늘이 최대
document.getElementById('startDate').max = new Date().toISOString().substring(0, 10);
document.getElementById('lastDate').max = new Date().toISOString().substring(0, 10);

function lastchk() {
	//검색 마지막일 시작일 이후부터 선택가능 최대는 오늘날짜
	document.getElementById('lastDate').min = document.querySelector('#startDate').value;
}


</script>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>