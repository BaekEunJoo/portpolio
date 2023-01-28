<%@page import="com.mystudy.model.DAO.DAO"%>
<%@page import="com.mystudy.model.VO.userVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>

function checkvalue(frm){
		
		var pwd = document.getElementById('pwd').value; 
		var pwd2 = document.getElementById('pwd2').value; 
		
		if (pwd == ""){
			alert("pwd 값을 넣어주세요!");
			document.getElementById('pwd').focus();
		} else if (pwd2 == ""){
			alert("pwd2 값을 넣어주세요!");
			document.getElementById('pwd2').focus();
		} else{
			changepwd(frm);
		}	
		
}

function changepwd(frm){
	var pwd = document.getElementById('pwd').value; 
	var pwd2 = document.getElementById('pwd2').value; 
		
	if (pwd!=pwd2){
		alert("동일한 비밀번호를 입력해주세요");
		document.getElementById('pwd').value = "";
		document.getElementById('pwd2').value = "";
		
	} else{
		frm.action="/ourHW/controller";
		frm.submit();
		return false;
		}
}
	

</script>


</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>



	<div class="w3-container w3-center">
	
	
	<br><h5><strong>비밀번호 변경</strong></h5>
	
	<form method="post">
		<table class="w3-table w3-bordered">
			
			<tr>
				<td>아이디</td>
				<td><input class="w3-input w3-border" type="text" name = "userId" id="userId" value= ${userId } readonly></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input class="w3-input w3-border" type="text" name = "pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input class="w3-input w3-border" type="password" name = "pwd2" id="pwd2"></td>
			</tr>
		</table>
				<input type="hidden" name = "type" id="type" value="changepwd">
				<br><button type="button" class="w3-button w3-black" onclick="checkvalue(this.form)">확인</button>
	</form>
</div>


<footer>
	<%@ include file="/common/footer.jspf" %>
</footer>


</body>

</html>