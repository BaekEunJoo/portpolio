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
			<p style="font-size: 4em; font-weight: bold;">개인정보 처리방침</p>
		</div>
		<div class="col-6 text-end" id="noweb">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;개인정보 처리방침 </span>
		</div>
	</div>

	<div class="row" style="margin-bottom: 100px;">
		<div class="col-12">
			<div>
				<p>대림문화재단 (이하 "재단"은) 이용자의 개인정보를 중요시하며, 개인정보보호법을 준수하고 있습니다.</p>			
				<p>재단은 개인정보처리방침을 통하여 이용자께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>			
				<p style="color: #DA2A21;">본 방침은 2022년 9월 16일부터 시행됩니다.</p>			
			</div>
			<div class="row">
			<div class="col-5">
			1. 개인정보의 처리 목적<br>
			2. 개인정보의 처리 및 보유기간<br>
			3. 처리하는 개인정보의 항목<br>
			4. 개인정보의 제3자 제공에 관한 사항<br>
			5. 개인정보 처리업무의 위탁에 관한 사항<br>
			6. 개인정보의 파기 절차 및 방법에 관한 사항<br>
			7. 정보주체와 법정대리인의 권리·의무 및 행사방법에 관한 사항<br>
			</div>			
			<div class="col-7">
			8. 개인정보의 안전성 확보조치에 관한 사항<br>
			9. 개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항<br>
			10. 개인정보 보호책임자 및 개인정보의 열람청구를 접수·처리하는 부서에 관한 사항<br>
			11. 정보주체의 권익침해에 대한 구제방법<br>
			12. 개인정보 처리방침의 변경에 관한 사항<br>
			</div>
			</div>
			<hr>
			<div>
			<p>1. 개인정보의 처리 목적</p>
			<p>재단은 수집한 개인정보를 다음의 목적을 위해 활용합니다.</p>
			
			<p>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</p>
			o 콘텐츠 제공 , 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스, 재단에서 진행하는 프로그램 참가자의 본인 확인<br><br>
			<p>나. 회원 관리</p>
			o 회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달<br><br>
			<p>다. 마케팅 및 광고에 활용</p>
			o 이벤트 등 광고성 정보 전달 , 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계<br><br>
			</div>			
			<hr>
		</div>
	</div>

</div>


</body>
<%@ include file="/common/footer.jspf"%>
</html>