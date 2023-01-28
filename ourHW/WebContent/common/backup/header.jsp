<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

	<div id="header">
		
			<div class="top">
			
				<c:choose>
					<c:when test="${user eq null}">
						<input type="button" value="Login" onclick="login()" class="button">
						<input type="button" value="join" onclick="join()" class="button">
					</c:when>
					<c:otherwise>
							<input type="button" value="Logout" onclick="logout()" class="button">
							<input type="button" value="cart" onclick="cart()" class="button">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="search">
				<input type="text" name="통합검색" placeholder="검색어를 입력하세요." id="search">
				<input type="image" src="/images/search_2.png" onclick="search()" width="20px" >
			</div>
		
		<p class="logo">
			<a href="/ourHW/main/main.jsp"><img src="/images/logo.jpg" alt="로고"></a>
		</p>
	</div>



