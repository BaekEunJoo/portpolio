<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VISIT | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	#noweb {
		color: #949494;
		font-size: 0.9em;
		padding-left: 30%;
		margin: auto 0;
	}
	
	.video_box{max-width: 1920px; width: 100%; object-fit: cover;}
    .video_box video{width: 100%;}
    .title_area{padding: 85px 0 150px;}
    .title_area h3{font-size: 4.5rem; font-weight: 500; line-height: 1.33; letter-spacing: -0.125rem;}
    .title_area p{margin-top: 30ox; font-size: 1.25rem; line-height: 1.5; letter-spacing: -0.03125rem; color: #666; word-break: keep-all;}
    .title_area strong{color: #000;}
    .content{display: flex; justify-content: space-between;}
    .left{width: 45%;}
    .right{width: calc(55% - 100px);}
    .right h4 span{background-color: #000; color: #fff; display: inline-block; padding: 5px 5px 0 5px; font-size: 34px;}
    .right h4 span:first-child{margin-right: 5px;}
    .right h5{margin-top: 20px; font-size: 30px; font-weight: 400;}
    .right h6{margin-top: 5px; font-size: 20px; font-weight: 400;}
    .right p{margin-top: 20px; color: #666; font-size: 18px;}
    .right #claendar {
    	display: inline-block;
    	border: 1px solid #000;
    	padding: 12px 40px;
    	margin-top: 10px;
    	vertical-align: middle;
    	}
	a{text-decoration: none; color: inherit;}
	
	@font-face {
    font-family: 'SF_HambakSnow';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/SF_HambakSnow.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	#ilogo span {
	font-family: 'SF_HambakSnow';
	}
	
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
		<div class="col-6" style="margin-top: 40px; margin-bottom: 40px;">
			<p style="font-size: 4em; font-weight: bold;">미술관 소개</p>
		</div>
		<div class="col-6 text-end" id="noweb" style="float: right;">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;미술관 소개 </span>
		</div>
	</div>
</div>

<div class="main">
    <div class="video_box">
      <video src="https://cdn.daelimmuseum.org/Store/Homepage/Main/Pc/202202/20220225123810497001.mp4" loop autoplay muted></video>
    </div>
<div class="container-filid notosanskr" style="margin-bottom: 100px;">
	<div class="row" style="margin: 0;">
		<div class="col-10 offset-1">
    <div class="title_area">
      <h3>일상이 예술이 되는 미술관</h3>
      <p>
        아이티윌 문화재단이 운영하는 아이뮤지엄은 우리 일상에서 예술적 가치를 발견하는 전시와 누구나 함께 참여하고 향유할 수 있는 다양한 <br>
        교육 문화 프로그램을 통해 관람객들에게 영감과 경험을 선사함으로써 <strong>‘일상이 예술이 되는 미술관’</strong>을 실현하고자 합니다.
      </p>
    </div>
    <div class="content">
      <div class="left">
        <img src="https://www.daelimmuseum.org/img/dmuseum-img.d9d1673f.png" alt="" width="95%;">
      </div>
      <div class="right">
        <h4 id="ilogo">
          <span>I</span><span>MUSEUM</span>
        </h4>
        <h5>아이뮤지엄</h5>
        <h6>"영감을 디자인하는 복합문화예술센터"</h6>
        <p>
          아이뮤지엄은, 다양한 문화예술 콘텐츠들을 더 확장된 공간에서, 보다 많은 사람들에게 수준 높은 감성으로 제시하며 주목을 받아 왔습니다.
          아이뮤지엄은, 보다 많은 대중들이 일상에서 예술을 즐길 수 있도록 새로운 라이프스타일을 제안하는 전시는 물론, 어린이부터 시니어까지 참여할 수 있는 다채로운 교육, 문화 프로그램을 연중 실행하여 누구나 즐겁게 예술을 경험하고 향유하는 영감의 장소, 문화와 예술로 삶을 풍요롭게 하는 서울의 문화·예술 랜드마크로 자리매김할 예정입니다.
        </p>
        <%
		SimpleDateFormat matt = new SimpleDateFormat("yyyy-MM");
		Date nowww = new Date();
		String now_dttt = matt.format(nowww) + "-01";
		%>
        <a href="calender.do?calDay=<%=now_dttt %>" id="claendar" style="text-decoration: none; color: inherit;">
          <i class="bi bi-calendar2-week"
			style="font-size: 1.3em; cursor: pointer; margin-right: 20px;"></i>캘린더 보기
        </a>
        
      </div>
    </div>
    </div>
    </div>
</div>
</div>

</body>
<%@ include file="/common/footer.jspf"%>
</html>