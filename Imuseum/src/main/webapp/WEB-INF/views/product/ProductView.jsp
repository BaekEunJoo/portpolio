<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/common/style.jspf"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- <script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script> -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="google-site-verification"
	content="IE2hToDnQFmj0qovhKUWmqnaQyMPi7QndNEDR6uoVpI">
<link rel="icon" href="/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;400;500;600;700;800;900&amp;display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<link rel="stylesheet" href="common/css/productview.css">
<link rel="stylesheet" href="common/css/cardmodal.css">
<script type="text/javascript" async=""
	src="https://www.google-analytics.com/analytics.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- <script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAvnLt4QUXB59ZsNU2mzaeLmPhniiV0QnE&amp;language=en"></script> -->
<title>상품상세페이지</title>
<style>
html {
	scroll-behavior: smooth;
}

.snb-area {
	position: sticky;
	top: 60px;
	z-index: 10000;
}
#review-list-area .star{
   color: #E3242B;
}
.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: #E3242B;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}
</style>
<script type="text/javascript">

	$(function() {
		$(window).on('scroll', function() {
			var scrollsection = window.pageYOffset;
			var introTop = document.querySelector("#introduction").offsetTop;
			var reviewTop = document.querySelector("#review").offsetTop;
			var inquiryTop = document.querySelector("#inquiry").offsetTop;
			var guideTop = document.querySelector("#guide").offsetTop;
			var relatedTop = document.querySelector("#related").offsetTop;
			var snbTop = document.querySelector(".snb-area").offsetTop;
			console.log(snbTop);
			console.log(scrollsection);
			if (snbTop < scrollsection) {
				$(".sticky-area").attr("class", "sticky-area on");
				console.log("여기서 붙이기");
			} else if (scrollsection < snbTop) {
				$(".sticky-area").attr("class", "sticky-area");
			}
			if (0 <= scrollsection && scrollsection < reviewTop) {
				$("#menu1").addClass("on");
				$("#menu2").removeClass("on");
				$("#menu3").removeClass("on");
				$("#menu4").removeClass("on");
				$("#menu5").removeClass("on");
			} else if (scrollsection < inquiryTop) {
				$("#menu1").removeClass("on");
				$("#menu2").addClass("on");
				$("#menu3").removeClass("on");
				$("#menu4").removeClass("on");
				$("#menu5").removeClass("on");
			} else if (scrollsection < guideTop) {
				$("#menu1").removeClass("on");
				$("#menu2").removeClass("on");
				$("#menu3").addClass("on");
				$("#menu4").removeClass("on");
				$("#menu5").removeClass("on");
			} else if (scrollsection < relatedTop) {
				$("#menu1").removeClass("on");
				$("#menu2").removeClass("on");
				$("#menu3").removeClass("on");
				$("#menu4").addClass("on");
				$("#menu5").removeClass("on");
			} else {
				$("#menu1").removeClass("on");
				$("#menu2").removeClass("on");
				$("#menu3").removeClass("on");
				$("#menu4").removeClass("on");
				$("#menu5").addClass("on");
			}
		});
	});

	$(function() {
		$("#photo1")
				.on(
						"click",
						function() {
							let dispHtml = "<img src='${pageContext.request.contextPath}/imgs/${product.photo1 }' alt='${product.productname }'>";
							$("#photoarea").html(dispHtml);
						});
	});
	$(function() {
		$("#photo2")
				.on(
						"click",
						function() {
							let dispHtml = "<img src='${pageContext.request.contextPath}/imgs/${product.photo2 }' alt='${product.productname }'>";
							$("#photoarea").html(dispHtml);
						});
	});
	$(function() {
		$("#photo3")
				.on(
						"click",
						function() {
							let dispHtml = "<img src='${pageContext.request.contextPath}/imgs/${product.photo3 }' alt='${product.productname }'>";
							$("#photoarea").html(dispHtml);
						});
	});
	$(function() {
		$("#photo4")
				.on(
						"click",
						function() {
							let dispHtml = "<img src='${pageContext.request.contextPath}/imgs/${product.photo4 }' alt='${product.productname }'>";
							$("#photoarea").html(dispHtml);
						});
	});
	
	
//--------------------------옵션 클릭시 재고 체크------------------------------------------	
		
	var cnt = 0;
	function cntCheck(selectValue){
		$.ajax("cntCheck.do",{
			type:"get",
			data: {"productNum": sessionStorage.getItem('productNum'),
					"productOption" : selectValue},
			dataType: "text",
			async: false,
			success: function(result){
						cnt = result;
						console.log("cntCheck 후 cnt:" + selectValue +","+ cnt);
					},
			error: function(){
				alert("cntCheck 오류가 발생하였습니다.");
			}
		});
	
	}	
	
	$(function() {
		var pp = $("#pp").text();
		pp = pp.replace(",", "");
		var productprice = parseInt(pp);
		$("#selectbox").on("change", function() {
			var select = document.getElementById("selectbox");
			// select element에서 선택된 option의 value가 저장된다.
		    var selectValue = select.options[select.selectedIndex].value;
			
		    cntCheck(selectValue);
		    
			console.log("셀렉박스 체인지 펑션 후 cnt :" +selectValue +","+ cnt);
			if (cnt < 1){
				alert("해당 옵션은 재고가 소진 되어 선택 불가능 합니다.");
				return;
			}
			
			console.log(productprice);
			console.log(pp);
			var optionname = $("#selectbox option:selected").val();
			console.log(optionname);
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			if (optionname == '${option[0].optionname}') {
				if ($('#optionarea0').is(':visible') == true){
					return;
				}
				$("#optionarea0").show();
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			}
			if (optionname == '${option[1].optionname}') {
				if ($('#optionarea1').is(':visible') == true){
					return;
				}
				$("#optionarea1").show();
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			}
			if (optionname == '${option[2].optionname}') {
				if ($('#optionarea2').is(':visible') == true){
					return;
				}
				$("#optionarea2").show();
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			}
			if (optionname == '${option[3].optionname}') {
				if ($('#optionarea3').is(':visible') == true){
					return;
				}
				$("#optionarea3").show();
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			}
			if (optionname == '${option[4].optionname}') {
				if ($('#optionarea4').is(':visible') == true){
					return;
				}
				
				$("#optionarea4").show();
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			}
		});
		
		$("#pluscnt0").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt0").val();
			var opcnt = $("#optioncnt0").val();
			console.log(opcnt);
			var numbercv = parseInt(cvvalue);
			var numberopcnt = parseInt(opcnt);
			console.log(numbercv);
			console.log(numberopcnt);
			if (numbercv < numberopcnt) {
				var cvplus = numbercv + 1;
				$("#cnt0").val(cvplus);
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("재고 소진");
			}
		});
		$("#minuscnt0").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt0").val();
			var numbercv = parseInt(cvvalue);
			console.log(numbercv);
			if (numbercv > 1) {
				var cvminus = numbercv - 1;
				$("#cnt0").val(cvminus);
				var updatetotal = nowtotal - productprice;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("1개의 수량부터 주문 가능합니다.");
			}
		});
		$("#delete0").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt0").val();
			var numbercv = parseInt(cvvalue);
			var deleteprice = productprice * numbercv;
			var updatetotal = nowtotal - deleteprice;
			result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#totalprice").text(result);
			$("#optionarea0").hide();
			$("#cnt0").val(1);
		});

		$("#pluscnt1").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt1").val();
			var opcnt = $("#optioncnt1").val();
			console.log(opcnt);
			var numbercv = parseInt(cvvalue);
			var numberopcnt = parseInt(opcnt);
			console.log(numbercv);
			console.log(numberopcnt);
			if (numbercv < numberopcnt) {
				var cvplus = numbercv + 1;
				$("#cnt1").val(cvplus);
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("재고 소진");
			}
		});
		$("#minuscnt1").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt1").val();
			var numbercv = parseInt(cvvalue);
			console.log(numbercv);
			if (numbercv > 1) {
				var cvminus = numbercv - 1;
				$("#cnt1").val(cvminus);
				var updatetotal = nowtotal - productprice;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("1개의 수량부터 주문 가능합니다.");
			}
		});
		$("#delete1").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt1").val();
			var numbercv = parseInt(cvvalue);
			var deleteprice = productprice * numbercv;
			var updatetotal = nowtotal - deleteprice;
			result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#totalprice").text(result);
			$("#optionarea1").hide();
			$("#cnt1").val(1);
		});

		$("#pluscnt2").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt2").val();
			var opcnt = $("#optioncnt2").val();
			console.log(opcnt);
			var numbercv = parseInt(cvvalue);
			var numberopcnt = parseInt(opcnt);
			console.log(numbercv);
			console.log(numberopcnt);
			if (numbercv < numberopcnt) {
				var cvplus = numbercv + 1;
				$("#cnt2").val(cvplus);
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("재고 소진");
			}
		});
		$("#minuscnt2").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt2").val();
			var numbercv = parseInt(cvvalue);
			console.log(numbercv);
			if (numbercv > 1) {
				var cvminus = numbercv - 1;
				$("#cnt2").val(cvminus);
				var updatetotal = nowtotal - productprice;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("1개의 수량부터 주문 가능합니다.");
			}
		});
		$("#delete2").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt2").val();
			var numbercv = parseInt(cvvalue);
			var deleteprice = productprice * numbercv;
			var updatetotal = nowtotal - deleteprice;
			result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#totalprice").text(result);
			$("#optionarea2").hide();
			$("#cnt2").val(1);
		});
		
		$("#pluscnt3").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt3").val();
			var opcnt = $("#optioncnt3").val();
			console.log(opcnt);
			var numbercv = parseInt(cvvalue);
			var numberopcnt = parseInt(opcnt);
			console.log(numbercv);
			console.log(numberopcnt);
			if (numbercv < numberopcnt) {
				var cvplus = numbercv + 1;
				$("#cnt3").val(cvplus);
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("재고 소진");
			}
		});
		$("#minuscnt3").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt3").val();
			var numbercv = parseInt(cvvalue);
			console.log(numbercv);
			if (numbercv > 1) {
				var cvminus = numbercv - 1;
				$("#cnt3").val(cvminus);
				var updatetotal = nowtotal - productprice;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("1개의 수량부터 주문 가능합니다.");
			}
		});
		$("#delete3").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt3").val();
			var numbercv = parseInt(cvvalue);
			var deleteprice = productprice * numbercv;
			var updatetotal = nowtotal - deleteprice;
			result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#totalprice").text(result);
			$("#optionarea3").hide();
			$("#cnt3").val(1);
		});
	
		$("#pluscnt4").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt4").val();
			var opcnt = $("#optioncnt4").val();
			console.log(opcnt);
			var numbercv = parseInt(cvvalue);
			var numberopcnt = parseInt(opcnt);
			console.log(numbercv);
			console.log(numberopcnt);
			if (numbercv < numberopcnt) {
				var cvplus = numbercv + 1;
				$("#cnt4").val(cvplus);
				var updatetotal = productprice + nowtotal;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("재고 소진");
			}
		});
		$("#minuscnt4").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt4").val();
			var numbercv = parseInt(cvvalue);
			console.log(numbercv);
			if (numbercv > 1) {
				var cvminus = numbercv - 1;
				$("#cnt4").val(cvminus);
				var updatetotal = nowtotal - productprice;
				result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				$("#totalprice").text(result);
			} else {
				alert("1개의 수량부터 주문 가능합니다.");
			}
		});
		$("#delete4").on("click", function() {
			var ee = $("#totalprice").text();
			ee = ee.replace(",", "");
			var nowtotal = parseInt(ee);
			var cvvalue = $("#cnt4").val();
			var numbercv = parseInt(cvvalue);
			var deleteprice = productprice * numbercv;
			var updatetotal = nowtotal - deleteprice;
			result = updatetotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			$("#totalprice").text(result);
			$("#optionarea4").hide();
			$("#cnt4").val(1);
		});
	});
</script>
<script>
	
	var count = 0;
	$(document).on("click", ".btn-toggle", function() {
		count++;
		console.log("클릭됨");
		var discount = $("#discount").val();
		var discountnum = parseInt(discount);
		console.log("discount = " + discount)
		var beforesale = $(".beforesale").text();
		beforesale = beforesale.replace(",", "");
		var beforevalue = parseInt(beforesale);
		var aftersale = $(".aftersale").text();
		aftersale = aftersale.replace(",", "");
		aftersale = parseInt(aftersale);
		aftersale = beforesale * ((100 - discountnum) / 100);
		var comma = aftersale.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		if (count % 2 == 0) {
			$('.field-area').hide();
		} else {
			$('.field-area').show();
			$(".aftersale").text(comma);
			console.log(beforesale + "," + aftersale);
		}
	});

</script>
<script>
	var count = 0;
	$(document).on("click", "#like", function() {
		count++;
		if (count % 2 == 0) {
			$("#like").removeClass("btn-area like-on")
			$("#like").addClass("btn-area")
		} else {
			$("#like").removeClass("btn-area")
			$("#like").addClass("btn-area like-on")
		}
	});

	$(document).on("click", ".icon-question", function() {
		count++;
		if (count % 2 == 0) {
			$(".pop-question").hide();
		} else {
			$(".pop-question").show();
		}
	});
	$(document).on("click", ".close", function() {
		$(".pop-question").hide();
	});
	
	function gotop() {
		window.scrollTo({
			top : 0,
			behavior : "smooth"
		});
	}
	
	$(document).on("click", "#menu1", function() {
		var go = document.querySelector("#introduction").offsetTop;
		window.scrollTo({
			top : go,
			behavior : "smooth"
		})
	});
	$(document).on("click", "#menu2", function() {
		var go = document.querySelector("#review").offsetTop;
		window.scrollTo({
			top : go,
			behavior : "smooth"
		})
	});
	$(document).on("click", "#menu3", function() {
		var go = document.querySelector("#inquiry").offsetTop;
		window.scrollTo({
			top : go,
			behavior : "smooth"
		})
	});
	$(document).on("click", "#menu4", function() {
		var go = document.querySelector("#guide").offsetTop;
		window.scrollTo({
			top : go,
			behavior : "smooth"
		})
	});
	$(document).on("click", "#menu5", function() {
		var go = document.querySelector("#related").offsetTop;
		window.scrollTo({
			top : go,
			behavior : "smooth"
		})
	});
	
</script>
<script>

window.onload = function(){
	sessionStorage.setItem('member', '${member}'); 
	sessionStorage.setItem('id', '${member.id}');
	sessionStorage.setItem('productNum', '${product.productnum}');
	
	var productNum = sessionStorage.getItem('productNum');
	
//-----------------------------상품 클릭시 위시리스트 체크------------------------------------// 
	if(sessionStorage.getItem('member') != ''){
		$.ajax("wishCheck.do",{
			type:"post",
			data:$(".wish").serialize(),
			success: function(result){
						if(result == 'o'){
							//alert("위시에 있음");
							$("#like").removeClass("btn-area")
							$("#like").addClass("btn-area like-on")
						} 
					},
			error: function(){
				alert("wishCheck 오류가 발생하였습니다.");
			}
		});
		
	} 
}		
//-----------------------------위시리스트 추가 / 삭제 ------------------------------------//
	function insertWish(frm){
		if(sessionStorage.getItem('member') != ''){
			$.ajax("wishCheck.do",{
				type:"post",
				data:$(frm).serialize(),
				success: function(result){
						if(result == 'o'){
							$.ajax("deleteWishList.do",{
								type:"post",
								data:$(frm).serialize(),
								success: function(result){
											if(result == 'o'){
												$("#like").removeClass("btn-area like-on")
												$("#like").addClass("btn-area")
												//-------위시 삭제되면 상단 네비 위시 갯수도 변경
												$.ajax("getWishCnt.do",{
													type:"post",
													success: function(result){
																$('#navWishCnt').html(result);
															},
													error: function(){
														alert("getWishCntAjax 오류가 발생하였습니다.");
													}
												});
												//-----
											}
										},
								error: function(){
									alert("deleteWish 오류가 발생하였습니다.");
								}
						});
						} else{
							$.ajax("insertWish.do",{
								type:"post",
								data:$(frm).serialize(),
								success: function(result){
											if(result == 'o'){
												$("#like").removeClass("btn-area")
												$("#like").addClass("btn-area like-on")
												//-------위시 추가되면 상단 네비 위시 갯수도 변경
												$.ajax("getWishCnt.do",{
													type:"post",
													success: function(result){
																$('#navWishCnt').html(result);
															},
													error: function(){
														alert("getWishCntAjax 오류가 발생하였습니다.");
													}
												});
												//-----
											}
										},
								error: function(){
									alert("insertWish 오류가 발생하였습니다.");
								}
						});
					}
				},
				error: function(){
					alert("wishCheck 오류가 발생하였습니다.");
				}
			});
			
		} else {
			if(confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?")){
				location.href="moveTologin.do";
			};
			
		}
	}


//-----------------------------장바구니 추가 ------------------------------------//	
	function insertCart(frm){
		if(sessionStorage.getItem('member') != ''){
			var selectOption = [];
			selectOption.push($('#optionarea0').is(':visible'));
			selectOption.push($('#optionarea1').is(':visible'));
			selectOption.push($('#optionarea2').is(':visible'));
			selectOption.push($('#optionarea3').is(':visible'));
			selectOption.push($('#optionarea4').is(':visible'));
			
			var nameArr = [];
			var cntArr = [];
			
			for(var i = 0; i < selectOption.length; i++) {
				if(selectOption[i] == true ){
					var optionName = document.getElementById('optionName'+i);
					var optionCnt = document.getElementById('cnt'+i);
					nameArr.push(optionName.value);
					cntArr.push(optionCnt.value);
				}
			}
			let form_contents = '<button data-v-26e42198="" id="btn83" type="button" class="secondary cart" onclick="insertCart(this.form)">장바구니</button>';
			for (var i = 0; i < nameArr.length; i++){
				let productNum_input = "<input name='products[" + i + "].productNum' type='hidden' value='${product.productnum}'>";
				form_contents += productNum_input;
				
				let productOption_input = "<input name='products[" + i + "].productOption' type='hidden' value='" + nameArr[i] + "'>";
				form_contents += productOption_input;
				
				let productCnt_input = "<input name='products[" + i + "].productCnt' type='hidden' value='" + cntArr[i] + "'>";
				form_contents += productCnt_input;
			}
			
			$(".cart").html(form_contents);
			 
			if (nameArr.length == 0) {
				alert("상품옵션을 선택하세요.");
			} else {
				$.ajax("insertCart.do",{
					type:"post",
					data: $(".cart").serialize(),
					dataType: "text",
					success: function(result){
								if(result == 'insert'){
									alert("장바구니에 상품이 담겼습니다.");
									//-------장바구니 추가되면 상단 네비 위시 갯수도 변경
									$.ajax("getCartCnt.do",{
										type:"post",
										success: function(result){
													$('#navCartCnt').html(result);
												},
										error: function(){
											alert("getCartCnt 오류가 발생하였습니다.");
										}
									});
									//-----
								} else {
									alert("장바구니에 같은 상품이 존재합니다.");
								}
							},
					error: function(){
						alert("insertCartWish 오류가 발생하였습니다.");
					}
				});
			}
			
		} else {
			if(confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?")){
				location.href="moveTologin.do";
			};
		}
	}
//-----------------------------바로구매 ------------------------------------//
	function order_go(frm){
		if(sessionStorage.getItem('member') != ''){
			var selectOption = [];
			selectOption.push($('#optionarea0').is(':visible'));
			selectOption.push($('#optionarea1').is(':visible'));
			selectOption.push($('#optionarea2').is(':visible'));
			selectOption.push($('#optionarea3').is(':visible'));
			selectOption.push($('#optionarea4').is(':visible'));
			
			var nameArr = [];
			var cntArr = [];
			
			for(var i = 0; i < selectOption.length; i++) {
				if(selectOption[i] == true ){
					var optionName = document.getElementById('optionName'+i);
					var optionCnt = document.getElementById('cnt'+i);
					nameArr.push(optionName.value);
					cntArr.push(optionCnt.value);
				}
			}
			let form_contents ='<button data-v-26e42198="" id="btn80" type="button" class="primary full" onclick="order_go(this.form)">바로구매</button>';
			for (var i = 0; i < nameArr.length; i++){
				let productNum_input = "<input name='orders[" + i + "].productNum' type='hidden' value='${product.productnum}'>";
				form_contents += productNum_input;
				
				let productOption_input = "<input name='orders[" + i + "].productOption' type='hidden' value='" + nameArr[i] + "'>";
				form_contents += productOption_input;
				
				let productCnt_input = "<input name='orders[" + i + "].productCnt' type='hidden' value='" + cntArr[i] + "'>";
				form_contents += productCnt_input;
			}
			
			if (nameArr.length == 0) {
				alert("상품옵션을 선택하세요.");
			} else {
				$(".order").html(form_contents);
				frm.submit(); 
			}
		} else {
			if(confirm("로그인이 필요한 서비스입니다.\n로그인 하시겠습니까?")){
				location.href="moveTologin.do";
			};
		}
	}
	

</script>
</head>
<c:choose>
	<c:when test="${empty member }">
		<%@include file="/common/guestMenu.jspf"%>
	</c:when>
	<c:when test="${not empty member }">
		<c:if test="${member.admin eq 'ADMIN' }">
			<%@include file="/common/adminMenu.jspf"%>
		</c:if>
		<c:if test="${member.admin eq 'NORMAL' }">
			<%@include file="/common/MemberMenu.jspf"%>
		</c:if>
	</c:when>
</c:choose>
<body class="fix-on">
	<div id="app">
		<div id="contents">
			<%@include file="/common/store.jspf"%>
			<%@include file="/common/cardmodal.jspf"%>
			<%@include file="/common/sharemodal.jspf"%>
			<main>
				<div class="root-container">
					<div class="content-wrapper">
						<section data-v-0de41721="" class="sub-contents-wrap">
							<div data-v-0de41721="" class="product-detail-area">
								<div data-v-0de41721="" class="payment-area" style="top: 170px;">
									<ul data-v-0de41721="" class="path-list">
										<c:if test="${member.id eq 'admin' }"></c:if>
										<li data-v-0de41721=""></li>
										<li data-v-0de41721="">SHOP</li>
										<c:if test="${product.category eq 'EXHIBITION GOODS' }">
											<li data-v-0de41721="">EXHIBITION GOODS</li>
										</c:if>
										<c:if test="${product.category eq 'EDITIONS' }">
											<li data-v-0de41721="">EDITIONS</li>
										</c:if>
									</ul>
									<div data-v-0de41721="" class="visual-area">
										<!---->
										<!---->
									</div>
									<div data-v-0de41721="" class="product-info-area">
										<strong data-v-0de41721="">${product.productname }</strong> <br>
										<c:if test="${product.discount eq '0' }">
											<div data-v-0de41721="" class="price-information">
												<!---->
												<!---->
												<p data-v-0de41721="" class="real-price">
													<strong data-v-0de41721="" id="productprice"><fmt:formatNumber
															value="${product.price}" pattern="###,###,###,###" /></strong>원
												</p>
											</div>
										</c:if>
										<c:if test="${product.discount ne '0' }">
											<div data-v-0de41721="" class="price-information">
												<p data-v-0de41721="" class="original-price">
													<del data-v-0de41721="">
														<fmt:formatNumber value="${product.price}"
															pattern="###,###,###,###" />
													</del>
													원
												</p>
												<span data-v-0de41721="" class="discount">${product.discount }<em>%</em></span>
												<p data-v-0de41721="">
													<strong data-v-0de41721="" class="real-price"> <fmt:formatNumber
															type="number" pattern="###,###,###,###,###,###"
															value="${product.price * (100 - product.discount) / 100 }" />
													</strong>원
												</p>
											</div>
										</c:if>
									</div>
									<ul data-v-0de41721="" class="discount-details">
										<li data-v-0de41721=""><div data-v-0de41721=""
												role="button" class="btn-toggle">할인 혜택 안내</div>
											<div data-v-0de41721="" class="field-area"
												style="display: none;">
												<strong data-v-0de41721="">할인 혜택 안내</strong> <input
													type="hidden" value="${product.discount }" id="discount">
												<ul data-v-0de41721="">
													<li data-v-0de41721=""><div data-v-0de41721="">
															<strong data-v-0de41721="">상품금액</strong> <span
																data-v-0de41721=""><em data-v-0de41721=""
																class="beforesale"><fmt:formatNumber
																		value="${product.price}" pattern="###,###,###,###" />
															</em>원</span>
														</div></li>
													<li data-v-0de41721="" class=""><div
															data-v-0de41721="">
															<strong data-v-0de41721="">할인 적용가 </strong><span
																data-v-0de41721="" style="color: #fe511d;"><em
																data-v-0de41721="" class="aftersale"> </em>원</span>
														</div></li>
												</ul>
											</div></li>
									</ul>
									<div data-v-0de41721="" class="notice-area">
										<div data-v-26e42198="" data-v-0de41721="" class="btn-area"
											style="margin-bottom: 10px;">
											<button data-v-26e42198="" id="add-btn" type="button"
												class="btn"
												style="font-weight: bold; padding: 0; text-align: left;">카드사
												무이자할부 안내</button>
										</div>
									</div>

									<div data-v-0de41721="" class="option-layer">
										<div data-v-0de41721="" class="layer-contents">
											<div data-v-0de41721="" class="option-select">
												<div data-v-0f105554="" data-v-0de41721=""
													class="select-area option-sel" style="width: 25.5rem;">
													<div data-v-0f105554="" id="select74" class="option-sel"
														style="width: 25.5rem;">
														<select class="select-list" id="selectbox"
															style="width: 100%; height: 3.75rem; padding: 0 2.5rem 0 1rem; border: 1px solid #ccc; color: #111; line-height: 1.25rem; letter-spacing: -0.025rem; text-align: left; word-break: keep-all;">
															<option value="" style="text-align: left;" disabled
																selected hidden>상품 옵션을 선택하세요.</option>
															<c:forEach var="option" items="${option }">
																	<option value="${option.optionname }" id="optiontag"
																	class="option">${option.optionname }</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<c:forEach var="option" items="${option }" begin="0" end="0">
												<div data-v-0de41721="" class="option-list-area"
													id="optionarea0" style="display: none;">
													<ul data-v-0de41721="" class="optionarea">
														<li data-v-0de41721=""><strong data-v-0de41721=""
															id="optionname0"> ${option.optionname }</strong> <!-- 나중에 option으로 변경 -->
															<div data-v-0de41721="" class="option-control">
																<div data-v-0de41721="" class="control count-control"
																	style="float: left;">
																	<button data-v-0de41721="" type="button"
																		class="btn-minus" style="float: left;" id="minuscnt0"></button>
																	<div data-v-67ca82d2="" data-v-0de41721=""
																		class="input-area" style="float: left;">
																		<input data-v-67ca82d2="" value="1"
																			readonly="readonly" type="number" id="cnt0">
																		<input type="hidden" value="${option.cnt }"
																			id="optioncnt0"> <a data-v-67ca82d2=""
																			href="javascript:void(0);" class=""
																			style="float: left;"></a>
																		<!---->
																	</div>
																	<button data-v-0de41721="" type="button"
																		class="btn-plus" style="float: left;" id="pluscnt0"></button>
																</div>
																<p data-v-0de41721="" class="price">
																	<strong data-v-0de41721="" id="pp"><fmt:formatNumber
																			value="${product.price * (100 - product.discount) / 100 }"
																			pattern="#,###" /></strong>원
																</p>
															</div>
															<button data-v-0de41721="" type="button"
																class="btn-delete" id="delete0">삭제</button></li>
													</ul>
												</div>
												<input type="hidden" id="optionName0" value="${option.optionname }">
											</c:forEach>
											<c:forEach var="option" items="${option }" begin="1" end="1">
												<div data-v-0de41721="" class="option-list-area"
													id="optionarea1" style="display: none;">
													<ul data-v-0de41721="" class="optionarea">
														<li data-v-0de41721=""><strong data-v-0de41721=""
															id="optionname1"> ${option.optionname }</strong> <!-- 나중에 option으로 변경 -->
															<div data-v-0de41721="" class="option-control">
																<div data-v-0de41721="" class="control count-control"
																	style="float: left;">
																	<button data-v-0de41721="" type="button"
																		class="btn-minus" style="float: left;" id="minuscnt1"></button>
																	<div data-v-67ca82d2="" data-v-0de41721=""
																		class="input-area" style="float: left;">
																		<input data-v-67ca82d2="" value="1"
																			readonly="readonly" type="number" id="cnt1">
																		<input type="hidden" value="${option.cnt }"
																			id="optioncnt1"> <a data-v-67ca82d2=""
																			href="javascript:void(0);" class=""
																			style="float: left;"></a>
																		<!---->
																	</div>
																	<button data-v-0de41721="" type="button"
																		class="btn-plus" style="float: left;" id="pluscnt1"></button>
																</div>
																<p data-v-0de41721="" class="price">
																	<strong data-v-0de41721="" id="pp"><fmt:formatNumber
																			value="${product.price * (100 - product.discount) / 100 }"
																			pattern="#,###" /></strong>원
																</p>
															</div>
															<button data-v-0de41721="" type="button"
																class="btn-delete" id="delete1">삭제</button></li>
													</ul>
												</div>
												<input type="hidden" id="optionName1" value="${option.optionname }">
											</c:forEach>
											<c:forEach var="option" items="${option }" begin="2" end="2">
												<div data-v-0de41721="" class="option-list-area"
													id="optionarea2" style="display: none;">
													<ul data-v-0de41721="" class="optionarea">
														<li data-v-0de41721=""><strong data-v-0de41721=""
															id="optionname2"> ${option.optionname }</strong> <!-- 나중에 option으로 변경 -->
															<div data-v-0de41721="" class="option-control">
																<div data-v-0de41721="" class="control count-control"
																	style="float: left;">
																	<button data-v-0de41721="" type="button"
																		class="btn-minus" style="float: left;" id="minuscnt2"></button>
																	<div data-v-67ca82d2="" data-v-0de41721=""
																		class="input-area" style="float: left;">
																		<input data-v-67ca82d2="" value="1"
																			readonly="readonly" type="number" id="cnt2">
																		<input type="hidden" value="${option.cnt }"
																			id="optioncnt2"> <a data-v-67ca82d2=""
																			href="javascript:void(0);" class=""
																			style="float: left;"></a>
																		<!---->
																	</div>
																	<button data-v-0de41721="" type="button"
																		class="btn-plus" style="float: left;" id="pluscnt2"></button>
																</div>
																<p data-v-0de41721="" class="price">
																	<strong data-v-0de41721="" id="pp"><fmt:formatNumber
																			value="${product.price * (100 - product.discount) / 100 }"
																			pattern="#,###" /></strong>원
																</p>
															</div>
															<button data-v-0de41721="" type="button"
																class="btn-delete" id="delete2">삭제</button></li>
													</ul>
												</div>
												<input type="hidden" id="optionName2" value="${option.optionname }">
											</c:forEach>
											<c:forEach var="option" items="${option }" begin="3" end="3">
												<div data-v-0de41721="" class="option-list-area"
													id="optionarea3" style="display: none;">
													<ul data-v-0de41721="" class="optionarea">
														<li data-v-0de41721=""><strong data-v-0de41721=""
															id="optionname3"> ${option.optionname }</strong> <!-- 나중에 option으로 변경 -->
															<div data-v-0de41721="" class="option-control">
																<div data-v-0de41721="" class="control count-control"
																	style="float: left;">
																	<button data-v-0de41721="" type="button"
																		class="btn-minus" style="float: left;" id="minuscnt3"></button>
																	<div data-v-67ca82d2="" data-v-0de41721=""
																		class="input-area" style="float: left;">
																		<input data-v-67ca82d2="" value="1"
																			readonly="readonly" type="number" id="cnt3">
																		<input type="hidden" value="${option.cnt }"
																			id="optioncnt3"> <a data-v-67ca82d2=""
																			href="javascript:void(0);" class=""
																			style="float: left;"></a>
																		<!---->
																	</div>
																	<button data-v-0de41721="" type="button"
																		class="btn-plus" style="float: left;" id="pluscnt3"></button>
																</div>
																<p data-v-0de41721="" class="price">
																	<strong data-v-0de41721="" id="pp"><fmt:formatNumber
																			value="${product.price * (100 - product.discount) / 100 }"
																			pattern="#,###" /></strong>원
																</p>
															</div>
															<button data-v-0de41721="" type="button"
																class="btn-delete" id="delete3">삭제</button></li>
													</ul>
												</div>
												<input type="hidden" id="optionName3" value="${option.optionname }">
											</c:forEach>
											<c:forEach var="option" items="${option }" begin="4" end="4">
												<div data-v-0de41721="" class="option-list-area"
													id="optionarea4" style="display: none;">
													<ul data-v-0de41721="" class="optionarea">
														<li data-v-0de41721=""><strong data-v-0de41721=""
															id="optionname4"> ${option.optionname }</strong> <!-- 나중에 option으로 변경 -->
															<div data-v-0de41721="" class="option-control">
																<div data-v-0de41721="" class="control count-control"
																	style="float: left;">
																	<button data-v-0de41721="" type="button"
																		class="btn-minus" style="float: left;" id="minuscnt4"></button>
																	<div data-v-67ca82d2="" data-v-0de41721=""
																		class="input-area" style="float: left;">
																		<input data-v-67ca82d2="" value="1"
																			readonly="readonly" type="number" id="cnt4">
																		<input type="hidden" value="${option.cnt }"
																			id="optioncnt4"> <a data-v-67ca82d2=""
																			href="javascript:void(0);" class=""
																			style="float: left;"></a>
																		<!---->
																	</div>
																	<button data-v-0de41721="" type="button"
																		class="btn-plus" style="float: left;" id="pluscnt4"></button>
																</div>
																<p data-v-0de41721="" class="price">
																	<strong data-v-0de41721="" id="pp"><fmt:formatNumber
																			value="${product.price * (100 - product.discount) / 100 }"
																			pattern="#,###" /></strong>원
																</p>
															</div>
															<button data-v-0de41721="" type="button"
																class="btn-delete" id="delete4">삭제</button></li>
													</ul>
												</div>
												<input type="hidden" id="optionName4" value="${option.optionname }">
											</c:forEach>
											<hr>
											<div data-v-0de41721="" class="total-payment">
												<strong data-v-0de41721="" class="title"> 총 결제금액 </strong>
												<div data-v-9970e362="" data-v-0de41721=""
													class="tooltip-area">
													<span data-v-9970e362="" role="button"
														class="icon-question" style="margin-right: 170px;"></span>
													<div data-v-9970e362="" class="pop-question"
														style="display: none;">
														<strong data-v-9970e362="" class="title">총 결제금액</strong>
														<button data-v-9970e362="" type="button" class="close"></button>
														<p data-v-0de41721="" data-v-9970e362="" class="txt">
															총 상품금액에 <span class="orange">배송비는 포함되어 있지 않습니다.</span>
															결제시 배송비가 추가될 수 있습니다.
														</p>
													</div>
												</div>
												<p data-v-0de41721="" class="amount">
													<strong data-v-0de41721="" id="totalprice">0</strong>원
												</p>
											</div>
										</div>
									</div>
									<div data-v-0de41721="" class="btn-group-area full">
										<div data-v-26e42198="" data-v-0de41721="" class="btn-area">
											<form action="getOrderPage.do" method="get" class="order">
											<button data-v-26e42198="" id="btn80" type="button"
												class="primary full" onclick="order_go(this.form)">바로구매</button>
											</form>	
										</div>
										<!---->
									</div>
									<div data-v-0de41721="" class="btn-group-area">
										<div data-v-0de41721="" class="btn-group">
											<div data-v-26e42198="" data-v-0de41721="" class="btn-area">
												<button data-v-26e42198="" id="btn81" type="button"
													class="secondary light share">공유하기</button>
											</div>
											<div data-v-26e42198="" data-v-0de41721="" class="btn-area"
												id="like">
												<form class="wish">
												<button data-v-26e42198="" id="btn82" type="button"
													class="secondary light like" onclick="insertWish(this.form)">위시리스트</button>
													<input type="hidden" name="productNum" value="${product.productnum }">
												<input type="hidden" name="id" value="${member.id }">
												</form>		
											</div>
											<div data-v-26e42198="" data-v-0de41721="" class="btn-area">
												<form class="cart">
												<button data-v-26e42198="" id="btn83" type="button"
													class="secondary cart" onclick="insertCart(this.form)">장바구니</button>
												</form>
											</div>
										</div>
									</div>
									<div data-v-0de41721="" class="btn-group-area">
										<div data-v-26e42198="" data-v-0de41721="" class="btn-area">
											<button data-v-26e42198="" id="adminbtn" type="button"
												onclick="location.href='ProductList.do'" class="secondary"
												style="width: 409px;">상품목록</button>
										</div>
										<!---->
									</div>
									<%-- <c:if test="${member.admin eq 'ADMIN' }">
										<div data-v-0de41721="" class="btn-group-area">
											<div data-v-26e42198="" data-v-0de41721="" class="btn-area">
												<button data-v-26e42198="" id="adminbtn" type="button"
													onclick="location.href='insertProductgo.do'"
													class="secondary" style="width: 409px;">상품등록</button>
											</div>
											<!---->
										</div>
										<div data-v-0de41721="" class="btn-group-area">
											<div data-v-26e42198="" data-v-0de41721="" class="btn-area">
												<button data-v-26e42198="" id="adminbtn" type="button"
													onclick="location.href='productAdmin.do'" class="secondary"
													style="width: 409px;">상품관리</button>
											</div>
											<!---->
										</div>
									</c:if> --%>
								</div>
								<div data-v-0de41721="" class="product-detail">
									<div data-v-0de41721="" class="product-img-area">
										<div data-v-aaf18c02="" data-v-0de41721="" class="swiper-area">
											<div data-v-aaf18c02="" class="preview-img-area">
												<button data-v-aaf18c02="" type="button"
													class="btn-prev img-prev swiper-button-disabled"
													tabindex="-1" role="button" aria-label="Previous slide"
													aria-disabled="true"></button>
												<div data-v-aaf18c02=""
													class="swiper-container swiper-container-initialized swiper-container-horizontal">
													<div class="swiper-wrapper"
														style="transform: translate3d(0px, 0px, 0px);">
														<div data-v-aaf18c02=""
															class="preview swiper-slide swiper-slide-active">
															<div data-v-aaf18c02="" class="img-area" id="photoarea">
																<img
																	src="${pageContext.request.contextPath}/imgs/${product.photo1 }"
																	alt="${product.productname }">
															</div>
														</div>
													</div>
												</div>
												<div data-v-470801da="" data-v-aaf18c02=""
													class="preview-thumb-list">
													<ul data-v-470801da="" class="ii-ul" style="width: 880px;">
														<li data-v-470801da="" class="img-indicator on">
															<button data-v-470801da="" type="button" id="photo1">
																<img
																	src="${pageContext.request.contextPath}/imgs/${product.photo1 }"
																	alt="${product.productname }">
															</button>
														</li>
														<li data-v-470801da="" class="img-indicator">
															<button data-v-470801da="" type="button" id="photo2">
																<img
																	src="${pageContext.request.contextPath}/imgs/${product.photo2 }"
																	alt="${product.productname }">
															</button>
														</li>
														<li data-v-470801da="" class="img-indicator">
															<button data-v-470801da="" type="button" id="photo3">
																<img
																	src="${pageContext.request.contextPath}/imgs/${product.photo3 }"
																	alt="${product.productname }">
															</button>
														</li>
														<li data-v-470801da="" class="img-indicator">
															<button data-v-470801da="" type="button" id="photo4">
																<img
																	src="${pageContext.request.contextPath}/imgs/${product.photo4 }"
																	alt="${product.productname }">
															</button>
														</li>
													</ul>
												</div>
											</div>
										</div>
										<!---->
									</div>
									<div data-v-0de41721="" class="sticky-area" style="top: 50px;">
										<div data-v-0de41721="">
											<div data-v-0de41721="" class="img-area">
												<img data-v-2fed1a9a="" data-v-0de41721=""
													src="${pageContext.request.contextPath}/imgs/${product.photo1 }"
													alt="${product.productname }" style="">
											</div>
											<div data-v-0de41721="" class="info-area">
												<strong data-v-0de41721="">"${product.productname }"</strong>
												<div data-v-0de41721="" class="price-information">
													<p data-v-0de41721="" class="real-price">
														<strong data-v-0de41721=""><fmt:formatNumber
																type="number" pattern="###,###,###,###,###,###"
																value="${product.price * (100 - product.discount) / 100 }" /></strong>원
													</p>
												</div>
											</div>
										</div>
									</div>
									<div data-v-080a389a="" data-v-0de41721="" class="into-shop"
										style="width: 100%;">
										<div data-v-080a389a="" class="snb-area"
											style="z-index: 101; top: 175px; width: 845px;">
											<!-- 원래 top 60 -->
											<ul data-v-080a389a="" class="snb">
												<li data-v-080a389a="" class="on" id="menu1"><a
													data-v-080a389a="" role="button" style="cursor: pointer;"
													>상품</a></li>
												<li data-v-080a389a="" class="" id="menu2"><a
													data-v-080a389a="" role="button" style="cursor: pointer;"
													>리뷰</a></li>
												<li data-v-080a389a="" class="" id="menu3"><a
													data-v-080a389a="" role="button" style="cursor: pointer;"
													>상품문의</a></li>
												<li data-v-080a389a="" class="" id="menu4"><a
													data-v-080a389a="" role="button" style="cursor: pointer;"
													>배송안내</a></li>
												<li data-v-080a389a="" class="" id="menu5"><a
													data-v-080a389a="" role="button" style="cursor: pointer;"
													>연관상품</a></li>
											</ul>
										</div>
										<div id="introduction">
											<br>
										</div>
										<div data-v-080a389a="" id="" class="sub-contents-area">
											<!-- 상품 내용 -->
											<!-- 나중에 이미지 파일로 수정 -->
											<img
												src="${pageContext.request.contextPath}/imgs/${product.productcontent}"
												style="width: 100%; margin-top: 20px;">
										</div>
										<div id="review">
											<br>
										</div>
										<div data-v-080a389a="" id="" class="sub-contents-area">
											<div data-v-47f728bb="" data-v-0de41721=""
												class="container review" data-v-080a389a="">
												<div data-v-47f728bb="" class="title-area">
													<strong data-v-47f728bb="" class="title">리뷰</strong>
												</div>
												<div data-v-47f728bb="" class="review-list-area" id="review-list-area">
													<c:if test="${not empty review }">
														<c:forEach var="review" items="${review }">
															<ul data-v-47f728bb="" class="review-list">
																<li data-v-47f728bb=""><ul data-v-47f728bb=""
																		class="info-area">
																		<li data-v-47f728bb="" class="user" style="width: 120px;">
																			${fn:substring (review.id,0,fn:length(review.id)-3) }***
																		</li>
																		<%-- <li data-v-47f728bb="" class="star">평점: ${review.star }</li> --%>
																		<li data-v-47f728bb="" class="star" style="margin-right: 500px;">
																		<c:if test="${review.star == 1}">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:if>
												<c:if test="${review.star == 2}">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:if>
												<c:if test="${review.star == 3}">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
													<i class="bi bi-star"></i>
												</c:if>
												<c:if test="${review.star == 4}">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star"></i>
												</c:if>
												<c:if test="${review.star == 5}">
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
													<i class="bi bi-star-fill"></i>
												</c:if>
																		</li>
																		<li data-v-47f728bb="" class="date">${review.regdate }</li>
																	</ul>
																	<div data-v-47f728bb="" class="content">${review.content }</div></li>
															</ul>
														</c:forEach>
													</c:if>
													<c:if test="${empty review }">
														<div data-v-47f728bb="" class="no-result">
															<p data-v-47f728bb="">
																등록된 리뷰 글이 없습니다.<br>이 상품에 대한 첫번째 리뷰를 작성해 주세요.
															</p>
														</div>
													</c:if>
												</div>
											</div>
										</div>
										<div data-v-080a389a="" id="inquiry" class="sub-contents-area">
											<div data-v-4c7d2118="" data-v-0de41721=""
												class="container inquiry" data-v-080a389a="">
												<div data-v-4c7d2118="" class="title-area">
													<strong data-v-4c7d2118="" class="title">상품문의</strong>
													<!---->
													<c:if
														test="${not empty member && member.admin eq 'NORMAL' }">
														<a data-v-26e42198="" href="productQnaGo.do?productnum=${product.productnum }" class="gray"
															style="float: right; text-decoration: underline;">
															상품문의 쓰기 </a>
													</c:if>
												</div>
												<div data-v-4c7d2118="" class="inquiry-list-area">
													<c:if test="${not empty qna }">
														<c:forEach items="${qna }" var="qna">
															<ul data-v-4c7d2118="" class="inquiry-list">
																<li data-v-4c7d2118="" class=""><div
																		data-v-4c7d2118="" class="question">
																		<ul data-v-4c7d2118="" class="info-area">
																			<li data-v-4c7d2118="" class="category">${qna.typename }</li>
																			<li data-v-4c7d2118="" class="user">${fn:substring (qna.id,0,fn:length(qna.id)-3) }***</li>
																			<li data-v-4c7d2118="" class="date">${qna.regdate }</li>
																		</ul>
																		<div data-v-4c7d2118="" class="content"
																			id="qnacontent">${qna.question }</div>
																		<div data-v-4c7d2118="" class="" id="answer"
																			style="margin-top: 10px; display: block;">
																			<ul data-v-4c7d2118="" class="info-area">
																				<li data-v-4c7d2118="" class="category">답변</li>
																			</ul>
																			<c:if
																				test="${qna.id eq member.id || member.admin eq 'ADMIN'}">
																				<div data-v-4c7d2118="" class="content">
																					<p>${qna.answer }</p>
																				</div>
																			</c:if>
																			<c:if
																				test="${qna.id ne member.id && member.admin ne 'ADMIN' }">
																				<div data-v-4c7d2118="" class="content">
																					<p>비밀글입니다.</p>
																				</div>
																			</c:if>
																		</div>
																		<div data-v-4c7d2118="" class="status">
																			<!---->
																		</div>
																	</div></li>
															</ul>
														</c:forEach>
													</c:if>
													<c:if test="${empty qna }">
														<div data-v-4c7d2118="" class="no-result">
															<p data-v-4c7d2118="">등록된 문의 글이 없습니다.</p>
														</div>
													</c:if>
												</div>
											</div>
										</div>
										<div data-v-080a389a="" id="guide" class="sub-contents-area">
											<div data-v-047fc12e="" data-v-0de41721=""
												class="container guide" data-v-080a389a="">
												<div data-v-047fc12e="" class="title-area">
													<strong data-v-047fc12e="" class="title">배송안내</strong>
												</div>
												<div data-v-047fc12e="" class="guide-list-area">
													<ul>
														<li style="letter-spacing: -0.3px;"><strong>[주문안내]</strong>
															<ul class="dot-list">
																<li>뮤지엄샵의 회원이 아닌 경우 다양한 혜택에서 제외됩니다. 회원 가입을 해주시기
																	바랍니다.</li>
																<li>비회원 고객의 경우 주문이 불가합니다. 회원가입을 부탁드립니다.</li>
															</ul></li>
														<li style="letter-spacing: -0.3px;"><strong>[결제안내]</strong>
															<ul class="dot-list">
																<li>결제수단은 PG사에서 제공하는 유형으로 결제가 가능합니다. (카드결제, 간편결제
																	일부)</li>
																<li>무통장입금은 결제수단으로 제공하지 않습니다. 현금결제가 필요하신 경우 간편결제
																	서비스를 활용하여 주시기 바랍니다.</li>
															</ul></li>
														<li style="letter-spacing: -0.3px;"><strong>[배송안내]</strong>
															<ul class="dot-list">
																<li>고객님께서 주문하신 상품은 결제완료 후 배송됩니다.</li>
																<li>오후 2시까지 결제 확인된 주문에 대해서는 당일 출고됩니다.</li>
																<br>
																<li>배송방법 : 택배 (CJ대한통운)</li>
																<li>배송지역 : 전국지역</li>
																<li>배송비용 : 기본 배송비는 3,000원이며, 제주도는 3,000원, 도서산간지역은
																	5,000원이 기본 배송비에 추가됩니다.</li>
																<li>배송기간 : 3일 ~ 7일 (주말 및 공휴일 제외, 택배사의 사정에 따라 변동이 있을
																	수 있음)</li>
															</ul></li>
														<li style="letter-spacing: -0.3px;"><strong>[반품
																안내]</strong>
															<ul class="dot-list">
																<li>모든 반품 신청은 상품 수령일로부터 7일 이내에 MYPAGE&gt;MY
																	SHOPPING&gt;주문/배송조회에서 가능합니다.</li>
																<li>MY PAGE를 통한 반품 신청이나 고객센터 접수(전화문의, 상품문의, 문의하기)
																	없이 상품을 반송하셨을 경우에는 고객님께 다시 반송되는 점 참고 부탁드립니다.</li>
																<li>단순변심 또는 회원님의 실수로 인한 오배송(주소지 오류 등) 사유로 반품하시는
																	경우에는 반품 신청 시 반품 배송비 결제가 필요합니다.</li>
																<li>반품 배송비는 왕복 배송비가 결제되며, 환불 시 최초 배송비를 포함한 결제 금액
																	전액이 환불됩니다.</li>
																<li>부분 반품의 경우에는 반품 배송비로 편도 배송비가 결제되며, 환불 시 반품 상품
																	금액만 환불 됩니다.</li>
																<li>반품 시 회수되는 상품은 상품 및 포장이 재판매 가능한 상태여야 합니다.</li>
																<li>상품에 사용감이 있거나 인위적인 훼손의 흔적이 있을 경우 반품이 불가합니다.</li>
																<li>반송 시 보내드린 구성품 그대로 보내주셔야만 반품이 가능합니다.</li>
																<li>상품의 포장 마감재나 태그가 제거된 경우 반품이 불가합니다.</li>
																<li>이미 사용하신 상품이나 설치 상품, 주문 제작 상품의 경우 반품이 불가합니다.</li>
																<li>오배송 및 불량에 의한 반품의 경우 가급적 수령 당일 신청 부탁드립니다.</li>
																<li>포장이나 구성품이 누락 또는 훼손된 경우에는 오배송 및 불량 사유일지라도 반품이
																	불가한 점 참고 부탁드립니다.</li>
																<li>결제 금액의 환불은 결제한 수단으로 환불됩니다. (현금 환불은 어떠한 경우에도 절대
																	불가합니다.)</li>
															</ul></li>
														<li style="letter-spacing: -0.3px;"><strong>[A/S
																안내]</strong>
															<ul class="dot-list">
																<li>A/S 기준이나 가능여부는 상품에 따라 다르므로 관련 문의는 뮤지엄샵 고객센터를 통해
																	문의 부탁드립니다.</li>
																<li>상품 불량에 의한 반품, A/S, 환불, 품질보증 및 피해보상 등에 관한 사항은
																	소비자분쟁해결기준(공정거래위원회 고시)에 따라 받으실 수 있습니다.</li>
															</ul></li>
													</ul>
												</div>
											</div>
										</div>
										<div data-v-080a389a="" id="related" class="sub-contents-area">
											<div data-v-aa52a050="" data-v-0de41721=""
												class="container related" data-v-080a389a="">
												<div data-v-aa52a050="" class="related-list-area">
													<div data-v-aa52a050="" class="no-result">
														<p data-v-aa52a050="">${product.productname }의연관상품이
															없습니다.</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!---->
								</div>
							</div>
							<!---->
							<!---->
							<!---->
						</section>
					</div>
				</div>
			</main>
			<button class="goto-top show" style="user-select: auto;"
				onclick="gotop()">상단으로 이동</button>
		</div>
	</div>
</body>
<%@include file="/common/footer.jspf"%>
</html>