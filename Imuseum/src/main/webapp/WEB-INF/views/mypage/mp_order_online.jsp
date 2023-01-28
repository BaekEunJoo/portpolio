<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>주문내역</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	input[type=date] { 
		border-radius: 0;
		border: 1px solid silver;
		width: 210px;
		height: 50px;
		margin: 0;
		vertical-align: middle;
	}
	.btn {
		border-radius: 0;
		width: 100px;
		height: 50px;
		margin-right:5px;
	}
	.bt {
		width:180px;
		height:50px;
		border: 1px solid black;
		background-color: white;
	}
	.hover:hover {
		color:black;	
		background-color: white;
	}
	.bt:hover, .bt:active {
		color:white;
		background-color: black;
	}
	.dateBtn {
		width:100px;
		height:40px;
		border: 1px solid black;
		background-color: white;
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
	#mp_order {color: black;}
	.whitebtn {
		border: 1px solid black;
		background-color: white;
	}
	.whitebtn:hover {
		border: 1px solid grey;
		background-color: grey;
		color: white;
	}
	.blackbtn {
		border: 1px solid black;
		background-color: black;
		color: white;
	}
	.blackbtn:hover {
		border: 1px solid black;
		background-color: white;
		color: black;
	}
</style>
<script>
function cancleOrder(frm){
	//alert("주문취소 클릭");
	var orderNum = frm["orderNum"].value;
	var status = frm["status"].value;
	var paymentType = frm["paymentType"].value;
	if(confirm("주문을 취소하시겠습니까?")){
		if(status == "결제완료" || status == "입금확인중"){
			if(paymentType == "카드결제"){
				//alert("이벤트 발생");
				cancelPay(orderNum);
			} else {
				location.href="deleteOrder.do";
			}
		} else {
			alert("배송상태가 "+ status + "입니다.\n고객센터로 문의해주세요.");
		}
	} 
	
}
 
function cancelPay(orderNum) {
	$.ajax("orderCancel.do",{
		type:"POST",
		data:{"orderNum": orderNum},
		dataType: "text",
		success: function(result){
					if(result == "o"){
						alert("결제 취소 성공!!");
						location.href="mp_order_online.do";
					} else if(result == "ox"){
						alert("결제 취소 성공 이지만 db 변경실패");
						location.href="mp_order_online.do";
					} else if(result == "x"){
						alert("결제 취소 실패ㅠㅠ");
					} else {
						alert(result);
					}
				},
		error: function(){
			alert("orderCancel.do 오류가 발생하였습니다.");
		}
	});	
}
</script>
<script>
	function deleteOrder() {
		alert("취소하시겠습니까?");
		location.href="deleteOrder.do";
	}
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
			<div class="col-8">
				<!-- row div 시작 -->
				<div class="row">
				
					<!-- body 시작 -->
					<div class="container-fluid mt-5">
						<h5 style="font-weight:bold;" class="line">주문내역</h5>
						<!-- 타이틀 부분 시작 -->
						<div class="pt-2">
						  <ul class="row p-0" style="list-style:none;">
						  	<li class="col-4 m-0 p-0">
						  		<a>
							  		<button onclick="location.href='mp_order_online.do'" type="button" style="width:100%; color:white; background-color:black;" class="bt hover py-2 m-0">온라인 주문내역</button>
						  		</a>
					  		</li>
						  	<li class="col-4 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button onclick="location.href='mp_order_offline.do'" type="button" style="width:100%;" class="bt py-2 m-0">오프라인 주문내역</button>
						  		</a>
					  		</li>
					  		<li class="col-4 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button onclick="location.href='mp_order_team.do'" type="button" style="width:100%;" class="bt py-2 m-0">기업 및 단체 주문내역</button>
						  		</a>
					  		</li>
						  </ul>
						</div>
						<!-- 타이틀 부분 끝 -->
						
						<!-- 주문 내역 리스트 시작 -->
						<table class="rvtable" style="width: 100%;">
							<colgroup>
								<col style="width:20%">
								<col style="width:20%">
								<col style="width:20%">
								<col style="width:20%">
								<col style="width:20%">
							</colgroup>
							<tr style="text-align: center; height: 50px; background: black; color: white;">
								<th>주문번호</th>
								<th>주문날짜</th>
								<th>결제금액</th>
								<th>배송상태</th>
								<th>상세보기</th>
							</tr>
							<c:choose>
								<c:when test="${empty orderOnline }">
									<tr>
										<td colspan="5" style="padding:25px; text-align: center;">온라인 주문 내역이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="orderOnline" items="${orderOnline }">
									<form method="post">
									
										<tr style="text-align: center; height: 50px; border-bottom: 1px solid gray;">
											<td>${orderOnline.orderNum }</td>
											<td>${orderOnline.orderDate }</td>
											<td><fmt:formatNumber value="${orderOnline.totalPrice }" pattern="#,###"/>원</td>
											<td>${orderOnline.status }</td>
											<td>
												<button type="button"  class="whitebtn" onClick="location.href='mp_orderDetail.do?orderNum=${orderOnline.orderNum }'"
													style="width:150px; height:40px;">주문상세보기 &gt;</button>
											</td>
										</tr>
									</form>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					
						<!-- 주문 내역 리스트 끝 -->
						
						<!-- 기타 안내사항 시작 -->
						<div class="my-4">
							<strong class="mb-2" style="font-size:20px;">주문상태 및 취소기간 안내</strong>
							<p style="color:gray">
								- 배송완료 7일 후 자동으로 구매확정됩니다.<br>
								- 구매확정 후에는 반품 및 환불이 불가합니다.<br>
								- 구매확정 후 14일 이내 리뷰를 작성할 수 있습니다.
							</p>
						</div>
						<div class="my-5">
							<strong class="mb-2" style="font-size:20px;">주문/배송 절차 안내</strong>
							<p style="padding-top:20px;"><img src="${pageContext.request.contextPath}/common/img/del.JPG" alt="주문배송절차" style="width:100%"></p>
						</div>
						<!-- 기타 안내사항 끝 -->
					</div>
					<!-- body 끝 -->
					
				</div>
				<!-- row div 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>

</html>