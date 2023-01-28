<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
	.badge {
	background-color: black;
	color: white;
	padding: 10px;
	width: 100px;
	text-align: center;
	border-radius: 0;
	}
	
	.btn {border-radius: 0;}
	
	.imgsize img {
  	width: 100%;
  	height: 230px;
  	object-fit: cover;
	}
	
	#searchnav a {text-decoration: none; color: black; font-size: 0.9em;}
	
	
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
		<div class="col-6" style="margin-top: 40px;" id="line" >
			<p style="font-size: 4em; font-weight: bold;">Search</p>
		</div>
	</div>
</div>
<hr>


<%
String search = request.getParameter("searchKeyword");
%>


<div class="container-fulid notosanskr">
	<div class="row" style="margin: 0;">
		<div class="col-8 offset-2 notosanskr d-flex justify-content-center" 
			style="background-color: white; padding: 20px; width: 100%; ">
			<form action="search.do" name="findForm" method="post">
			<input type="text" placeholder="검색어를 입력하세요" value="<%=search %>" name="searchKeyword" id="findkeyword"
				style="width:500px; border:none; border-bottom: 2px solid black; height: 50px; outline: none;">
			</form>
			<i class="bi bi-search" onclick="findchk()"
			style="font-size: 1.5em; cursor: pointer; margin-left: 10px;"></i>
		</div>
		<div class="col-8 offset-2 notosanskr">
			<p id="tworow" style="margin-left: 350px; color: #ED0000; font-size: 0.8em; visibility:hidden">
				2글자 이상의 검색어를 입력하세요.
			</p>
		</div>
	</div>	
	<div style="padding-top: 30px;">
	<ul class="nav justify-content-center" id="searchnav">
		<li class="nav-item">
			<a class="nav-link active" href="search.do?searchKeyword=<%=search %>" style="border-bottom:1px solid black; border-bottom-width:thick; padding-bottom:20px;">
				전체 ${exhibitionList.size()+learnList.size() }
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="searchExhibition.do?searchKeyword=<%=search %>">EXHIBITION ${exhibitionList.size() }</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="searchLearn.do?searchKeyword=<%=search %>">LEARN ${learnList.size() }</a>
		</li>
	</ul>
	</div>
	<hr style="margin-top: 0;">
	
	<c:if test="${empty exhibitionList and empty learnList }">
		<p style="font-size: 1.5em; text-align: center; color: gray; padding: 100px 0;">
			검색결과가 없습니다
		</p>
	</c:if>
	
	<div class="row" style="padding-bottom: 100px; margin: 0;">
	<c:if test="${not empty exhibitionList }">
		<div class="col-8 offset-2">
			<strong style="font-size: 2em;">EXHIBITION</strong>
			
			<c:forEach var="ex" items="${exhibitionList }">
			<div class="row" style="padding: 20px 0;">
				<div class="col-4 imgsize">
					<img alt="" src="${pageContext.request.contextPath}/exhibitionImg/${ex.ticketImg}">
				</div>
				
				<div class="col-6">
				<c:set var="Ldate" value="${ex.lastDate.substring(0,10)}" />

						<%
							Calendar cal = Calendar.getInstance();
					
							String strYear = request.getParameter("year");
							String strMonth = request.getParameter("month");
					
							int year = cal.get(Calendar.YEAR);
							int month = cal.get(Calendar.MONTH);
							int date = cal.get(Calendar.DATE);
					
							if(strYear != null)
							{
							  year = Integer.parseInt(strYear);
							  month = Integer.parseInt(strMonth);
							  
							}else{
					
							}
							//년도/월 셋팅
							cal.set(year, month, 1);
					
							int startDay = cal.getMinimum(java.util.Calendar.DATE);
							int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
							int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
							int newLine = 0;
					
							//오늘 날짜 저장
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
							int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
						
							
							String Ldate = (String)pageContext.getAttribute("Ldate");
							Ldate = Ldate.replaceAll("-","");
							
							int lastDate = Integer.parseInt(Ldate); //전시마감일
						%>
						
						<%
							if(intToday <= lastDate){%>
								<p><span class="badge">현재전시</span></p>
							<%} else {%>
								<p><span class="badge">지난전시</span></p>
							<%}
						%>
				
				<p style="font-size: 1.5em;"><b>${ex.exhName }</b></p>
				<p style="padding-top: 30px;">장소: 아이뮤지엄
					<span style="padding-left: 10px;">일시: ${ex.startDate.substring(0,10) } ~ ${ex.lastDate.substring(0,10) }</span>
				</p>
				</div>
				
				<div class="col-2" style="padding-top: 75px;">
					<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='exhibitionDetail.do?exhNum=${ex.exhNum}'">
						자세히보기
					</button>
				</div>
			</div>
			<hr>
			</c:forEach>
		</div>
		</c:if>
		
		<div class="col-8 offset-2">
			<c:if test="${not empty learnList }">
			<strong style="font-size: 2em;">LEARN</strong>
			
			
			
			<c:forEach var="learn" items="${learnList }">
			<div class="row" style="padding: 20px 0;">
				<div class="col-4 imgsize">
					<img alt="" src="${pageContext.request.contextPath}/learnImage/${learn.fileName }">
				</div>
				
				<div class="col-6">
				<c:choose>
					<c:when test="${learn.categoryNum == 1 }"><p><span class="badge">유아</span></p></c:when>
					<c:when test="${learn.categoryNum == 2 }"><p><span class="badge">어린이</span></p></c:when>
					<c:when test="${learn.categoryNum == 3 }"><p><span class="badge">청소년</span></p></c:when>
					<c:when test="${learn.categoryNum == 4 }"><p><span class="badge">대학생</span></p></c:when>
					<c:when test="${learn.categoryNum == 5 }"><p><span class="badge">성인</span></p></c:when>
					<c:when test="${learn.categoryNum == 6 }"><p><span class="badge">교사</span></p></c:when>
					<c:when test="${learn.categoryNum == 7 }"><p><span class="badge">전시해설</span></p></c:when>
				</c:choose>
				
				<p style="font-size: 1.5em;"><b>${learn.title }</b></p>
				<p style="font-size: 0.8em; color: gray;">${learn.subtitle }</p>
				<p style="padding-top: 20px;">장소: ${learn.place }
					<span style="padding-left: 10px;">일시: ${learn.regdate1.replace("/", "-") } ~ ${learn.regdate2.replace("/", "-") }</span>
				</p>
				</div>
				<c:set var="endDate" value="${learn.regdate2.substring(0,10)}" />
				<%
							Calendar cal = Calendar.getInstance();
					
							String strYear = request.getParameter("year");
							String strMonth = request.getParameter("month");
					
							int year = cal.get(Calendar.YEAR);
							int month = cal.get(Calendar.MONTH);
							int date = cal.get(Calendar.DATE);
					
							if(strYear != null)
							{
							  year = Integer.parseInt(strYear);
							  month = Integer.parseInt(strMonth);
							  
							}else{
					
							}
							//년도/월 셋팅
							cal.set(year, month, 1);
					
							int startDay = cal.getMinimum(java.util.Calendar.DATE);
							int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
							int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
							int newLine = 0;
					
							//오늘 날짜 저장
							Calendar todayCal = Calendar.getInstance();
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
							int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
						
							
							String Ldate = (String)pageContext.getAttribute("endDate");
							Ldate = Ldate.replaceAll("/","");
							
							int lastDate = Integer.parseInt(Ldate); //전시마감일
						%>
						<%
							if(intToday <= lastDate){%>
								<div class="col-2" style="padding-top: 75px;">
									<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='getLearn.do?learnIdx=${learn.learnIdx }'">
										자세히보기
									</button>
								</div>
							<%}
						%>
				
			</div>
			</c:forEach>
			<hr>
		</c:if>	
		</div>
	</div>
</div>

<script>
	
	function findchk() {
		var f = document.findForm;
		var keyword = $("#findkeyword").val();
		//alert(keyword.length);
		
		if(keyword.length < 2){
			//alert('2글자 이상의 검색어를 입력하세요.');
			 var h1 = document.getElementById('tworow');
			 h1.style.visibility = "visible";
		} else {
			f.submit();
		}
	}

</script>




</body>
<%@ include file="/common/footer.jspf"%>
</html>