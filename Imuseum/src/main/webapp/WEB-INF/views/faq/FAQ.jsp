<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/common/css/faq_all.css">
<meta charset="UTF-8">
<title>FAQ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
<style>
input {accent-color: black;}
/* FAQ */
/* .faq{border-bottom:0px solid #ddd;margin:1em 0;} */
/* .faq .faqHeader{position:relative;zoom:1} */
.faq .faqHeader .showAll{position:absolute;bottom:0;right:0;border:0;padding:0;overflow:visible;background:none;cursor:pointer}
/* .faq .faqBody{margin:0;padding:0} */
.faqBody li{border-top : 1px solid #bdbdbd;}
.faq .faqBody .article{list-style:none}
/* .faq .q{margin:} */
.faq .q a{
	display:block;
	text-align:left; 
    /* background:url("faq1_icon_q.png") no-repeat 0 0; */
    padding:0 0 0 35px;
    font-size:18px;
    color:#5e5e5e;
    font-weight:bold;
    line-height: 27px;
    cursor:pointer;
    margin: 10px 0; !important
}
/* .faq .q a:hover, .faq .q a:active, .faq .q a:focus{} */
.faq .a{
	background:#f8f8f8 url("faq1_icon_a.png") no-repeat 40px 10px;
	padding: 20px 75px 20px 75px;
    font-size: 16px;
    color: #444444;
    line-height: 22px;
    border-top: 1px solid #bdbdbd;
    margin:5px 0 0 0;
}
.bt {
	width:150px;
	height:45px;
	color : white;
	background-color: black;
}
.bt:hover {
	color:black;
	background-color:white;
	border: 1px solid black;
}
.page-item > a {
	color : black;
	border : none;
}
.tt {
	width : 150px;
	border : 1px solid gray;
}
.cate {
	color:black; !important
}
#noweb {
	color: #949494;
	font-size: 0.9em;
	padding-left:180px;
	margin: auto 0;
}
.lineTest {
	  display: flex;
	  flex-basis: 100%;
	  align-items: center;
	  margin: 0px 0px;
}
.lineTest::before {
	  content: "";
	  flex-grow: 1;
	  background: rgba(0, 0, 0, 0.35);
	  height: 1px;
	  font-size: 0px;
	  line-height: 0px;
	  margin: 0px 16px;
}
#program::after {
   content: '';
   width: 100%;
   display: block;
   position: relative;
   margin-top: 20px;
   padding-bottom:0;
   border-bottom: 3px solid #000;
}
</style>
</head>
<body>
<c:choose>
	<c:when test="${empty member.id }">
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-3" style="margin-top: 40px; margin-bottom: 40px;">
				<div class="lineTest" style="font-size: 4em; font-weight: bold;">FAQ</div>
			</div>
			<div class="col-5">
			</div>
			<div class="col-4 text-end" id="noweb">
				<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor:pointer; font-size:1.1em;"></i>
				<span>&nbsp;&nbsp;|&nbsp;FAQ </span>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<!-- 검색 부분 시작 -->
		<!-- <div class="container my-5" style="padding-bottom:10px">
			<form action="">
				<table>
					<tr>
						<td>
							<div>
								<select class="tt form-select form-select-lg px-5 py-2 mx-3" aria-label=".form-select-lg example">
								  <option value="제목">제목</option>
								  <option value="내용">내용</option>
								</select>
								<input type="text" name="searchKeyword" placeholder="검색어를 입력하세요" class="px-3 py-2 mx-3" style="border:none; border-bottom:2px solid black; !important">
								<i class="bi bi-search"></i>
								<input type="submit" value="검색" class=" bt px-5 py-2">
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div> -->
		<!-- 검색 부분 끝 -->
		
		
		<div class="container">
			<div class="cate">
				<ul class="cate nav justify-content-center" style="padding-top:40px;">
				  <!-- <li class="nav-item">
				    <a class="nav-link" aria-current="page" href="#">전체</a>
				  </li> -->
				  <!-- <li class="nav-item">
				    <a class="nav-link active" aria-current="page" href="#" style="color:black;">전시/프로그램</a>
				  </li> -->
				  <li class="nav-item">
				    <a class="nav-link active" id="program" aria-current="page" href="#" onclick="location.href='FAQ.do'" style="color:black;">전시·프로그램</a>
				  </li>  
				  <li class="nav-item">
				    <a class="nav-link active" id="reservation" aria-current="page" href="#" onclick="location.href='FAQ_reservation.do'" style="color:gray;">관람·예약</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" id="shop" aria-current="page" href="#" onclick="location.href='FAQ_shop.do'" style="color:gray;">뮤지엄샵·온라인 SHOP</a>
				  </li>
				  <li class="nav-item">
				    <a class="nav-link active" id="location" aria-current="page" href="#" onclick="location.href='FAQ_location.do'" style="color:gray;">위치·시설안내</a>
				  </li>
				</ul>
			</div>	
		</div>
		<hr>
		
		<!-- 관람/예약 content -->
		<div class="container">
			<div class="faq py-5">
			    <ul class="faqBody">
			        <li class="article" id="a1" style="border-top:2px solid black; padding-top:15px;">
			            <p class="q row"><a href="#a1" class="col-4">전시·프로그램</a><a href="#a1" class="col-8" style="color:black;">교육 프로그램은 어떻게 참여하나요?</a></p>
			            <p class="a">디뮤지엄의 교육 프로그램은 사전예약제로 운영됩니다. <br>
							디뮤지엄 홈페이지에 로그인 후, 'LEARN' 또는 'TICKET'메뉴에서 각 연령별로 제공되는 프로그램들을 확인해 보세요. <br>
							참여 하고자 하는 프로그램을 찾으셨다면, 미술관 홈페이지에서 바로 예매할 수 있습니다. <br>
							예매가 끝나면, 여러분의 모바일 앱으로 티켓이 전송됩니다. 이 티켓과 함께 예매 하신 교육 당일 미술관으로 오셔서 프로그램에 참여 하시면 됩니다! <br>
							(미술관 티켓 박스에서도 티켓을 교환 할 수 있으니 참고해주세요.) <br>
							교육 참여에 대해 더 궁금하신 점이 있으시다면, 문의하기 또는 디뮤지엄 교육팀 (02-6233-7217)으로 연락 주시면, 보다 상세한 안내를 받을 수 있습니다.
						</p>
			        </li>
			        <li class="article" id="a2" style="padding-top:15px;">
			            <p class="q row"><a href="#a2" class="col-4">전시·프로그램</a><a href="#a1" class="col-8" style="color:black;">전시장에서 사진촬영이 가능한가요?</a></p>
			            <p class="a">
			            	네! 디뮤지엄과 대림미술관은 국내 최초로 전시장 안에서의 사진 촬영을 허용한 미술관이니 만큼, 전시장에서 사진 촬영이 가능합니다. <br>
							다만, 플래시, 삼각대 및 셀카스틱을 이용한 촬영, 허가되지 않은 상업적 용도의 촬영 및 녹음, 동영상 촬영은 불가합니다. <br>
							언론보도용 사진이 필요하신 경우, '문의하기'에 남겨주시거나 디뮤지엄 홍보마케팅팀으로 문의 주시기 바랍니다. <br>
							사진 촬영을 하실 때에는 과도한 촬영음이 발생하거나, 대기 줄이 생기지 않도록 관람 에티켓을 지켜주시기 바랍니다. 
						</p>
			        </li>
			    </ul>
			</div>
		</div>
		<!-- 관람/예약 content 끝 -->
		
		<!-- 페이징 처리 -->
		<nav aria-label="Page navigation example" class="mt-3">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link"><<</a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#">>></a>
		    </li>
		  </ul>
		</nav>
		
		<!-- 회색 박스 -->			
		<div class="container-fluid mt-5">
			<div class="bg-light py-5 d-flex justify-content-center">
		    	<div>
					FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.<br>원하는 답변을 얻지 못하셨나요?<br>문의하기를 이용해 보세요.
				</div>
		    	<div style="margin-left:100px;">
					<button type="button" class="bt m-3" onclick="location.href='moveToQna.do'">문의하기</button>
				</div>
			</div>
		</div>
	</div>
</div>		
 	<%@include file ="/common/footer.jspf" %>
</body>
<script>
jQuery(function($){
    // Frequently Asked Question
    var article = $('.faq>.faqBody>.article');
    article.addClass('hide');
    article.find('.a').hide();
    article.eq(0).removeClass('hide');
    /* article.eq(0).find('.a').show() */;
    $('.faq>.faqBody>.article>.q>a').click(function(){
        var myArticle = $(this).parents('.article:first');
        if(myArticle.hasClass('hide')){
            article.addClass('hide').removeClass('show');
            article.find('.a').slideUp(100);
            myArticle.removeClass('hide').addClass('show');
            myArticle.find('.a').slideDown(100);
        } else {
            myArticle.removeClass('show').addClass('hide');
            myArticle.find('.a').slideUp(100);
        }
        return false;
    });
    $('.faq>.faqHeader>.showAll').click(function(){
        var hidden = $('.faq>.faqBody>.article.hide').length;
        if(hidden > 0){
            article.removeClass('hide').addClass('show');
            article.find('.a').slideDown(100);
        } else {
            article.removeClass('show').addClass('hide');
            article.find('.a').slideUp(100);
        }
    });
});
</script>
</html>