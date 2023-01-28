<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	<%@include file = "/common/style.jspf" %>	
    <meta charset="utf-8">
<title>아이디 비밀번호 찾기</title>
<script src="/Imuseum/common/js/findmember.js"></script>

<link rel="stylesheet" type="text/css"	href="/Imuseum/common/css/findmember.css"/>
</head>
<body>    
<!-- 회원 정보로 헤더 표시 -->
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
<!-- 모달창 -->
<%@include file = "/common/MemberModal.jspf" %>
<section>
<div class="container notosanskr" style="width: 50%">
	<div class="subtop-area forms" style="text-align: center;">
		<div class="container mt-5  mb-5" style="font-weight: bold;">
			<h2>회원 정보 찾기</h2>
		</div>
	</div>
	<!-- ID 시작 -->
	<div class="container pb-5 notosanskr">
		<div>
			<div style="display: block;">
				<div class="border-bottom snb-area" style="font-size: 15px; padding-bottom:25px;">		
					<ul class="snb">
						<li>
							<a href="javascript:changeMenu('1')" role="botton" style="cursor:pointer;">
							아이디 찾기
							</a>
						</li>
						<li>
							<a href="javascript:changeMenu('2')" role="botton" style="cursor:pointer;">
							비밀번호 찾기
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="findId">
			<div class="container p-3" style="text-align: center; font-size:18px;">
				<p>아이디를 잊으셨나요?<br>회원정보에 등록된 연락처로 본인 확인을 진행하여 아이디를 찾아보세요.</p>
			</div>
			<form id ="findIdForm" action="#" method="post">
				<div class="form-group">
					<div class='input-area'>
						<label for="name">이름 </label>
						<input type="text" class="form-control" id="findIdName" placeholder="이름을 입력해주세요." name="name" required>
						<div class="valid-feedback">확인</div>
						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
				</div>
				<div class="filed-area">
					<div class = 'normal-area'>	
						<ul class='radio-group iblock'>
							<li>
								<div class ='radio-area mt14'>
									<input name='checkBox' type="radio" id='birthCheck1' value='idBirth'>
									<label for = 'birthCheck1'>
										<span>생년월일</span>
									</label>
								</div>
							</li>
							<li>
								<div class ='radio-area mt14'>
									<input name='checkBox' type="radio" id='phoneCheck2' value='idPhone'>
									<label for = 'phoneCheck2'>
										<span>전화번호</span>								
									</label>
								</div>
							</li>
						</ul>
					</div>			
					<div class="form-group radiochange">
						<div class="input-area">
							<label for="birth">생년월일</label>
							<input type="date" class="form-control" id="birth" placeholder="생년월일을 입력해주세요." name="birth" >
							<div class="valid-feedback">확인</div>
							<div class="invalid-feedback">올바른 생년월일을 입력해주세요.</div>
						</div>
					</div>	
				</div>	
				<div class ="btn-area" style="text-align: center;">
					<div style="display: inline-block;">				
			      		<button type="button" id="findIdBtn" class="btn btn-dark">아이디 찾기</button>
						<button type="button" class="btn btn-outline-dark" data-dismiss="modal">취소</button> 	
					</div>
				</div>					
			</form>
		</div>
		
<!-- 비밀번호 -->		
		<div id="findPassword" style="display: none;">
			<div class="container p-3"  style="text-align: center; font-size: 18px;">
				<p>비밀번호가 기억나지 않나요?<br>회원정보에 등록된 이름, 아이디, 연락처를 입력하여<br>본인 확인을 해 주시면 비밀번호를 재 설정할 수 있어요.</p>
			</div>		
			<form id ="findPasswordForm" method="post">
				<div class='input-area'>
					<div class="form-group">
						<label for="pwdId">아이디 </label>
						<input type="text" class="form-control" id="pwdId" placeholder="아이디를 입력해주세요." name="id" required>
						<div class="valid-feedback">확인</div>
						<div class="invalid-feedback">해당하는 정보가 없습니다.</div>
					</div>
				</div>
				<div class='input-area'>				
					<div class="form-group">
						<label for="pwdName">이름 </label>
						<input type="text" class="form-control" id="pwdName" placeholder="이름을 입력해주세요." name="name" required>
						<div class="valid-feedback">확인</div>
						<div class="invalid-feedback">해당하는 정보가 없습니다.</div>
					</div>
				</div>					
				<div class="filed-area">
					<div class = 'normal-area'>	
						<ul class='radio-group iblock'>
							<li>
								<div class ='radio-area mt14'>
									<input name='checkBoxPwd' type="radio" id='birthCheck3' value='pwdBirth'>
									<label for = 'birthCheck3'>
										<span>생년월일</span>
									</label>
								</div>
							</li>
							<li>
								<div class ='radio-area mt14'>
									<input name='checkBoxPwd' type="radio" id='phoneCheck4' value='pwdPhone'>
									<label for = 'phoneCheck4'>
										<span>전화번호</span>								
									</label>
								</div>
							</li>
							<li>
								<div class ='radio-area mt14'>
									<input name='checkBoxPwd' type="radio" id='phoneCheck5' value='pwdEmail'>
									<label for = 'phoneCheck5'>
										<span>이메일</span>								
									</label>
								</div>
							</li>									
						</ul>
					</div>			
					<div class="form-group radiochange2">
						<div class="input-area">
							<label for="birth">생년월일</label>
							<input type="date" class="form-control" id="pwdBirth" placeholder="생년월일을 입력해주세요." name="birth" >
							<div class="valid-feedback">확인</div>
							<div class="invalid-feedback">올바른 생년월일을 입력해주세요.</div>
						</div>
					</div>	
				</div>
				<div class ="btn-area" style="text-align: center;">
					<div style="display: inline-block;">				
			      		<button type="button" id="findPwdBtn" class="btn btn-dark">비밀번호 찾기</button>
						<button type="button" class="btn btn-outline-dark" onclick="moveTologin.do">취소</button> 	
					</div>
				</div>					
			</form>
		</div>		
	</div>
</div>
</section>
<%@include file ="/common/footer.jspf" %>
</body>
</html>



