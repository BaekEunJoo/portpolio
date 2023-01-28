<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.left { float:left;}
</style>
<title>주문조회</title>

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="w3-container w3-center">
<br><br>
<h4><strong>주문조회</strong></h4>
<span class="left"><strong>주문 상품 정보</strong></span>
<table class="w3-table w3-bordered">
	<tr>
		<th>주문일자<br>[주문번호]</th>
		<th>상품정보</th>
		<th>수량</th>
		<th>상품구매금액</th>
		<th>주문처리상태</th>
	
	<c:if test="${empty order }">
	<tr>
		<td colspan="5">주문하신 상품이 없습니다</td>
	</tr>
</c:if>	

<c:if test="${order ne null }">
<c:forEach items="${order}" var="list">
	<tr>
		<td><c:out value="${list.orderDate}" /><c:out value="[${list.orderNo}]" /></td> 
		<td>
		<a href="controllersk?type=productdetail&productNo=${list.productNo }">
		<c:out value="${list.productName}" /></a></td>
		<td><c:out value="${list.amount}" /></td>
		<td><c:out value="${list.totalPrice}" /></td>
		<td><c:out value="${list.orderStatus}" /></td> 
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