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
<meta charset="utf-8">
<title>회원 가입</title>
<link rel="stylesheet" type="text/css"
	href="/Imuseum/common/css/join.css"/>
<body>    
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

</script>
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
<section class="sub-content-wrap notosanskr">
	<div class="sub-top-area forms" >
		<div class="container">
			<h2>회원 가입</h2>
		</div>
	</div>
		<!-- 회원가입 시작 -->
	<div class="container small pddt">
		<div class="m-block">
			 ※ 만 14세 이상만 가입이 가능합니다. 
		</div>
		<div class="normal-area mt40 btn-group" style="display:block;">
			<div class="btn-area">
				<div class="btn-area">
					<button type="button" data-toggle="modal" data-target="#signup" class="primary"> 일반가입 </button>
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
	</div>	
</section>
<%@include file ="/common/footer.jspf" %>
</body>
</html>



