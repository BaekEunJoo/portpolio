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
#reservation::after {
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
				    <a class="nav-link active" id="program" aria-current="page" href="#" onclick="location.href='FAQ.do'" style="color:gray;">전시·프로그램</a>
				  </li>  
				  <li class="nav-item">
				    <a class="nav-link active" id="reservation" aria-current="page" href="#" onclick="location.href='FAQ_reservation.do'" style="color:black;">관람·예약</a>
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
			            <p class="q row"><a href="#a1" class="col-4">관람·예약</a><a href="#a1" class="col-8" style="color:black;">교육 프로그램 티켓도 선물 할 수 있나요?</a></p>
			            <p class="a">일부 프로그램의 경우 교육 프로그램 티켓 선물이 가능합니다.<br>
						'선물하기'가 가능한 프로그램은 디뮤지엄 홈페이지 로그인 후, 'MY PAGE'의 My TICKET에서 함께 참여하실 분께 선물을 할 수 있습니다. <br>
						다만, 참가하실 분이나 보호자가 스마트 폰을 소지 하고 있어야 하고 디뮤지엄 APP에서 회원 가입 후 선물을 수락하여 티켓을 등록하신 경우에만 가능합니다. <br><br>
						또, 티켓을 선물 받은 분의 연령이 선물한 프로그램의 교육대상자 연령과 일치해야 하는 점, 꼭 기억해 주세요. <br>
						(예를 들어, 청소년에게 티켓을 선물해주셨다고 해서 해당 학생이 성인 프로그램을 들을 수는 없습니다.) 
						</p>
			        </li>
			        <li class="article" id="a2" style="padding-top:15px;">
			            <p class="q row"><a href="#a2" class="col-4">관람·예약</a><a href="#a1" class="col-8" style="color:black;">교육 프로그램 단체 예약을 완료한 인원이 다 못가게 되었어요. 취소가 가능한가요?</a></p>
			            <p class="a">
			            	예매하신 티켓은 방문일 전일 17시까지 수수료 없이 취소가 가능합니다.  <br>
							만약 방문 인원이 불확실 한 학교 단체의 경우는, 단체 신청 시 직원에게 방문일 당일 현장 결제 여부를 문의해 주시기 바랍니다. <br><br>
							단체 교육의 취소는, <a href="#" onclick="location.href='askQna.do'">문의하기</a> 또는 교육팀 (02-6233-7217)으로 문의주시기 바랍니다. 
						</p>
			        </li>
			        <li class="article" id="a3" style="padding-top:15px;">
			            <p class="q row"><a href="#a3" class="col-4">관람·예약</a><a href="#a1" class="col-8" style="color:black;">단체 교육시, 세금계산서 처리가 가능한가요?</a></p>
			            <p class="a">
							사업자등록증, 혹은 고유번호증이 있는 단체의 경우, 세금계산서 처리가 가능합니다. 다만 교육 참여 신청 시 증빙 서류를 첨부 해 주셔야 합니다. <br><br>
							하지만, 계산서 발급은 교육 진행 일자로만 가능하기 때문에, 입금 시점과 발급 시점이 다를 수 있음을 참고하여 주시기 바랍니다. <br>
							무통장입금으로 프로그램 참가비를 계산 한 다음 취소와 환불을 진행한 단체의 경우, 환불에 최소 14일 이상이 소요 될 수 있으니 참고 부탁드립니다. 
						</p>
			        </li>
			        <li class="article" id="a4" style="padding-top:15px;">
			            <p class="q row"><a href="#a4" class="col-4">관람·예약</a><a href="#a1" class="col-8" style="color:black;">단체로 교육프로그램을 예매 했어요. 티켓은 어떻게 받을 수 있나요?</a></p>
			            <p class="a">
							디뮤지엄≪어쨌든, 사랑≫의 전시 관람료는 성인 18,000원 / 청소년(14세-19세) 9,000원 / 유아 및 어린이(36개월-13세) 6,000원 입니다.<br> 
							디뮤지엄의 온라인 회원이 되시면 성인 온라인 회원 12,600원 / 청소년 온라인 회원 6,300원 으로 할인된 가격에 전시 관람이 가능합니다. <br>
							보다 자세한 관람 안내 및 요금 할인은 디뮤지엄 APP / 홈페이지 '관람안내'와 TICKET 에서 확인하실 수 있습니다. <br>
							예매 및 입장방법을 확인 하시고 디뮤지엄에서 새롭고 즐거운 전시를 경험해 보세요. 
						</p>
			        </li>
			        <li class="article" id="a5" style="border-bottom: 1px solid #bdbdbd; padding-top:15px;">
			            <p class="q row"><a href="#a5" class="col-4">관람·예약</a><a href="#a1" class="col-8" style="color:black;">전시를 관람하려면 반드시 예약을 해야하나요?</a></p>
			            <p class="a">
							디뮤지엄의 ≪어쨌든, 사랑≫은 안전하고 쾌적한 관람을 위해 사전예약제로 운영됩니다.<br>
							잔여 티켓에 한해 현장 발권을 진행 하나, 방문하시고자 하는 시간에 예매가 완료 된 경우 <br>
							현장 구매와 입장이 어려 울 수 있으니 디뮤지엄 APP 또는 홈페이지에서 사전 예약 후 방문해 주시기를 추천 드립니다.<br> 
							잔여 티켓이 있는 경우, 디뮤지엄 APP이나 홈페이지에서 당일 예매도 가능 하오니 참고 부탁드립니다. 
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