<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf"%>
<style>
li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

li a span {
	text-decoration: none;
	color: black;
	font-size: 18px;
	margin-left: 10px;
}

.bi-people-fill {
	color: black;
}

.amName {
	font-size: 1.2em;
	font-weight: bold;
}

ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
	font-weight: normal;
}

ul li a:hover {
	color: black;
	font-weight: bold;
}

.btn {
	border-radius: 0;
}

input[type=date] {
	border-radius: 0;
	border: 1px solid silver;
	width: 220px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}

.extable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

.extable img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}

#am_pdt {
	color: black;
	font-weight: bold;
}
</style>
<script>
	function deleteProduct() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
		location.href="deleteProduct.do?productnum="+checkval;
	};
	function updateProduct() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
		location.href="updateProductgo.do?productnum="+checkval;
	};
	function insertOption() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
		location.href="insertOptiongo.do?productnum="+checkval;
	};
	
	function optionList() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
		location.href="optionList.do?productnum="+checkval;
	};
	
	function insertProduct() {
		location.href="insertProduct.jsp";
	};
	
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsById("checkbox");
		  
		 checkboxes.forEach((cb)=>{
		    cb.checked = false;
		  });
		  
		  element.checked = true;
		};
</script>
</head>
<body>
	<c:choose>
		<c:when test="${empty member }">
			<%@include file="/common/guestMenu.jspf"%>
		</c:when>
		<c:when test="${not empty member }">
			<c:if test="${member.admin eq 'ADMIN' }">
				<%@include file="/common/adminMenu.jspf"%>
			</c:if>
			<c:if test="${member.admin eq 'NORMAL' }">
				<%@include file="/common/MemberMenu.jspf"%>
			</c:if>
		</c:when>
	</c:choose>
	<%@ include file="/common/main.jspf"%>
	<div class="container-fulid notosanskr">
		<div class="row" style="padding: 0; margin: 0;">
			<div class="col-8 offset-2">
				<div class="row" style="padding-top: 50px;">
					<%@ include file="/common/adminNav.jspf"%>
					<div class="col-10">
						<span style="font-size: 1.3em; font-weight: bold;">상품관리</span>

						<div style="float: right;">
							<button type="button" class="btn btn-sm btn-dark" onclick="insertOption()">옵션추가</button>
							<button type="button" class="btn btn-sm btn-dark" onclick="optionList()">옵션목록</button>
							<button type="button" class="btn btn-sm btn-dark" onclick="insertProduct()">상품등록</button>
							<button type="button" class="btn btn-sm btn-dark" onclick="updateProduct()">상품수정</button>
							<button type="button" class="btn btn-sm btn-dark" onclick="deleteProduct()">상품삭제</button>
						</div>
						<form action="insertOption.do">
						<hr style="border: 0; height: 2px; background: black;">
						<table class="extable" style="width: 100%;">
							<tr
								style="text-align: center; height: 50px; background: black; color: white;">
								<th width="40px;">선택</th>
								<th width="70px;">상품번호</th>
								<th>이미지</th>
								<th>카테고리</th>
								<th>상품명</th>
								<th width="130px;">상품가격</th>
							</tr>
							<c:forEach var="list" items="${productList }">
								<tr style="text-align: center;">
									<td><input type="checkbox" value="${list.productnum }" id="checkbox" name="productnum" onclick='checkOnlyOne(this)'></td>
									<td>${list.productnum }</td>
									<td><img
										src="${pageContext.request.contextPath}/imgs/${list.photo1 }"
										alt="${list.productname }"></td>
									<td>${list.category }</td>
									<td><a href="getProduct.do?productnum=${list.productnum }" style="color: black; text-decoration: none;">
											<b>${list.productname }</b>
									</a></td>
									<td><b>${list.price }</b></td>
								</tr>
							</c:forEach>
						</table>
<!-- 									<td><input type="text" name="optionname"></td>
									<td><input type="number" name="cnt"></td>
									<td><b><button type="submit" class="btn btn-sm btn-dark">Add</button></b></td> -->
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="/common/footer.jspf"%>
</html>