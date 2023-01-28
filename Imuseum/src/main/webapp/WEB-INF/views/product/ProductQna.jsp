<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="/Imuseum/common/css/askQnaStyle.css" />
<title>문의 하기</title>
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

<!-- 본문 -->
<div class="container notosanskr" style="width: 30%; padding: 30px;">
	<div class="headline" >
		<div class="container mt-3  mb-3" style="font-weight: bold;">
			<h2>문의 하기</h2>
		</div>
	</div>
	<!-- ID 시작 -->
	<div class="container pb-5 ">
		<div id="content-wrapper">
			<div class="container p-1" style="text-align: left; font-size:18px;">
				<p class="txt-required" style="font-size:14px;">표시는 필수 입력 항목입니다.</p>
			</div>
			<form action="insertProductQna.do" method="post">
				<div class="form-group">		
				<select id ="typeNum" class="form-select" aria-label="museumCategory" name="typenum">
				  <option  selected>문의 유형을 선택해주세요.</option>
				  <option value="1">상품문의</option>
				  <option value="2">재입고문의</option>
				  <option value="3">사이즈문의</option>
				  <option value="4">배송문의</option>
				  <option value="5">기타</option>
				</select>
				</div>
				<input type="hidden" name="productnum" value="${product.productnum }">
				<input type="hidden" name="id" value="${member.id }">
				<div class="form-group">
					<label for="phone">상품명</label>
					<input type="text" class="form-control" id="productName" placeholder="${product.productname }" disabled="disabled">
					<div class="valid-feedback">확인</div>
					<div class="invalid-feedback">해당하는 정보가 없습니다.</div>
				</div>
				<div class="form-group">
					<label for="contents">내용</label>
					<textarea class="form-control" name ="question" placeholder="자세한 내용을 적어 주시면 정확한 상담이 가능합니다." maxlength="3000" style="height: 7.5rem"></textarea>
					<div class="valid-feedback">확인</div>
					<div class="invalid-feedback">해당하는 정보가 없습니다.</div>
				</div>				
				<div style="text-align: right; padding-top: 20px;">
					<div style="display: inline-block;">				
			      		<button type="submit" id="login" class="btn btn-dark">문의 하기</button>
						<button type="button" class="btn btn-outline-dark" onclick="location.href='ProductList.do'">취소</button> 	
					</div>
				</div>					
			</form>
		</div>
	</div>
</div>
<%@include file ="/common/footer.jspf" %>
</body>
</html>



