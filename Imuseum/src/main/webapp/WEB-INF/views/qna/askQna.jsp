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
<script
	src="/Imuseum/common/js/askQnaStyleJS.js"></script> 
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
			<form action="insertQnaBoard.do" method="post" enctype="multipart/form-data">
				<div class="form-group">
					<select id="menu-select" class="form-select" aria-label="musuemCategory" name="menuCategory">
					  <option selected>미술관을 선택해주세요.</option>
				  		<c:forEach var="menu" items="${menuList }">
					  		<option value="${menu.menuIdx }">${menu.menuName }</option>
						</c:forEach>					 
					</select>		
				</div>
				<div class="form-group">		
				<!-- 미술관 선택 후 달라지게 동적 -->
				<select id ="categoryList" class="form-select" aria-label="museumCategory" name="questionCategory">
				  <option  selected>문의 유형을 선택해주세요.</option>
					<!-- append 처리 -->				  
				</select>
				</div>
				<div class="form-group">
					<label for="phone">제목</label>
					<input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title" >
					<div class="valid-feedback">확인</div>
					<div class="invalid-feedback">해당하는 정보가 없습니다.</div>
				</div>
				<div class="form-group">
					<label for="contents">내용</label>
					<textarea class="form-control" name ="contents" placeholder="자세한 내용을 적어 주시면 정확한 상담이 가능합니다." maxlength="3000" style="height: 7.5rem"></textarea>
					<div class="valid-feedback">확인</div>
					<div class="invalid-feedback">해당하는 정보가 없습니다.</div>
				</div>				
				<div class="file-area">
					<ul class="file-list" style="padding:0;">
						<li class="" style="list-style: none; justify-content: left; align-content: center;">	
							<div class="filebox preview-image">
								  <input id="upload-name" value="파일선택" disabled="disabled" style="width:400px;">
								  <label class="btn btn-outline-dark" for="input-file" style="float:right">업로드</label>
							  	<div class="filebox">								  
								  	<input type="file" id="input-file" class="upload-hidden" name="uploadFile" accept="image/*"> 
							  	</div>
							</div>							 			
						</li>
					</ul>
					<ul class="file-notice" >
						<li> * 파일은 최대 1개, 최대 10MB까지 첨부 가능합니다.</li>
						<li> * 파일 종류 : 이미지 파일(jpg,png 등)</li>
					</ul>
				</div>
				<div style="text-align: right; padding-top: 20px;">
					<div style="display: inline-block;">				
			      		<button type="submit" id="login" class="btn btn-dark">문의 하기</button>
						<button type="button" class="btn btn-outline-dark" onclick="location.href='mp_faq.do'">취소</button> 	
					</div>
				</div>					
			</form>
		</div>
	</div>
</div>
<%@include file ="/common/footer.jspf" %>
</body>
</html>



