<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
</head>
<style>
#contentAll {
	font-size: 18px;
	text-align: center;
}

.center {
	text-align: center;
}

.right {
	text-align: right;
}

.left {
	text-align: left;
}

.title {
	font-size: 3em;
	font-weight: bold;
	text-align: center;
	border-bottom: 3px solid #F7F7F7;
}

.subtitle {
	font-size: 2em;
	font-weight: 600;
}

.subtitleline {
	border-bottom: 3px solid black;
	padding-top: 2px;
	padding-bottom: 13px;
}

.blackbtn {
	background-color: black;
	color: white;
	margin-top: 30px;
	width: 300px;
	height: 65px;
	font-size: 20px;
}

.blackbtn:hover {
	border: 1px solid black;
	background-color: white;
	color: black;
}
</style>
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
	<div class="container-filid notosanskr" id="contentAll">
		<div class="col-8 offset-2">
			<div style="border-bottom: 3px solid #F7F7F7;">
				<p class="title py-5 my-5">예매 완료</p>
				<br>
				<br>
				<br>
				<p style="font-size: 2em;">예매가 완료되었습니다.</p>
				<c:if test="${not empty vo }">
					예매번호 : <b>${vo.revNum }</b> <br><br>
				</c:if>
				<c:if test="${not empty learn }">
					예매번호 : <b>${learn.revNum }</b> <br><br>
				</c:if>
				<p>예매정보를 가입하신 이메일로 발송드렸습니다.</p>
				<p>입장시 직원에게 예매번호를 제시하여 주시기 바랍니다.</p>
				<br>
				<br>
				<button type="button" class="blackbtn" onclick="location.href='mp_ticket_le.do'">마이페이지</button>
				<br>
				<br>
				<br>
				<br>
			</div>


			<br>
			
			<div class="row my-5 left">
				<div class="col-6">
					<div>
						<p class="subtitleline">
							<span class="subtitle">결제 정보</span>
						</p>
						<c:if test="${not empty vo  }">
							<div style="line-height: 15px;">
								<p>카드결제</p>
								<p><c:if test="${vo.cardName == '' }">
									카카오페이
									</c:if>
									${vo.cardName}
									<span>${vo.cardNum } 일시불</span>
								</p>
								<p>결제금액 : <fmt:formatNumber value="${vo.totalprice }" pattern="#,###"/> 원</p>
							</div>
						</c:if>
						
						<c:if test="${not empty learn }">
							<c:if test="${learn.totalprice == 0 }">
							<div style="line-height: 15px;">
								<p>결제금액 : 0 원 (무료교육)</p>
							</div>
							</c:if>
							<c:if test="${learn.totalprice != 0 }">
							<div style="line-height: 15px;">
								<p>카드결제</p>
								<p><c:if test="${learn.cardName == '' }">
									카카오페이
									</c:if>
									${learn.cardName}
									<span>${learn.cardNum } 일시불</span>
								</p>
								<p>결제금액 : <fmt:formatNumber value="${learn.totalprice }" pattern="#,###"/> 원</p>
							</div>
							</c:if>
						</c:if>
						
						
						
						
						
						
					</div>
				</div>
				<div class="col-6">
					<div>
						<p class="subtitleline">
							<span class="subtitle">예매 정보</span>
						</p>
						<c:if test="${not empty vo }">
						<div style="line-height: 15px;">
							<p>전시명 : ${vo.exhName }</p>
							<p>관람일 : ${vo.revDate }</p>
							
						 <c:set var="adult" value="${vo.adult}" />
						 <c:set var="teens" value="${vo.teens}" />
						 <c:set var="child" value="${vo.child}" />
						 <%
						      int adult = (Integer)pageContext.getAttribute("adult") ;
						      int teens = (Integer)pageContext.getAttribute("teens") ;
						      int child = (Integer)pageContext.getAttribute("child") ;
						      
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
						      
						      String printrt = result.substring(0, result.length()-2);
						 %>
							<p>
								관람인원 : <%=printrt %>
							</p>
						</div>
						</c:if>
						<c:if test="${not empty learn }">
						<div style="line-height: 15px;">
							<p>교육명 : ${learn.title }</p>
							<p>교육일시 : ${learn.revDate } ${learn.time }</p>
							<p>교육인원 : ${learn.subscriber }명</p>
						</div>
						</c:if>
					</div>
				</div>
			</div>
			
			<br>
			<br>
			<br>
		</div>
	</div>
	<%@ include file="/common/footer.jspf"%>
</body>
</html>