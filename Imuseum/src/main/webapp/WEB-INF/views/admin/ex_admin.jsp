<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>

.col-2 li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

.col-2 li a span {
	text-decoration: none;
	color: black;
	font-size: 18px;
	margin-left: 10px;
}

.bi-people-fill{
	color: black;
}

.amName {
	font-size: 1.2em;
	font-weight: bold;
}

.col-2 ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
	font-weight: normal;
}

.col-2 ul li a:hover {
	color: black;
	font-weight: bold;
}

.btn {
	border-radius: 0;
}

input[type=date] { 
	border-radius: 0;
	border: 1px solid silver;
	width: 220px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}


.extable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

.extable img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}

#am_excenter { color: black; font-weight: bold; }


.extable a {text-decoration: none; color: black;}

/*페이징*/
.page-link {
  color: #000; 
  background-color: #fff;
  border: none;
  width: 40px; height: 40px;
  text-align: center;
  margin: 0 10px;

}

.page-item.active .page-link {
 z-index: 1;
 color: white;
 font-weight:bold;
 background-color: black;
 border-color: black;
 
}

.page-link:focus, .page-link:hover {
  color: white;
  background-color: black; 
}

.page-item:last-child .page-link {
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
}
.page-item:first-child .page-link {
    border-top-left-radius: 0;
    border-bottom-left-radius: 0;
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
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
			<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10">
				<span style="font-size: 1.3em; font-weight: bold;">전시관리</span>
				
				<div style="float: right;">
				<button type="button" class="btn btn-sm btn-dark" onclick="location.href='exhibitionInsert.do'">
					전시등록
				</button>
				<button type="button" class="btn btn-sm btn-dark" id="update">전시수정</button>
				<!-- <button type="button" class="btn btn-sm btn-dark">전시삭제</button> -->
				<button type="button" class="btn btn-sm btn-dark" id="aritst">작가관리</button>
				</div>
				
				<hr style="border: 0; height: 2px; background: black;">
				
				<table class="extable" style="width: 100%;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>선택</th>
						<th>전시번호</th>
						<th>이미지</th>
						<th>전시명</th>
						<th>전시시작일</th>
						<th>전시종료일</th>
						<th>전시상태</th>
					</tr>
					<c:forEach var="exhibition" items="${list }" varStatus="status">
					<tr style="text-align: center;">
						<td><input type="checkbox" value="${exhibition.exhNum }" name="checkList" onclick='checkOnlyOne(this)'></td>
						<td>${exhibition.exhNum }</td>
						<td>
							<a href="exhibitionDetail.do?exhNum=${exhibition.exhNum }">
								<img alt="" src="${pageContext.request.contextPath}/exhibitionImg/${exhibition.ticketImg }">
							</a>
						</td>
						<td>
							<a href="exhibitionDetail.do?exhNum=${exhibition.exhNum }">
								<b>${exhibition.exhName }</b>
							</a>	
						</td>
						<td>${exhibition.startDate.substring(0,10) }</td>
						<td><b>${exhibition.lastDate.substring(0,10) }</b></td>
						
						<c:set var="Ldate" value="${exhibition.lastDate.substring(0,10)}" />

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
								<td>진행</td>
							<%} else {%>
								<td>종료</td>
							<%}
						%>
					</tr>
					</c:forEach>
				</table>
				
				<div style="padding-top: 30px;">
				<ul class="pagination justify-content-center pb-2">
		   			<!-- 이전 -->
		  		 		<li class="page-item">
		  		 			<c:if test="${page.nowPage == 1 }">
		  		 				<a class="page-link disabled"><i class="bi bi-chevron-left"></i></a>
		  		 			</c:if>
		  		 			<c:if test="${page.nowPage != 1 }">
							<a href="exAdmin.do?page=${page.nowPage - 1 }" class="page-link"><i class="bi bi-chevron-left"></i></a>
						</c:if>	
		  		 			
		  		 		</li>
		  		 		<!-- 페이지 번호 -->
		  		 		<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
						<c:if test="${pageNo == page.nowPage }">	
							<li class="page-item active">
		   						<a class="page-link">${pageNo }</a>
		   					</li>
						</c:if>
						<c:if test="${pageNo != page.nowPage }">
							<li class="page-item">
									<a href="exAdmin.do?page=${pageNo }" class="page-link">${pageNo }</a>
		   					</li>
						</c:if>
						</c:forEach>
		   			<!-- 다음 -->
			   			<li class="page-item">
			   				<c:if test="${page.nowPage < page.totalPage }">
										<a href="exAdmin.do?page=${page.nowPage + 1 }" class="page-link"><i class="bi bi-chevron-right"></i></a>
							</c:if>
							<c:if test="${page.nowPage >= page.totalPage }">
								<a class="page-link disabled"><i class="bi bi-chevron-right"></i></a>
							</c:if>
			   			</li>
		 			</ul>
				</div>
				
				</div>
			</div>
		</div>
	</div>
</div>

<script>

function checkOnlyOne(element) {
	  
	  const checkboxes = document.getElementsByName("checkList");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}


$(document).ready(function() {
    $('#update').click(function() {
    	$("input[type=checkbox]:checked").each(function(){
			const value = $(this).val();
    		location.href = 'exhibitionUpdate.do?exhNum='+value;
		})
    })
});

$(document).ready(function() {
    $('#aritst').click(function() {
    	$("input[type=checkbox]:checked").each(function(){
			const value = $(this).val();
    		location.href = 'exArtist.do?exhNum='+value;
		})
    })
});




</script>


</body>

<%@ include file="/common/footer.jspf"%>
</html>