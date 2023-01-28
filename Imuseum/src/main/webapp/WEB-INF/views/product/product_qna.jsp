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

.bi-people-fill{
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
<%@ include file="/common/main.jspf" %>
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				
				<div class="col-10">
				<span style="font-size: 1.3em; font-weight: bold;">문의/후기</span>
				
				<div style="float: right;">
				<button type="button" class="btn btn-sm btn-dark">문의답변</button>
				<button type="button" class="btn btn-sm btn-dark">문의수정</button>
				<button type="button" class="btn btn-sm btn-dark">문의삭제</button>
				</div>
				<br><br>
				
				<div>
					<table border style="width: 100%; height:50px; text-align: center; cursor: pointer;">
						<tr style="font-size: 1.2em;">
							<td onclick="location.href='product_qna.jsp'"
								style="background-color: black; color: white;">
							상품문의
							</td>
							<td onclick="location.href='product_rev.jsp'">
							상품후기
							</td>
						</tr>
					</table>
				</div>
				
				<hr style="border: 0; height: 2px; background: black;">
				
				
				<table class="rvtable" style="width: 100%;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>선택</th>
						<th>문의번호</th>
						<th>ID</th>
						<th>상품명</th>
						<th>내용</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
					<tr style="text-align: center;">
						<td><input type="checkbox"></td>
						<td>2</td>
						<td>itwill01</td>
						<td><b class="line_limit">[LIMITED] 2023 다이어리 3종</b></td>
						<td><span class="line_limit">배송 언제 되나요?</span></td>
						<td>2022.11.23</td>
						<td>답변대기</td>
					</tr>
					<tr style="text-align: center;">
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>test01</td>
						<td><b class="line_limit">[어쨌든, 사랑] 버블건</b></td>
						<td><span class="line_limit">버블 얼마나 나가는 지 궁금해요</span></td>
						<td>2022.11.23</td>
						<td>답변완료</td>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>

</body>

<%@ include file="/common/footer.jspf"%>
</html>