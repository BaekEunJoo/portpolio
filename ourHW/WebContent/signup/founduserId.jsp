<%@page import="com.mystudy.model.DAO.DAO"%>
<%@page import="com.mystudy.model.VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	function loginpage(){
		
		location.href="signup/login.jsp";
	}
</script>



</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>



	<div class="w3-container w3-center">
	
	
	<br><h5><strong>아이디 찾기</strong></h5>
	
	
		<table class="w3-table w3-bordered">
			<tr>
				<td>이름</td>
				<td><input class="w3-input w3-border" type="text" name = "name" value= ${name } disabled></td>
			</tr>
			<c:if test="${empty email}">
				<tr>
					<td>핸드폰 번호</td>
					<td><input class="w3-input w3-border" type="text" name = "phone" value= ${phone } disabled></td>
				</tr>
			</c:if>
			<c:if test="${empty phone}">
				<tr>
					<td>이메일</td>
					<td><input class="w3-input w3-border" type="text" name = "email" value= ${email } disabled></td>
				</tr>
			</c:if>		
			<tr>
				<td>아이디</td>
				<td><input class="w3-input w3-border" type="text" name = "userId" value= ${userId } disabled></td>
			</tr>
			
		</table>
				<br><button type="button" class="w3-button w3-black" onclick="loginpage()">확인</button>

</div>


<footer>
	<%@ include file="/common/footer.jspf" %>
</footer>



</body>

</html>