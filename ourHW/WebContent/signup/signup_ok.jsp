<%@page import="com.mystudy.model.DAO.DAO"%>
<%@page import="com.mystudy.model.VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 완료!</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	function mypage(){
		
		location.href="controller?type=mypage";
	}
</script>

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>




	<div class="w3-container w3-center">
	
	
	<br><h5 class="left"><strong>회원가입완료!</strong></h5>
	
	
		<table class="w3-table w3-bordered">
			<tr>
				<td>아이디</td>
				<td><input class="w3-input w3-border" type="text" name = "id" value= ${user.userId } disabled></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="w3-input w3-border" type="text" name = "pwd" value= ${user.pwd } disabled></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="w3-input w3-border" type="text" name = "name" value= ${user.name } disabled></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input class="w3-input w3-border" type="text" name = "addr" value= ${user.address } disabled></td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td><input class="w3-input w3-border" type="text" name = "phone" value=${user.phone } disabled></td>
			</tr>	
			<tr>
				<td>이메일</td>
				<td><input class="w3-input w3-border" type="text" name = "email" value=${user.email } disabled></td>
			</tr>
			
		</table>
				<br><button type="button" class="w3-button w3-black" onclick="mypage()">확인</button>

</div>


	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>


</body>

</html>