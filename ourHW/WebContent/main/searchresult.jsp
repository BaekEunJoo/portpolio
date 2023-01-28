<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<title>검색 결과 화면</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<br><br>

<div class="w3-container w3-center">

<h4><strong>상품 검색 결과</strong></h4>
<hr>
	
	<table class="w3-table">
	
		<tr>
			<th>상품번호</th>
			<th>이미지</th>
			<th>상품 이름</th>
			<th>상품 가격</th>
		</tr>
		
		<c:if test="${empty search}">
	<tr>
		<td colspan="4"><Strong>검색결과가 없습니다</strong></td>
	</tr>
</c:if>	

<c:if test="${search ne null}">
<c:forEach items="${search}" var="list">
	<tr>	
		<td><c:out value="${list.productNo}" /></td> 
		<td><img src="./img/${list.thumnail }" alt="img" width="95%" height="100"></td>
		<td>
		<a href="controllersk?type=productdetail&productNo=${list.productNo }">
		<c:out value="${list.productName}" /></a></td>
		<td><c:out value="${list.price}" /></td>
		
	</tr>
</c:forEach>
</c:if>		
		
</table>
	
	
</div>	
</body>
</html>