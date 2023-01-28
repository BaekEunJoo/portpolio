<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위시리스트</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="w3-container w3-center">
<br>
<h5><strong>관심상품</strong></h5>
<table class="w3-table w3-bordered">
	<tr>
		<th>이미지</th>
		<th>상품정보</th>
		<th>판매가</th>
		<th>카테고리 번호</th>
	<c:if test="${empty wish}">
	<tr>
		<td colspan="4">주문하신 상품이 없습니다</td>
	</tr>
</c:if>	

<c:if test="${wish ne null }">
<c:forEach items="${wish}" var="list">
	<tr>
		
		<td><img src="./img/${list.thumnail }" alt="img" width="95%" height="100"></td> 
		<td>
		<a href="controllersk?type=productdetail&productNo=${list.productNo }">
		<c:out value="${list.productName}" /></a></td>
		<td><c:out value="${list.price}" /></td>
		<td><c:out value="${list.categoryNo}" /></td> 
		
	</tr>
</c:forEach>
</c:if>		
</table>
</div>

	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>

</body>
</html>