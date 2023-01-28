<%@page import="com.mystudy.project.vo.QAVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script>
function modify_go(qnaNo) {
	
	if ("${user.userId}" != "${qa.userId}") {
		alert("본인이 작성한 게시글만 수정 가능합니다");
		return false;
	} else {
		location.href="BBSController?type=updateQA&qnaNo="+qnaNo;	
	}
}

function delete_go(qnaNo) {
	
	if ("${user.userId}" != "${qa.userId}") {
		alert("본인이 작성한 게시글만 삭제 가능합니다");
		return false;
	} else {
		if(confirm("정말로 삭제하시겠습니까?")) {
			if (prompt("삭제를 위해 비밀번호를 입력해 주세요") == "${user.pwd}") {
				location.href="BBSController?type=deleteQA&qnaNo="+qnaNo;
			} else {
				alert("비밀번호가 틀렸습니다\n확인 후 다시 시도해 주세요");
				return false;
			}
		} else {
			return false;
		}		
	}
	
}

</script>
</head>
<body>
<div class="container align-content-center">

	<%@ include file="/common/header.jsp" %>
	<p class="py-3"></p>
	<div id="bbsQA" class="container">
	<div></div>
</div>

<footer>
<%@ include file="/common/footer.jspf" %>
</footer>
</body>
</html>