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
}

input[type=date] { 
	border-radius: 0;
	border: 1px solid silver;
	width: 220px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}


.extable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

.extable img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}

#am_learncenter { color: black; font-weight: bold; }

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
				<span style="font-size: 1.3em; font-weight: bold;">교육 프로그램 관리</span>
				
				<div style="float: right;">
				<button type="button" class="btn btn-sm btn-dark">교육등록</button>
				<button type="button" class="btn btn-sm btn-dark">교육수정</button>
				<button type="button" class="btn btn-sm btn-dark">교육삭제</button>
				</div>
				
				<hr style="border: 0; height: 2px; background: black;">
				
				<table class="extable" style="width: 100%;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>선택</th>
						<th>프로그램번호</th>
						<th>카테고리</th>
						<th>이미지</th>
						<th>프로그램명</th>
						<th>교육진행</th>
					</tr>
					<tr style="text-align: center;">
						<td><input type="checkbox"></td>
						<td>255</td>
						<td>유아</td>
						<td>
							<img alt="" src="https://cdn.daelimmuseum.org/Program/Learn/List/B/Big/202205/20220504184703612001.png">
						</td>
						<td><b>유아프로그램: 꼬마뮤지엄</b></td>
						<td><b>2022.04.22 ~ 2022.11.27</b></td>
					</tr>
					<tr style="text-align: center;">
						<td><input type="checkbox"></td>
						<td>254</td>
						<td>어린이</td>
						<td>
							<img alt="" src="https://cdn.daelimmuseum.org/Program/Learn/List/B/Big/202204/20220408201908816001.jpg">
						</td>
						<td><b>키즈워크룸 : 애니메이터 프로젝트(개인)</b></td>
						<td><b>2022.04.01 ~ 2022.11.27</b></td>
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