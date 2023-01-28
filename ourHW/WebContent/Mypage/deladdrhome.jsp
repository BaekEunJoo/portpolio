<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 주소록 관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>
	function insertAddr(){
		location.href="controller?type=insertAddr";
	}
	
	function deleteAddr(delNo){
		if (confirm("정말 삭제하시겠습니까?") == true){
		location.href="controller?type=deleteAddr&delNo=" + delNo;
		}
	}
	
	function representAddr(delNo){
		location.href="controller?type=representAddr&delNo=" + delNo;
	}
	
	function editAddr(delNo){
		location.href="controller?type=goeditAddr&delNo=" + delNo;
	}
</script>

</head>

<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="w3-container w3-center">
<br>
<h5><strong>배송 주소록 관리</strong></h5>
<table class="w3-table w3-bordered">
	<tr>
		<th>주소록 고정</th>
		<th>배송지명</th>
		<th>수령인</th>
		<th>휴대전화</th>
		<th>주소</th>
		<th>수정</th>
		<th>삭제</th>
		
<c:if test="${empty addrlist}">
	<tr>
		<td colspan="6">등록된 주소가 없습니다</td>
	</tr>
</c:if>	

<c:if test="${addrlist ne null}">
<c:forEach items="${addrlist}" var="list">
	<tr>
		
		<td><input type="button" class="w3-btn w3-black" value="고정" onclick= "representAddr(${list.delNo})"></td> <!-- update from USER -->
		<td><c:out value="${list.delName}" /></td>
		<td><c:out value="${list.delGetter}" /></td>
		<td><c:out value="${list.delPhone}" /></td>
		<td><c:out value="${list.delAddr}" /></td>
		<td><input type="button" class="w3-btn w3-gray" value="수정" onclick= "editAddr(${list.delNo})"></td> <!--  update from DELADDR -->
		<td><input type="button" class="w3-btn w3-gray" value="삭제" onclick= "deleteAddr(${list.delNo})"></td>
	</tr>
</c:forEach>
</c:if>		
	
</table>
<br>
<input type="button" class="w3-btn w3-black" value="배송지등록" onclick= "insertAddr()">
</div>

<hr>
<h5><strong>배송주소록 유의사항</strong></h5>
<hr>
<p>1. 배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</p>
<p>2. 자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</p>
<p>3. 기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</p>

	<footer>
		<%@ include file="/common/footer.jspf" %>
	</footer>
	
</body>
</html>