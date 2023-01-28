<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%@include file="/common/style.jspf"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Product Insert</title>
<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});
	$(document)
			.on(
		'click',
		'#btnList',
		function(e) {
			e.preventDefault();
			location.href = "productAdmin.do";
	});
</script>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
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
<%@include file="/common/main.jspf"%>
	<article>
		<div class="container" role="main" style="margin-bottom: 20px; margin-top: 20px;">
			<h2>Product Insert Form</h2>
			<form name="form" id="form" role="form" method="post" enctype="multipart/form-data"
				action="insertProduct.do">
				<div class="mb-3">
					<label for="title">상품명</label> <input type="text"
						class="form-control" name="productname" id="title"
						placeholder="상품명을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">카테고리</label> 
						<select name="category">
						    <option value="EXHIBITION GOODS">EXHIBITION GOODS</option>
						    <option value="EDITIONS">EDITIONS</option>
						</select>
				</div>
				<div class="mb-3">
					<label for="reg_id">상품사진1</label> <input type="file"
						class="form-control" name="uploadFile1" id="reg_id" multiple>
				</div>
				<div class="mb-3">
					<label for="reg_id">상품사진2</label> <input type="file"
						class="form-control" name="uploadFile2" id="reg_id" multiple>
				</div>
				<div class="mb-3">
					<label for="reg_id">상품사진3</label> <input type="file"
						class="form-control" name="uploadFile3" id="reg_id" multiple>
				</div>
				<div class="mb-3">
					<label for="reg_id">상품사진4</label> <input type="file"
						class="form-control" name="uploadFile4" id="reg_id" multiple>
				</div>
				<div class="mb-3">
					<label for="reg_id">가격</label> <input type="number"
						class="form-control" name="price" id="reg_id"
						placeholder="가격을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">할인율</label> <input type="number"
						class="form-control" name="discount" id="reg_id" max="100" min="0" placeholder="할인율을 입력해 주세요">
				</div>
				<div class="mb-3">
					<label for="reg_id">상품소개</label> <input type="file"
						class="form-control" name="uploadFile5" id="reg_id" multiple>
				</div>
				<button class="btn btn-sm btn-primary" id="btnSave" style="background-color: gray; border-color: gray;">저장</button>
				<button class="btn btn-sm btn-primary" id="btnList" style="background-color: gray; border-color: gray;">목록</button>
			</form>
		</div>
	</article>
	<%@include file="/common/footer.jspf" %>
</body>
</html>