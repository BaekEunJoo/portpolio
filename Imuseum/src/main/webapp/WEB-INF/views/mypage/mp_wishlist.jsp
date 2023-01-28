<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>위시리스트</title>
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
	.bt:hover, .bt:active {
		color:white;
		background-color: black;
	}
	.boldBorder:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 3px solid black;
		margin-top : 15px;
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
	#mp_wishlist {color: black;}
	input#checkAll {
   		display: none;
  	}
  	table, tr, td { border:none; !important }
</style>
<script>
$().ready(function () {
	$("#wishDelete").click( function(){
		alert('삭제하시겠습니까?');
		 if($(".form-check-input:checked").length == 0){
			alert('삭제할 상품을 선택하세요.');
			return;
		} else {
			var wishLists = document.querySelectorAll(".form-check-input");
			var list = new Array();
			for (var i = 0; i < wishLists.length; i++) {
	            if (wishLists[i].checked) {
	            	list.push(parseInt(wishLists[i].value,10));
	            }
	        }
			for (var i = 0; i < list.length; i++){
				console.log("list.length:"+list.length);
				$("input[name='wishNum']").eq(i).val(list[i]);
				console.log($("input[name='wishNum']"));
			}
			document.wishlist.submit();
		} 
	});
});
	
	
var checkflag = "false";
function check(field) {
if (checkflag == "false") {
for (i = 0; i < field.length; i++) {
field[i].checked = true;}
checkflag = "true";
return "전체선택"; }
else {
for (i = 0; i < field.length; i++) {
field[i].checked = false; }
checkflag = "false";
return "전체선택"; }
}
</script>
</head>
<body>
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
	
		<div class="row" style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<div class="row">
					<div class="body container-fluid mt-5">
						<h5 style="font-weight:bold;">위시리스트</h5>
						<span>
							<i class="bi bi-exclamation-circle"></i> 위시리스트는 최대 200개까지 저장됩니다.
						</span>
						<!-- 모달 버튼 -->
						<form action="deleteWish.do" method="get" name="wishlist">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<input type="button" name="button" class="bt" value="전체선택" onclick="this.value=check(this.form.wishNum)">
							<input type="button" class="deleteBtn bt" value="삭제" id="wishDelete">
						</div>
						
						<div class="boldBorder">
							<p>총&nbsp;<b>${wishCnt }</b>개의 상품</p>
						</div>
						<!-- 목록 -->
						<div class="list container-fluid">
						 <c:set var="i" value="0" />
 						 <c:set var="j" value="4" />
							<table class="table" id="dTable" style="text-align:center; border:none;">
								<c:choose>
									<c:when test="${empty wishlist }">
										<div class="noP text-center mt-5">
											위시리스트에 담은 상품이 없습니다.
										</div>
									</c:when>
									<c:otherwise>
										<c:forEach var="wishList" items="${wishlist }">
										<c:if test="{i%j == 0}">
									        <tr>
									    </c:if>
											<td>
												<div align="left">
													<div>
												  		<input class="form-check-input" type="checkbox" name="wishNum" value="${wishList.wishNum }" id="flexCheckDefault"><br>
													</div>
													<div>
													  	<label for="img">
														  	<span style="width:150px; height:150px;" id="img">
														  		<a href="getProduct.do?productnum=${wishList.productNum }">
														  		<img alt="" src="${pageContext.request.contextPath}/imgs/${wishList.photo }" style="width:250px;">
														  		</a>
														  	</span>
													  	</label>
													</div>
													<div>
													  	<div class="pTitle">${wishList.productName }</div>
													  	<div class="pPrice"><fmt:formatNumber value="${wishList.price }" pattern="#,###"/>&nbsp;원</div>
													</div>
												</div>
											</td>
										<c:if test="${i%j == j-1}">
											</tr>
										</c:if>
										<c:set var="i" value="${i+1}" />
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
							<input type="hidden" name="cartNum" value="${vo.cartNum }"> 
						</div>
						</form>
					</div>
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
</body>
</html>