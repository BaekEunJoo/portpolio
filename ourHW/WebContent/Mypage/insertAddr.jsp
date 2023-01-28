<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>배송주소록 관리</title>

<script>

function checkvalue(frm){
	var delName = document.getElementById('delName').values; 
	var delGetter = document.getElementById('delGetter').value; 
	var delAddr = document.getElementById('delAddr').value; 
	var delPhone = document.getElementById('delPhone').value; 
	
	console.log("delName : " + delName);
	
	if (delName == ""){
		alert("name 값을 넣어주세요!");
		document.getElementById('delName').focus();
	} else if (delGetter == ""){
		alert("Getter 값을 넣어주세요!");
		document.getElementById('delGetter').focus();
	} else if (delAddr == ""){
		alert("Addr 값을 넣어주세요!");
		document.getElementById('delAddr').focus();
	} else if (delPhone == ""){
		alert("phone 값을 넣어주세요!");
		document.getElementById('delPhone').focus();
	} else{
		insertAddr(frm);
	}
}

	function insertAddr(frm){
		frm.action="./controller?type=addAddr";
		frm.submit();
		return false;
	}
	function goback(){
		window.history.back();
	}
</script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>


<div class="w3-container w3-center">
	
	<h5><strong>배송 주소록 관리</strong></h5>
	<h6>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</h6>
	
	
	<form method="post">
		<table class="w3-table w3-bordered">
			<tr>
				<td>배송지명</td>
				<td><input class="w3-input w3-border" type="text" name = "delName" id="delName"></td>
			</tr>
			<tr>
				<td>성명</td>
				<td><input class="w3-input w3-border" type="text" name = "delGetter" id="delGetter"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input class="w3-input w3-border" type="text" name = "delAddr" id="delAddr"></td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td><input class="w3-input w3-border" type="text" name = "delPhone" id="delPhone"></td>
			</tr>
			
			
		</table>
		
		<br>
				<button type="button" class="w3-button w3-black" onclick="checkvalue(this.form)">등록</button>
				<button type="button" class="w3-button w3-black" onclick="goback()">취소</button>
		</form>
	
	
</div>

	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>
	
</body>

</html>