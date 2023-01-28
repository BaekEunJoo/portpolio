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

.col-2 li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

.col-2 li a span {
	text-decoration: none;
	color: black;
	font-size: 18px;
	margin-left: 10px;
}

.bi-people-fill{
	color: black;
}

.amName {
	font-size: 1.2em;
	font-weight: bold;
}

.col-2 ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
	font-weight: normal;
}

.col-2 ul li a:hover {
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

input[type=date] { 
	border-radius: 0;
	border: 1px solid silver;
	width: 210px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}


.rvtable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

#am_qr { color: black; font-weight: bold; }


.line_limit {
      width:250px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
      display:inline-block;
      vertical-align: middle;
  }
  
 input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}

</style>
<script>
	function deleteReview() {
		var checkval = $("input:checkbox[id='checkbox']:checked").val()
		console.log(checkval);
				if(confirm("삭제하시겠습니까?")){
					location.href="deleteReview.do?prnum="+checkval;
				} else{
					return;
				}
	};
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
<%@ include file="/common/main.jspf" %>
<div class="container-fulid notosanskr" style="margin-bottom: 50px;"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				
				<div class="col-10">
				<span style="font-size: 1.3em; font-weight: bold;">문의/후기</span>
				
				<div style="float: right;">
				<button type="button" class="btn btn-sm btn-dark" onclick="deleteReview()">리뷰삭제</button>
				</div>
				<br><br>
				
				<div>
					<table border style="width: 100%; height:50px; text-align: center; cursor: pointer;">
						<tr style="font-size: 1.2em;">
							<td onclick="location.href='productQna.do'">
							상품문의
							</td>
							<td onclick="location.href='productRev.do'"
								style="background-color: black; color: white;">
							상품후기
							</td>
						</tr>
					</table>
				</div>
				
				<hr style="border: 0; height: 2px; background: black;">
				
				<!-- <div style="font-size: 0.9em;">
				<p>총리뷰수 <span>n</span> 개</p>
				</div> -->
				
				<table class="rvtable" style="width: 100%;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>선택</th>
						<th>리뷰번호</th>
						<th>ID</th>
						<th>상품번호</th>
						<th>내용</th>
						<th>평점</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${review }" var="review">
						<tr style="text-align: center;">
							<td><input type="checkbox" value="${review.prnum }"
											id="checkbox" name="prnum"></td>
							<td>${review.prnum }</td>
							<td>${review.id }</td>
							<td><b class="line_limit">${review.productnum }</b></td>
							<td><span class="line_limit">${review.content }</span></td>
							<td><b>${review.star }</b></td>
							<td>${review.regdate }</td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<%@ include file="/common/footer.jspf"%>
</html>