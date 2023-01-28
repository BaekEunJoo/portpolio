<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
 
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 메인</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
	.main_view {
		margin-bottom : 20px;
		margin-top : 50px;
	}
	.main_view ul {
		width : calc(100% * 4);
		display : flex;
		animation : slide 4s infinite;
	}
	.main_view li {
		width : calc(100% / 4);
	}
	@keyframes slide {
		0% {margin-left : 0;}
		10% {martgin-left : 0;}
		25% {margin-left:-100%;}
		35% {margin-left:-100%;}
		45% {margin-left:-200%;}
		55% {margin-left:-200%;}
		65% {margin-left:-200%}
		80%{margin-left:-300%;}
		100% {margin-left:-300%;}
	}
</style>
</head>

<body>
	<jsp:include page="/common/header.jsp"></jsp:include>

	<div id="body">
		<div class="main_view">
			<ul class="w3-stretch">
				<li><img src="/ourHW/images/main.jpg" alt="메인이미지" width="100%"></li>
				<li><img src="/ourHW/images/main2.jpg" alt="메인이미지" width="100%"></li>
				<li><img src="/ourHW/images/main3.jpg" alt="메인이미지" width="100%"></li>
				<li><img src="/ourHW/images/main4.jpg" alt="메인이미지" width="100%"></li> 
			</ul>
		</div>
		<h5 class="text-center">BEST ITEM</h5>
			<table id="product">
				<tbody class="p1">
					<tr>
						<td><img alt="상품이미지1" src="/ourHW/images/p1.jpg" width="100%"></td>
						<td><img alt="상품이미지2" src="/ourHW/images/p2.jpg" width="100%"></td>
						<td><img alt="상품이미지3" src="/ourHW/images/p3.jpg" width="100%"></td>
					</tr>
					<tr>
						<td>포인트 오버핏 후드 바람막이(3 color)</td>
						<td>트래핑 스트링 와이드 팬츠(6 color)</td>
						<td>미니멀 왁스 소프트 긴팔(4 color)</td>
					</tr>
					<tr>
						<td>16,300원</td>
						<td>26,300원</td>
						<td>36,300원</td>
					</tr>
				</tbody>
				<tbody class="p2">
					<tr>
						<td><img alt="상품이미지4" src="/ourHW/images/p4.jpg" width="100%"></td>
						<td><img alt="상품이미지5" src="/ourHW/images/p5.jpg" width="100%"></td>
						<td><img alt="상품이미지6" src="/ourHW/images/p6.jpg" width="100%"></td>
					</tr>
					<tr>
						<td>포인트 오버핏 후드 바람막이(3 color)</td>
						<td>트래핑 스트링 와이드 팬츠(6 color)</td>
						<td>미니멀 왁스 소프트 긴팔(4 color)</td>
					</tr>
					<tr>
						<td>16,300원</td>
						<td>26,300원</td>
						<td>36,300원</td>
					</tr>
				</tbody>
			</table>
	</div>
	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>
</body>
</html>