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
#program::after {
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
	
	
	<div class="container-fluid">
		<div class="container">
			<div class="cate">
				<ul class="cate nav justify-content-center" style="padding-top:40px;">
				  <li class="nav-item">
				    <a class="nav-link active" id="all" aria-current="page" href="#" onclick="location.href='allNotice.do'" style="color:gray;">전체</a>
				  </li> 
				  <li class="nav-item">
				    <a class="nav-link active" id="program" aria-current="page" href="#" onclick="location.href='deNotice.do'" style="color:black;">디뮤지엄</a>
				  </li>  
				  <li class="nav-item">
				    <a class="nav-link active" id="reservation" aria-current="page" href="#" onclick="location.href='daeNotice.do'" style="color:gray;">대림미술관</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" id="shop" aria-current="page" href="#" onclick="location.href='guNotice.do'" style="color:gray;">구슬모아당구장</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" id="location" aria-current="page" href="#" onclick="location.href='muNotice.do'" style="color:gray;">뮤지엄샵</a>
				  </li>
				</ul>
			</div>	
		</div>
		<hr>
		
		<div class="container mt-5">
			<div class="noticeCount">총 &nbsp;<b>3</b>건</div>
			<hr>
			<div>
				<table style="line-height:70px; margin-bottom:200px; border-bottom:1px solid lightgray;">
				<c:choose>
					<c:when test="${empty deNotice }">
						<div style="text-align: center; font-size: 2em;">작성된 공지사항이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="deNotice" items="${deNotice }">
							<tr>
								<td>${deNotice.noNum }&nbsp;|&nbsp;${deNotice.noCategory }</td>
							</tr>
							<tr style="border-bottom:1px solid lightgray;">
								<td>
									<div>
										<span style="font-size:1.5em;">${deNotice.noTitle }</span>
										<span style="font-size:0.7em; float:right; margin-left:400px;">${deNotice.noDate }</span>
									</div>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</table>
				<hr>
			</div>
		</div>
		
	</div>
	</div>
		
 	<%@include file ="/common/footer.jspf" %>
</body>
</html>