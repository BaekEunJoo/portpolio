<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>개인정보 수정</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.page-title-area {
		padding-bottom:1.5rem;
	}
	.myinfo-box{
		padding-bottom:1.5rem;		
	}
	
	.top-title{
		padding-bottom:14px;
		border-bottom: 1px solid rgba(0,0,0,.1);
	}
	.info-list{
		padding-top:1.5rem;
	}
	
	ul{
		list-style-type: none;
   	 	margin: 0;
    	padding: 0;
	}
	.myinfo-box .info-list >form>ul>li{
		display: flex;
    	padding: 1.125rem 0;
	}
	.myinfo-box .info-list >form>ul>li>.title{
	    flex-shrink: 0;
	    width: 6.875rem;
	    font-weight: 300;
	    font-size: 1rem;
	    color: #111;
	}	
	
	.myinfo-box .info-list >form >ul .info{
	    flex-grow: 1;
	    flex-wrap: wrap;
	    font-weight: 500;
	    font-size: 1rem;
	    color: #111;
	    word-break: break-word;
	    padding-right: 1rem;
	}	
	.myinfo-box .info-list >form >ul .info.form{
		margin-top: -1.5rem;
	    padding: 0 0 0 6.875rem;
	}
	.myinfo-box .info-list >form >ul .info .tit-field{
	    display: block;
	    margin-bottom: 0.5rem;
	    font-weight: 500;
	    font-size: 0.9375rem;
	    color: #666;	
	}
	li > .info > strong{
		margin-top:1rem;
	}
	.myinfo-box .info-list >form >ul .info .field-area{
	    display: flex;
    	flex-wrap: wrap;
	}
	
	.myinfo-box .info-list >form >ul .info .field-area .password-area{
		display: flex;
	    align-items: flex-start;
	    width: 25.5rem;
	}
	.input-area{
		display: inline-block;
	    width: 100%;
	    position: relative;
	    vertical-align: top;
	}
	
	.input-area input:not(checkbox):not(radio){
		width: 100%;
	    height: 3.75rem;
	    padding: 1rem 1.1875rem;
	    border: 1px solid #ddd;
	    background: #fff;
	    color: #111;
	    line-height: 1.2rem;
	    letter-spacing: -0.025rem;
	    font-family: 'Geogrotesque', 'YoonGothic', sans-serif;
	}
	
	.myinfo .btn-group{
	    margin-top: 1.75rem;
	    display: flex;
	    justify-content: center;		
	}
	
	.myinfo .btn-gorup .btn-area{
		width: 11.875rem;
	}
	.btn-group .btn-area + .btn-area{
		margin-left: 1.75rem;
	}
	.btn-area button{
		display: inline-block;
	    min-width: 11.875rem;
	    height: 3.75rem;
	    padding: 0 0.625rem 0;
	    text-align: center;
	    letter-spacing: -0.04063rem;
	    line-height: 3rem;
	}
	.btn-area button.primary{
		background: #111;
		color: #fff;	
	}
	.btn-area button.primary:hover{
		background: #fff;
   		border: 1px solid #111;
    	color: #111;
	}
	.btn-area button.secondary{
		border: 1px solid #111;
    	color: #111;		
	}
	.btn-area button.secondary:hover{
	    background-color: #111;
	    color: #fff;
	    opacity: .5;	
	}
	
	.withdrawal-agree{
		display: flex;
	    align-items: center;
	    justify-content: space-between;
	    width: 18.125rem;
	    margin-top: 1rem;		
	}
	.line:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 2px solid black;
		margin-top : 17px;
	}
	.bt {
		width:150px;
		height:50px;
		color : white;
		background-color: black;
	}
	.btn2:hover {
		border : 1px solid black;
		color : black;
		background-color: white;
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
/* function infoSubmit() {
	var newPwd = document.getElementById('newPwd1').value;
	var newPwd2 = document.getElementById('newPwd2').value;
	var newPhone = document.getElementById('newPhone').value;
	var newEmail = document.getElementById('newEmail').value;
	console.log("newPwd : " + newPwd);
	console.log("newPwd2 : " + newPwd2);
	console.log("newPhone : " + newPhone);
	console.log("newEmail : " + newEmail);
	
	if (newpwd == newPwd2) {
		alert("비밀번호가 다릅니다!!")
	} else if(newPwd == newPwd2) {
		frm.action=""
		frm.submit();
		return false;
	}
	
	console.log(">> 정보 업데이트 완료");
} */
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty member }">
			<%@include file = "/common/guestMenu.jspf" %>	
		</c:when>	
		<c:when test="${not empty member }">
			<c:if test="${member.admin eq 'ADMIN' }">
				<%@include file = "/common/adminMenu.jspf" %>
			</c:if>
			<c:if test="${member.admin eq 'NORMAL' }">
				<%@include file = "/common/MemberMenu.jspf" %>
			</c:if>
		</c:when>
	</c:choose>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<!-- row div 시작 -->
				<div class="row">
				
					<!-- body 시작 -->
					<div class="container-fluid mt-5">
						<div class="page-title-area line">
							<h5 style="font-weight:bold;" >개인정보 변경/탈퇴</h5>
						</div>
						<div class="contents myinfo">
							<div class="myinfo-box">
								<div class="top-title">
									<strong>기본 회원 정보</strong>
								</div>
								<div class="info-list">
									<form id="needs-validation" action="mp_memberUpdate.do" method="post">
										<ul>
											<li>
												<div class="title">아이디</div>
												<div class="info">${member.id }</div>
												<input type="hidden" value="${member.id }">
											</li>
											<li>
												<div class="title">비밀번호</div>
												<div class="info">${member.password }</div>
											</li>
											<li>
												<div class="info form">
													<strong class="tit-field">새 비밀번호</strong>
													<div class="field-area">
														<div class="password-area">
															<div class="input-area">
																<input class="form-control" id="pwd1" placeholder="새 비밀번호를 입력해주세요" type="password">
																<div class="invalid-feedback">비밀번호를 6자 이상 입력해주세요.</div>																
															</div>
														</div>
													</div>
													<strong class="tit-field">새 비밀번호 확인</strong>
													<div class="field-area">
														<div class="password-area">
															<div class="input-area">
																<input class="form-control" id="pwd2" placeholder="새 비밀번호를 재입력해주세요" type="password" name="updatePassword">
																<input type="hidden" name="password" value="${member.password }">																
																<div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
															</div>
														</div>
													</div>														
												</div>
											</li>
											<li>
												<div class="title">이름</div>
												<div class="info">${member.name }</div>
												<input type="hidden" value="${member.name }">
												
											</li>
											<li>
												<div class="title">이메일</div>
												<div class="info">${member.email }</div>
											</li>
											<li>
												<div class="info form">
													<strong class="tit-field">이메일 변경</strong>
													<div class="field-area">
														<div class="password-area">
															<div class="input-area">
																<input id="email" class="form-control" placeholder="수정하실 이메일을 입력해주세요." type="email" name="updateEmail" pattern="^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$">
																<input type="hidden" value="${member.email }" name = "email">
																<div class="invalid-feedback">이메일을 양식을 확인해주세요.</div>
															</div>
														</div>
													</div>													
												</div>												
											</li>
											<li>
												<div class="title">전화번호</div>
												<div class="info">${member.phone }</div>										
											</li>		
											<li>							
												<div class="info form">
													<strong class="tit-field">전화번호 변경</strong>
													<div class="field-area">
														<div class="password-area">
															<div class="input-area">
																<input id="phone" class="form-control" placeholder="수정하실 전화번호를 입력해주세요.(하이픈 제외)" type="text" name="updatePhone" pattern="^\d{3}-\d{4}-\d{4}$">
																<input type="hidden" value="${member.phone }" name = "phone">
																<div class="invalid-feedback">전화번호 양식에 맞춰 입력해주세요.</div>
															</div>
														</div>
													</div>													
												</div>	
											</li>
											<li>
												<div class="title">가입 유형</div>
												<div class="info">${member.snsName }</div>										
											</li>												
										</ul>
										<div class="withdrawal-agree">
											<div class="btn-area">
												<a href="#" style="color:black;" onclick="location.href='mp_infoDelete.do'"><strong>회원탈퇴</strong></a>
											</div>
										</div>											
										<div class="btn-group">
											<div class="btn-area">	
												<button type="button" onclick="javascript:location.href='mypage_main.do'"class="btn secondary">취소</button>					
											</div>
											<div class="btn-area">
									      		<button type="submit" id="sign"class="btn primary">회원 정보 수정</button>
									      	</div>	
										</div>	 
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- body 끝 -->
					
				</div>
				<!-- row div 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
	<script>
	$(function(){
		//비밀번호 양식 체크
		$('#pwd1').on('keyup',function(){
			let pwd1 = $('#pwd1').val();
			$('#pwd1').removeClass('is-valid');
			if(pwd1.length < 6){
				$('#pwd1').addClass('is-invalid');
				$('#pwd1').removeClass('is-valid');
			} else{
				$('#pwd1').removeClass('is-invalid');
				$('#pwd1').addClass('is-valid');
				$('#pwd2').focus();
			}
		});
		$('#pwd2').on('keyup',function(){
			let pwd1 = $('#pwd1').val();
			let pwd2 = $('#pwd2').val();
			$('#pwd2').removeClass('is-valid');
			if(pwd1 != pwd2){
				$('#pwd2').addClass('is-invalid');
				$('#pwd2').removeClass('is-valid');
			} else{
				$('#pwd2').removeClass('is-invalid');
				$('#pwd2').addClass('is-valid');
			}
		});
		
		//전화번호 정규식 자동 변경
		$('#phone').on('keyup',function(){
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );	
		});
		
		(function() {
			  "use strict";
			  window.addEventListener("load", function() {
			    var form = document.getElementById("needs-validation");
			    form.addEventListener("submit", function(event) {
			      if (form.checkValidity() == false) {
			        event.preventDefault();
			        event.stopPropagation();
			        form.classList.add("was-validated");
			      }
			    }, false);
			  }, false);
			}());	
	});
	</script>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>