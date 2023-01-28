<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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

#am_excenter { color: black; font-weight: bold; }

.extable a {text-decoration: none; color: black;}

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
<div class="container-fulid notosanskr" style="margin-bottom: 100px;"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
			<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10">
				<span style="font-size: 1.3em; font-weight: bold;">작가관리</span>
				
				<div style="float: right;">
				<button type="button" class="btn btn-sm btn-dark" onclick="location.href='artistInsert.do?exhNum=${vo.exhNum }'">
					작가등록
				</button>
				<button type="button" class="btn btn-sm btn-dark" id="update">작가수정</button>
				<button type="button" class="btn btn-sm btn-dark" id="delete">작가삭제</button>
				<!-- <button type="button" class="btn btn-sm btn-dark">전시삭제</button> -->
				</div>
				
				<hr style="border: 0; height: 2px; background: black;">
				<p><b style="font-size: 2em;">${vo.exhName }</b></p>
				<hr>
				<c:if test="${empty list }">
					<p style="text-align: center; font-size: 1.3em; padding: 100px 0; color: gray;">해당 전시에 등록된 작가가 없습니다.</p>
					<hr>
				</c:if>
				<c:if test="${not empty list }">
					<div class="row px-auto">
					<c:forEach var="artist" items="${list }" varStatus="status">
					<div class="card col-lg-2 col-md-4 mt-4 ml-4" style="padding-bottom: 10px;">
							<div class="card-top" style="margin: 0; padding: 10px 0; text-align: left;">
							<input type="checkbox" value="${artist.artistNum }" name="checkList" onclick='checkOnlyOne(this)'>
							</div>
							<!-- Modal -->
							<div class="modal fade notosanskr" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog" role="document">
							    <div class="modal-content" style="padding: 30px;">
							      <div class=" text-center">
							        <p>정말 삭제하겠습니까?</p>
							        <form action="artistDelete.do" method="get">
							        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal" style="width: 100px;">취소</button>
							        <input type="submit" class="btn btn-dark" id="btn" value="삭제" style="width: 100px;">
							        <input type="hidden" id="deleteNum" name="artistNum" value="${artist.artistNum }">
							        </form>
							        <br>
							        </div>
							    </div>
							  </div>
							</div>
						<img src="${pageContext.request.contextPath}/artistImg/${artist.artistImage }" class="card-img-top" alt="...">
							<div class="card-body" style="margin: 0; padding: 0; text-align: center;">
								<p class="card-title"><b>${artist.artist }</b></p>
								<p class="btn btn-sm btn-dark" data-toggle="modal" data-target="#exampleModal${status.index }">자세히보기</p>
							</div>
							<!-- Modal -->
							<div class="modal fade notosanskr" id="exampleModal${status.index }" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
							  <div class="modal-dialog modal-xl modal-dialog-centered">
							    <div class="modal-content">
							      <div class="modal-header" style="background-color: black;">
							        <h5 class="modal-title" id="exampleModalLabel" style="color: white;">작가소개</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
							          <span aria-hidden="true" style="color: white;">&times;</span>
							        </button>
							      </div>
							      <div class="modal-body" style="font-size: 0.9em; font-weight: normal; text-align: left;">
							      	<p style="font-size: 2em; margin-left: 20px;"><b>${artist.artist }</b></p>
							      	<div class="container">
							      		<div class="row">
							      			<div class="col-4">
							      				<img src="${pageContext.request.contextPath}/artistImg/${artist.artistImage}" alt="..." width="100%;">
							      			</div>
							      			<div class="col-8" style="color: gray;">
							       				 ${artist.artistInfo }
							      			</div>
							      		</div>
							      	</div>
							      </div>
							    </div>
							  </div>
							</div>
					</div>
					</c:forEach>
					</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

function checkOnlyOne(element) {
	  
	  const checkboxes = document.getElementsByName("checkList");
	  
	  checkboxes.forEach((cb) => {
	    cb.checked = false;
	  })
	  
	  element.checked = true;
	}



var artistNum = document.querySelector('#deleteNum').value;


$(document).ready(function() {
    $('#update').click(function() {
    	$("input[type=checkbox]:checked").each(function(){
			const value = $(this).val();
    		location.href = 'artistUpdate.do?artistNum='+value;
		})
    })
});

$(document).ready(function() {
    $('#delete').click(function() {
    	$("input[type=checkbox]:checked").each(function(){
			const value = $(this).val();
			document.querySelector('#deleteNum').value = value;
			//alert(document.querySelector('#deleteNum').value);
			$('#deleteModal').modal('show');
    		//location.href = 'artistUpdate.do?artistNum='+value;
		})
    })
});




</script>


</body>

<%@ include file="/common/footer.jspf"%>
</html>