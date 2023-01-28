<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXHIBITION | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	.ticketTop {
		width: 100%;
		height: 50px;
		table-layout: fixed;
		text-align: center;
		margin: 30px 0;
		border: 1px solid #949494;
		color: #949494;
	}
	.border {
		border: 1px solid #949494; 
	}
	
	.badge {
		background-color: black;
		color: white;
		padding: 10px;
		width: 100px;
		text-align: center;
		border-radius: 0;
	}
	
	.hov {color:gray; cursor: pointer;}
	.hov:hover {color:black;}
	
	
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


<div class="container-filid notosanskr" style="margin: 0 auto;">
	<div class="row" style="margin: 0;">
		<div class="col-8 offset-2">
			<table class="ticketTop">
				<tr>
					<td class="border" style="background-color: black; color: white;">
						01. 티켓 선택
					</td>
					<td class="border">
						02. 관람일/인원 선택
					</td>
					<td class="border">
						03. 결제
					</td>
				</tr>
			</table>
			<br>
			<div style="text-align: center; font-weight: bold; font-size: 1.1em;">
				<a href="ExticketList.do" 
					style="margin-right: 50px; padding-bottom:15px; color: black; text-decoration: none; border-bottom:1px solid black; border-bottom-width:thick; ">EXHIBITION</a>
				<a href="LearnticketList.do" style="color: #949494; text-decoration: none;">LEARN</a>
			</div>
			<hr>
			<div class="row" style="color: #949494;">
				<div class="col-6">
					총 <span style="color: black;">${list.size() }</span>건
				</div>
				<div class="col-6" style="text-align: right;">
					<span class="hov" onclick="location.href='ExticketList.do'">최신순</span>
					<span>|</span>
					<span class="hov" onclick="location.href='ExticketListPast.do'">오래된순</span>
				</div>
			</div>
			<div class="row" style="padding: 50px 0;">
				<c:if test="${empty list}">
					<div class="col-12" style="text-align: center; padding: 100px 0;">
					<strong style="font-size: 2em; color: gray">현재 예매 가능한 티켓이 없습니다.</strong>
					</div>
				</c:if>
				
				<c:if test="${not empty list}">
				<c:forEach var="vo" items="${list }" varStatus="status">
				<div class="col-7" style="padding-bottom: 50px;">
					<a href="javascript:checklogin(${vo.exhNum })">
					<img alt=".." src="${pageContext.request.contextPath}/exhibitionImg/${vo.ticketImg }" width="100%;">
					</a>
				</div>
				<div class="col-5">
				<span class="badge">
					아이뮤지엄
				</span>
				<p style="font-size: 2.5em; font-weight: bold; cursor: pointer;" onclick="checklogin(${vo.exhNum })">
					${vo.exhName }
				</p>
				<p style="font-size: 1.1em; font-weight: bold;">${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }</p>
				</div>
				</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</div>


<script>

function checklogin(exhNum) {
	<c:if test="${empty member }">
	location.href='moveToSign.do';
	</c:if>
	
	<c:if test="${not empty member}">
	location.href='ticketExhibition.do?exhNum='+exhNum;
	</c:if>
}

</script>


</body>
<%@ include file="/common/footer.jspf"%>
</html>