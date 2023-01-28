<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>나의문의</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.bt {
		width:120px;
		height:50px;
		background-color: black;
		color:white;
	}
	.bt:hover {
		background-color:white;
		color:black;
		border : 1px solid black; 
	}
	.page-item > a {
		color : black;
		border : none;
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
	#mp_faq {color: black;}
	
	tbody >.hide{
		display:none;
	}
</style>
<script>
	$(function(){
		$('tbody').find('a').on('click',function(){
			var qnaIdx = $(this).attr('id');
			var myArticle = $(this).parents().next("tr");	
			var open = (".table .show");
		    var article = (".table .show");  
		    var jsonTarget = $(this).parents().next("tr").next("tr");
		    
		    if($(myArticle).hasClass('hide')) {  
		           $(article).removeClass('show').addClass('hide');  
		           $(jsonTarget).removeClass('hide').addClass('show');  
		           $(myArticle).removeClass('hide').addClass('show');  
		       } 
		       else {  
		           $(myArticle).addClass('hide').removeClass('show');  
		           $(jsonTarget).addClass('hide').removeClass('show');  
		       }
		    $.ajax("getFileVO.do",{
		    	type:"get",
		    	data:{fileIdx:qnaIdx},
		    	dataType:"text",
		    	success: function(fileName){
		    		if(fileName != 'false'){
			    		var imgPath = '/Imuseum/common/img/'+ fileName;
			    		console.log(imgPath);
			    		$(myArticle).find('img').attr('src',imgPath);
		    		} else{
		    			$(myArticle).find('span').text('이미지 파일 없음.')
		    		}
		    	},
				error: function(){
					alert("오류가 발생하였습니다.");
				}
		    });
		     $.ajax('getAnswerVO.do',{
			    	type:"post",
			    	data:{qnaIdx:qnaIdx},
			    	dataType:"text", 
			    	success: function(obj){
			    		console.log(obj);
			    		var htmlTag ="<td style='text-align:center; border-bottom: 1px solid black;' ><b>관리자 답변 :</b> </td>";
			    		htmlTag += "<td colspan = '2' style='text-align:left; border-bottom: 1px solid black;'>"
			    		htmlTag += obj + "</td>"
			    		$(jsonTarget).html(htmlTag);
			    	},
			    	
			    	error:function(request,status,error){
			            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			           }
			     });
		});
	});
</script>
</head>
<body>
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
				<%@include file ="/common/mypageNav.jspf" %>
			</div>
			<!-- 컨텐츠 -->
			<div class="col-8" style="padding-top: 22px;">
				<div class="row">
					<div class="body container-fluid mt-5">
						<h5 style="font-weight:bold;">나의문의</h5>
						<div class="mt-0">
						    <!-- 제목 -->
							<table class="table text-center" style="table-layout: fixed;">
								<colgroup>
									<col style="width: 20%;">
									<col style="width: 50%;">
									<col style="width: 30%;">
								</colgroup>
								<thead style="border-top:2px solid black; background-color: black; color:white;">
								  <tr>
								    <th>미술관</th>
								    <th>제목</th>
								    <th>답변상태</th>
								  </tr>
								</thead>
								<tbody>
								<c:forEach var="qnaBoard" items="${qnaBoardList }">
									<c:choose>
										<c:when test="${qnaBoard.statusValue eq '답변 완료' }">
											  <tr>
											    <td class="align-middle">${qnaBoard.menuName }</td>
											    <td class="align-middle">
												    <a id="${qnaBoard.qnaIdx }"style="cursor: pointer;">[${qnaBoard.cateName }]${qnaBoard.title }
												    <br>작성일:${qnaBoard.regDate }
												    </a>
											    </td>
												<th class="align-middle"><b>${qnaBoard.statusValue }</b></th>
											  </tr>
											  <tr class="hide">	
												<td style="text-align: center;">
													<img src="" style="max-width: -webkit-fill-available; max-height: 240px">
													<span></span>
												</td>
												<td colspan="2">
													<p style="text-align: left; padding-top:15px;">${qnaBoard.contents }</p>
												</td>
											  </tr>
					  						  <tr class="hide">
											  </tr>
										</c:when>										
										<c:when test="${qnaBoard.statusValue ne '답변 완료' }">
											  <tr>								  
											    <td class="align-middle">${qnaBoard.menuName }</td>
											    <td class="align-middle">[${qnaBoard.cateName }]${qnaBoard.title }<br>작성일:${qnaBoard.regDate }</td>
												<th class="align-middle">${qnaBoard.statusValue }</th>
											  </tr>										
										</c:when>
									</c:choose>
								</c:forEach>  
								</tbody>
							</table>
						</div>
						<!-- 페이징 처리 시작 -->
						<nav aria-label="Page navigation example" class="mt-5">
						  <ul class="pagination justify-content-center">
						  	<c:if test="${pvo.beginPage != 1 }">
							    <li class="page-item">
							    	<a href="mp_faq.do?cPage=${pvo.beginPage - 1 }"class="page-link"><<</a>
							    </li>		
							</c:if>    				  			
						  	<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
								<c:if test="${pageNo == pvo.nowPage }">
								    <li class="page-item">
								    	<a class="page-link" href="#" style="background:black; color:white;">${pageNo}</a>
							    	</li>
								</c:if>						  	
							    <c:if test="${pageNo != pvo.nowPage }">
							   		<li class="page-item"><a class="page-link" href="mp_faq.do?cPage=${pageNo }">${pageNo }</a></li>
							    </c:if>
							    <c:if test="">
								    <li class="page-item">
								    	<a class="page-link" href="mp_faq.do?cPage=${pvo.endPage }">${pvo.endPage }</a>
							    	</li>
						    	</c:if>
						    </c:forEach>
							    <c:if test="${pvo.endPage < pvo.totalPage }">						    
									<li class="page-item">
										<a class="page-link" href="mp_faq.do?cPage=${pvo.endPage +1 }">>></a>
									</li>
							    </c:if>
						  </ul>
						</nav>
						<!-- 페이징 처리 끝 -->
						
						<div style="margin:0; padding:0;">
							<div class="container-fluid mt-5">
								<div class="bg-light py-5 d-flex justify-content-center">
							    	<div>
										FAQ를 이용하시면 궁금증을 더 빠르게 해결하실 수 있습니다.
										<br>원하는 답변을 얻지 못하셨나요?
										<br>문의하기를 이용해 보세요.
										<br><b>상품 관련 문의는 상품 문의를 통해 문의해주세요.</b>
									</div>
							    	<div style="margin-left:100px;">
										<button type="button" class="bt m-3" onclick="location.href='moveToQna.do'">문의하기</button>
									</div>
								</div>
							</div>
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
	//if로 상품선택 안되어있을때, 선택되어있을때 뜨는 모달창 다름
	$('#btn').click(function(e){
		e.preventDefault();
		$('#modal').modal("show");
	});
	
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