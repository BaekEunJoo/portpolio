<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	<%@include file = "/common/style.jspf" %>
    <meta charset="utf-8">
    <meta name="google-signin-client_id" content="823701064865-qt234ui11kpthfqh28ptkua9cuav1kmr.apps.googleusercontent.com">
<title>로그인</title>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script>
/* 카카오 로그인 */
$(document).ready(function(){
    Kakao.init('d9eec056b1db6f9504901b34553a6865');
    Kakao.isInitialized();
});

function loginWithKakao() {
    Kakao.Auth.authorize({ 
    redirectUri: 'http://localhost:8080/Imuseum/kakao_callback.do' 
    });
}

/* 메뉴 변경 */
function changeMenu(menu){
	if(menu == 1){
		$("#findPasswordForm").css('display','none');
		$("#findIdForm").css('display','block');
	}
	if(menu == 2){
		$("#findIdForm").css('display','none');
		$("#findPasswordForm").css('display','block');
	}
}
</script>	
<style>
body button {
    outline: none;
    border: 0;
    background: transparent;
    cursor: pointer;
    -webkit-tap-highlight-color: transparent;
    color: inherit;
}
.sub-contents-wrap{
	padding-bottom:9.375rem;
}
.sub-top-area.forms{
    padding: 5rem 0 3.75rem 0;
}
.sub-top-area.container{
	position: relative;
    width: 80rem;
    margin: 0 auto;
}
.sub-top-area h2{
    position: relative;
    font-weight: 300;
    font-size: 4.5rem;
    color: #1d1d1d;
}
.sub-top-area.forms h2{
	font-size: 3rem !important;
    font-weight: 500 !important;
    line-height: 1.2;
    letter-spacing: -0.075rem;
    text-align: center;
}

.container.small{
	width: 25.5rem;
    margin: 0 auto;
}

.container.small > div:first-child{
	margin-top: 0px;
}

.container.small > div{
	margin-top:1.25rem;
}
.container .id-area{
	position: relative;
}

.container .normal-area.between{
	display: flex;
	justify-content: space-between;
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
    font-family: 'Noto Sans KR', sans-serif;
}
.account-tool{
	padding-left:12rem;
}

.container .normal-area.between .account-tool a{
	font-size: 1rem;
    line-height: 1.2;
    letter-spacing: -0.025rem;
    color: #888;
}

.container .normal-area.mt40{
	margin-top:2.5rem;
}

.btn-group > div{
	width: 100%;
	margin-top:0.625rem;
}

.btn-area{
	text-align: center;
}
button{
	font-family: 'Noto Sans KR', sans-serif;
}
.btn-area button{
    display: inline-block;
    min-width: 11.875rem;
    height: 3.75rem;
    padding: 0 0.625rem 0;
    text-align: center;
    letter-spacing: -0.04063rem;
    line-height: 3rem;
    font-size: initial;
}

.btn-area button{
	min-width: 100%
}

.btn-area button.primary{
    background: #111;
    color: #fff;
}

.btn-area button.secondary{
    border: 1px solid #111;
    color: #111;
}
.icons{
	margin: 0;
}
.icons li img{
	width: 50px;
	display:block;
	margin-right: 20px; margin-bottom: 10px; 
}


</style>	
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
<section class="sub-contents-wrap">
	<div class="sub-top-area forms">
		<div class="container" style="font-weight: bold;">
			<h2>로그인</h2>
		</div>		
	</div>
		<!-- ID 시작 -->
	<form action="#" method="post">
		<div class="container small pddt">
			<div class="id-area">
				<div class="input-area">
					<input type="text" class="form-control" id="loginId" placeholder="아이디를 입력해주세요." name="id" required>
					<div class="valid-feedback"></div>
					<div class="invalid-feedback">ID를 확인해주세요.</div>
				</div>
			</div>					
			<div class="input-area">
				<input type="password" class="form-control" id="loginPwv" placeholder="비밀번호를 입력해주세요." name="password" required>
				<div class="valid-feedback">확인</div>
				<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
			</div>	
			<div class="normal-area between">
				<div class="account-tool mt0">
					<a href="moveTomemberFind.do?category=1">아이디 찾기</a>
					<a href="moveTomemberFind.do?category=2">비밀번호 찾기</a>
				</div>
			</div>			
			<div class="normal-area mt40 btn-gorup">
				<div class="btn-area">		
		      		<button type="button" id="login" class="primary" onclick="validateLogin(this.form)">로그인</button>
				</div>
				<div class="btn-area" style="padding-top: 1rem;">
					<button type="button" class="secondary" onclick="location.href='moveToSign.do'">회원이 아니신가요? 가입하기</button> 	
				</div>
			</div>	
			<div class="border-top pt-3" style="padding-top:20px; text-align: center;">
				<p><span style="display: inline-block; padding: 0 1.5625rem;font-size: 1rem;font-weight: 500;line-height: 1.2;letter-spacing: -0.025rem; text-align: center;color: #888;">소셜 계정으로 로그인</span></p>
				<ul class="icons" style="display: flex; list-style: none; justify-content: center; align-content: center;">
					<!-- 컨트롤러 태우게 수정 -->
					<li>
						<div id="naver_id_login" style="text-align:center"><a href="${naverUrl }"><img src="/Imuseum/common/img/naver_logo.png"></a></div>
					</li>
					<li>
						<img alt = "카카오로그인" src="/Imuseum/common/img/kakaotalk_sharing_btn_medium_ov.png" onclick = "loginWithKakao()" style="cursor: pointer;">							
					</li>
					<li>
						<a href="${googleUrl }">
							<img id="googleLoginBtn" alt = "구글로그인" src="/Imuseum/common/img/googleLogo.png" style="cursor: pointer;">
						</a>							
					</li>
				</ul>				
			</div>
		</div>											
	</form>

</section>
<%@include file ="/common/footer.jspf" %>
</body>
</html>



