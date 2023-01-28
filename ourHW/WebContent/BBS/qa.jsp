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
	$(function(){
				
		 $(document).on("click", ".pqitems", function () {
	
			$.ajax("BBSAjaxController", {
				
				//get타입으로 전달해 주는 것
				type : "get",
				data : "type=qa&qaPage="+$(this).attr('value'), //서버쪽으로 전달할 데이터
				//서버쪽으로 전달해 줄 데이터(파라미터) 여기에서는 전부 가져올 거라 안 적어 줘도 됨
				dataType : "json", //응답 받을 데이터 타입
				success : function(data){
					//여기에서 function의 파라미터 data는 위의 date랑 다른 것
					alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
					let rList = data.qa.list; //JSON 객체 속성명 "list"의 값 추출
					let pq = data.qa.pq;
									
					//전달받은 JSON 데이터 처리
					let htmlTag = "";
					$.each(rList, function(index, item){ // 아이템이 끝날 때까지
						htmlTag += "<tr>";	
						htmlTag += "<td>"+this.qnaNo+"</td>";	
						htmlTag += "<td><a href='${pageContext.request.contextPath }/BBSController?type=qnaView&qnaNo="+this.qnaNo+"'>"+this.title+"</td>";	
						htmlTag += "<td>"+this.userName+"</td>";
						htmlTag += "<td>"+this.wdate.substring(0, 10)+"</td>";	
						htmlTag += "<td>"+this.hit+"</td>";
						htmlTag += "</tr>";	
					});
					
					$("#productQnA").html(htmlTag);
						
					let pagingHtml = "";
	
					pagingHtml += '<p class="py-5"></p>';
					pagingHtml += '<div>';
					pagingHtml += '<ul id="QAPagingButton" class="pagination justify-content-center">';
					
					<%--[1페이지로]에 대한 사용여부 처리 --%>
					if (pq.beginPage == 1 ) {
						pagingHtml += '<li class="page-item disabled"><a class="pqitems page-link text-body">**</a></li>';
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pqitems page-link text-body" value="1">';
						pagingHtml += '**';
						pagingHtml += '</a>';
						pagingHtml += '</li>';
					}
					<%--[이전으로]에 대한 사용여부 처리 --%>
					if (pq.beginPage == 1) {
						pagingHtml += '<li class="page-item disabled"><a class="pqitems page-link text-body">pre</a></li>';	
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pqitems page-link text-body" value="'+(pq.beginPage-1)+'">';	
						pagingHtml += 'pre';
						pagingHtml += '</a>';
						pagingHtml += '</li>'						
					}
	
					<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
					for (let i = pq.beginPage; i <= pq.endPage ; i++ ) {
						
						if (i == pq.nowPage) {
							pagingHtml += '<li class="page-item disabled">';
							pagingHtml += '<a class="pqitems page-link text-body font-weight-bold">'+i+'</a></li>';
						} else {
							pagingHtml += '<li class="page-item">';
							pagingHtml += '<a class="pqitems page-link text-body" value="'+ i +'">'+i+'</a>';
							pagingHtml += '</li>';
						}
						
					}
					<%--[다음으로]에 대한 사용여부 처리 --%>
					if (pq.endPage >= pq.totalPage) {
						pagingHtml += '<li class="page-item disabled">';
						pagingHtml += '<a class="pqitems page-link text-body">nex</a></li>';
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pqitems page-link text-body" value="'+(pq.endPage+1)+'">';
						pagingHtml += 'nex';
						pagingHtml += '</a>';
						pagingHtml += '</li>';
					}		
					<%--[마지막으로]에 대한 사용여부 처리 --%>
					if (pq.endPage >= pq.totalPage) {
						pagingHtml += '<li class="page-item disabled">';
						pagingHtml += '<a class="pqitems page-link text-body">**</a></li>';							
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pqitems page-link text-body" value="'+pq.totalPage+'">';
						pagingHtml += '**';
						pagingHtml += '</a>';
						pagingHtml += '</li>';
					}
					pagingHtml += '</ul>';
					pagingHtml += '</div>';
					pagingHtml += '<p class="py-3"></p>';					    
				  	
					$("#pagingQnA").html(pagingHtml);
	
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
							+ "jqXHR : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
			});	
		
		});
		
	});

	
function write_qa() {
	
	if (${empty user}) {
		if(confirm("회원 전용 서비스입니다\n 로그인하시겠습니까?")){
			location.href="/ourHW/signup/login.jsp";
		} 
	} else {
		location.href='/ourHW/BBSController?type=qaWrite';
	}
}
	
</script>
</head>
<body>
<div class="container align-content-center">

	<%@ include file="/common/header.jsp" %>
	<p class="py-3"></p>
	
	<div class="text-center">
		<p class="py-3"></p>
		<h2 class="text-center">QNA</h2>
		<p class="py-3"></p>
	</div>
	
	<div id="bbsQA">
	 	<table class="table text-center">
	 	<caption class="d-none">상품Q&A</caption>
	 	<colgroup>
			<col style="width: 5%;">
			<col style="width: 40%;">
			<col style="width: 5%;">
			<col style="width: 10%;">
			<col style="width: 5%;">
	 	</colgroup>
	 	<thead class="thead-light">
	 		<tr>
	 			<th>번호</th>
	 			<th>제목</th>
	 			<th>작성자</th>
	 			<th>작성일</th>
	 			<th>조회</th>
	 		</tr>
	 	</thead>
	 	<tbody id="productQnA">
	 	<c:if test="${empty qaList }">
		 	<tr>
	 			<td colspan="5">게시물이 없습니다</td>
	 		</tr>
	 	</c:if>
 		<c:forEach var="qaVO" items="${qaList }">
			<tr>
 			<td>${qaVO.qnaNo }</td>
 			<td><a href="${pageContext.request.contextPath }/BBSController?type=qnaView&qnaNo=${qaVO.qnaNo }">${qaVO.title }</a></td>
 			<td>${qaVO.userName }</td>
 			<td>${qaVO.wdate.substring(0, 10) }</td>
 			<td>${qaVO.hit}</td>
 		</tr>
		</c:forEach>
	 	</tbody>
	 </table>
	<div class="text-right">
		<input type="button" class="btn btn-outline-light text-dark" onclick="write_qa()" value="글쓰기">
	</div>
		<c:if test="${not empty qaList }">
			<div id="pagingQnA">
				<%@ include file="/include/pagingQA.jspf" %>
			</div>
	 	</c:if>
	</div>

</div>

<footer>
<%@ include file="/common/footer.jspf" %>
</footer>
</body>
</html>