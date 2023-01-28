<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

//금액 콤마 표시
function numberWithCommas(val) {
	   return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

//상품1개 삭제하기  ----------------------------------------------------
function delete_go(frm){
	if(confirm('선택한 상품을 장바구니에서 삭제하시겠습니까?:' )){
		frm.action="deleteCart.do"
		frm.submit();
	};

}; 
//상품 1개 주문하기 ----------------------------------------------------
function order_go(frm){
	frm.action="getOrderPage.do"
	frm.submit();
}


//배송비 안내 팝오버-------------------------------------------------------
$(function () {
  $('[data-toggle="popover"]').popover({html:true});
  
})


</script>
</head>
<style>
#contentAll {
	font-size: 18px;
}
.productView{
	color: black;
}
.productView:hover {
	text-decoration: none;
	color: black;
 }
.center {
	text-align: center;
}

.right {
	text-align: right;
}

.subtitle {
	font-size: 2em;
	font-weight: 600;
}

thead>tr {
	background-color: #F7F7F7;
}

.cartlist table {
	width: 100%;
	border-top: 2px solid black;
	text-align: center;
	vertical-align: middle;
}

.cartlist th {
	height: 55px;
	font-weight: normal;
}

.cartlist td {
	border-bottom: 2px solid #F7F7F7;
	height: 160px;
	padding: 10px;
	vertical-align: middle;
}

input[type=checkbox] {
	width: 25px;
	height: 25px;
	margin: 5px;
	accent-color: black;
}

.price table {
	width: 100%;
	border-top: 2px solid black;
	text-align: center;
	vertical-align: middle;
}

.price td {
	border-bottom: 2px solid #F7F7F7;
	height: 75px;
	padding: 10px;
	vertical-align: middle;
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
.modal-header {
	background-color: black;
	color: white;
	height: 65px;
}

#modal-option .modal-footer {
	height: 80px;
	border-top: none;
	text-align: center;
}

#modal-option .whitebtn,#modal-option .blackbtn {
	width: 200px; height: 50px;
	display :inline-block;
	
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
	margin: 0;
}
#qty .ct_qty:hover {
	text-decoration: none;
}

#modal-body .row {
	margin-left: 0;
	margin-right: 0;
}

</style>

<body>

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
			<p class="center py-5 my-5"
				style="font-weight: bold; font-size: 3em;">장바구니</p>
				<div>
					<div style="float: left;">
						<span class="subtitle">담은상품</span> 총 ${cartCnt}개
					</div>
					<div style="float: right; width: 300px;">
					<form method="post" class="deleteForm" >
						<input type="button" class="whitebtn" value="선택상품 삭제"
							style="width: 140px; height: 45px;" id="selectDeleteBtn">
						<input type="button" class="whitebtn" value="품절상품 삭제" id="soldoutDeleteBtn"
							style="width: 140px; height: 45px; margin-left: 15px;">
					</form>
					</div>
					
				</div>
				<br>
				<div class="cartlist mt-5">
<!-- <c:set var="totalPrice" value="0" /> -->				
					<table>
						<thead>
							<tr>
								<th style="width: 5%;"><input type="checkbox" name="allCheck" autocomplete="off" id="allCheck"></th>
								<th style="width: 40%;">상품정보</th>
								<th style="width: 10%;">옵션 변경</th>
								<th style="width: 15%;">상품금액</th>
								<th style="width: 20%;">합계</th>
								<th style="width: 10%;">주문관리</th>
							</tr>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${empty cartlist }">
								<tr>
									<td colspan="6">
										<h4>장바구니에 담긴 상품이 없습니다.</h4>
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="vo" items="${cartlist }">
								
									<form  method="post" name="oneProduct" >
										<tr class="cartinfo">
										
											<td><input type="checkbox" autocomplete="off" name="cartProduct" id="cartProduct" value="${vo.price * ((100 - vo.discount) / 100) * vo.productCnt }" class="cartProduct"></td>
											<td>
												<div class="inline ">
													<a class="productView" href="getProduct.do?productnum=${vo.productNum }">
														<img class="mr-3"
															src="${pageContext.request.contextPath}/imgs/${vo.photo }"
															width="90" height="90" style="float: left" alt="상품사진">
													</a>
															
														<div class="my-3" style="text-align: left; display: inline; font-size: 15px;">
															<p style="font-weight: bold;"><a class="productView" href="getProduct.do?productnum=${vo.productNum }">${vo.productName }</a></p>
															<p>옵션<span style="color:grey;"> ${vo.productOption }</span>
															&nbsp;&nbsp;&nbsp;&nbsp;수량 <span style="color:grey;"> ${vo.productCnt }</span></p>
														</div>
												</div>
											</td>
											<td><input type="button" class="optionChange whitebtn"
												data-toggle="modal" data-target="#modal-option"
												style="width: 90px; height: 40px;" value="옵션변경" data-id="${vo.cartNum}">
												
											</td>
											<td>
												<c:if test="${vo.discount eq '0' }"> <!-- 할인율이 0일때 -->
													<span class="price-style" ><fmt:formatNumber value="${vo.price }" pattern="#,###"/></span>원
												</c:if>
												
												<c:if test="${vo.discount ne '0' }"> <!-- 할인율이 있을때 -->
												<p class="real-price"><fmt:formatNumber pattern="#,###" value="${vo.price }" />원</p>
												<p><span class="price-style"><fmt:formatNumber pattern="#,###" value="${vo.price * (100 - vo.discount) / 100 }" /></span>원</p>
												</c:if>
											</td>
											<td><span class="price-style"><fmt:formatNumber value="${vo.price * ((100 - vo.discount) / 100) * vo.productCnt }" pattern="#,###"/></span>원</td>
											<td>
												
												<input type="hidden" name="orders[0].cartNum" id="cartNum" value="${vo.cartNum }"> 
	 	 										<input type="hidden" name="orders[0].productNum" id="productNum" value="${vo.productNum }"> 
	 	 										<input type="hidden" name="orders[0].productCnt" id="productCnt" value="${vo.productCnt }"> 
	 	 										<input type="hidden" name="orders[0].productOption" id="productOption" value="${vo.productOption }"> 
	 	 										<input type="hidden" name="orders[0].discount" id="discount" value="${vo.discount }"> 
												<input type="button" class="blackbtn my-1" value="주문하기" 
													style="width: 200px; height: 50px;" onclick="order_go(this.form)"><br>
												
												<input type="hidden" name="cartNum" value="${vo.cartNum }"> 
												<input type="button"  class="whitebtn my-1" 
													style="width: 200px; height: 50px;" value="삭제" onclick="delete_go(this.form)">
											</td>
										</tr>
									</form>

									</c:forEach>
								</c:otherwise>
								</c:choose>
						</tbody>
					</table>
				</div>
			
				<div class="price mt-5 mb-4">
				<!-- <div style="text-align: right; font-size: 16px;margin-bottom:10px;"><span style="color:red;">&#42;</span> 상품 합계금액 10만원 이상 구매시 무료배송</div> -->
					<table>
						<tr style="font-size: 20px;">
							<td>상품 합계금액</td>
							<td></td>
							<td>배송비 
								<i class="bi bi-question-circle" style="cursor: pointer;" data-toggle="popover" title="" 
								data-content="상품 합계금액 10만원 이상 <br>구매시 무료배송" data-original-title="<b>배송비 안내</b>" aria-describedby="popover926843">
					   			</i>
							</td>
							<td></td>
							<td>총 주문금액</td>
						</tr>
								<tr>
									<td><span class="price-style" id="total">0</span>원</td>
									<td><span class="price-style">+</span></td>
									<td><span class="price-style" id="shipping" >0</span>원</td>
									<td><span class="price-style">=</span></td>
									<td style="color: red;"><span class="price-style" id="totalPS">0</span>원</td>
								</tr>
					</table>
				</div>
				<button type="button" class="whitebtn"
					style="width: 150px; height: 50px;" onclick="location.href='ProductList.do'">쇼핑계속하기 ></button>
				<div class="center py-4">
				<form action="getOrderPage.do" method="post" class="orderForm">
					<input type="button" class="whitebtn" id="selectOrderBtn"
						style="width: 320px; height: 70px; margin: 15px;" value="선택상품주문">
					<input type="button" class="blackbtn" id="AllOrderBtn"
						style="width: 320px; height: 70px; margin: 15px;" value="전체상품주문">
				</form>
				</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>
	</div>
	
<!-- 옵션변경 모달  -->
<div class="modal fade" id="modal-option" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">옵션 및 수량 변경</h5>
		
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true" style="color: white;">&times;</span>
				</button>
			</div>
		<form action="updateCart.do" id="updateCart" name="updateCart" class="updateCart">
			<div class="modal-body" id="modal-body">
					<p style='font-weight:bold; font-size:15px;' id="productNameModal">상품명</p>
					<div class="form-group row" style="height:50px;">
						<div class="form-check form-check-inline ">
							<label style="width:60px; height:50px; margin:0; display: inline; padding-top: 13px; " for="optionSelect" >옵션</label>
							<select class="custom-select"  id="optionSelect" name="productOption" style="width:350px; height:50px;">
									
							</select>
						</div>
					</div>
					<div class="form-group row" style="height:50px;">
					
						<label style="width:60px;height:50px; margin:0;padding-top: 13px;">수량</label>
						<div class="">
							<span class="qty" id="qty"> 
								<span class="minus"> 
									<!-- <a href="javascript:change_qty('m')" class="minus">  -->
									<input type="button" value="-" class="minus" onclick="change_qty('m')"
									style="border:none; width: 50px; height: 50px; margin-right: -5px; " >
									<!-- </a> -->
								</span> 
								<input type="text" class="ct_qty" id="ct_qty" value="1" readonly="readonly" name="productCnt"
									style="background-color: white; width: 50px; height: 50px; text-align: center; border: 1px solid #F0F0F0;">
								<span class="plus"> 
									<!-- <a href="javascript:change_qty('p')">  -->
									<input type="button" value="+" onclick="change_qty('p')"
									style="border: none; width: 50px; height: 50px; margin-left: -5px;">
									<!-- </a> -->
								</span>
							</span>
						</div>
				</div>
				
			</div>
			<div class="modal-footer d-flex justify-content-center" >
			
				<input type="button" class="whitebtn" data-dismiss="modal" id="modalCancle" value="취소"> 
				<input type="button" class="blackbtn" value="변경" id="updateCartBtn">
				<input type="hidden" name="cartNum" class="" value="0" id="modalCartNum">
				<input type="hidden" name="productNum" class="" value="0" id="modalProductNum">
			
			</div>
		</form>
		</div>
	</div>
</div>
<!-- 옵션변경 모달  끝-->

	<%@ include file="/common/footer.jspf"%>

</body>
<script>
//옵션변경 모달창 수량변경 -------------------------------------------------------------
Number.prototype.format = function() {
	if (this == 0)
		return 0;
	

	var reg = /(^[+-]?\d+)(\d{3})/;
	var n = (this + '');

	while (reg.test(n))
		n = n.replace(reg, '$1' + ',' + '$2');

	return n;
};

String.prototype.format = function() {
	var num = parseFloat(this);
	if (isNaN(num))
		return "0";

	return num.format();
};


function change_qty(t) {

	//var min_qty = '수량버튼'*1;
	var min_qty = 1;
	var this_qty = $("#ct_qty").val() * 1;
//	var max_qty; // 현재 재고
	
	console.log("수량 버튼 눌렀을때 max_qty : "+ max_qty);
	console.log("수량 버튼 눌렀을때 this_qty : "+ this_qty);
	if (t == "m") {
		this_qty -= 1;
		if (this_qty < min_qty) {
			//alert("최소구매수량 이상만 구매할 수 있습니다.");
			alert("수량은 1개 이상 입력해 주십시오.");
			return;
		}
	} else if (t == "p") {
		this_qty += 1;
		if (this_qty > max_qty) {
			alert("재고가 부족합니다.");
			return;
		}
	}

	$(".ct_qty").val(this_qty);
}	
//선택삭제 버튼 -------------------------------------------------------------------
$("#selectDeleteBtn").on("click", function(){
	let form_contents ='';
	if($("#cartProduct:checked").length == 0){
		alert('삭제할 상품을 선택하세요.');
		return;
	} else {
		if(confirm("선택한 상품을 장바구니에서 삭제하시겠습니까?")){
			$(".cartinfo").each(function(index, element){
				if($(element).find("#cartProduct").is(":checked") === true){
					let cartNum = $(element).find("#cartNum").val();
					let cartNum_input = "<input name='cartNum' type='hidden' value='" + cartNum + "'>";
					form_contents += cartNum_input;
				}
			});
			$(".deleteForm").html(form_contents);
			$(".deleteForm").attr("action","deleteCart.do").submit();
		}
	}
});
//품절삭제 버튼 ---------------------------------------------------------------------------------------------
$("#soldoutDeleteBtn").on("click", function(){
	$.ajax("deleteCartSoldout.do",{
		type:"post",
		dataType: "text",
		success: function(result){
					if(result == '1'){
						alert("품절된 상품이 삭제되었습니다.");
						location.href="getCartList.do";
					} else {
						alert("품절된 상품이 없습니다.");
					}
				},
		error: function(){
			alert("deleteCartSoldout 오류가 발생하였습니다.");
		}
	});
});

//전체상품 주문 페이지 이동 --------------------------------------------------------------------------------------
$("#AllOrderBtn").on("click", function(){
	let form_contents ='';
	let i = 0;
	
	$(".cartinfo").each(function(index, element){
		let cartNum = $(element).find("#cartNum").val();
		let productNum = $(element).find("#productNum").val();
		let productCnt = $(element).find("#productCnt").val();
		let productOption = $(element).find("#productOption").val();
		let discount = $(element).find("#discount").val();
		
		let cartNum_input = "<input name='orders[" + i + "].cartNum' type='hidden' value='" + cartNum + "'>";
		form_contents += cartNum_input;
		
		let productNum_input = "<input name='orders[" + i + "].productNum' type='hidden' value='" + productNum + "'>";
		form_contents += productNum_input;
		
		let productCnt_input = "<input name='orders[" + i + "].productCnt' type='hidden' value='" + productCnt + "'>";
		form_contents += productCnt_input;
		
		let productOption_input = "<input name='orders[" + i + "].productOption' type='hidden' value='" + productOption + "'>";
		form_contents += productOption_input;
		
		let discount_input = "<input name='orders[" + i + "].discount' type='hidden' value='" + discount + "'>";
		form_contents += discount_input;
		
		i += 1;
	});	
	$(".orderForm").html(form_contents);
	$(".orderForm").submit();
});

//선택상품 주문 넘기기 --------------------------------------------------------------------------------------------------	
$("#selectOrderBtn").on("click", function(){
	if($("#cartProduct:checked").length == 0){
		alert('주문할 상품을 선택하세요.');
		return;
	} else {
		
		let form_contents ='';
		let i = 0;
		
		$(".cartinfo").each(function(index, element){
			
			if($(element).find("#cartProduct").is(":checked") === true){	//체크여부
				
				let cartNum = $(element).find("#cartNum").val();
				let productNum = $(element).find("#productNum").val();
				let productCnt = $(element).find("#productCnt").val();
				let productOption = $(element).find("#productOption").val();
				let discount = $(element).find("#discount").val();
				
				let cartNum_input = "<input name='orders[" + i + "].cartNum' type='hidden' value='" + cartNum + "'>";
				form_contents += cartNum_input;
				
				let productNum_input = "<input name='orders[" + i + "].productNum' type='hidden' value='" + productNum + "'>";
				form_contents += productNum_input;
				
				let productCnt_input = "<input name='orders[" + i + "].productCnt' type='hidden' value='" + productCnt + "'>";
				form_contents += productCnt_input;
				
				let productOption_input = "<input name='orders[" + i + "].productOption' type='hidden' value='" + productOption + "'>";
				form_contents += productOption_input;
	
				let discount_input = "<input name='orders[" + i + "].discount' type='hidden' value='" + discount + "'>";
				form_contents += discount_input;
				
				i += 1;
				
			}
		});	
	
		$(".orderForm").html(form_contents);
		$(".orderForm").submit();
	}
});


//체크박스 전체선택 선택해제 -------------------------------------------------
$(function(){
	computeTotalPrice(checklist);
	
	var checklist = $(".cartProduct");
	var rowCnt = checklist.length;
	var totalPrice = 0;
	var shipping = 3000;
	var totalPS = 0;
	
	$("#allCheck").click(function(){
		console.log("체크박스 클릭 이벤트 발생");
		for (var i = 0; i< checklist.length; i++){
			checklist[i].checked = this.checked;
		}
		if($("#allCheck")[0].checked == true){
			totalPrice = 0;
		}
		
		$(".cartProduct").trigger("change");
		
		if ($("#allCheck")[0].checked == false ){
			totalPrice = 0;
		}
		
	});
	
	$(".cartProduct").click(function(){
		if($(".cartProduct:checked").length == rowCnt){
			$("#allCheck")[0].checked = true;
		} else{
			$("#allCheck")[0].checked = false;
		}
	});

	
	$(".cartProduct").change(computeTotalPrice);

	function computeTotalPrice(){
		console.log("this:" );
		console.log("this.checked: " + this.checked);
		console.log("this.value: " + this.value);
		console.log('$(this).prop("checked") : ' + $(this).prop("checked"));
	
		shipping = 3000;
		
		if (this.checked) {
			totalPrice += parseInt(this.value);
			console.log(totalPrice);
			if(totalPrice >= 100000) {
				shipping = 0;
			} 
		} else {
			totalPrice -= parseInt(this.value);
			if(totalPrice >= 100000) {
				shipping = 0;
			} 
		}
		
		if($(".cartProduct:checked").length == 0){
			totalPrice = 0;
			shipping = 0;
		}
		totalPS = totalPrice + shipping;
		$("#total").text(numberWithCommas(totalPrice));
		$("#shipping").text(numberWithCommas(shipping));
		$("#totalPS").text(numberWithCommas(totalPS));
	} 
	
});


//모달창 옵션값 전달 ------------------------------------------------------------------

var max_qty; //현재재고
var oriCnt = 0; // 원래 옵션 선택 갯수
var productNum;
var cnt = document.querySelector("#ct_qty")

//var options;
//var option;
var oriOption;
var optionSelect = document.querySelector("#optionSelect");

function getModal(){
	$.ajax("getOneCart.do",{
		type:"post",
		data: {"cartNum" : cartNum},
		dataType: "json",
		async: false,
		success: function(data){
					console.log(data);
					
					$("#productNameModal").html(data.productName); //상품명 
					//oriCnt = 0;
					oriCnt = data.productCnt; //원래 선택옵션
				    console.log("원래선택 수량 oriCnt:" + oriCnt);
				    $("#ct_qty").val(oriCnt);
				    $("#modalProductNum").val(oriCnt);
				   
					
				    productNum.setAttribute("value", data.productNum);
				    var options = data.optionName;
				    var option = options.split(",");
				    oriOption = data.productOption;
				    
				    //console.log(options);
				    optionSelect.options.length = 0;
				    for (var i=0; i < option.length; i++) {
				    	if(option != '') {
				    		var optionTag = document.createElement('option');
					   		var optionTagText = document.createTextNode(option[i]);
					   		optionTag.value = option[i]; 
					    	optionTag.appendChild(optionTagText);
					    	
					    	if (option[i] == oriOption) {
					    		optionTag.setAttribute("selected", true);
					    	}
					   		optionSelect.appendChild (optionTag);
					   	}
				    } 
					return;
				},
		error: function(){
			alert("getOneCart 오류가 발생하였습니다.");
		}
	});
}

function cntCheck(){
	$.ajax("cntCheck.do",{
		type:"post",
		data: $(".updateCart").serialize(),
		dataType: "text",
		async: false,
		success: function(result){
					console.log('cntCheck 실행  / 남은재고: '+ result);
					max_qty = result;
				},
		error: function(){
			alert("cntCheck 오류가 발생하였습니다.");
		}
	});

}
//-----------------------------------------------------
$(document).on("click", ".optionChange", function () {
	console.log("------------------옵션변경 모달창 클릭----------");
	
    cartNum = $(this).data('id');
	$('#modalCartNum').val(cartNum);
    //console.log(cartNum);
    
    productNum = document.querySelector("#modalProductNum")
    productNameModal = document.querySelector("#productNameModal")
    
	getModal();
    
    console.log("겟 모달 후 인풋 cnt 값 :"+cnt.value);
 
//옵션 재고 체크 -------------------------------------------------------------
	 
	cntCheck();
	
	$("#optionSelect").change(function(){
		
		cntCheck();
		$("#ct_qty").val(1);
		console.log("옵션체인지 이벤트 실행 후  cnt 값:" + cnt.value);
		console.log("옵션체인지 이벤트 실행 후  max_qty 값:" + max_qty);
	});
	
	console.log("max_qty:"+max_qty); 
});

//옵션 변경시 중복 체크 ------------------------------------------------
$(document).on("click", "#updateCartBtn", function () {
	if (oriOption == optionSelect.value & oriCnt == cnt.value){
		alert("이미 선택된 옵션입니다.");
		return;
	} else if(oriOption == optionSelect.value & oriCnt != cnt.value){
		document.updateCart.submit();
	} else {
		$.ajax("cartCheck.do",{
			type:"post",
			data: $(".updateCart").serialize(),
			dataType: "text",
			success: function(result){
						if(result == 'o'){ //동일상품(+동일옵션)이 장바구니에 있음
							console.log("oriCnt: "+oriCnt);
							console.log("Cnt: "+cnt.value);
							alert("이미 선택된 옵션입니다.");
							return;
						} else { //동일상품(+동일옵션)이 장바구니에 없음
							if ($("#ct_qty").val()*1 > max_qty){
								if(max_qty == 0){
									alert("품절된 상품입니다.")
									return;
								}
								alert("재고가 부족합니다.")
								$("#ct_qty").val(max_qty);
								return;
							} else {
								document.updateCart.submit();
								return;
							}
					}
			},
			error: function(){
				alert("cartCheck 오류가 발생하였습니다.");
			}
		});
		
	}
	
	
});

</script>
</html>
