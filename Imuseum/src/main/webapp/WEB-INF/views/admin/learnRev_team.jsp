<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
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

.btn {
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

#am_learnticket { color: black; font-weight: bold; }

</style>
</head>
<body>
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
				
				<div class="col-10">
				<p style="font-size: 1.3em; font-weight: bold;">티켓예매 목록</p>
				<div>
					<table border style="width: 100%; height:50px; text-align: center; cursor: pointer;">
						<tr style="font-size: 1.2em;">
							<td onclick="location.href='${pageContext.request.contextPath}/admin/learnRev_personal.jsp'">
							개인예매
							</td>
							<td onclick="location.href='${pageContext.request.contextPath}/admin/learnRev_team.jsp'"
								style="background-color: black; color: white;">
							단체예매
							</td>
						</tr>
					</table>
				</div>
				
				<div>
					<table class="head" style="width: 100%; margin-top: 50px;">
						<tbody>
							<tr>
								<td>
									<button type="button" class="btn btn-outline-dark">오늘</button>
									<button type="button" class="btn btn-outline-dark">1주일</button>
									<button type="button" class="btn btn-outline-dark">1달</button>
									<button type="button" class="btn btn-outline-dark">전체</button>
									<input type="date" name="regdate1" style="margin-left: 30px;">
									&nbsp;~&nbsp;
									<input type="date" name="regdate2">
									<button type="button" class="btn btn-outline-dark" style="margin-left: 20px;">검색</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr style="border: 0; height: 2px; background: black;">
				
				
				<table class="rvtable" style="width: 100%;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>예매일</th>
						<th>예매번호</th>
						<th>ID</th>
						<th>단체구분</th>
						<th>교육명</th>
						<th>교육일시</th>
						<th>인원</th>
						<th>상태</th>
					</tr>
					<tr style="text-align: center;">
						<td>2022.11.25</td>
						<td>2</td>
						<td>itwill01</td>
						<td>학교단체</td>
						<td>키즈워크룸 : 애니메이터 프로젝트(개인)</td>
						<td><b>2022.11.25</b></td>
						<td>20 <span> 명</span></td>
						<td>승인대기</td>
					</tr>
					<tr style="text-align: center;">
						<td>2022.11.23</td>
						<td>1</td>
						<td>gomm</td>
						<td>학교단체</td>
						<td>유아프로그램: 꼬마뮤지엄</td>
						<td><b>2022.11.25</b></td>
						<td>10 <span> 명</span></td>
						<td>승인완료</td>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>

</body>

<%@ include file="/common/footer.jspf"%>
</html>