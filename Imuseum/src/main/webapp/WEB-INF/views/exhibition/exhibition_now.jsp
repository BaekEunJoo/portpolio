<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>                   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXHIBITION | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	#noweb {
	color: #949494;
	font-size: 0.9em;
	padding-left: 30%;
	margin: auto 0;
	}
	
	@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}

	#namef {
	font-family: 'Cafe24SsurroundAir';
	}
	
	.btn {height: 40px; border-radius: 0;}
	
</style>
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
<%@ include file="/common/main.jspf" %>


<div class="container notosanskr" style="margin: 0 auto;">
	<div class="row">
		<div class="col-6" style="margin-top: 40px;">
			<p style="font-size: 4em; font-weight: bold;">현재전시</p>
		</div>
		<div class="col-6 text-end" id="noweb">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;EXHIBITION&nbsp;&nbsp;|&nbsp;&nbsp;현재전시 </span>
		</div>
	</div>
</div>
<hr>
<div class="container notosanskr">
	<div class="row">
	
	<c:if test="${empty list}">
		<div class="col-12" style="text-align: center; padding: 100px 0;">
		<strong style="font-size: 2em;">지금은 전시를 준비중입니다.</strong>
		<p style="font-size: 1.2em; padding-top: 10px;">더 나은 전시로 찾아뵙겠습니다.<p>
		</div>
	</c:if>
	
	
	<c:if test="${not empty list}">
		<c:forEach var="vo" items="${list }" varStatus="status">
		<div class="col-6">
			<div style="padding: 30% 0;">
		<span style="background-color: black; color: white; padding: 10px;">
			아이뮤지엄
		</span>
		<br><br>
		<br>
		<span style="font-weight: bold; font-size: 4em;">
			${vo.exhInfo }
		</span>
		<br>
		<span style="font-size: 4em;" id="namef">
			${vo.exhName }
		</span>
		<br>
		<span style="font-weight: bold; font-size: 1.1em;">
			${vo.startDate.substring(0,10) } ~ ${vo.lastDate.substring(0,10) }
		</span>
		<i class="bi bi-share" style="font-size: 1.1em; cursor: pointer; padding-left: 10px;" data-toggle="modal" data-target="#shareModal${status.index }"></i>
		<!-- Modal -->
		<div class="modal fade" id="shareModal${status.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered notosanskr">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">공유하기</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		      	<div style="text-align: center; padding: 20px 0;">
		      		<a href="javascript:shareFacebook(${vo.exhNum });">
		      		<img alt="페이스북" src="${pageContext.request.contextPath}/img/icon-facebook.png" style="padding-right: 20px;">
		      		</a>
		      		<a href="javascript:shareTwitter(${vo.exhNum } ,'${vo.exhName }');">
		      		<img alt="트위터" src="${pageContext.request.contextPath}/img/icon-twitter.png" style="padding-right: 20px;">
		      		</a>
		      		<a href="javascript:shareKakao(${vo.exhNum },'${vo.exhName }');">
		      		<img alt="카카오톡" src="${pageContext.request.contextPath}/img/icon-kakao.png" id="btnKakao">
		      		</a>
		      		<br>
		      		<div style="padding-top: 30px;">
		      		<input type="text" id="${status.index }" value="http://localhost:8080/Imuseum/exhibitionDetail.do?exhNum=${vo.exhNum }" readonly="readonly";
		      			style="width: 60%; height: 40px; border: 1px solid silver; outline: none; padding-bottom: 5px;">
		      		<button type="button" class="btn btn-outline-dark btn-sm" onclick="copy(${status.index })">복사하기</button>	
		      		</div>
		      	</div>
		      
		        
		      </div>
		    </div>
		  </div>
		</div>
		<br><br><br>
		<span style="font-size: 1.2em; border: 2px solid black;
			padding: 15px 30px; cursor: pointer;" onclick="location.href='exhibitionDetail.do?exhNum=${vo.exhNum}'">
			자세히보기
		</span>
		<span style="margin-left: 20px; font-size: 1.2em; background-color:black; color: white;
			border: 2px solid black; padding: 15px 40px; cursor: pointer;" onclick="checklogin(${vo.exhNum })">
			예매하기
		</span>
		</div>
		</div>
		<div class="col-6" style="padding: 100px;">
			<img alt=".." src="${pageContext.request.contextPath}/exhibitionImg/${vo.posterImg}"
				width="500px;">
		</div>
		</c:forEach>
	</c:if>
	</div>
</div>






<script>

function checklogin(exhNum) {
	<c:if test="${empty member }">
	location.href='moveToSign.do';
	</c:if>
	
	<c:if test="${not empty member}">
	location.href='ticketExhibition.do?exhNum='+exhNum;
	</c:if>
}


function shareFacebook(exhNum) {
    var sendUrl = "exhibitionDetail.do?exhNum=" + exhNum; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

function shareTwitter(exhNum, exhName) {
	var sendText = "아이뮤지엄 " + "\r" + exhName + "\r"; // 전달할 텍스트
    var sendUrl = "http://localhost:8080/Imuseum/exhibitionDetail.do?exhNum=" + exhNum; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

function shareKakao(exhNum, exhName) {
	 
	  // 사용할 앱의 JavaScript 키 설정
	  Kakao.init('e0f3321d007e1c8104ea863a5e45bcb5');
	 
	  // 카카오링크 버튼 생성
	  Kakao.Link.createDefaultButton({
	    container: '#btnKakao', // 카카오공유버튼ID
	    objectType: 'feed',
	    content: {
	      title: "아이뮤지엄", // 보여질 제목
	      description: exhName, // 보여질 설명
	      imageUrl: "http://localhost:8080/Imuseum/exhibitionDetail.do?exhNum=" + exhNum, // 콘텐츠 URL
	      link: {
	         mobileWebUrl: "http://localhost:8080/Imuseum/exhibitionDetail.do?exhNum=" + exhNum,
	         webUrl: "http://localhost:8080/Imuseum/exhibitionDetail.do?exhNum=" + exhNum
	      }
	    }
	  });
	}



	function copy(idex) {
	    const input_text = document.getElementById(idex);
	    input_text.select();
	    document.execCommand('copy');
	    alert('주소가 복사되었습니다.')
	}



</script>






</body>
<%@ include file="/common/footer.jspf"%>
</html>