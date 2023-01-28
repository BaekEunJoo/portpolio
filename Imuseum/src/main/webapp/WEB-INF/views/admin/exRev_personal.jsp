<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>

.col-2 li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

.col-2 li a span {
	text-decoration: none;
	color: black;
	font-size: 18px;
	margin-left: 10px;
}

.bi-people-fill{
	color: black;
}

.amName {
	font-size: 1.2em;
	font-weight: bold;
}

.col-2 ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
	font-weight: normal;
}

.col-2 ul li a:hover {
	color: black;
	font-weight: bold;
}

.head .btn {
	border-radius: 0;
	width: 100px;
	height: 50px;
}


.btn:hover {
	background-color: black;
}

input[type=date] { 
	border-radius: 0;
	border: 1px solid silver;
	width: 210px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}


.rvtable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

#am_exticket { color: black; font-weight: bold; }


/*페이징*/
.page-link {
  color: #000; 
  background-color: #fff;
  border: none;
  width: 40px; height: 40px;
  text-align: center;
  margin: 0 10px;

}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: black;
 border-color: black;
 
}

.page-link:focus, .page-link:hover {
  color: white;
  background-color: black; 
  /*border-color: #ccc;*/
}

.page-item:last-child .page-link {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
.page-item:first-child .page-link {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
}
</style>
</head>
<body>
<%String printrt = ""; %>

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
<%@ include file="/common/main.jspf" %>
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10" style="margin-bottom: 100px;">
				<p style="font-size: 1.3em; font-weight: bold;">티켓예매 목록</p>
				<div>
					
				</div>
				<div>
					<table class="head" style="width: 100%; margin-top: 50px;">
						<tbody>
							<tr>
								<td>
								<form action="exRevPersonalSearch.do" method="post">
									<select name="searchCondition" style="width: 100px; height: 30px; border: 1px solid black; border-radius: 0;">
									<c:forEach var="option" items="${conditionMap }">
										<option value="${option.value }">${option.key }</option>
									</c:forEach>
									</select>
									<input type="text" name="searchKeyword" style="width:203px; height: 30px; border: 1px solid black; border-radius: 0;" required>
									<input type="submit" class="btn btn-sm btn-outline-dark" value="검색" style="margin-bottom: 5px; height: 30px; vertical-align: middle;">
								</form>
							</tr>
							<tr>
								<td>
									<input type="button" class="btn btn-outline-dark" value="오늘" onclick="location.href='exRevPersonalToday.do'">
									<button type="button" class="btn btn-outline-dark" onclick="location.href='exRevPersonalWeek.do'">1주일</button>
									<button type="button" class="btn btn-outline-dark" onclick="location.href='exRevPersonalMonth.do'">1달</button>
									<button type="button" class="btn btn-outline-dark" onclick="location.href='exRevPersonal.do'">전체</button>
									<form action="exRevPersonalSelect.do" method="post" style="display: inline-block;">
									<input type="date" name="regdate1" id="startDate" style="margin-left: 30px;" onchange="lastchk()" required>
									&nbsp;~&nbsp;
									<input type="date" name="regdate2" id="lastDate" required>
									<input type="submit" class="btn btn-outline-dark" style="margin-left: 20px;" value="검색">
									</form>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr style="border: 0; height: 2px; background: black;">
				<c:if test="${empty list }">
				<p style="text-align: center; padding: 100px; color: gray;">예매 내역이 없습니다.</p>
				<hr>
				
				</c:if>
				<%int totalprice = 0; %>
				<c:if test="${not empty list }">
				<p style="font-size: 0.8em; color: gray">총 <b style="color: black;">${page.totalRecord}</b> 건</p>
				<table class="rvtable" style="width: 100%; font-size: 0.9em;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>예매일</th>
						<th>예매번호</th>
						<th>ID</th>
						<th>예약자명</th>
						<th>티켓명</th>
						<th>관람일</th>
						<th style="width: 247px;">매수</th>
						<th>상태</th>
					</tr>
					<tbody id="ajaxtable">
					<c:forEach var="ticket" items="${list }" varStatus="status">
					<tr style="text-align: center;" id="disppp">
						<td>${ticket.regdate.substring(0,10) }</td>
						<td>${ticket.revNum }</td>
						<c:if test="${ticket.snsName != 'IMUSUEM' }">
							<td>${ticket.snsName } 회원</td>
						</c:if>
						<c:if test="${ticket.snsName == 'IMUSUEM' }">
							<td>${ticket.id }</td>
						</c:if>
						<td>${ticket.name }</td>
						<td>${ticket.exhName }</td>
						<td><b>${ticket.revDate.substring(0,10) }</b></td>
						
						 <c:set var="adult" value="${ticket.adult}" />
						 <c:set var="teens" value="${ticket.teens}" />
						 <c:set var="child" value="${ticket.child}" />
						 <c:set var="totprice" value="${ticket.totalprice}" />
						 <%
						      int adult = (Integer)pageContext.getAttribute("adult") ;
						      int teens = (Integer)pageContext.getAttribute("teens") ;
						      int child = (Integer)pageContext.getAttribute("child") ;
						      int totprice = (Integer)pageContext.getAttribute("totprice") ;
						      
						      String result = "";
						      
						      if(adult != 0){
						    	  result += "성인 "+adult+", ";
						      }
						      if(teens != 0){
						    	  result += "청소년 "+teens+", ";
						      }
						      if(child != 0){
						    	  result += "유아 및 어린이 "+child+", ";
						      }
						      
						      printrt = result.substring(0, result.length()-2);
						      totalprice += totprice;
						 %>
						
						<td><%=printrt %></td>
						<td>
							<c:if test="${ticket.status == '결제완료'}">
								<button type="button" class="btn btn-sm btn-outline-dark" style="border-radius: 0;" onclick="updatechk('${ticket.revNum }')">${ticket.status}</button>
							</c:if>
							<c:if test="${ticket.status != '결제완료'}">
								<button type="button" class="btn btn-sm btn-dark" disabled style="border-radius: 0;">${ticket.status}</button>
							</c:if>
						</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<%
					DecimalFormat decFormat = new DecimalFormat("###,###");
					String printtotal = decFormat.format(totalprice); 
				%>
				
				<div style="background-color: #FCFCFC; height: 70px;">
					<p style="text-align: center; padding-top: 12px; font-size: 0.9em;">
						<span style="font-size: 0.9em;"><fmt:formatNumber value="${totp}" pattern="#,###"/>(총 결제금액) - </span>
						<span style="color: gray; font-size: 0.9em;"><fmt:formatNumber value="${cancle}" pattern="#,###"/>(예매취소)</span><br>
						합계 : <b><fmt:formatNumber value="${totp-cancle }" pattern="#,###"/></b> 원
					</p>
				</div>
				
				<div style="padding-top: 30px;">
				<ul class="pagination justify-content-center pb-2">
		   			<!-- 이전 -->
		  		 		<li class="page-item">
		  		 			<c:if test="${page.nowPage == 1 }">
		  		 				<a class="page-link disabled"><i class="bi bi-chevron-left"></i></a>
		  		 			</c:if>
		  		 			<c:if test="${page.nowPage != 1 }">
							<a href="exRevPersonal.do?page=${page.nowPage - 1 }" class="page-link"><i class="bi bi-chevron-left"></i></a>
						</c:if>	
		  		 			
		  		 		</li>
		  		 		<!-- 페이지 번호 -->
		  		 		<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
						<c:if test="${pageNo == page.nowPage }">	
							<li class="page-item active">
		   						<a class="page-link">${pageNo }</a>
		   					</li>
						</c:if>
						<c:if test="${pageNo != page.nowPage }">
							<li class="page-item">
									<a href="exRevPersonal.do?page=${pageNo }" class="page-link">${pageNo }</a>
		   					</li>
						</c:if>
						</c:forEach>
		   			<!-- 다음 -->
			   			<li class="page-item">
			   				<c:if test="${page.nowPage < page.totalPage }">
										<a href="exRevPersonal.do?page=${page.nowPage + 1 }" class="page-link"><i class="bi bi-chevron-right"></i></a>
							</c:if>
							<c:if test="${page.nowPage >= page.totalPage }">
								<a class="page-link disabled"><i class="bi bi-chevron-right"></i></a>
							</c:if>
			   			</li>
		 			</ul>
				</div>
				</c:if>
				
				
				</div>
			</div>
		</div>
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

function updatechk(a) {
	var revnum = a;
	
	var result = confirm('사용완료로 변경하시겠습니까? \n변경 후 상태변경이 불가능합니다.');
	if (result==true){
		alert('사용완료 처리되었습니다.');
	location.href='updateExTicket.do?revNum='+revnum;
	}
}

</script>


</body>

<%@ include file="/common/footer.jspf"%>
</html>