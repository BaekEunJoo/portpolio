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
function update_review(frm) {
	if (${empty user}) {
		if(confirm("회원 전용 서비스입니다\n 로그인하시겠습니까?")){
			location.href="/ourHW/signup/login.jsp";
		} else {
			return false;
		}
	} else {
		
		if (frm.title.value.trim() == "" || frm.title.value.trim() == "") {
			alert("제목과 내용은 한 글자 이상 입력해 주셔야 합니다"); 
		} else {
			frm.submit();
		}
	}
}

</script>
</head>
<body>
<div class="container align-content-center">
	<%@ include file="/common/header.jsp" %>
	<p class="py-3"></p>
	<div id="bbsReview" class="container">
		<form action="BBSController">
			<table class="table table-striped text-center mx-auto border-0 w-100 p-3">
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 10%;">
					<col style="width: 20%;">
					<col style="width: 15%;">
					<col style="width: 20%;">
		 		</colgroup>
				<thead>
					<tr>
						<th colspan="6"><strong>게시글 수정<strong></th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="5" class="text-left"><input type="text" name="title" value="${review.title }" size="80" class="border-0 bg-transparent text-left"></td>
					</tr>
					<tr>
						<th>글번호</th>
						<td><input type="text" name="reviewNo" value="${review.reviewNo }" class="border-0 bg-transparent" readonly></td>
						<th>작성자</th>
						<td class="text-left"><input type="text" name="userName" value="${review.userName }" class="border-0 bg-transparent" readonly></td>
						<th>작성일자</th>
						<td><input type="text" name="wdate" value="${review.wdate.substring(0, 10) }" class="border-0 bg-transparent" readonly></td>
					</tr>
					<tr>
						<th>제품번호</th>
						<td colspan="5" class="text-left"><input type="text" name="productNo" value="${review.productNo }" class="border-0 bg-transparent"></td>
					</tr>
					<tr>
						<td colspan="6">
							<textarea name="content" rows="10"  style="width:100%;" class="border-0 bg-transparent">
							${review.content }
							</textarea>
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5" class="text-left"><input type="file" name="filename"></td>
					</tr>
				</tbody>
			</table>
			<div class="text-center">
				<input type="hidden" name="type" value="updateReview">
				<input type="hidden" name="userId" value=${review.userId }>
				<input type="button" onclick="update_review(this.form)" value="수정" class="btn btn-outline-dark">
				<input type="button" onclick="history.back()" value="수정취소" class="btn btn-outline-dark">
			</div>
		</form>
	</div>
</div>

<footer>
<%@ include file="/common/footer.jspf" %>
</footer>
</body>
</html>