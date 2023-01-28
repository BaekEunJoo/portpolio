<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문/결제</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

</head>
<script type="text/javascript">
 window.history.forward();
 function noBack(){window.history.forward();}
</script>

<style>
#contentAll {
	font-size: 18px;
}

.center {
	text-align: center;
}

.right {
	text-align: right;
}

.left {
	text-align: left;
}

.title {
	font-size: 3em;
	font-weight: bold;
	text-align: center;
}

.subtitle {
	font-size: 2em;
	font-weight: 600;
}

.subtitleline {
	border-bottom: 2px solid black;
	padding-top: 2px;
	padding-bottom: 13px;
}

.productlist table, .info table, .payment table {
	width: 100%;
	border-top: 2px solid black;
	text-align: center;
	vertical-align: middle;
}

.productlist th, .payment th {
	height: 55px;
	font-weight: normal;
	background-color: #F7F7F7;
}

.productlist td {
	border-bottom: 2px solid #F7F7F7;
	height: 160px;
	padding: 10px;
}

.payment tbody>tr {
	font-size: 25px;
	height: 100px;
	
}

.info td {
	height: 70px;
	border-bottom: 2px solid #F7F7F7;
	text-align: left;
	padding-left: 30px;
}

.real-price{
	text-decoration: line-through;
	color: grey;
	font-weight: 700;
	font-size: 15px;
	margin: 0;
}
.price-style{
	font-weight: 700;
	font-size: 25px;
}

.blackbtn {
	background-color: black;
	color: white;
	margin-top: 30px;
	font-size: 20px;
}

.blackbtn:hover {
	border: 1px solid black;
	background-color: white;
	color: black;
}

.whitebtn {
	border: 1px solid black;
	background-color: white;
}

.whitebtn:hover {
	border: 1px solid grey;
	background-color: grey;
	color: white;
}

.red {color: red;}
#deliveryInfo input, .phoneSelect select {
	height: 60px;
	display: inline-block;
	margin-bottom: 5px;
	border-radius: 0;
}

input[type=checkbox] {
	width: 25px;
	height: 25px;
	margin: 5px;
	accent-color: black;
}

input[type=radio] {
	width: 25px;
	height: 25px;
	margin: 5px;
	accent-color: black;
}

label[for="a"], label[for="b"], label[for="c"] {
	font-size: 20px;
	position: relative;
	top: -4px;
	line-height: 50px;
	display: inline-block;
	margin-left: 7px;
}

#form-group2 .row {
	margin-left: 0;
	margin-right: 0;
}
/* #modal-addr.modal-dialog {
  width: 100%;
  height: 100%;
  border-radius: 0; 
}
#modal-addr.modal-content {
  height: auto;
  min-height: 50%;
  border-radius: 0; 
} */
.modal-header {
	background-color: black;
	color: white;
	height: 65px;
}

#modal-addr .modal-footer {
	height: 130px;
	border-top: none;
	text-align: center;
}

#modal-addr table {
	width: 100%;
	border-top: 2px solid black;
}
#modal-addr td {
	
	border-bottom: 2px solid #F7F7F7;
	
}
#modal-addr tr{
	height: 160px;
}

#modal-addr .whitebtn,#modal-addr .blackbtn {
	width: 300px; height: 50px;
}

#modal-addr input[type=radio] {
	height: 100px;
	margin-right: 20px;
}

#modal-addr label {
	position: relative;
	margin-top: 15px;
}
/* 
.badge {
border-radius: 0;
} 
*/




@font-face {
	font-family: 'establishRetrosansOTF';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/establishRetrosansOTF.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

#establishRetrosansOTF {
	font-family: 'establishRetrosansOTF';
}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
function numberWithCommas(val) {
	   return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}


/* window.history.forward();
function noBack(){
	window.history.forward();
} */
function daumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				addr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if (data.userSelectedType === 'R') {
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
				// 조합된 참고항목을 해당 필드에 넣는다.
				//document.getElementById("extraAddress").value = extraAddr;
				addr += extraAddr;
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("addr1").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addr2").focus();
		}
	}).open();
}

</script>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<%-- ${member } <br>--%>
<%-- ${orderList } --%>
<%@ include file="/common/style.jspf"%>

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

<%@ include file="/common/store.jspf"%>
	<div class="container-filid notosanskr" id="contentAll">
		<div class="col-8 offset-2">
			<p class="title py-5 my-5">주문/결제</p>
			<div>
				<p>
					<span class="subtitle">상품목록</span> 총 <span
						style="font-weight: bold">${orderProductCnt }</span>건
				</p>
			</div>
<!-- 상품정보 form name="productListForm"--------------------------------------------------------------------->		



 	
<c:set var="totalPrice" value="0" />
<c:forEach var="pvo" items="${orderList }">
	<c:set var= "totalPrice" value="${totalPrice + (pvo.price * ((100 - pvo.discount) / 100) * pvo.productCnt)}"/>
</c:forEach>
<c:set var ="shipping" value ="3000" />
<c:if test ="${totalPrice ge 100000 }">
	<c:set var = "shipping" value = "0" />
</c:if>
	
				<div class="productlist">
					<table>
						<thead>
							<tr>
								<th style="width: 55%;">상품정보</th>
								<th>상품금액</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="pvo" items="${orderList }">
							<tr>
								<td>
									<div class="left" style="vertical-align: middle;">
										<img class="mx-3" style="display: inline-block; float: left;"
											src="${pageContext.request.contextPath}/imgs/${pvo.photo }"
											width="90" height="90" alt="상품사진">
										<div class="my-3" style="display: inline; font-size: 15px; ">
											<p style="font-weight: bold;">${pvo.productName}</p>
											<p>옵션<span style="color:grey;"> ${pvo.productOption }</span> &nbsp;&nbsp;&nbsp;&nbsp;수량<span style="color:grey;"> ${pvo.productCnt }</span></p>
										</div>
									</div>
								</td>
								<td>
									<c:if test="${pvo.discount eq '0' }"> <!-- 할인율이 0일때 -->
										<span class="price-style" ><fmt:formatNumber value="${pvo.price }" pattern="#,###"/></span>원
									</c:if>
												
									<c:if test="${pvo.discount ne '0' }"> <!-- 할인율이 있을때 -->
												
									<p class="real-price"><fmt:formatNumber pattern="#,###" value="${pvo.price }" />원</p>
									<p><span class="price-style"><fmt:formatNumber pattern="#,###" value="${pvo.price * (100 - pvo.discount) / 100 }" /></span>원</p>
									</c:if>
									
								</td>
								<td><span class="price-style"><fmt:formatNumber value="${pvo.price * ((100 - pvo.discount) / 100) * pvo.productCnt }" pattern="#,###"/></span>원</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					
					
				</div>
				<div class="right">
					<br>
					<p style="font-size: 20px; color: #606060;">
						상품 합계금액 <span class="price-style"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/>원</span>
					</p>
					<p style="font-size: 20px; color: #606060;">
						+ 배송비 <span class="price-style" ><fmt:formatNumber value="${shipping }" pattern="#,###"/>원</span>
					</p>
					<p style="font-size: 20px; color: #606060;">
						= 총 주문금액 <span class="price-style" style="color: red;" >
						<fmt:formatNumber value="${totalPrice + shipping}" pattern="#,###"/>원</span>
					</p>
				</div>

				<br>
				<br>
				<div class="row">
<!-- 주문자 정보 form name="memberInfoform"--------------------------------------------------------------------->					
					<div class="col">
						<p>
							<span class="subtitle">주문자 정보</span>
						</p>
						<div class="info">
						<form name="memberInfoform">
							<table>
								<tr>
									<td style="width: 25%;">이름</td>
									<td style="font-weight: 700;">${member.name}</td>
								</tr>
								<tr>
									<td>휴대폰번호</td>
									<td style="font-weight: 700;">${member.phone}</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td style="font-weight: 700;">${member.email}</td>
								</tr>
							</table>
						</form>
						</div>
					</div>
<!-- 배송지 정보 form name="deliveryInfoForm"--------------------------------------------------------------------->					
					<div class="col">
						<p class="subtitleline" style="">
							<span class="subtitle" style="width:70%;">배송지 정보&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span style="font-size: 15px; "><span class='red'>&#42;</span>표시는 필수 입력 항목입니다.</span>
						</p>
					<form name="deliveryInfoForm" >
						<div id="deliveryInfo">
							<label >배송지 선택</label>
							<div class="form-group" >
								<div class="form-check form-check-inline">

										<input type="radio" class="form-check-input" name="selectDel"
											id="oriPlace" value="oriPlace" checked> 
										<label class="form-check-label" for="oriPlace" style="margin-bottom: 7px;"> 주문자와 동일 </label>
										<input type="radio" class="form-check-input" name="selectDel"
											id="newPlace" value="newPlace" style="margin-left: 50px;"> 
											<label class="form-check-label" for="newPlace" style="margin-bottom: 7px;"> 새로운 배송지 </label>
										<button type="button" class="addrList whitebtn"
											style="width: 200px; height: 50px; margin-left: 50px;" data-toggle="modal"
											data-target="#modal-addr" data-id="${member.id }">주소록 보기</button>

								</div>
							</div>

							<div class="form-group1" id="form-group1">
								<label for="orderName">받으시는 분 <span class='red'> &#42;</span></label> 
								<input type="text" class="form-control" id="orderName" value="">
							</div>
							<div class="form-group4" id="form-group2">
								<label for="postcode">주소<span class='red'> &#42;</span></label>
								<div class="form-group2 row">
									<div class="col-xs-2">
										<input type="text" class="form-control" id="postcode" value="" style="display: inline;" 
											placeholder="우편번호" readonly="readonly" >
									</div>
									<div class="">
										<input type="button" class="whitebtn" id="" style="display: inline; margin-left: 10px;" 
											value="우편번호 찾기" style="width: 200px;" onclick="daumPostcode()">
									</div>
								</div>
								<input type="text" class="form-control" id="addr1" value=""
									placeholder="주소" readonly="readonly"> 
								<input
									type="text" class="form-control" id="addr2" value=""
									placeholder="상세주소">

							</div>
							<div class="form-group3">
								<label for="phone">휴대전화 <span class='red'> &#42;</span></label>
								<div class="phoneSelect" id="phoneSelect">
									<select class="form-control" id="phone1" style="width: 32.5%;">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
									</select> 
									<input type="text" id="phone2" class="form-control" style="width: 33%;" value="">
									<input type="text" id="phone3" class="form-control" style="width: 33%;" value="">
								</div>
							</div>
							<div class="form-group">
								<label for="orderReq">배송요청사항</label> 
								<input type="text" class="form-control" id="orderReq">
							</div>
						</div>
					
				</form>
					</div>
				</div>
				<!--  주소록 보기 모달 -->
				<div class="row">
					<div class="modal fade" id="modal-addr" tabindex="-1">
						<div class="modal-dialog modal-dialog-centered modal-lg" >
							<div class="modal-content">
								<div class="modal-header">
									<span style="font-size: 22px;">주소록</span>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true" style="color: white;">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="mb-3">
									<span>고객님이 저장하신 배송지 목록입니다.</span><br>
									<span>(마이페이지>배송지관리에서 등록 및 수정하실 수 있습니다.)</span>
									</div>
									<table id="addrListModal">
										<!-- 
										<tr>
											<td style="height: 200px;">
												<input type="radio" id="addr" name="addr" value="">
												<label for="addr"><p style="font-size: 25px;">김소연 <span class="badge badge-dark">기본배송지</span></p>
													<p>서울시 강남구 역삼동 삼원타워 4층 ~~~~~~~ </p>
													<p>010-0000-0000</p>
												</label>
											</td>
										</tr>
										-->
									</table>
								</div>
								<div class="modal-footer d-flex justify-content-center">
									<button type="button" class="whitebtn" data-dismiss="modal">취소</button>
									<input type="button" class="blackbtn" id="addrApply" value="확인">
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!--  주소록 보기 모달 끝 -->
				
<!-- 우편번호 찾기 모달 -->
				<div class="row">
					<div class="modal fade" id="modal-addr-find" tabindex="-1">
						<div class="modal-dialog modal-dialog-centered modal-lg" >
							<div class="modal-content">
								<div class="modal-header">
									<span style="font-size: 22px;">우편번호 찾기</span>
									<button type="button" class="close" data-dismiss="modal">
										<span aria-hidden="true" style="color: white;">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									 
								</div>
								
							</div>
						</div>
					</div>
				</div>
<!-- 우편번호 찾기 모달 끝 -->


				<br>
				<br>
<!-- 결제 정보-------------------------------------------------------------------------------------------------->				
				<p>
					<span class="subtitle">결제 정보</span>
				</p>
				<div class="payment">
				<form name="paymentForm">
					<table>
						<thead>
							<tr>
								<th>상품 합계금액</th>
								<th></th>
								<th>배송비</th>
								<th></th>
								<th>결제예정금액</th>
						    <!-- 
								<td>상품 합계금액</td>
								<td></td>
								<td>배송비</td>
								<td></td>
								<td>할인금액</td>
								<td></td>
								<td>결제예정금액</td>
							 -->
							</tr>
						</thead>
						<tbody>
							<tr>
							<td><span style="font-weight: 700;"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/></span>원</td>
								<td>+</td>
								<td><span style="font-weight: 700;"><fmt:formatNumber value="${shipping }" pattern="#,###"/></span>원</td>
								
								<td>=</td>
								<td style="color: red;"><span style="font-weight: 700;"><fmt:formatNumber value="${totalPrice + shipping}" pattern="#,###"/></span>원</td>
							
							
							<!--	<td><span style="font-weight: 700;"><fmt:formatNumber value="${totalPrice }" pattern="#,###"/></span>원</td>
								<td>+</td>
								<td><span style="font-weight: 700;"><fmt:formatNumber value="${shipping }" pattern="#,###"/></span>원</td>
								<td>-</td>
								<td><span style="font-weight: 700;">0</span>원</td>
								<td>=</td>
								<td style="color: red;"><span style="font-weight: 700;"><span style="font-weight: 700;"><fmt:formatNumber value="${totalPrice + shipping}" pattern="#,###"/></span>원</td>
							-->
							</tr>
						</tbody>
					</table>
					</form>
				</div>
				<br>
				<br>
<!-- 결제 수단 form name="payMethodForm"---------------------------------------------------------------------->			
				<div class="my-5">
					<p class="subtitleline">
						<span class="subtitle">결제 수단</span>
					</p>
					<form name="payMethodForm">
					<div>
						<input type="radio" name="paymentTypeRadio" value="카드결제" id="a">
						<label for="a" style="width: 300px;"> 카드결제</label> 
						<input type="radio" name="paymentTypeRadio" value="무통장입금" id="b">
						<label for="b" style="width: 300px;"> 무통장입금</label>
					</div>
					</form>
				</div>

				<br>
				<br>
				<div class="row">
<!-- 구매자 동의 form name="agreeForm"------------------------------------------------------------------->						
					<div class="col">
						<p class="subtitleline">
							<span class="subtitle">구매자 동의</span>
						</p>
						<form name="agreeForm">
						<div >
							<input type="checkbox" name="agree" id="c" style="display:inline">
							<label for="c" style="display:inline"> 
							주문할 상품의 상품명, 가격, 배송정보 등 판매조건을 최종 확인하였으며, 구매에 동의합니다. (전자상거래법 제8조 2항)
							</label>
						</div>
						</form>
					</div>
<!-- 최종결제금액 form name="payForm"--------------------------------------------------------------->					
					<div class="col">
						<p class="subtitleline">
							<span class="subtitle">최종 결제금액</span>
						</p>
						<form name="payForm" action="insertOrder.do" method="get">
						<p class="center my-5"
							style="color: red; font-size: 2em; font-weight: bold;">
							<fmt:formatNumber value="${totalPrice + shipping}" pattern="#,###"/>원 <br>
							<br> 
							<input type="button" class="blackbtn"
								style="width: 460px; height: 65px;" value="결제하기" id="payBtn">
								
						</p>
						<input type="hidden" name="orderName" >
						<input type="hidden" name="orderAddr" >
						<input type="hidden" name="postcode" >
						<input type="hidden" name="orderPhone" >
						<input type="hidden" name="orderReq" >
						<input type="hidden" name="paymentType">
						<input type="hidden" name="totalPrice" id="totalPrice" value="${totalPrice + shipping}">
						<input type="hidden" name="shipping" value="${shipping }">
						<input type="hidden" name='orderNum' value="">
						<input type="hidden" name='cardNum' value="">
						<input type="hidden" name='cardName' value="">
						<input type="hidden" name='cardQuota' value="0">
						<input type="hidden" name='approvalNum' value="">
						
						
						<c:forEach var="pvo" items="${orderList }">
						<div class="products">
						
							<input type="hidden" id='id' value="${member.id}" >
							<input type="hidden" id='cartNum' value="${pvo.cartNum}">
							<input type="hidden" id='productNum' value="${pvo.productNum}">
							<input type="hidden" id='productName' name='productName' value="${pvo.productName }">
							<input type="hidden" id='productOption' value="${pvo.productOption }">
							<input type="hidden" id='productCnt' value="${pvo.productCnt }">
							<input type="hidden" id='price' value="${pvo.price * ((100 - pvo.discount) / 100)}">
							
						</div>
						</c:forEach>
						</form>
							
						
					</div>
				</div>



			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>
	<%@ include file="/common/footer.jspf"%>

</body>



<script>

//주소록보기 모달
$(document).on("click", ".addrList", function () {
    var id = $(this).data('id');
    console.log(id);
    
    $.ajax("getAddressList.do",{
    	type:"get",
    	data: id,
    	success: function(data){
    		console.log(data);
			console.log(data.length);
			let dispHtml = '';
			if(data.length == 0){
				dispHtml += "<tr>";
				dispHtml += '<td>';
				dispHtml += '<p>배송 가능한 주소정보가 존재하지 않습니다.\n배송지를 추가해 주세요.</p>';
				dispHtml += '</td>';
				dispHtml += '</tr>';
			} else {
				$.each(data, function(index, obj){
					dispHtml += "<tr>";
					dispHtml += '<td>';
					dispHtml += '<input type="radio" id="addr'+index+'" name="addr[]" value="'+this.addrGetter+','+this.postNum+','+this.addr+','+this.addrDetail+','+this.addrPhone+'">';
					dispHtml += '<label for="addr'+index+'"><p style="font-size: 25px;" id="getter">';
					dispHtml += this.addrGetter+'&nbsp&nbsp&nbsp';
						if(this.addrDefault == 'Y'){
							dispHtml += '<span class="badge badge-dark">기본배송지</span></p>';
						}
					dispHtml += '<p style="margin-bottom: 10px;" name="address">'+ this.addr + ' ' + this.addrDetail + '</p>';
					dispHtml += '<p style="margin: 0;" name="phone">'+ this.addrPhone + '</p>';
					dispHtml += '</label>';
					dispHtml += '</td>';
					dispHtml += '</tr>';
				});
			}
			$("#addrListModal").html(dispHtml);
    		
    	},
    	error : function(){
			alert("getAddressList 오류가 발생하였습니다.");
		}
    });
    
  //주소록 모달창 옵션 선택시 
    $(document).on("click", "#addrApply", function () {
    	//alert("주소 변경");
    	
    	var addr = document.getElementsByName('addr[]');
    	var addrs = '';
    	var address = '';
    	var phone= '';
    	console.log(addr);
    		
    	for(var i = 0; i< addr.length; i++){
    		if(addr[i].checked == true ){
    			console.log("체크된 밸류:"+addr[i].value);
    			addrs = addr[i].value;
    			address = addrs.split(",");
    			phone = address[4].split("-");
    		}
    	}
    	
    	$('#orderName').val(address[0]);
    	$('#postcode').val(address[1]);
    	$('#addr1').val(address[2]);
    	$('#addr2').val(address[3]);
    	$('#phone1').val(phone[0]);
    	$('#phone2').val(phone[1]);
        $('#phone3').val(phone[2]);
        
        $('#modal-addr').modal("hide"); 
    });
});


$(function(){
	sessionStorage.setItem('id', '${member.id}');	
	$("input[name='selectDel']").change(function(){
		if($("input[name='selectDel']:checked").val() == 'newPlace'){
			
			$('#orderName').val('');
	 		$('#postcode').val('');
			$('#addr1').val('');
			$('#addr2').val('');
			$('#phone1').val('010');
			$('#phone2').val('');
		    $('#phone3').val('');
		    
		} else if ($("input[name='selectDel']:checked").val() == 'oriPlace'){
			//alert('기본배송지 선택');
			$.ajax("getDefaultAddr.do",{
				type:"post",
				data: sessionStorage.getItem('id'),
				dataType: "json",
				success: function(data){
					let dispHtml1 = '';
					let dispHtml2 = '';
					let dispHtml3 = '';
					let phone = '';
					console.log(data);
					
					
					if (data.addrGetter == null)  {
						$('#orderName').val(sessionStorage.getItem('name'));
						if (sessionStorage.getItem('phone') != ''){
							phone = sessionStorage.getItem('phone').split("-");
							$('#phone1').val(phone[0]);
							$('#phone2').val(phone[1]);
						    $('#phone3').val(phone[2]);
						}
					} else {
							phone = data.addrPhone.split("-");
							
							/* 
							
							<div class="form-group1" id="form-group1">
								<label for="orderName">받으시는 분 <span class="red"> &#42;</span></label> 
								<input type="text" class="form-control" id="orderName" value="">
							</div>
							<div class="form-group4" id="form-group2">
								<label for="postcode">주소<span class='red'> &#42;</span></label>
								<div class="form-group2 row">
									<div class="col-xs-2">
										<input type="text" class="form-control" id="postcode" value="" style="display: inline;" 
											placeholder="우편번호" readonly="readonly" >
									</div>
									<div class="">
										<input type="button" class="whitebtn" id="" style="display: inline; margin-left: 10px;" 
											value="우편번호 찾기" style="width: 200px;" onclick="daumPostcode()">
									</div>
								</div>
								<input type="text" class="form-control" id="addr1" value=""
									placeholder="주소" readonly="readonly"> 
								<input
									type="text" class="form-control" id="addr2" value=""
									placeholder="상세주소">

							</div>
							
						</div>
					 */
							dispHtml1 += '<label for="orderName">받으시는 분 <span class="red"> &#42;</span></label>';
							dispHtml1 += '<input type="text" class="form-control" id="orderName" value="'+data.addrGetter+'">';
							
							dispHtml2 += '<label for="postcode">주소<span class="red"> &#42;</span></label>';
							dispHtml2 += '<div class="form-group2 row">';
							dispHtml2 += '<div class="col-xs-2">';
							dispHtml2 += '<input type="text" class="form-control" id="postcode" value="'+data.postNum+'" style="display: inline;" placeholder="우편번호" readonly="readonly" >';
							dispHtml2 += '</div>';
							dispHtml2 += '<div>';
							dispHtml2 += '<input type="button" class="whitebtn" id="" style="display: inline; margin-left: 10px;" value="우편번호 찾기" style="width: 200px;" onclick="daumPostcode()">';
							dispHtml2 += '</div>';
							dispHtml2 += '</div>';
							dispHtml2 += '<input type="text" class="form-control" id="addr1" value="'+data.addr+'" placeholder="주소" readonly="readonly"> ';
							dispHtml2 += '<input type="text" class="form-control" id="addr2" value="'+data.addrDetail+'" placeholder="상세주소">';
							
							dispHtml3 += '<select class="form-control" id="phone1" style="width: 32.5%;"  value="'+phone[0]+'">';
							dispHtml3 += '<option>010</option>';
							dispHtml3 += '<option>011</option>';
							dispHtml3 += '<option>016</option>';
							dispHtml3 += '<option>017</option>';
							dispHtml3 += '<option>018</option>';
							dispHtml3 += '<option>019</option></select>';
							dispHtml3 += '<input type="text" id="phone2" class="form-control" style="width: 33%;" value="'+phone[1]+'">';
							dispHtml3 += '<input type="text" id="phone3" class="form-control" style="width: 33%;" value="'+phone[2]+'">';
						
							$("#form-group1").html(dispHtml1);
							$("#form-group2").html(dispHtml2);
							$("#phoneSelect").html(dispHtml3);
						
					}
				},
				error:function(){
					alert("getDefaultAddr 오류가 발생하였습니다.");
				}
					
			});
		}
		
	});

});

window.onload = function(){
	sessionStorage.setItem('name', '${member.name}');
	sessionStorage.setItem('email', '${member.email}');
	sessionStorage.setItem('phone', '${member.phone}');	
	//기본배송지 띄워주기
	 $.ajax("getDefaultAddr.do",{
			type:"post",
			data: sessionStorage.getItem('id'),
			dataType: "json",
			success: function(data){
				let dispHtml1 = '';
				let dispHtml2 = '';
				let dispHtml3 = '';
				let phone = '';
				console.log(data);
				
				if (data.addrGetter == null) { //기본배송지가 없을때 회원정보로 띄우기
					$('#orderName').val(sessionStorage.getItem('name'));
					if (sessionStorage.getItem('phone') != ''){
						phone = sessionStorage.getItem('phone').split("-");
						$('#phone1').val(phone[0]);
						$('#phone2').val(phone[1]);
					    $('#phone3').val(phone[2]);
					}
				} else { //기본배송지 띄우기
					phone = data.addrPhone.split("-");
				
					dispHtml1 += '<label for="orderName">받으시는 분 <span class="red"> &#42;</span></label>';
					dispHtml1 += '<input type="text" class="form-control" id="orderName" value="'+data.addrGetter+'">';
					
					dispHtml2 += '<label for="postcode">주소<span class="red"> &#42;</span></label>';
					dispHtml2 += '<div class="form-group2 row">';
					dispHtml2 += '<div class="col-xs-2">';
					dispHtml2 += '<input type="text" class="form-control" id="postcode" value="'+data.postNum+'" style="display: inline;" placeholder="우편번호" readonly="readonly" >';
					dispHtml2 += '</div>';
					dispHtml2 += '<div>';
					dispHtml2 += '<input type="button" class="whitebtn" id="" style="display: inline; margin-left: 10px;" value="우편번호 찾기" style="width: 200px;" onclick="daumPostcode()">';
					dispHtml2 += '</div>';
					dispHtml2 += '</div>';
					dispHtml2 += '<input type="text" class="form-control" id="addr1" value="'+data.addr+'" placeholder="주소" readonly="readonly"> ';
					dispHtml2 += '<input type="text" class="form-control" id="addr2" value="'+data.addrDetail+'" placeholder="상세주소">';
					
					dispHtml3 += '<select class="form-control" id="phone1" style="width: 32.5%;"  value="'+phone[0]+'">';
					dispHtml3 += '<option>010</option>';
					dispHtml3 += '<option>011</option>';
					dispHtml3 += '<option>016</option>';
					dispHtml3 += '<option>017</option>';
					dispHtml3 += '<option>018</option>';
					dispHtml3 += '<option>019</option></select>';
					dispHtml3 += '<input type="text" id="phone2" class="form-control" style="width: 33%;" value="'+phone[1]+'">';
					dispHtml3 += '<input type="text" id="phone3" class="form-control" style="width: 33%;" value="'+phone[2]+'">';
				
					$("#form-group1").html(dispHtml1);
					$("#form-group2").html(dispHtml2);
					$("#phoneSelect").html(dispHtml3);
				}
			},
			error:function(){
				alert("getDefaultAddr 오류가 발생하였습니다.");
			}
				
		});
	 
/////////////////////////////////////////////////////////////////////	 
	 
	//페이먼트 value 변경시 
	var payment = document.getElementsByName('paymentTypeRadio');
	var payMethodValue = null;
	
		
		$('input[name=paymentTypeRadio]').change(function(){
			//alert("결제수단paymentTypeRadio 변경");
			for(var i = 0; i < payment.length; i++){
				//console.log("["+i+"]체크값 : " + payment[i].checked);
				if(payment[i].checked == true ){
					payMethodValue = payment[i].value;
					console.log("payMethodValue:"+payMethodValue);
				}
			}
		});
		
		
	
	//결제하기 버튼 눌렀을때 체크하기
	var payBtn = document.getElementById("payBtn");
	payBtn.onclick = function(){
		//alert("결제하기 버튼클릭");
		
		//배송지 입력 체크
		if($("#orderName").val() == '' || $("#postcode").val()== '' || $("#addr1").val()== ''
				||$("#phone2").val()== '' || $("#phone3").val()== ''){
			alert("배송지 정보의 필수항목을 입력해주세요."); 
			return false;
		}
			
		//결제수단 체크
		//var payment = document.getElementsByName('paymentType');
		//var payMethodValue = null;
		
		 for(var i = 0; i< payment.length; i++){
			if(payment[i].checked == true ){
				payMethodValue = payment[i].value;
				console.log("payMethodValue:"+payMethodValue);
			}
		}
		
		if(payMethodValue == null){
			alert("결제수단을 선택해 주세요."); 
			return false;
		}
		//alert("선택한 결제수단:"+payMethodValue);
		
		//구매자 동의 체크
		let agree = document.agreeForm.agree;
        if (agree.checked == false) {
            alert("구매자 동의에 체크해 주세요.");
            return false;
        }
        
   		//주문번호 생성
        var now = moment();
        var orderNum = 'S'+ now.format("YYYYMMDDHHmmss");
       	//var orderNum = 'S20221206111932';
        //alert(orderNum);
        
        //input value 값 세팅
        var orderName = document.getElementById('orderName').value;
        var orderAddr = document.getElementById('addr1').value +' '+ document.getElementById('addr2').value;
        var postcode = document.getElementById('postcode').value;
        var orderPhone = document.getElementById('phone1').value +'-'+ document.getElementById('phone2').value +'-'+ document.getElementById('phone3').value;
        var orderReq = document.getElementById('orderReq').value;
        var orderReq = document.getElementById('orderReq').value;
        var totalPrice = document.getElementById('totalPrice').value;
        var paymentType = payMethodValue;
        $("input[name='orderNum']").val(orderNum);
        $("input[name='orderName']").val(orderName);
        $("input[name='orderAddr']").val(orderAddr);
        $("input[name='postcode']").val(postcode);
        $("input[name='orderPhone']").val(orderPhone);
        $("input[name='orderReq']").val(orderReq);
        $("input[name='totalPrice']").val(parseInt(totalPrice));
        $("input[name='paymentType']").val(paymentType);
        
        
    	$(".products").each(function(index, element){
    		var idInput = $(element).find('#id');
    		idInput.attr('name','orders[' + index + '].id');
    		
    		var cartNumInput = $(element).find('#cartNum');
    		cartNumInput.attr('name','orders[' + index + '].cartNum');
    		
    		var productNumInput = $(element).find('#productNum');
    		productNumInput.attr('name','orders[' + index + '].productNum');
    		
    		var productNameInput = $(element).find('#productName');
    		productNameInput.attr('name','orders[' + index + '].productName');
    		
    		var productOptionInput = $(element).find('#productOption');
    		productOptionInput.attr('name','orders[' + index + '].productOption');
    		
    		var productCntInput = $(element).find('#productCnt');
    		productCntInput.attr('name','orders[' + index + '].productCnt');
    		
    		var priceInput = $(element).find('#price');
    		priceInput.attr('name','orders[' + index + '].price');
    		priceInput.attr('value', parseInt(priceInput.val()));
    		
    	});	
    	//input value 값 세팅 끝

        var totalPriceInt = document.getElementById('totalPrice').value;
        var productName = document.getElementById('productName').value;
       

    	var IMP = window.IMP; // 생략 가능
    	IMP.init("imp16211152"); // 예: imp00000000
    	
    	var phoneNum = sessionStorage.getItem('phone').replaceAll('-', '');
    	//alert(phoneNum);
    	if (payMethodValue == '카드결제'){
    		requestPay();
    	} else if (payMethodValue == '무통장입금') {
    		console.log(payMethodValue);
    		document.payForm.submit();
    	}
    	
    	function requestPay() {
    	    // IMP.request_pay(param, callback) 결제창 호출
    	    IMP.request_pay({ // param
    	        pg: "html5_inicis",
    	        pay_method: "card",
    	        merchant_uid: orderNum,
    	        name: productName,
    	        //amount: 100,
    	        amount: totalPriceInt,
    	        buyer_email: sessionStorage.getItem('email'),
    	        buyer_name: sessionStorage.getItem('name'),
    	        buyer_tel: phoneNum,
    	        card_quota: "[]",
    	    }, function (rsp) { // callback
    	    	console.log(rsp);
    	        if (rsp.success) {
    	           //alert("결제성공 -> 고유ID : "+rsp.imp_uid+" / 상점거래ID : " + rsp.merchant_uid + "카드 승인번호" + rsp.apply_num+"/카드사:" + rsp.card_name+ "/카드번호:"+rsp.card_number +"/할부:" +rsp.card_quota);
    	           $("input[name='cardNum']").val(rsp.card_number);
    	           $("input[name='cardName']").val(rsp.card_name);
    	           $("input[name='cardQuota']").val(rsp.card_quota);
    	           $("input[name='approvalNum']").val(rsp.apply_num);
    	         
    	           document.payForm.submit();
    	           
    	        } else {
    	            // 결제 실패 시 로직
    	            var msg = '결제에 실패하였습니다.';
     				msg += '에러내용 : ' + rsp.error_msg;
     				//alert(msg);
     				if(rsp.error_msg == '사용자가 결제를 취소하셨습니다'){
     					return;
     					
     				}else {
     					location.href='orderFail.do?errorMsg='+rsp.error_msg;
      					
     				}
    	        }
    	    });
    	  }
        
	}; 
};
</script>

</html>