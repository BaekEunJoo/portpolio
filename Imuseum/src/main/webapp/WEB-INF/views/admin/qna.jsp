<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

.page-item > a {
	color : black;
	border : none;
}
.page-item > li > a:hover { 
	color : black; 
	list-style : none; 
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

#am_qa { color: black; font-weight: bold; }


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
.hide {
	display:none;
}  

.show changesplay:table-row;
}  
</style>
<script>
$(function(){
    $("#rvtable").click(function () {
        // 현재 클릭된 Row(<tr>)
        var checkbox = $(this).find('td:first-child :checkbox');
        
        checkbox.attr('checked', !checkbox.is(':checked'));
    });

	//체크 박스 클릭 시 이미지 불러오기	
	$('input:checkbox[name=qnaBoard]').on('change',function(){
		var myArticle = $(this).parents().next("tr");
		var open = (".rvtable.show");
        var article = (".rvtable .show");  
        if($(myArticle).hasClass('hide')) {  
	           $(article).removeClass('show').addClass('hide');  
	           $(myArticle).removeClass('hide').addClass('show');  
           }  
           else {  
               $(myArticle).addClass('hide').removeClass('show');  
           }  
	    var qnaIdx = $("input:checkbox[name=qnaBoard]:checked").attr('id');
	    var fileIdx = $("input:checkbox[name=qnaBoard]:checked").val();
        
		if($(this).prop('checked')){
		     $("input:checkbox[name='qnaBoard']").prop('checked',false);			     
		     $(this).prop('checked',true);
			    $.ajax("getFileVO.do",{
			    	type:"get",
			    	data:{fileIdx:fileIdx},
			    	dataType:"text",
			    	contentType:"application/x-www-form-urlencoded; charset=UTF-8",
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
			} 			
		});
	$("#callModal").on('click',function(){
		var checkval = $("input:checkbox[name=qnaBoard]:checked").val();
		if(checkval == "" || checkval == null){
			alert("답변하실 문의글을 선택해주세요.");
		} else{
			$("#replyQna").modal('toggle');
		}
	});
	
	$("#replyForm").on('submit',function(){
		var qnaIdx = $("input:checkbox[name=qnaBoard]:checked").attr('id');
		console.log(qnaIdx);
		$("#qnaIdx").val(qnaIdx);
	});
	
	});
	
	function deleteQna() {
		var qnaIdx = $("input:checkbox[name=qnaBoard]:checked").attr('id');
		console.log(qnaIdx);
				if(confirm("삭제하시겠습니까?")){
					location.href="deleteQnaBoard.do?qnaIdx="+qnaIdx;
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
<div class="modal" id="replyQna">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">1:1 문의 답변</h4>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
		<form id="replyForm" action="insertReplyQna.do" method="post">
			<div class="form-group">
				<label for="contents">작성 내용</label>
				<textarea class="form-control" id="content" placeholder="작성 내용을 입력해주세요." name="content" style="height:200px"></textarea>
				<input id="qnaIdx" type="hidden" name="qnaIdx">
			</div>			
			<div style="text-align: center;">
				<div style="display: inline-block;">				
		      		<button type="submit" id="insertReply" class="btn btn-dark">1:1 문의 작성</button>
					<button type="button" id="cancle" class="btn btn-outline-dark" data-dismiss="modal">취소</button> 	
				</div>
			</div>					
		</form>
      </div>		
    </div>
  </div>
</div>
<div class="container-fulid notosanskr" style="margin-bottom: 50px;"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10">
				<span style="font-size: 1.3em; font-weight: bold;">1:1 문의</span>
				<div style="float: right;">
				<button id="callModal" type="button" class="btn btn-sm btn-dark" >문의답변</button>
				<button type="button" class="btn btn-sm btn-dark" onclick="deleteQna()">문의삭제</button>
				</div>
				<br><br>
				<div>
					<table id="qnaList" border style="width: 100%; height:50px; text-align: center; cursor: pointer;">
						<tr style="font-size: 1.2em;">
							<td onclick="location.href = 'qnaAdmin.do'"
									style="background-color: black; color: white;">
								답변대기
							</td>
							<td onclick="location.href = 'qnaAdminComplete.do'">
								답변완료
							</td>
						</tr>
					</table>
				</div>				
				<hr style="border: 0; height: 2px; background: black;">
					<table class="rvtable" style="width: 100%; table-layout: fixed;">
						<tr style="text-align: center; height: 50px; background: black; color: white;">
							<th>선택</th>
							<th>미술관</th>
							<th>문의유형</th>
							<th>ID</th>
							<th>제목</th>
							<th>작성일</th>
						</tr> 							
							<c:forEach var="qnaBoard" items="${qnaBoardList }">
								<tr style="text-align: center;">
									<td><input id="${qnaBoard.qnaIdx }" type="checkbox" name="qnaBoard" value="${qnaBoard.fileIdx }"></td>
									<td>${qnaBoard.menuName }</td>
									<td>${qnaBoard.cateName }</td>
									<c:if test="${fn:length(qnaBoard.id) > 10 }">
										<td>${fn:substring(qnaBoard.id,0,10) }</td>
									</c:if>
									<c:if test="${fn:length(qnaBoard.id) <= 10 }">
										<td>${qnaBoard.id }</td>
									</c:if>									
									<td>${qnaBoard.title }</td>
									<td>${qnaBoard.regDate }</td>								
								</tr>
								<tr class="hide">	
									<td style="text-align: center;">
										<img src="" style="max-width: 480px; max-height: 240px">
										<span></span>
									</td>
									<td colspan="5" style= "padding-top:20px; padding-bottom:20px;text-align: left; height:300px">
										<p style="text-align: center;">${qnaBoard.contents }</p>
									</td>
								</tr>								
							</c:forEach>
					</table>
					<!-- 페이징 처리 시작 -->
					<nav aria-label="Page navigation example" class="mt-5">
					  <ul class="pagination justify-content-center">
					  	<c:if test="${pvo.beginPage != 1 }">
						    <li class="page-item">
						    	<a href="qnaAdmin.do?cPage=${pvo.beginPage - 1 }"class="page-link"><<</a>
						    </li>		
						</c:if>    				  			
					  	<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
							<c:if test="${pageNo == pvo.nowPage }">
							    <li class="page-item">
							    	<a class="page-link" style="background:black; color:white;">${pageNo}</a>
						    	</li>
							</c:if>						  	
						    <c:if test="${pageNo != pvo.nowPage }">
						   		<li class="page-item"><a class="page-link" href="qnaAdmin.do?cPage=${pageNo }">${pageNo }</a></li>
						    </c:if>
						    <c:if test="">
							    <li class="page-item">
							    	<a class="page-link" href="qnaAdmin.do?cPage=${pvo.endPage }">${pvo.endPage }</a>
						    	</li>
					    	</c:if>
					    </c:forEach>
						    <c:if test="${pvo.endPage < pvo.totalPage }">						    
								<li class="page-item">
									<a class="page-link" href="qnaAdmin.do?cPage=${pvo.endPage +1 }">>></a>
								</li>
						    </c:if>
					  </ul>
					</nav>
					<!-- 페이징 처리 끝 -->					
				</div>
			</div>
		</div>
	</div>
</div>

</body>

<%@ include file="/common/footer.jspf"%>
</html>