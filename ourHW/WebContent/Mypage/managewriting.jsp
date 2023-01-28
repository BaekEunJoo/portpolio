<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="w3-container w3-center">
<br>
<h5><strong>게시물관리</strong></h5>
<table class="w3-table w3-bordered">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회</th>

	
	<c:if test="${list eq null}">
		<tr>
			<td colspan="6">게시물이 없습니다</td>
		</tr>
	</c:if>
	<c:if test="${list ne null}">
		<c:forEach items="${list}" var="list">
		<tr>
			<td>${list.reviewNo}</td>
			<td><a href="/ourHW/BBSController?type=reviewView&reviewNo= + ${list.reviewNo}" >${list.title }</a></td>
			<td>${list.userName }</td>
			<td>${list.wdate }</td>
			<td>${list.hit }</td>
		</tr>
		
		</c:forEach>
		
	</c:if>
	
		
	</tr>
</table>
</div>

	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>

</body>
</html>