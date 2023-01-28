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
<title>Option List</title>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
<script>
	function deleteOption() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
		location.href="deleteOption.do?optionnum="+checkval;
	}
	
	function updateOption() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
		var cntvalue = $("#cnt").val();
		console.log(cntvalue);
		var optionname = $("#optionname").val();
		
		location.href="updateOption.do?optionnum="+checkval+"&cnt="+cntvalue+"&optionname="+optionname;
	}
</script>
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
			<h2>Option List Form</h2>
			<c:forEach var="option" items="${option }">
				<div class="mb-3">
					<label for="reg_id">옵션</label>
					 <input type="text" 
						class="form-control" name="optionname" id="optionname" value="${option.optionname }">
					<label for="reg_id" style="margin-top: 10px;">수량</label> 
					<input type="number"
						class="form-control" name="cnt" id="cnt" value="${option.cnt }">
				</div>
				<input type="checkbox"
						class="form-control" name="optionnum" id="checkbox"
						value="${option.optionnum }" style="float: left; width: 30px;">
				<br><br><hr>
			</c:forEach>
			<a type="button" class="btn btn-sm btn-primary" id="btnDelete" onclick="deleteOption()"
			style="background-color: gray; border-color: gray; color: white;">삭제</a>
			<a type="button" class="btn btn-sm btn-primary" id="btnModify" onclick="updateOption()"
			style="background-color: gray; border-color: gray; color: white;">수정</a>
			<a type="button" class="btn btn-sm btn-primary" id="btnList" 
			style="background-color: gray; border-color: gray; color: white;" href="productAdmin.do">돌아가기</a>
		</div>
		
	</article>
	<%@include file="/common/footer.jspf" %>
</body>
</html>