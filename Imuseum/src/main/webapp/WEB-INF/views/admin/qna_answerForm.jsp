<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<link rel="stylesheet" type="text/css" href="/Imuseum/common/css/askQnaStyle.css" />
<meta charset="UTF-8">
<title>I Museum</title>
<style type="text/css">
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
	font-weight: normal;
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
	width: 210px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}

#am_qa { color: black; font-weight: bold; }


.line_limit {
      width:250px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
      display:inline-block;
      vertical-align: middle;
  }

input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}
control[readonly]{
	background-color: white;
}

</style>
<script>
</script>
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
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10">
				<p style="font-size: 1.3em; font-weight: bold;">1:1 문의 답변</p>				
				<hr style="border: 0; height: 2px; background: black;">			
					<div class="form-group">
						<select id="menu-select" class="form-select" aria-label="musuemCategory" name="menuCategory">
						  <option selected>${qnaBoard.menuName }</option>
						</select>		
					</div>
					<div class="form-group">		
					<select id ="categoryList" class="form-select" aria-label="museumCategory" name="questionCategory">
					  <option  selected>${qnaBoard.cateName }</option>
					</select>
					</div>
					<div class="form-group">
						<label for="title">제목</label>
						<input id="title" class="form-control" value="${qnaBoard.title }" readonly>
					</div>
					<div class="form-group">
						<label for="contents">내용</label>
						<textarea class="form-control" name ="contents" style="height: 7.5rem" readonly>						
							${qnaBoard.contents }
						</textarea>
					</div>				
					<div class="file-area">

					</div>
					<div style="text-align: right; padding-top: 20px;">
						<div style="display: inline-block;">				
				      		<button type="submit" id="login" class="btn btn-dark">작성 하기</button>
							<button type="button" class="btn btn-outline-dark" onclick="location.href='mp_faq.do'">취소</button> 	
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>
	
<%@include file="/common/footer.jspf" %>
 </body>
</html>