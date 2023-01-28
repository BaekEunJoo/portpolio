<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>               
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXHIBITION | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	
	@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}

	#namef {
	font-family: 'Cafe24SsurroundAir';
	}
	
	.underln {
		font-size: 2em; 
		font-weight: bold; 
		
	}
	
	aside {
		position: fixed;
	    bottom: 40px;
	    right: 47px;
	    cursor: pointer;
	}
	    
	nav.exhibition_nav ul{list-style: none;}
	a{color: inherit; text-decoration: none;}
	nav.exhibition_nav a:hover{text-decoration: none;}
	nav.exhibition_nav{border-bottom: 1px solid #ccc; margin-top: 20px;}
	nav.exhibition_nav ul{margin: 16px auto 0; width:300px; display: flex;}
	nav.exhibition_nav ul li{width: calc((100% - 40px) / 2);}
	nav.exhibition_nav ul li:first-child{margin-right: 40px;}
	nav.exhibition_nav ul li a{display:block; font-size: 20px; padding-bottom:16px; text-align: center;}
	nav.exhibition_nav ul li.line::after{content: ''; display: block; width: 100%; height:4px; background-color: #000;}
	nav.exhibition_nav.on{position:fixed; top: 41px; left: 0; width: 100%; background-color: #fff; z-index: 20;}
	.at_row{padding-bottom: 100px;}
	    
	
	
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
		<div class="col-8" style="margin-top: 40px;">
			<span style="font-weight: bold; font-size: 4em;">
			${evo.exhInfo }
		</span>
		<br>
		<span style="font-size: 2em;" id="namef">
			${evo.exhName }
		</span>
		<br>
		<span style="font-size: 1.2em; font-weight: bold;">
			디뮤지엄 | 
		</span>
		<span style="font-weight: bold; font-size: 1.1em;">
			${evo.startDate.substring(0,10) } ~ ${evo.lastDate.substring(0,10) }
		</span>
		</div>

		<c:set var="Ldate" value="${evo.lastDate.substring(0,10) }" />

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
		
		<% if(intToday <= lastDate) {%>
		<div class="col-4 text-end align-self-end">
		<span style="margin: 20px; font-size: 1.2em; background-color:black; color: white;
			border: 2px solid black; padding: 10px 60px; cursor: pointer;" onclick="checklogin()">
			예매하기
		</span>
		</div>
		<%}%>
		
	</div>
</div>
<br>
<hr>

<div class="container-filid notosanskr">
	<div class="row" style="padding: 0; margin: 0;">
		<div>
			<img alt="" src="${pageContext.request.contextPath}/exhibitionImg/${evo.upImg }"
				style="max-width: 100%;">
		</div>
		
		<div style="margin-left: 60%; padding-top: 20px;">
			<table style="border-left: 2px solid black;">
				<c:if test="${not empty evo.genre}">
				<tr>
					<td style="padding-left: 20px;">장르</td>
					<td style="padding-left: 20px;">${evo.genre }</td>
				</tr>
				</c:if>
				<tr>
					<td style="padding-left: 20px;">주최</td>
					<td style="padding-left: 20px;">아이뮤지엄</td>
				</tr>
				<c:if test="${not empty evo.partnership}">
				<tr>
					<td style="padding-left: 20px;">후원</td>
					<td style="padding-left: 20px;">${evo.partnership }</td>
				</tr>
				</c:if>
			</table>
		</div>
	</div>
</div>
<nav class="exhibition_nav notosanskr">
	<ul>
		<li class="line">
			<a href="#ex_introduce">전시소개</a>
		</li>
		<li>
			<a href="#at_introduce">작가소개</a>
		</li>
	</ul>
</nav>

<aside>
<i class="bi bi-arrow-up-circle-fill top" style="font-size: 3em;"></i>	
</aside>

<div class="container notosanskr">
	<div class="row" style="padding-top: 50px;">
	<p class="underln" id="ex_introduce">전시소개</p>
			<img alt="" src="${pageContext.request.contextPath}/exhibitionImg/${evo.infoImg }" width="100%;">
	</div>
	
	<p class="underln" id="at_introduce" style="padding-top: 100px;">작가소개</p>
	<c:if test="${empty list }">
		<p style="text-align: center; font-size: 1.3em; color: gray; padding: 20px 0;">등록된 작가소개가 없습니다.</p>
	</c:if>
	<div class="row">
			<div class="row at_row" style="text-align: center; font-size: 1.3em; font-weight: bold;">
				<c:forEach var="artist" items="${list }" varStatus="status">
				<div class="col-lg-3 col-md-6 mt-3 mr-auto">
					<div class="card" style="width: 16rem; border: none;">
						<img src="${pageContext.request.contextPath}/artistImg/${artist.artistImage}" class="card-img-top" alt="...">
						<div class="card-body">
						<p class="card-text" style="margin-bottom: 0;">${artist.artist }</p>
						<p data-toggle="modal" data-target="#exampleModal${status.index }"
							style="color: black; font-weight: normal; font-size: 0.8em; cursor: pointer;">자세히 보기</p>
						</div>
					</div>
				</div>
				<!-- Modal -->
				<div class="modal fade notosanskr" id="exampleModal${status.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-xl modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header" style="background-color: black;">
				        <h5 class="modal-title" id="exampleModalLabel" style="color: white;">작가소개</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true" style="color: white;">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body" style="font-size: 0.8em; font-weight: normal; text-align: left;">
				      	<p style="font-size: 2em; margin-left: 20px;"><b>${artist.artist }</b></p>
				      	<div class="container">
				      		<div class="row">
				      			<div class="col-4">
				      				<img src="${pageContext.request.contextPath}/artistImg/${artist.artistImage}" alt="..." width="100%;">
				      			</div>
				      			<div class="col-8" style="color: gray;">
				       				 ${artist.artistInfo }
				      			</div>
				      		</div>
				      	</div>
				      </div>
				    </div>
				  </div>
				</div>
				</c:forEach>
			</div>	
		</div>	
</div>


<script>
   $('aside .top').on('click',function(){
      $('html, body').animate({scrollTop: 0},500);
    });

    $(window).scroll(function(){
      var curr = $(this).scrollTop();
      var target = 0;
      var windowTop = $(window).scrollTop();
      var atIntroduce = $('#at_introduce').offset().top - 60;
      
      if(curr > target){
            $('aside .top').addClass('on');
        }else{
            $('aside .top').removeClass('on');
        }
      
      	if(windowTop > 1000){
			$('.exhibition_nav').addClass('on');
      	}else{
			$('.exhibition_nav').removeClass('on');
      	}
      	
      	if(atIntroduce > windowTop){
      		$('nav.exhibition_nav ul li:first-child').addClass('line');
      		$('nav.exhibition_nav ul li:last-child').removeClass('line');
      	}else{
      		$('nav.exhibition_nav ul li:first-child').removeClass('line');
      		$('nav.exhibition_nav ul li:last-child').addClass('line');
      	}
    });
    
		
    
    function checklogin() {
    	<c:if test="${empty member }">
    	location.href='moveToSign.do';
    	</c:if>
    	<c:if test="${not empty member}">
    	location.href='ticketExhibition.do?exhNum=${evo.exhNum }';
    	</c:if>
    }
    
    
    
    

</script>

</body>
<%@ include file="/common/footer.jspf"%>
</html>