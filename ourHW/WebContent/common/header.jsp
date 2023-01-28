<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 
<div class="container">
	<div id="header" class="py-5">
		
		<div class="float-left">
			<c:choose>
				<c:when test="${user eq null}">
					<input type="button" class="opacity-50-hover border-0 bg-transparent" value="Login" onclick="location.href='/ourHW/signup/login.jsp'; return false;">
					<input type="button" class="opacity-50-hover border-0 bg-transparent" value="join" onclick="location.href='/ourHW/signup/signup.jsp'; return false;">
				</c:when>
				<c:otherwise>
						<input type="button" class="opacity-50-hover border-0 bg-transparent" value="Logout" onclick="location.href='/ourHW/controller?type=logout'; return false;">
						<input type="button" class="opacity-50-hover border-0 bg-transparent" value="Cart" onclick="location.href='/ourHW/controllersk?type=cartList'; return false;">
						<input type="button" class="opacity-50-hover border-0 bg-transparent" value="MyPage" onclick="location.href='/ourHW/Mypage/userpage.jsp'; return false;">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="float-right mr-1">
			<input type="text" name="통합검색" placeholder="검색어를 입력하세요." id="search">
			<input type="image" src="/ourHW/images/search_2.png" onclick="location.href='/ourHW/controller?type=search&search='+document.getElementById('search').value; return false;" width="20px" >
		</div>
		
		<p class="text-center">
			<a href="/ourHW/main/main.jsp"><img src="${pageContext.request.contextPath }/images/logo.jpg" alt="로고"></a>
		</p>
	</div>
		
	<p class="clear"></p>
	
	<div id="headermenu">
		<div>
			<div class="container">
			  <ul class="nav justify-content-center">
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=BESTITEM">BEST ITEM</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=NEW">NEW</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=OUTER">OUTER</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=TOP">TOP</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=BOTTOM">BOTTOM</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=SHOESBAG">SHOES & BAG</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/controllersk?type=productlist&category=ACC">ACC</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/BBSController?type=COMMUNITY&bbs=QA">Q&A</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link text-body" href="${pageContext.request.contextPath }/BBSController?type=COMMUNITY&bbs=review">REVIEW</a>
			    </li>
			  </ul>
			</div>
		</div>
		<p class="clear"></p>
	</div>

</div>

