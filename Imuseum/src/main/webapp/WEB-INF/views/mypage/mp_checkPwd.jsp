<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>개인정보 변경/탈퇴</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.body > h6:after {
	   content: '';
	   width: 100%;
	   display: block;
	   margin-top: 20px;
	   padding-bottom:0;
	   border-bottom: 3px solid #000;
	}
	.info:after {
	   content: '';
	   width: 100%;
	   display: block;
	   margin-top: 20px;
	   padding-bottom:0;
	   border-bottom: 1px solid gray;
	}
	.bt {
		width:150px;
		height:50px;
		color : white;
		background-color: black;
	}
	.boldBorder:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 3px solid black;
		margin-top : 15px;
	}
	.mpName {
		font-size:1.2em;
		font-weight: bold;
	}
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
	#mp_updateInfo {color: black;}
</style>
<script>
$(document).on('click','#checkPwd',function(){
	var pwd2 = document.getElementById('pwd2').value; //입력한 비밀번호
	var pwd = "${member.password }"; //원래 비밀번호
	
	console.log("pwd: " + pwd);
	console.log("pwd2: " + pwd2);
	
	if (pwd!=pwd2){
		alert("비밀번호가 다릅니다!");
	} else if (pwd2 == "") {
		alert("비밀번호를 입력하세요!");
	} else if (pwd == pwd2){
		location.href = "mp_infoUpdate.do";
	}
});
</script>
</head>
<body>
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<div class="row">
					<div class="body container-fluid mt-5">
						<h5 style="font-weight:bold;" class="boldBorder">개인정보 변경/탈퇴</h5>
							<div class="py-5">
								<div><h4 style="font-size:1.1em; font-weight:bold;">회원님의 개인정보를 소중하게 보호하려고 노력하고 있습니다.&nbsp;&nbsp;비밀번호 확인 후 개인정보를 제공합니다.</h4></div>
								<br>
								<div>
									<form action="#" method="post" class="needs-validation" novalidate>
										<div class="info">
										   <label for="validationCustom03" class="form-label">비밀번호</label>
										   <input type="password" class="form-control py-2 px-5 mb-5" id="pwd2" name="pwd2" placeholder="비밀번호를 입력하세요">
										 </div>
										<div class="mt-5 p-0 align-middle" style="margin-left:40%;">
											<button type="button" class="bt" id="checkPwd" onclick="checkPwd()">확인</button>
										</div>
									</form>
								</div>
							</div>
					</div>
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
	<%@include file="/common/footer.jspf" %>
</body>
</html>