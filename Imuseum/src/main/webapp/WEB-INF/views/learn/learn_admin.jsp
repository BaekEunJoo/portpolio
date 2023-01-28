<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>

li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

li a span {
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

ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
}

ul li a:hover {
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

#am_learncenter { color: black; font-weight: bold; }






<!-- 페이징 -->
 #paging ul {
 	display: inline;
	padding: 5px 15px;
 }
 
 #paging ul li{
 	display: inline;
 
 }
 
 #paging ul li a {

 	padding: 10px 15px;
	font-weight: bold;
	font-size: 15px;
	text-decoration: none;
	color: black;
 }
 
 #paging ul li a:hover {
	background-color: black;
	color: white;
	cursor: pointer;
 }
 




#but1 {
		border: 1px solid black;
		background-color: black;
		color: white;
		border-radius: 3px;
		transition: all 0.3s;
	}
	
	#but1:hover {
		border: 1px solid black;
		background-color: white;
		color: black;
	}




</style>
<script>
	function deleteLearn(a) {
		var reservationIdx = a;
		
		var result = confirm('삭제하시겠습니까?');
		if (result==true){
			alert('삭제가 완료되었습니다.');
		location.href='deleteLearn2.do?learnIdx='+ reservationIdx;
		}
	}
	

</script>
</head>
<body>
<%@ include file="/common/adminMenu.jspf" %>
<%@ include file="/common/main.jspf" %>
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
			<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10">
				<span style="font-size: 1.3em; font-weight: bold;">교육 프로그램 관리</span>
				
				<div style="float: right;">
				</div>
				
				<hr style="border: 0; height: 2px; background: black;">
				
				<table class="extable" style="width: 100%;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>프로그램번호</th>
						<th>카테고리</th>
						<th>이미지</th>
						<th>프로그램명</th>
						<th>교육진행</th>
						<th>삭제</th>
					</tr>
					<c:forEach var="getlearnList4" items="${getlearnList4 }">
						<tr style="text-align: center;">
							<td>${getlearnList4.learnIdx }</td>
							<c:if test="${getlearnList4.categoryNum == 1 }">
								<td>유아</td>
							</c:if>
							<c:if test="${getlearnList4.categoryNum == 2 }">
								<td>어린이</td>
							</c:if>
							<c:if test="${getlearnList4.categoryNum == 3 }">
								<td>청소년</td>
							</c:if>
							<c:if test="${getlearnList4.categoryNum == 4 }">
								<td>대학생</td>
							</c:if>
							<c:if test="${getlearnList4.categoryNum == 5 }">
								<td>성인</td>
							</c:if>
							<c:if test="${getlearnList4.categoryNum == 6 }">
								<td>교사</td>
							</c:if>
							<c:if test="${getlearnList4.categoryNum == 7 }">
								<td>전시해설</td>
							</c:if>
							<td><img src="${pageContext.request.contextPath}/learnImage/${getlearnList4.fileName }" width="200px" height="200px" /></td>
							<td>${getlearnList4.title }</td>
							<td>${getlearnList4.regdate1 } ~ ${getlearnList4.regdate2 }</td>
							<td><input type="submit" value="삭제하기" id="but1" onclick="deleteLearn('${getlearnList4.learnIdx }')"></td>					
						</tr>
					</c:forEach>
		
				</table>
				<div style="text-align: center;">
		<div id="paging" style="margin-top: 40px;">
			<ul>
				<!-- 이전 -->
				<li>
		 			<c:if test="${page.nowPage == 1 }">
			  			<a>&#60;</a>
			  		</c:if>
			  		<c:if test="${page.nowPage != 1 }">
						<a href="learnAdmin.do?page=${page.nowPage - 1 }">&#60;</a>
					</c:if>	
			  		 			
			  	</li>
			  	<!-- 페이지 번호 -->
			  	<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
					<c:if test="${pageNo == page.nowPage }">	
						<li>
			   				<a style="background-color:black; color: white;">${pageNo }</a>
			   			</li>
					</c:if>
					<c:if test="${pageNo != page.nowPage }">
						<li>
							<a href="learnAdmin.do?page=${pageNo }">${pageNo }</a>
			   			</li>
					</c:if>
				</c:forEach>
			   	<!-- 다음 -->
				<li>
					<c:if test="${page.nowPage < page.totalPage }">
						<a href="learnAdmin.do?page=${page.nowPage + 1 }">&#62;</a>
					</c:if>
					<c:if test="${page.nowPage >= page.totalPage }">
						<a>&#62;</a>
					</c:if>
				 </li>
			</ul>
		</div>
	</div>
				</div>
				
			</div>
		</div>
	</div>
</div>






</body>

<%@ include file="/common/footer.jspf"%>
</html>