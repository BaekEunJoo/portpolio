<%@page import="java.text.DecimalFormat"%>
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
	
	.hov:hover {color: black;}
	
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

<div class="container-filid notosanskr" style="margin: 0 auto; padding-bottom: 50px;">
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
				<a href="ExticketList.do" style="margin-right: 50px; color: #949494; text-decoration: none;">EXHIBITION</a>
				<a href="LearnticketList.do" style="color: black; text-decoration: none; border-bottom:1px solid black; border-bottom-width:thick; padding-bottom:15px; ">LEARN</a>
			</div>
			<hr>
			<div style="padding-bottom: 30px; color: #949494; cursor: pointer;">
				<span class="hov" onclick="location.href='LearnticketList.do'">전체</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=1'">유아</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=2'">어린이</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=3'">청소년</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=4'">대학생</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=5'">성인</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=6'">교사</span>
				<span style="color: #EAEAEA;">|</span>
				<span class="hov" onclick="location.href='LearnticketCategory.do?categoryNum=7'">전시해설</span>
			</div>
			<div class="row" style="color: #949494;">
				<div class="col-6" style="padding-bottom: 10px;">
					총 <span style="color: black;">${learnList.size() }</span>건
				</div>
			</div>
			<!--======================================= -->
			<c:if test="${empty learnList }">
				<p style="font-size: 1.3em; color: gray; text-align: center; padding: 100px 0;">현재 예매 가능한 티켓이 없습니다.</p>
			</c:if>
			<c:forEach var="learnList" items="${learnList }" varStatus="status">
			<div class="row" style="padding-bottom: 50px; cursor: pointer;" onclick="checklogin(${learnList.learnIdx }, ${learnList.educationNum})">
				<div class="col-6">
					<img alt=".." src="${pageContext.request.contextPath}/learnImage/${learnList.fileName }" width="100%;" height="280px;" style="object-fit: cover;">
				</div>
				<div class="col-6">
				<span class="badge">
					<c:if test="${learnList.educationNum == 0 }">
					교육  
					</c:if>
					<c:if test="${learnList.educationNum == 1 }">
					1회성 교육 
					</c:if>
					<c:if test="${learnList.educationNum == 2 }">
					단체 교육  
					</c:if>
				</span>
				<span class="badge">
					아이뮤지엄
				</span>
				<br>
				<span style="font-size: 2em; font-weight: bold;">${learnList.title}</span><br>
				<span style="font-size: 0.9em; color: gray;">${learnList.subtitle}</span>
				
				<br>
				<table style="color: gray; margin-top: 20px;">
					<tr>
						<td width="100px;">교육진행</td>
						<td>${learnList.regdate1.replace("/", "-")} ~ ${learnList.regdate2.replace("/", "-")}</td>
					</tr>
					<tr>
						<td>장소</td>
						<td>${learnList.place}</td>
					</tr>
					<tr>
						<td>대상</td>
						<td>${learnList.target}</td>
					</tr>
					<tr>
						<td>교육시간</td>
						<td>${learnList.educationTimeNum}</td>
					</tr>
					<tr>
					<c:set var="fee" value="${learnList.fee}"/>
					<%
						String fee = (String)pageContext.getAttribute("fee");
						System.out.println("fee : " + fee);
						String feeout = "";
						if (fee.equals("무료")){
							feeout = "0";
						} else {
							feeout = fee.replace("원", "");
						}
						int feeprint = Integer.parseInt(feeout);
						DecimalFormat decFormat = new DecimalFormat("###,###");
					
					%>
						<td>참가비</td>
						<td>
						<c:if test="${learnList.fee eq '무료' }">
							${learnList.fee }
						</c:if>
						<c:if test="${learnList.fee ne '무료' }">
							<%=decFormat.format(feeprint) %>원
						</c:if>
						</td>
					</tr>
				</table>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
</div>



<script>

function checklogin(learnIdx, educationNum) {
	<c:if test="${empty member }">
	location.href='moveToSign.do';
	</c:if>
	
	<c:if test="${not empty member}">
		if(educationNum == 1){
			location.href='ticketLearn.do?learnIdx='+learnIdx;
		}
		if(educationNum == 2){
			location.href='moveTogroupReservation.do?learnIdx='+learnIdx;
		}
	</c:if>
}

</script>






</body>
<%@ include file="/common/footer.jspf"%>
</html>