<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SITEMAP | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	#noweb {
		color: #949494;
		font-size: 0.9em;
		padding-left: 30%;
		margin: auto 0;
	}
	
	.howto {
		color: #949494;
	}
	
	#maptable {
		width: 100%;
	}
	
	#maptable th {
		font-size: 1.5em;
		border-bottom: 2px solid black;
	}
	#maptable td { font-size: 1.1em; padding-top: 20px; color: gray;}
	
	#backblack p {
		background-color: black; 
		color: white;
		padding: 20px;
		margin-left: 50px;
	}
	
	#blackmenu {
		background-color: black; 
		color: white;
		padding: 20px;
		margin-left: 50px;
	}
	
	#maptable a, #backblack a { color: inherit; text-decoration: none;}
	
	
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


<div class="container notosanskr" style="margin: 0 auto;">
	<div class="row">
		<div class="col-6" style="margin-top: 40px; margin-bottom: 40px;">
			<p style="font-size: 4em; font-weight: bold;">SITEMAP</p>
		</div>
		<div class="col-6 text-end" id="noweb">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;SITEMAP </span>
		</div>
	</div>

	<div class="row" style="margin-bottom: 100px;">
		<div class="col-8">
			<table id="maptable">
				<tr>
					<th width="26%">VISIT</th>
					<td width="11%"></td>
					<th width="26%">EXHIBITION</th>
					<td width="11%"></td>
					<th width="26%">LEARN</th>
				</tr>
				<tr>
					<td><a href="visit.do">미술관소개</a></td>
					<td></td>
					<td><a href="exhibitionNow.do">현재전시</a></td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=1">유아</a></td>
				</tr>
				<tr>
					<td rowspan="6" style="vertical-align: top;">
						<a href="us.do">오시는길</a>
					</td>
					<td></td>
					<td rowspan="6" style="vertical-align: top;">
						<a href="exhibitionPast.do">지난전시</a>
					</td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=2">어린이</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=3">청소년</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=4">대학생</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=5">성인</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=6">교사</a></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><a href="categoryLearn.do?categoryNum=7">전시해설</a></td>
				</tr>
				<tr>
					<th><a href="ExticketList.do">TICKET <span style="float: right;">→</span></a></th>
					<td></td>
					<th><a href="ProductList.do">SHOP <span style="float: right;">→</span></a></th>
					<td></td>
				</tr>
			</table>
		</div>
		
		<div class="col-4" id="backblack">
			<p>
				<a href="moveToSign.do">
					BECOME A MEMBER <span style="float: right;">→</span>
				</a>
			</p>
			<c:choose>
				<c:when test="${empty member }">
					<p>
						<a href="moveTologin.do">
						MY PAGE <span style="float: right;">→</span>
						</a>
					</p>
				</c:when>	
				<c:when test="${not empty member }">
					<p>
						<a href="mypage_main.do">
						MY PAGE <span style="float: right;">→</span>
						</a>
					</p>
				</c:when>
			</c:choose>
			
			<div id="blackmenu">
				<br>
				<span><a href="FAQ.do">FAQ</a></span>
				<br><br>
				<span>NOTICE</span>
				<br><br>
				<span>CALENDER</span>
				<br><br>
			</div>
		
		</div>
		
	</div>

</div>


<script>
	function chk() {
		
	}


</script>




</body>
<%@ include file="/common/footer.jspf"%>
</html>