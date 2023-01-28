<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>            
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>

@font-face {
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#namef {
	font-family: 'Cafe24SsurroundAir';
}

.box-item01 img{
	width: 100%;
	cursor: pointer;
}
.box-item02 img{
	width: 100%;
	cursor: pointer;
}
a{text-decoration: none; color: inherit;}
ul{list-style: none;}
.box li{width: 195px; height: 195px;}
.box-item02{position: relative; top: -50px; right: -60px;}
.box:hover .box-item01{animation: a 0.5s infinite alternate;}
.box:hover .box-item02{animation: b 0.5s infinite alternate;}
@keyframes a {
	0%{transform: rotate(0);}
	100%{transform: rotate(40deg);}
	}
@keyframes b {
	0%{top: -50px;}
	100%{top: -60px;}
	}
aside {position: fixed; bottom: 40px; right: 100px; z-index: 20; cursor: pointer;}
aside .top {width: 40px; height: 40px; z-index: 20; opacity: 0; transition: 0.2s; position: relative; right: -240px}
aside .top.on {opacity: 1;}


#shopbtn {
	margin: 0 auto;
	background-color: white;
	border: 1px solid black;
	font-size: 1.3em;
	width: 200px;
	height: 50px;	
}

#shopbtn:hover {
	background-color: black;
	color: white;
}

.card:hover {
	transform: scale(1.1);
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


<div style="width: 100%; height: 1080px;
	background-image: url('https://cdn.daelimmuseum.org/Store/Homepage/Main/Pc/202209/20220916134414476001.jpg');">

<%@ include file="/common/main.jspf" %>

<div class="notosanskr">
	<div style="padding-top: 15%;">
	<span style="background-color: black; color: white; margin: 10%; padding: 10px;">
		아이뮤지엄
	</span>
	<br><br>
	<span style="margin: 10%; color: white; font-weight: bold; font-size: 1.1em;">
		2022.06.29 ~ 2022.12.23
	</span>
	<br>
	<span style="margin: 10%; color: white; font-weight: bold; font-size: 4em;">
		Romantic Days
	</span>
	<br>
	<span style="margin: 10%; color: white; font-size: 4em;" id="namef">
		어쨌든, 사랑
	</span>
	<br><br>
	<span style="margin-left: 10%; color: white; font-size: 1.2em; border: solid white;
		padding: 15px 30px; cursor: pointer;" onclick="location.href='exhibitionDetail.do?exhNum=12'">
		자세히보기
	</span>
	<span style="margin-left: 20px; font-size: 1.2em; background-color:white; 
		border: solid white; padding: 15px 40px; cursor: pointer;" onclick="location.href='ticketExhibition.do?exhNum=12'">
		예매하기
	</span>
	</div>
</div>
</div>

<aside>
	<div class="box">
		<ul>
		<li class="box-item01">
			<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fcc6L44%2FbtrRlIBWyVZ%2F4OIhGsGIaSX6NNLVfsmoz0%2Fimg.png" alt="" onclick="location.href='ExticketList.do'">
		</li>
		<li class="box-item02">
			<img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FyDSQZ%2FbtrRoP7f1Lp%2FbLZQHHBd5r95d4hanZthg1%2Fimg.png" alt="" onclick="location.href='moveToSign.do'">
		</li>
		</ul>
		
	</div>
<i class="bi bi-arrow-up-circle-fill top" style="font-size: 3em;"></i>	
</aside>



<div class="container-filid notosanskr" style="margin: 80px 0;">
	<div class="row" style="margin: 0;">
		<div class="col-3">
		<p style="font-size: 5em; font-weight: bold; text-align: right;">SHOP</p>
		</div>
		<div class="container-filid">
			<div class="row" style="margin-left: 5%;">
			<c:forEach var="list" items="${productList }" begin="1" end="3">
				<div class="col-xl-4 col-md-6 mt-3">
					<div class="card" style="width: 18rem; border: none; cursor: pointer;">
					<a href="getProduct.do?productnum=${list.productnum }" style="color: inherit; text-decoration: none;">
						<img src="${pageContext.request.contextPath}/imgs/${list.photo1 }" class="card-img-top" alt="...">
						<div class="card-body">
							<p class="card-text">${list.productname }</p>
						</div>
					</a>
					</div>
				</div>
			</c:forEach>					
				<button id="shopbtn" style="margin-top: 50px;" onclick="location.href='ProductList.do'">쇼핑하기</button>
				
			</div>
		</div>
	</div>
</div>

<script>
   $('aside .top').on('click',function(){
      $('html, body').animate({scrollTop: 0},500);
    });

    $(window).scroll(function(){
      var curr = $(this).scrollTop();
      var target = 0;

      if(curr > target){
            $('aside .top').addClass('on');
        }else{
            $('aside .top').removeClass('on');
        }
    });
  </script>

</body>

<%@ include file="/common/footer.jspf"%>
</html>