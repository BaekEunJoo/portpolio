<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<style>
	.left { float:left;}
	
</style>

<title>회원정보 수정</title>
<script>

function checkvalue(frm){
	var pwd = document.getElementById('pwd').value; 
	var name = document.getElementById('name').value; 
	var addr = document.getElementById('addr').value; 
	var phone = document.getElementById('phone').value; 
	var email = document.getElementById('email').value; 
	
	if (pwd == ""){
		alert("pwd 값을 넣어주세요!");
		document.getElementById('pwd').focus();
	} else if (name == ""){
		alert("name 값을 넣어주세요!");
		document.getElementById('name').focus();
	} else if (addr == ""){
		alert("addr 값을 넣어주세요!");
		document.getElementById('addr').focus();
	} else if (phone == ""){
		alert("phone 값을 넣어주세요!");
		document.getElementById('phone').focus();
	} else if (email == ""){
		alert("email 값을 넣어주세요!");
		document.getElementById('email').focus();
	} else{
		go_update(frm);
	}
	
	
}

	function go_update(frm){
		
		frm.action = "controller?type=update";
		frm.submit();
		return false;
	}
	function cancel(){
		history.go(-2);
		return false;
	}
	
	function go_delete(frm){
		
		var r = confirm("정말 탈퇴하시겠습니까?");
		if (r == true){
			location.href="controller?type=deleteuser";
		} 
	
	}
</script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div class="w3-center w3-container">
	<br><br>
	<h5><strong>회원정보 수정</strong></h5>
	<h5 class="left"><strong>기본정보</strong></h5>
	<form method="post">
		<table class="w3-table w3-bordered">
			<tr>
				<td>아이디</td>
				<td><input class="w3-input w3-border" type="text" name = "id" id = "id" value=${user.userId } disabled></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="w3-input w3-border" type="text" name = "pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input class="w3-input w3-border" type="text" name = "name" id="name"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input class="w3-input w3-border" type="text" name = "addr" id="addr"></td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td><input class="w3-input w3-border" type="text" name = "phone" id="phone"></td>
			</tr>	
			<tr>
				<td>이메일</td>
				<td><input class="w3-input w3-border" type="text" name = "email" id="email"></td>
			</tr>
			
		</table>
		<br>
		<button type="button" class="w3-button w3-black" onclick="checkvalue(this.form)">회원정보수정</button>
		<button type="button" class="w3-button w3-gray" onclick="cancel()">취소</button>
		<button type="button" class="w3-button" onclick="go_delete()">회원탈퇴</button>
	</form>
	
</div>


	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>


</body>
</html>