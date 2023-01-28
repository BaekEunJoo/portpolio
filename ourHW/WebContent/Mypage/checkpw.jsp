<%@page import="com.mystudy.model.VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	userVO vo = (userVO)session.getAttribute("vo");
	request.setAttribute("vo", vo);
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script>
	function checkpwd(){
		
		var pwd2 = document.getElementById('pwd2').value; 
		var pwd = "${user.pwd }";
		
		if (pwd!=pwd2){
			alert("비밀번호가 다릅니다!");
			document.getElementById('pwd2').value = "";
		} else{
			location.href = "controller?type=updateuser";
		}
		
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	btn { width:300px;}
</style>

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>

	<div class="w3-container w3-center">
	<h5><strong>회원정보 수정</strong></h5><br><br>
	<h4><strong>비밀번호 확인</strong></h4>
	<p>사용자님의 회원정보를 안전하게 보호하기 위해<br>비밀번호를 한번 더 확인해주세요</p><br>
	비밀번호&nbsp;&nbsp;<input type="password" name="pwd2" id="pwd2"><br><br>
	<button type="button" class="w3-button w3-black btn" onclick="checkpwd()">확인</button>
	</div>
	
	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>
</body>

</html>