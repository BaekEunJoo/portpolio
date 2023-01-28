<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>상품문의</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.bt {
		width:120px;
		height:50px;
		margin-left:20px;
		border: 1px solid black;
		background-color: white;
	}
	.bt:hover {
		color:white;
		background-color: black;
	}
	#btn {
		color:white;
		background-color: black;
	}
	#btn:hover {
		border: 1px solid black;
		background-color: white;
		color:black;
	}
	.mpName {
		font-size:1.2em;
		font-weight: bold;
	}
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
	#mp_productFaq {color: black;}
</style>
</head>
<body>
<script>
function noAnswer() {
	alert("등록된 답변이 없습니다.");
}

</script>

	<!-- ------------------------------------------------------------------------------ -->
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<div class="row">
					<div class="body container-fluid mt-5">
						<h5 style="font-weight:bold;">상품문의</h5>
					    <div class="mt-0">
							<table class="rvtable" style="width: 100%; line-height:50px;">
								<colgroup>
									<col style="width: 20%;">
									<col style="width: 50%;">
									<col style="width: 20%;">
									<col style="width: 10%;">
								</colgroup>
								  <tr style="text-align: center; height: 50px; background: black; color: white;">
								    <th>상품정보</th>
								    <th>문의내용</th>
								    <th>답변상태</th>
								    <th></th>
								  </tr>
								  <c:choose>
								  	<c:when test="${empty productFaq }">
								  		<tr style="text-align: center; margin:100px;">
								  			<td colspan="4" style="padding:100px; font-size:1.2em;">문의 내역이 없습니다.</td>
								  		</tr>
								  	</c:when>
								  	<c:otherwise>
								  		<c:forEach var="productFaq" items="${productFaq }" varStatus="vs">
								  		
								  			<!-- 모달창 시작 -->
											<div class="modal notosanskr" id="faq${vs.index }">
											  <div class="modal-dialog">
											    <div class="modal-content">
											    <!-- Modal Header -->
											      <div class="modal-header" style="background-color:black; color:white;">
											        <h4 class="modal-title">상품문의</h4>
											      </div>
											      <div class="modal-body">
														<div class="form-group">
															<label for="question"><strong>문의</strong></label>
															<input style="border-radius:0;" value="${productFaq.question }" type="text" class="form-control" id="question" name="question" readonly="readonly">
														</div>
														<div class="form-group">
															<label for="answer"><strong>답변</strong></label>
															<input style="border-radius:0;" value="${productFaq.answer }" type="text" class="form-control" id="answer" name="answer" readonly="readonly">
														</div>
													<hr>
													<div style="text-align: center;">
														<button type="button" class="btn" style="background-color:black; color:white;" data-dismiss="modal">취소</button>					
													</div>
												  </div>
												 </div>
											  </div>
											</div>
											<!-- 모달창 끝 -->
											
											<tr style="text-align: center; border-bottom: 1px solid gray;" class="my-5">
												<th>${productFaq.productName }</th>
												<th>${productFaq.question }</th>
												<th>
													<c:choose>
														<c:when test="${productFaq.answer == null}">
															<b>답변대기</b>
														</c:when>
														<c:otherwise>
															<b>답변완료</b>
														</c:otherwise>
													</c:choose>
												</th>
												<th>
													<c:choose>
														<c:when test="${productFaq.answer == null }">
															<button onclick="noAnswer()" type="button" id="btn" class="bt mt-4">답변보기</button>
															<button onclick="location.href='deleteFaq.do?pqnaNum=${productFaq.pqnaNum }'" type="button" class="bt mt-2 mb-4">삭제</button>
														</c:when>
														<c:otherwise>
															<input type="hidden" value="${productFaq.pqnaNum }" name="pqnaNum">
															<button data-toggle="modal" data-target="#faq${vs.index }" type="button" id="btn" class="bt mt-4">답변보기</button>
															<button onclick="location.href='deleteFaq.do?pqnaNum=${productFaq.pqnaNum }'" type="button" class="bt mt-2 mb-4">삭제</button>
														</c:otherwise>
													</c:choose>
												</th>
											</tr>
								  		</c:forEach>
								  	</c:otherwise>
								  </c:choose>
							</table>
						</div>
					</div>
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
 <script>
	$(document).ready(function() {
		  $(".content").hide();
		  //content 클래스를 가진 div를 표시/숨김(토글)
		  $(".heading").click(function()
		  {
		    $(this).next(".content").slideToggle(500);
		    $("i", this).toggleClass("fa-chevron-down fa-chevron-up");
		  });
		});
</script>
</html>