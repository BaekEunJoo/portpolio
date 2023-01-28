<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
input {accent-color: black;}
.cate {
	color:black; !important
}
#noweb {
	color: #949494;
	font-size: 0.9em;
	padding-left:180px;
	margin: auto 0;
}
.lineTest {
	  display: flex;
	  flex-basis: 100%;
	  align-items: center;
	  margin: 0px 0px;
}
.lineTest::before {
	  content: "";
	  flex-grow: 1;
	  background: rgba(0, 0, 0, 0.35);
	  height: 1px;
	  font-size: 0px;
	  line-height: 0px;
	  margin: 0px 16px;
}
#all::after {
   content: '';
   width: 100%;
   display: block;
   position: relative;
   margin-top: 20px;
   padding-bottom:0;
   border-bottom: 3px solid #000;
}
.noticeCount {
	font-size:0.7em;
}
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
	<%@include file = "/common/main.jspf" %>
	
	<div class="container-fluid notosanskr">
		<div class="row">
			<div class="col-3" style="margin-top: 40px; margin-bottom: 40px;">
				<div class="lineTest" style="font-size: 4em; font-weight: bold;">공지사항</div>
			</div>
			<div class="col-5">
			</div>
			<div class="col-4 text-end" id="noweb">
				<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor:pointer; font-size:1.1em;"></i>
				<span>&nbsp;&nbsp;|&nbsp;공지사항 </span>
			</div>
		</div>
	
	<hr>
	<div class="container-fluid">
		<div class="container mt-5">
			<table style="line-height:70px; border-bottom:1px solid lightgray;">
				<tr>
					<td>3&nbsp;|&nbsp;디뮤지엄</td>
				</tr>
				<tr style="border-bottom:1px solid lightgray;">
					<td>
						<div>
							<span style="font-size:1.5em;">초·중·고등학교 교사 대상, 디뮤지엄 교사 워크숍 개최 안내</span>
							<span style="font-size:0.7em; float:right; margin-left:400px;">2022-12-08 12:51:55</span>
						</div>
					</td>
				</tr>
			</table>
			<div class="container" style="background-color:#f1f3f5; margin-bottom:200px;">
				<p style="padding:20px;">
					안녕하세요. 디뮤지엄입니다.<br>
					한남동에 위치했던 디뮤지엄이 성수동 서울숲 인근으로 이전한 뒤 개최한 첫 전시 《어쨌든, 사랑: Romantic Days》이 11월 27일까지 연장 개관합니다.
					디뮤지엄을 방문해주신 관람객 여러분의 성원에 힘입어 더 많은 분들이 전시의 설렘과 감동을 느낄 수 있도록 전시 연장을 진행하오니 아래 내용을 참고하시어 깊어가는 가을,
					전시를 통해 다채로운 사랑의 순간들을 다시 한번 마주해 보시기 바랍니다.<br><br>
					<strong>[전시 기간]</strong><br>
					2022.03.16 ~2022.10.30 <strong>➞ 2022.11.27 종료</strong><br><br>
					- 휴관일: 매주 월요일 (11/21 제외)<br>
					- 특별 연장 개관: 11/19 ~11/27까지 휴관 없이 9시까지 운영 (입장 마감 8 PM)<br>
					<strong>[이용 정보]</strong><br><br>
					● 로맨틱 로드 이벤트는 전시 연장에 맞춰 11/27일까지 연장됩니다.<br>
					● 전시 연장 개관에 따라 하기 PIN 번호 또는 쿠폰 번호의 유효 기간이 11월 27일(일)까지 자동으로 연장됩니다.<br>
					● 문의: 디뮤지엄 (02-6233-7200)
				</p>
			</div>
		</div>
	</div>
</div>
		
 	<%@include file ="/common/footer.jspf" %>
</body>
</html>