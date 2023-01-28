<%@page import="com.mystudy.project.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.project.dao.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="cartVO" class="com.mystudy.project.vo.CartVO" scope="request"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<style>
 pre {    
    white-space: pre-wrap;
    word-break: break-all;
    overflow: auto;    
  }

</style>

<script>	

	$(function(){
		
		//기본으로 안 보여 주기		
		$(".optiontbd").hide();

        
		$(".qty").each(function(){
			
			$(this).change(function(){
				
				let originP = parseInt($(this).parent().parent().find("td:eq(2)").find("input:eq(2)").val());
				let qty = parseInt($(this).val());
				let eachSum = originP*qty;
				console.log("originP: " + originP);
				console.log("eachSum = " + originP*qty);

				$(this).parent().parent().find("input:eq(2)").val(eachSum);
				console.log("eachsum: " + $(this).parent().parent().find("input:eq(2)").val());
				
				let totalPrice = 0;
				
		   		$(".eachPrice").each(function(){
	    			
	    			totalPrice += parseInt($(this).val());
	    			$("#totalPrice").text(totalPrice);
	    		});
				
			})

		});
		
		
		$(".deleteOption").each(function(){
			$(this).click(function(){
				$(this).parent().parent().find("td:eq(2)").find("input:eq(0)").val("0");
				$(this).parent().find("input:eq(0)").val("0");
				
				let totalPrice = 0;
		   		$(".eachPrice").each(function(){
	    			
	    			totalPrice += parseInt($(this).val());
	    			$("#totalPrice").text(totalPrice);
	    		});
		   		
				$(this).parent().parent().parent().hide();
			})
		});
		
		
		$(".pritems").each(function(){
			$(this).click(function(){
				$(this).parent().find("input:eq(0)").val("0");
				$(this).parent().parent().parent().hide();
			})
		});
		

		
	
		 $(document).on("click", ".pritems", function () {

			$.ajax("ajaxController", {
				
				//get타입으로 전달해 주는 것
				type : "get",
				data : "type=review&productNo=${productVO.productNo}&reviewPage="+$(this).attr('value'), //서버쪽으로 전달할 데이터
				//서버쪽으로 전달해 줄 데이터(파라미터) 여기에서는 전부 가져올 거라 안 적어 줘도 됨
				dataType : "json", //응답 받을 데이터 타입
				success : function(data){
					//여기에서 function의 파라미터 data는 위의 date랑 다른 것
					alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
					let rList = data.review.list; //JSON 객체 속성명 "list"의 값 추출
					let pr = data.review.pr;
					
					//전달받은 JSON 데이터 처리
					let htmlTag = "";
					$.each(rList, function(index, item){ // 아이템이 끝날 때까지
						htmlTag += "<tr>";	
						htmlTag += "<td>"+this.reviewNo+"</td>";	
						htmlTag += "<td><a href='${pageContext.request.contextPath }/BBSController?type=reviewView&reviewNo="+this.reviewNo+"'>"+this.title+"</td>";	
						htmlTag += "<td>"+this.userName+"</td>";
						htmlTag += "<td>"+this.wdate+"</td>";	
						htmlTag += "<td>"+this.hit+"</td>";
						htmlTag += "</tr>";	
					});
					
					$("#productReview").html(htmlTag);
						
					let pagingHtml = "";

					pagingHtml += '<p class="py-5"></p>';
					pagingHtml += '<div>';
					pagingHtml += '<ul id="ReviewPagingButton" class="pagination justify-content-center">';
					
					<%--[1페이지로]에 대한 사용여부 처리 --%>
					if (pr.beginPage == 1 ) {
						pagingHtml += '<li class="page-item disabled"><a class="pritems page-link text-body">**</a></li>';
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pritems page-link text-body" value="1">';
						pagingHtml += '**';
						pagingHtml += '</a>';
						pagingHtml += '</li>';
					}
					<%--[이전으로]에 대한 사용여부 처리 --%>
					if (pr.beginPage == 1) {
						pagingHtml += '<li class="page-item disabled"><a class="pritems page-link text-body">pre</a></li>';	
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pritems page-link text-body" value="'+(pr.beginPage-1)+'">';	
						pagingHtml += 'pre';
						pagingHtml += '</a>';
						pagingHtml += '</li>'						
					}

					<%-- 블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
					for (let i = pr.beginPage; i <= pr.endPage ; i++ ) {
						if (i == pr.nowPage) {
							pagingHtml += '<li class="page-item disabled">';
							pagingHtml += '<a class="pritems page-link text-body font-weight-bold">'+i+'</a></li>';
						} else {
							pagingHtml += '<li class="page-item">';
							pagingHtml += '<a class="pritems page-link text-body" value="'+ i +'">'+i+'</a>';
							pagingHtml += '</li>';
						}
					}
					<%--[다음으로]에 대한 사용여부 처리 --%>
					if (pr.endPage >= pr.totalPage) {
						pagingHtml += '<li class="page-item disabled">';
						pagingHtml += '<a class="pritems page-link text-body">nex</a></li>';
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pritems page-link text-body" value="'+(pr.endPage+1)+'">';
						pagingHtml += 'nex';
						pagingHtml += '</a>';
						pagingHtml += '</li>';
					}		
					<%--[마지막으로]에 대한 사용여부 처리 --%>
					if (pr.endPage >= pr.totalPage) {
						pagingHtml += '<li class="page-item disabled">';
						pagingHtml += '<a class="pritems page-link text-body">**</a></li>';							
					} else {
						pagingHtml += '<li class="page-item">';
						pagingHtml += '<a class="pritems page-link text-body" value="'+pr.totalPage+'">';
						pagingHtml += '**';
						pagingHtml += '</a>';
						pagingHtml += '</li>';
					}
					pagingHtml += '</ul>';
					pagingHtml += '</div>';
					pagingHtml += '<p class="py-3"></p>';					    
				  	
					$("#pagingReview").html(pagingHtml);

				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
							+ "jqXHR : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
			});	
		
		});
		
		
		 $(document).on("click", ".pqitems", function () {
	
			$.ajax("ajaxController", {
				
				//get타입으로 전달해 주는 것
				type : "get",
				data : "type=qa&productNo=${productVO.productNo}&qaPage="+$(this).attr('value'), //서버쪽으로 전달할 데이터
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
						htmlTag += "<td>"+this.wdate+"</td>";	
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
	
	
	
	function select_opt(num) {
		$(function(){
			$("#opt"+num).show();
		});
	}
	
	
	function qty_delete(frm) {
		
		alert("선택이 취소됩니다");
		$(frm).hide();

	}
	
	
	

	function go_pay(frm) {
		
		let sum = 0;
		
		$(".qty").each(function(){
			sum += parseInt($(this).val());
		})
		
		if (sum == 0) {
			alert("수량은 최소 한 개 이상 선택해 주세요");
			return false; 
			
		} else {
			
			if ("${user.userId}".trim() == "") {
				if (confirm("회원 전용 서비스입니다\n"+"로그인 페이지로 이동하시겠습니까?")) {
					location.href="/ourHW/signup/login.jsp";
					return false;				
				} else {
					return false;
				}
			} else {
				
				frm.type.value = "pay";
				
				alert("결제 페이지로 이동합니다");
				
				frm.action = "/ourHW/controllersk";
				frm.submit();
			}
			
		}

	}
	
	function add_cart(frm) {	
		
		$(".optionSize").each(function(){
			alert("optionSize: " + $(this).val());
		});
		
		
		let sum = 0;
		
		$(".qty").each(function(){
			sum += parseInt($(this).val());
		})
		
		if (sum == 0) {
			alert("수량은 최소 한 개 이상 선택해 주세요");
			return false; 
			
		} else {
			
			if ("${user.userId}".trim() == "") {
				if (confirm("회원 전용 서비스입니다\n"+"로그인 페이지로 이동하시겠습니까?")) {
					location.href="/ourHW/signup/login.jsp";
					return false;				
				} else {
					return false;
				}
			} else {
				frm.type.value = "addCart";
				alert("장바구니에 추가되었습니다!!");
				frm.action = "/ourHW/controllersk";
				frm.submit();
			}
			
		}
		
	}
	
	$(document).on("click", ".likeButton", function () {
		if ("${user.userId}".trim() == "") {
			if (confirm("회원 전용 서비스입니다\n"+"로그인 페이지로 이동하시겠습니까?")) {
				location.href="/ourHW/signup/login.jsp";
				return false;				
			} else {
				return false;
			}
		} else {
			
			let productNo = $("input[name=productNo]").val();
			console.log(productNo);
			
	  		$.ajax("ajaxController", {

				type : "get",
				data : "type=addLike&from=productDetail&productNo="+productNo,
				dataType : "json",
				success : function(data){
					
					//여기에서 function의 파라미터 data는 위의 date랑 다른 것
					alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
					
					let result = data.result;
					let htmlTag = "";
					if (result == 1) {
						alert("관심상품에 추가되었습니다");
						htmlTag += '<input type="button" class="likeButton btn btn-dark btn-lg" value="관심상품삭제">';				
					} else {
						alert("관심상품에서 삭제되었습니다");
						htmlTag += '<input type="button" class="likeButton btn btn-outline-dark btn-lg" value="관심상품추가">';
					}
					
					$("#likeButton").html(htmlTag);
				},
				error : function(jqXHR, textStatus, errorThrown){
					alert("Ajax 처리 실패 : \n"
							+ "jqXHR : " + jqXHR.readyState + "\n"
							+ "textStatus : " + textStatus + "\n"
							+ "errorThrown : " + errorThrown);
				}
				
	  	  	}) // ajax의 끝	

		}
		
	
	});
	
	
	function write_review() {
		
		if (${empty user}) {
			if(confirm("회원 전용 서비스입니다\n 로그인하시겠습니까?")){
				location.href="/ourHW/signup/login.jsp";
			} 
		} else {
			location.href='/ourHW/BBSController?type=reviewWrite';
		}
	}
	
	
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

	<div id="productsummary" class="p-3 float-left" style="width:100%; height: 800px;">

		<div id="productimg" class="text-center float-left" style="width:50%; height: 100%;">
			<img src="${pageContext.request.contextPath }/img/${productVO.thumnail }" alt="${productVO.thumnail }" width="90%;">
		</div>
		
		<div id="productselect" class="p-5 float-left" style="width:50%;  height: 100%;">
			<div id="productinfo">
				<table class="mb-5" style="width:100%;">
					<colgroup>
						<col style="width: 30%;">
					</colgroup>
					<tbody>
					<tr>
						<th class="pb-3">상품명</th>
						<td class="pb-3">${productVO.productName }</td>
					<tr>
						<th class="pb-3">판매가</th>
						<td class="pb-3">${productVO.price }원</td>
					</tr>
					<tr>
						<th class="pb-3">배송비</th>
						<td class="pb-3">3,000원 (70,000원 이상 구매 시 무료)</td>
					</tr>
					</tbody>
				</table>				
				<hr>
				<table style="width:100%;">
				<colgroup>
					<col style="width: 30%;">
				</colgroup>
					<tr>
						<th>Option</th>
						<td>
							<c:forEach var="size" items="${SizeList }">
								<c:choose>
									<c:when test="${size.optionCount <= 0}">
										<input type="button" class="btn btn-outline-light text-dark"" value="${size.optionSize }" disabled>
									</c:when>
									<c:otherwise>
										<input type="button" class="btn btn-outline-light text-dark" onclick="select_opt(${size.optionNo})" value="${size.optionSize }">
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</td>
					</tr>
				</table>
				<hr>
			</div>
			
			<div>
			<span>(최소주문수량 1개 이상)</span>
			</div>
			<br >
			<p class="py-3">위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</p>
			<hr>
			<div id="productfrm">
				<form>
					<table style="widht: 100%">
						<colgroup>
						<col style="width: 50%;">
						<col style="width: 40%;">
						</colgroup>
						
						<tr class="d-none">
							<th>상품명</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
						<c:forEach var="size" items="${SizeList }">
							<tbody class="optiontbd" id="opt${size.optionNo }">
								<tr>
									<td class="pb-3"> ${productVO.productName } ${size.optionSize }</td>
									<td class="pb-3">
										<input type="number" name="qty" style="width: 60px" min="0" max="${size.optionCount }" value="0"
											class="qty border-0">
										<input type="button" class="deleteOption btn btn-outline-light text-dark " value="x">				
									</td>
									<td class="pb-3">
										<input type="text" name="eachPrice" value="0" size="3" class="eachPrice border-0 font-weight-bold" readonly/>
										<input type='hidden' name='productName' value='${productVO.productName}'>
										<input type="hidden" name="price" value="${productVO.price }">
										<input type='hidden' name='productThumnail' value='${productVO.thumnail}'>
										<input type='hidden' name='productNo' value='${productVO.productNo}'>
										<input type="hidden" name="optionSize" value='${size.optionSize }'>
									</td>
								</tr>
							</tbody>
						</c:forEach>
						<tr>
							<td class="h4 font-weight-bold">
								totalPrice
							</td>
							<td id="totalPrice" class="totalPrice h4 font-weight-bold text-danger" colspan="2">
							0
							</td>
						</tr>
						<tr>
							<td colspan="3">
							<input type='hidden' name='type' value='type'>
							</td>
						</tr>
					</table>
					<hr>
					<div class="text-center">
						<input type="button" class="btn btn-outline-dark btn-lg ml-3" onclick="go_pay(this.form)" value="바로구매">
						
						<input type="button"  class="btn btn-outline-dark btn-lg mx-3" onclick="add_cart(this.form)" value="장바구니">
						<span id="likeButton">
							<!-- 관심상품 등록 및 해제 페이지 이동 없이 처리 가능한지 추후 구현 -->
							<c:choose>
								<c:when test="${empty likeVO }">
									<input type="button" class="likeButton btn btn-dark btn-lg" value="관심상품추가">
								</c:when>
								<c:otherwise>							
									<input type="button" class="likeButton btn btn-outline-dark btn-lg" value="관심상품삭제">
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</form>				
			</div>
			
		</div> <!-- productselect div end -->
		
	</div> <!-- summary div end -->
	<p class="clearfix">
	
	<p class="py-5"></p>
	
	<%@ include file="/include/detailnav.jspf" %>
	<p class="float-none">
	<div id="menu1" class="productContent" style="width: 100%; height: 1500px;">
	<img src="${pageContext.request.contextPath }/img/${productVO.content }" alt="${productVO.content }" width="90%;">
	</div>
	<p class="py-5"></p>
	<%@ include file="/include/detailnav.jspf" %>
	
	<p class="clear"></p>
	<div id="menu2" class="text-center">
	<pre>
	<%@ include file="/include/shippinginfo_detail.jspf" %>
	</pre>
	</div>
	<p class="py-5"></p>
	
	<%@ include file="/include/detailnav.jspf" %>
	
	<div id="menu3">
		 <table class="table text-center table-responsive-sm" style="width:100%">
		 	<colgroup>
				<col style="width: 5%;">
				<col style="width: 40%;">
				<col style="width: 5%;">
				<col style="width: 10%;">
				<col style="width: 5%;">
		 	</colgroup>
		 	<caption class="d-none">상품리뷰</caption>
		 	<thead class="thead-light">
		 		<tr>
		 			<th>번호</th>
		 			<th>제목</th>
		 			<th>작성자</th>
		 			<th>작성일</th>
		 			<th>조회</th>
		 		</tr>
		 	</thead>
		 	<tbody id="productReview">
		 	<c:if test="${empty reviewList }">
			 	<tr>
		 			<td colspan="5">게시물이 없습니다</td>
		 		</tr>
		 	</c:if>
	 		<c:forEach var="reviewVO" items="${reviewList }">
 			<tr>
	 			<td>${reviewVO.reviewNo }</td>
	 			<td><a href="${pageContext.request.contextPath }/BBSController?type=reviewView&reviewNo=${reviewVO.reviewNo }">${reviewVO.title }</a></td>
	 			<td>${reviewVO.userName }</td>
	 			<td>${reviewVO.wdate.substring(0, 10) }</td>
	 			<td>${reviewVO.hit}</td>
	 		</tr>
			</c:forEach>
		 	</tbody>
		 </table>
		 <div class="text-right">
		 	<button class="btn btn-outline-light text-dark" onclick="write_review()">상품리뷰쓰기</button>
		 	<button class="btn btn-outline-light text-dark" onclick="location.href='${pageContext.request.contextPath }/BBSController?type=COMMUNITY&bbs=review';">모두보기</button>
		 </div>
		<c:if test="${not empty reviewList }">
			<div id="pagingReview">
				<%@ include file="/include/pagingReview.jspf" %>
			</div>
	 	</c:if>
	</div>
	<p class="py-5"></p>
	
	<%@ include file="/include/detailnav.jspf" %>

	<div id="menu4">
	 	<table class="table text-center table-responsive-sm">
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
		<input type="button" class="btn btn-outline-light text-dark" onclick="write_qa()" value="상품문의하기">
		<button class="btn btn-outline-light text-dark" onclick="location.href='${pageContext.request.contextPath }/BBSController?type=COMMUNITY&bbs=QA';">모두보기</button>
	</div>
	 <div id="pagingQnA">
	 	<%@ include file="/include/pagingQA.jspf" %>
	 </div>
	</div>
	<p class="py-5"></p>
</div>
</body>
<footer>
<%@ include file="/common/footer.jspf" %>
</footer>
</html>