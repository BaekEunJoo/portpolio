<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	function go_login(frm){
		frm.action="/ourHW/controller?type=checklogin";
		frm.submit();
		return false;
	}
	function check_userId(){
		location.href = "/ourHW/controller?type=checkuserId";
	}
	function check_userpwd(){
		location.href = "/ourHW/controller?type=checkuserpwd";
	}
</script>

<style>
	table {
    margin-left:auto; 
    margin-right:auto;
	}
	#position {
	position:relative; 
	bottom: 30px;
	width:130px; height:80px;
	}
	.size2 {width:80px; height:25px;}
	
</style>

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>


<div class="w3-container w3-center">
	<br><br>
	<h3>회원로그인</h3>
	<form method="post">
	<table>
		<tr>
			<td ><input type="text" class="w3-input" name = "id" id = "id" placeholder="아이디" class="size2"></td>
		</tr>
		<tr>
			<td ><input type="password" class="w3-input" name = "pwd" id = "pwd" placeholder="비밀번호" class="size2"></td>
			<td rowspan="2"><button class="w3-button w3-black" id="position" onclick="go_login(this.form)">로그인</button></td>
		</tr>
	</table>
	<br>
	<input type="button" value="아이디 찾기" class="w3-btn w3-gray" onclick="check_userId()">
	<input type="button" value="비밀번호 찾기" class="w3-btn w3-gray" onclick="check_userpwd()">
	</form>
	
</div>
<footer>
	<%@ include file="/common/footer.jspf" %>
</footer>

</body>
</html>