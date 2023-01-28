<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXHIBITION | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	#noweb {
		color: #949494;
		font-size: 0.9em;
		padding-left: 30%;
		margin: auto 0;
	}
	
	@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}

	#namef {
	font-family: 'Cafe24SsurroundAir';
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
<%@ include file="/common/main.jspf" %>


<script>
	function getJsonExhibitionListData(year) {
		$.ajax("getJsonExhibitionList.do?year="+year, {
			type: "get",
			data: year,
			dataType: "json",
			success: function(data){
				let dispHtml = "";
				 	dispHtml += "<p style='font-size: 4em; font-weight: bold;'>"+ year +"</p>";
				if (data == "") {
					dispHtml += "<p style='font-size: 1.3em; color: gray; text-align: center; padding:100px 0;'>해당연도에 조회된 전시가 없습니다.</p>";
				} 	
				for (let vo of data) {
				 	dispHtml += "<div class='card mb-3' style='width: 100%; border: none; padding-bottom: 50px;'>";
				 	dispHtml += "<div class='row no-gutters'>";
					dispHtml += "<div class='col-md-6'>";
					dispHtml += "<div class='card-body'>";
					dispHtml += "<p class='card-title' style='background-color: black; color: white; padding: 10px; width: 100px; text-align: center;'>";
					dispHtml +=	"아이뮤지엄";
					dispHtml += "</p>";
					dispHtml += "<p class='card-text' style='font-size: 3em; font-weight: bold;'>"+ vo.exhInfo +"</p>";
					dispHtml += "<p class='card-text' style='font-size: 1.5em;'>" + vo.exhName + "</p>";
					dispHtml += "<p class='card-text' style='color: gray;'>" + vo.startDate.substring(0,10) + "~" + vo.lastDate.substring(0,10) +"</p>";
					dispHtml += "</div>";
					dispHtml += "</div>";
					dispHtml += "<div class='col-md-6'>";
					dispHtml += "<a href='exhibitionDetail.do?exhNum=" + vo.exhNum + "'>";
					dispHtml += "<img src='${pageContext.request.contextPath}/exhibitionImg/" + vo.ticketImg + "' alt='...' width='100%;'>";
					dispHtml += "</a>";
					dispHtml += "</div>";
					dispHtml += "</div>";
					dispHtml += "</div>";
					
				}
				$("#disppp").html(dispHtml);
			},
			error: function(){
				alert("실패~~");
			}
		}); 
	}
</script>


<div class="container notosanskr" style="margin: 0 auto;">
	<div class="row">
		<div class="col-6" style="margin-top: 40px;">
			<p style="font-size: 4em; font-weight: bold;">지난전시</p>
		</div>
		<div class="col-6 text-end" id="noweb">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;EXHIBITION&nbsp;&nbsp;|&nbsp;&nbsp;지난전시 </span>
		</div>
	</div>
</div>
<hr>
<div class="container-filid notosanskr">
	<div class="row" style="margin: 0;">
		<div class="col-8 offset-2">
			<div id="printyear" style="cursor: pointer; text-align: center; margin:50px auto; font-weight: bold;">
				<span onclick="location.href='exhibitionPast.do'" style="margin-right: 20px;">전체</span>
				<span id="2022" onclick="getJsonExhibitionListData(2022)" style="margin-right: 20px;">2022</span>
				<span id="2021" onclick="getJsonExhibitionListData(2021)" style="margin-right: 20px;">2021</span>
				<span id="2020" onclick="getJsonExhibitionListData(2020)" style="margin-right: 20px;">2020</span>
				<span id="2019" onclick="getJsonExhibitionListData(2019)" style="margin-right: 20px;">2019</span>
				<span id="2018" onclick="getJsonExhibitionListData(2018)" style="margin-right: 20px;">2018</span>
			</div>
			
			<div class="pastcard" id="disppp" style="padding-bottom: 50px;">
				<p style="font-size: 4em; font-weight: bold;">2022</p>
				<c:forEach var="vo" items="${list }" varStatus="status">
				<c:if test="${vo.startDate.substring(0,4) == 2022}">
				<div class="card mb-3" style="width: 100%; border: none; padding-bottom: 50px;">
				  <div class="row no-gutters">
				    <div class="col-md-6">
				      <div class="card-body">
				      <p class="card-title" style="background-color: black; color: white; padding: 10px; width: 100px; text-align: center;">
						아이뮤지엄
					  </p>
				        <p class="card-text" style="font-size: 3em; font-weight: bold;">${vo.exhInfo }</p>
				        <p class="card-text" style="font-size: 1.5em;">${vo.exhName }</p>
				        <p class="card-text" style="color: gray;">${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }</p>
				      </div>
				    </div>
				    <div class="col-md-6">
				     <a href="exhibitionDetail.do?exhNum=${vo.exhNum}">
				      <img src="${pageContext.request.contextPath}/exhibitionImg/${vo.ticketImg}" alt="..." width="100%;">
				      </a>
				    </div>
				  </div>
				</div>
				</c:if>
				</c:forEach>
				<p style="font-size: 4em; font-weight: bold;">2021</p>
				<c:forEach var="vo" items="${list }" varStatus="status">
				<c:if test="${vo.startDate.substring(0,4) == 2021}">
				<div class="card mb-3" style="width: 100%; border: none; padding-bottom: 50px;">
				  
				  <div class="row no-gutters">
				    <div class="col-md-6">
				      <div class="card-body">
				      <p class="card-title" style="background-color: black; color: white; padding: 10px; width: 100px; text-align: center;">
						아이뮤지엄
					  </p>
				        <p class="card-text" style="font-size: 3em; font-weight: bold;">${vo.exhInfo }</p>
				        <p class="card-text" style="font-size: 1.5em;">${vo.exhName }</p>
				        <p class="card-text" style="color: gray;">${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }</p>
				      </div>
				    </div>
				    <div class="col-md-6">
				      <a href="exhibitionDetail.do?exhNum=${vo.exhNum}">
				      <img src="${pageContext.request.contextPath}/exhibitionImg/${vo.ticketImg}" alt="..." width="100%;">
				      </a>
				    </div>
				  </div>
				  
				</div>
				</c:if>
				</c:forEach>
				<p style="font-size: 4em; font-weight: bold;">2020</p>
				<c:forEach var="vo" items="${list }" varStatus="status">
				<c:if test="${vo.startDate.substring(0,4) == 2020}">
				<div class="card mb-3" style="width: 100%; border: none; padding-bottom: 50px;">
				  <div class="row no-gutters">
				    <div class="col-md-6">
				      <div class="card-body">
				      <p class="card-title" style="background-color: black; color: white; padding: 10px; width: 100px; text-align: center;">
						아이뮤지엄
					  </p>
				        <p class="card-text" style="font-size: 3em; font-weight: bold;">${vo.exhInfo }</p>
				        <p class="card-text" style="font-size: 1.5em;">${vo.exhName }</p>
				        <p class="card-text" style="color: gray;">${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }</p>
				      </div>
				    </div>
				    <div class="col-md-6">
				      <a href="exhibitionDetail.do?exhNum=${vo.exhNum}">
				      <img src="${pageContext.request.contextPath}/exhibitionImg/${vo.ticketImg}" alt="..." width="100%;">
				      </a>
				    </div>
				  </div>
				</div>
				</c:if>
				</c:forEach>
				<p style="font-size: 4em; font-weight: bold;">2019</p>
				<c:forEach var="vo" items="${list }" varStatus="status">
				<c:if test="${vo.startDate.substring(0,4) == 2019}">
				<div class="card mb-3" style="width: 100%; border: none; padding-bottom: 50px;">
				  <div class="row no-gutters">
				    <div class="col-md-6">
				      <div class="card-body">
				      <p class="card-title" style="background-color: black; color: white; padding: 10px; width: 100px; text-align: center;">
						아이뮤지엄
					  </p>
				        <p class="card-text" style="font-size: 3em; font-weight: bold;">${vo.exhInfo }</p>
				        <p class="card-text" style="font-size: 1.5em;">${vo.exhName }</p>
				        <p class="card-text" style="color: gray;">${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }</p>
				      </div>
				    </div>
				    <div class="col-md-6">
				      <a href="exhibitionDetail.do?exhNum=${vo.exhNum}">
				      <img src="${pageContext.request.contextPath}/exhibitionImg/${vo.ticketImg}" alt="..." width="100%;">
				      </a>
				    </div>
				  </div>
				</div>
				</c:if>
				</c:forEach>
				<p style="font-size: 4em; font-weight: bold;">2018</p>
				<c:forEach var="vo" items="${list }" varStatus="status">
				<c:if test="${vo.startDate.substring(0,4) == 2018}">
				<div class="card mb-3" style="width: 100%; border: none; padding-bottom: 50px;">
				  <div class="row no-gutters">
				    <div class="col-md-6">
				      <div class="card-body">
				      <p class="card-title" style="background-color: black; color: white; padding: 10px; width: 100px; text-align: center;">
						아이뮤지엄
					  </p>
				        <p class="card-text" style="font-size: 3em; font-weight: bold;">${vo.exhInfo }</p>
				        <p class="card-text" style="font-size: 1.5em;">${vo.exhName }</p>
				        <p class="card-text" style="color: gray;">${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }</p>
				      </div>
				    </div>
				    <div class="col-md-6">
				      <a href="exhibitionDetail.do?exhNum=${vo.exhNum}">
				      <img src="${pageContext.request.contextPath}/exhibitionImg/${vo.ticketImg}" alt="..." width="100%;">
				      </a>
				    </div>
				  </div>
				</div>
				</c:if>
				</c:forEach>
				
			</div>
			
			
		</div>
	</div>
</div>

</body>
<%@ include file="/common/footer.jspf"%>
</html>