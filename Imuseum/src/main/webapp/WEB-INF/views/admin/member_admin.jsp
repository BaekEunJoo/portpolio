<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
.extable th:last-child{
	width:50px;
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
.page-item > a {
	color : black;
	border : none;
}
.page-item > li > a:hover { 
	color : black; 
	list-style : none; 
}

#am_member { color: black; font-weight: bold; }

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
				<span style="font-size: 1.3em; font-weight: bold;">회원관리</span><br>
				<span style="font-size: 0.8em; color: gray;">
					회원자료 삭제 시 다른 회원이 기존 회원아이디를 사용하지 못하도록 회원아이디, 이름, 닉네임은 삭제하지 않고 영구 보관합니다.
				</span>
				<div class="btnarea" style="float: right;">
					<button id="updateBtn" type="button" class="btn btn-sm btn-dark">수정</button>					
				</div>
				<hr style="border: 0; height: 2px; background: black;">
				
				<div style="font-size: 0.9em;">
				<p>총회원수 <span>${fn:length(memberList) }</span>명</p>
				</div>
				<form id="adminUpdate" action="adminUpdate.do" method="get">
					<table class="extable" style="table-layout: fixed; width: 100%">
						<tr style="text-align: center; height: 50px; background: black; color: white;">
							<th style="width: 10%;">선택</th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>등급</th>
							<th>상태</th>
						</tr>
						<c:forEach items="${memberList }" var="memberVO">
							<tr style="text-align: center;">							
								<td><input name="memberBox" type="checkbox" value="${memberVO.id }"></td>
								<c:choose>
									<c:when test="${memberVO.snsType ne 1 }">
										<td>${memberVO.snsName } 가입</td>
										<td>${memberVO.name }</td>
									</c:when>
									<c:otherwise>
										<td>${memberVO.id }</td>
										<td>${memberVO.name }(${memberVO.snsName })</td>								
									</c:otherwise>								
								</c:choose>
								<!-- 수정 가능 영역 -->
								<td>${memberVO.email }</td>
								<td>${memberVO.phone }</td>							
								<td>${memberVO.grade }</td>
								<td>${memberVO.statusValue }</td>							
							</tr>
						</c:forEach>	
					</table>
				</form>
					<!-- 페이징 처리 시작 -->
					<nav aria-label="Page navigation example" class="mt-5">
					  <ul class="pagination justify-content-center">
					  		<c:choose>
					  			<c:when test="${pvo.nowPage == beginPage }">
								    <li class="page-item">
								    	<a href="#"class="page-link disable"><i class="bi bi-chevron-left"></i></a>
								    </li>					  				
							    </c:when>		
							    <c:when test="${pvo.nowPage != beginPage }">
								    <li class="page-item">
								    	<a href="moveToAdmin.do?cPage=${pvo.nowPage - 1 }"class="page-link"><i class="bi bi-chevron-left"></i></a>
								    </li>
								</c:when>
						    </c:choose>
					  	<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage }">
							    <li class="page-item">
							    	<a class="page-link" style="background:black; color:white;">${pageNo}</a>
						    	</li>
							</c:if>						  	
						    <c:if test="${pageNo != pvo.nowPage }">
						   		<li class="page-item"><a class="page-link" href="moveToAdmin.do?cPage=${pageNo }">${pageNo }</a></li>
						    </c:if>
						    <c:if test="">
							    <li class="page-item">
							    	<a class="page-link" href="moveToAdmin.do?cPage=${pvo.endPage }">${pvo.endPage }</a>
						    	</li>
					    	</c:if>
					    </c:forEach>
						    <c:if test="${pvo.nowPage < pvo.totalPage }">						    
								<li class="page-item">
									<a class="page-link" href="moveToAdmin.do?cPage=${pvo.nowPage +1 }"><i class="bi bi-chevron-right"></i></a>
								</li>					    
							</c:if>	
						    <c:if test="${pvo.nowPage >= pvo.totalPage }">						    
								<li class="page-item">
									<a class="page-link disabled"><i class="bi bi-chevron-right"></i></a>
								</li>
						    </c:if>
					  </ul>
					</nav>
					<!-- 페이징 처리 끝 -->					
				</div>
			</div>
		</div>
	</div>
</div>
<script>	
	$(function(){
		$('input:checkbox[name=memberBox]').on('click',function(){
			if($(this).prop('checked')){
			     $("input:checkbox[name='memberBox']").prop('checked',false);			     
			     $(this).prop('checked',true);
			}	
		});
		
		$(document).on('click',"#updateBtn",function(){
			if($('input:checkbox[name=memberBox]').is(':checked') == true){			
			var tr = $('input:checkbox[name=memberBox]:checked').parent().parent();
			var td = tr.children();
			
			var email = td.eq(3).text();
			var phone = td.eq(4).text();
			var grade = td.eq(5).text();
			var status = td.eq(6).text();
			td.eq(3).html("<input type='email' name='email' value='" + email + "' style='width:100%'>");
			td.eq(4).html("<input type='text' name = 'phone'value='" + phone + "' style='width:100%'>");
			td.eq(5).html("<select name='grade'>"
					+ "<option value='SEED'>SEED</option>"
					+ "<option value='TREE'>TREE</option>"
					+ "<option value='FOREST'>FOREST</option>"
					+ "</select>");
			
			td.eq(6).html("<select name='status'>"
					+ "<option value='1'>정상</option>"
					+ "<option value='2'>탈퇴</option>"
					+ "<option value='3'>제재</option>");
			$(".btnarea").html("<button id='smBtn' type='submit' form ='adminUpdate' class='btn btn-sm btn-dark'>확인</button>"); 
			$(".btnarea").append("<button id='undoBtn' type='button' class='btn btn-sm btn-dark'>취소</button>");
			}			
		});
	});
	$(document).on('click','#undoBtn',function(){
		history.go(0);
	});
</script>
</body>

<%@ include file="/common/footer.jspf"%>
</html>