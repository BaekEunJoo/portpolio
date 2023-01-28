<%@page import="oracle.sql.DATE"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 아임포트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXHIBITION | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<style>
	.ticketTop {
		width: 100%;
		height: 50px;
		table-layout: fixed;
		text-align: center;
		margin: 30px 0;
		border: 1px solid #949494;
		color: #949494;
	}
	.border { border: 1px solid #949494; }
	
	.pname { font-size: 1.3em; }
	
	.fprint {
		text-align: right;
	}
	
	#btn {
		color: white;
		background-color: black;
		border-radius: 0;
	}
	
	#pv_agree {
		accent-color: black;
		width: 20px;
		height: 20px;
	}
	
	.spinner-border {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 3000;
	width: 3rem;
	height: 3rem;
	}
	
	
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

<div class="container-filid notosanskr" style="margin: 0 auto;">

<div class="spinner-border" role="status" style="display: none;" id="roadingStatus">
  <span class="sr-only">Loading...</span>
</div>

	<div class="row" style="margin: 0;">
		<div class="col-8 offset-2">
			<table class="ticketTop">
				<tr style="background-color: black; color: white;">
					<td class="border">
						01. 티켓 선택
					</td>
					<td class="border">
						02. 관람일/인원 선택
					</td>
					<td class="border">
						03. 결제
					</td>
				</tr>
			</table>
			<br>
						
			<div class="row" style="padding-bottom: 50px;">
				<div class="col-8" style="height: auto;">
					<p style="font-size: 2em; font-weight: bold;">티켓 정보</p>
					<hr>
					<table style="width: 100%;">
						<tr>
							<td class="pname" style="width: 20%;">전시명</td>
							<td style="font-size: 1.8em; font-weight: bold;">
								<%
								String exhName = request.getParameter("exhName"); 
								int exhNum = Integer.parseInt(request.getParameter("exhNum")); 
								%>
								<%=exhName %>
							</td>
						</tr>
						<tr>
							<td class="pname">관람일시</td>
							<td style="font-weight: bold; color: #747474; font-size: 1.1em;">
								<%String selectDate = request.getParameter("selectDate"); 

								DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
								LocalDate date = LocalDate.parse(selectDate, formatter);

								System.out.println(date);
								
								String year = selectDate.substring(0,4);
								String month = selectDate.substring(4,6);
								String day = selectDate.substring(6,8);
								
								String revdate = year+"."+month+"."+day;
								
								%>
								<%=date %>
							</td>
						</tr>
						<tr>
							<td class="pname">장소</td>
							<td style="font-size: 1.1em;">아이뮤지엄</td>
						</tr>
					</table>
					<hr>
					<table style="width: 100%;">
						<%
						int adult = Integer.parseInt(request.getParameter("adult"));
						int teens = Integer.parseInt(request.getParameter("teens"));
						int child = Integer.parseInt(request.getParameter("child"));
						
						DecimalFormat formatter2 = new DecimalFormat("###,###");
						int adultPrice = 18000*adult;
						int teensPrice = 9000*teens;
						int childPrice = 6000*child;
						
						
						if (adult != 0){%>
							<tr style="color: gray;">
								<td style="width: 20%;">성인</td>
								<td style="width: 30%; text-align: right;">18,000원</td>
								<td style="width: 15%; text-align: right; color: black;"><%=adult %>인</td>
								<td style="width: 35%; text-align: right; color: black; font-weight: bold;">
									<%= formatter2.format(adultPrice) %><span>원</span>
								</td>
							</tr>
						<%}
						
						if (teens != 0){%>
							<tr style="color: gray;">
								<td style="width: 20%;">청소년</td>
								<td style="width: 30%; text-align: right;">9,000원</td>
								<td style="width: 15%; text-align: right; color: black;"><%=teens %>인</td>
								<td style="width: 35%; text-align: right; color: black; font-weight: bold;">
									<%= formatter2.format(teensPrice) %><span>원</span>
								</td>
							</tr>
						<%}
						
						if (child != 0){%>
							<tr style="color: gray;">
								<td style="width: 20%;">유아 및 어린이</td>
								<td style="width: 30%; text-align: right;">6,000원</td>
								<td style="width: 15%; text-align: right; color: black;"><%=child %>인</td>
								<td style="width: 35%; text-align: right; color: black; font-weight: bold;">
									<%= formatter2.format(childPrice) %><span>원</span>
								</td>
							</tr>
						<%}
						
						%>
					</table>
					<hr>
					<p style="font-size: 2em; font-weight: bold;">할인 혜택 적용</p>
					<table style="width: 100%;">
						<tr>
							<td colspan="4" style="background-color: #F7F7F7; font-size: 1.3em; padding: 20px;">
								프로모션
							</td>
						</tr>
						<tr>
							<td style="padding: 20px;"> 회원우대 30% </td>
							<%
								if(adult != 0) {%>
								<td style="text-align: center;"> 성인 </td>
								<%} else if (teens == 0){%>
								<td style="text-align: center;"> 유아 </td>
								<%} else {%>
								<td style="text-align: center;"> 청소년 </td>
								<%}
							%>
							<td style="text-align: center;">
					    		<span class="qty">
								<span class="minus">
									<a href="javascript:change_qty('m')">
										<input type="button" value="-" 
											style="border: none; width: 40px; height: 40px; margin-right: -5px; background-color: black; color: white;">
									</a>
								</span> 
								<input type="text" class="ct_qty" id="ct_qty" value="0"	readonly="readonly"
									style="background-color: white; width: 40px; height:40px; text-align: center; border: 1px solid black;"> 
								<span class="plus">
									<a href="javascript:change_qty('p')">
										<input type="button" value="+" 
										style="border: none; width: 40px; height: 40px; margin-left: -5px; background-color: black; color: white; ">
									</a>
								</span>
							</span>
							</td>
							<td width="150px;" style="text-align: right;"><span id="discount">0</span>원 </td>
						</tr>
					</table>
					<hr>
					
					
					
					
				</div> <!-- col-8 -->
				
				
				<div class="col-4">
				<div class="position-sticky">
					<form name="thisForm" method="post">
					<div class="card" style="width: 100%; border-radius: 0;">
					  <div class="card-body">
					  		<p style="font-size: 1.5em; font-weight: bold; padding-bottom: 20px;">결제정보</p>
					  		<table style="width: 100%; font-size: 1.2em;">
					  			<tr>
					  				<td>총금액 / <span><%=adult+teens+child %></span>매</td>
					  				<td class="fprint"><span><%= formatter2.format(adultPrice+teensPrice+childPrice) %></span>원</td>
					  			</tr>
					  			<tr>
					  				<td>할인금액</td>
					  				<td class="fprint"><span id="discountPay">0</span>원</td>
					  			</tr>
					  			<tr>
					  				<td style="padding-top: 50px;">최종 결제금액</td>
					  				<td class="fprint" style="padding-top: 40px; font-size: 1.5em; font-weight:900;">
					  					<span class="totalprice"><%= formatter2.format(adultPrice+teensPrice+childPrice) %></span>원
					  				</td>
					  			</tr>
					  		</table>
					  </div>
					</div>
					<br>
					<table>
						<tr>
							<td style="vertical-align: middle;">
							<input type="checkbox" id="pv_agree" name="pv_agree" class="agree_ck" style="margin-top: 5px;">
							</td>
							<td style="padding-left: 10px;">예약 티켓 정보에 대한 동의(필수)</td>
						</tr>
					</table>
					<br>
					<c:set var="name" value="${member.name }" />
					<c:set var="email" value="${member.email }" />
					<c:set var="phone" value="${member.phone }" />
						 <%
						      String name = (String)pageContext.getAttribute("name") ;
						      String email = (String)pageContext.getAttribute("email") ;
						      String phone = (String)pageContext.getAttribute("phone") ;
						      
						      String mem = "";
						      if(adult!=0) {
						    	  mem += "성인"+adult+"명, ";
						      }
						      if(teens!=0) {
						    	  mem += "청소년"+teens+"명, ";
						      }
						      if(child!=0) {
						    	  mem += "유아"+child+"명, ";
						      }
						      
						      String member = mem.substring(0 , mem.length()-2);
						      
						 %>
						 
					<p style="font-size: 0.8em;">예약하신 티켓의 가격, 할인 내역, 취소 정책을 최종확인 하였으며, 구매에 동의합니다. <br> (전자거래법 제8조 제2항)</p>
					<input type="hidden" name="exhNum" value="<%=exhNum %>">
					<input type="hidden" name="id" value="${member.id }">
					<input type="hidden" name="name" value="${member.name }">
					<input type="hidden" name="exhName" value="<%=exhName %>">
					<input type="hidden" name="revDate" value="<%=date %>">
					<input type="hidden" name="adult" value="<%=adult %>">
					<input type="hidden" name="teens" value="<%=teens %>">
					<input type="hidden" name="child" value="<%=child %>">
					<input type="hidden" class="totalprice" name="totalprice" id="totpp" value="<%=adultPrice+teensPrice+childPrice %>">
					<input type="hidden" name='cardNum' value="">
					<input type="hidden" name='cardName' value="">
					<input type="hidden" name='approvalNum' value="">
					<input type="hidden" name='revNum' value="">
					<input type="hidden" name='errorMsg' value="">
					<button type="button" class="btn btn-lg btn-block" id="btn" style="font-weight: bold;" onclick="requestPay()">
						결제하기</button>
				    </form>
				    <!-- <button type="button" class="btn" onclick="mailgo()">메일 테스트</button> -->
					</div>
				</div> <!-- col-4 -->
			</div>
		</div>
	</div>
</div>

<script>
	//주문번호 생성
	var now = moment();
	var revNum = 'T'+ now.format("YYYYMMDDHHmmss");
    var regdate = now.format("YYYY년MM월DD일HH시mm분ss초");
    var f = document.thisForm;
	
    //여기 클릭버튼
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

	
	function numberWithCommas(val) {
		return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
						
	function change_qty(t) {
		//var min_qty = '수량버튼'*1;
		var min_qty = 0;
		var this_qty = $("#ct_qty").val() * 1;
		var max_qty = '1'; // 최대선택
		if (t == "m") {
			this_qty -= 1;
			if (this_qty < min_qty) {
				return;
			}
		} else if (t == "p") {
			this_qty += 1;
			if (this_qty > max_qty) {
				alert("회원할인은 본인 1매만 가능합니다.");
				return;
			}
		}

		var totalcount = <%= adultPrice+teensPrice+childPrice%>
		var adult = <%= adult %>
		var teens = <%= teens %>
		var child = <%= child %>
		
		
		if (adult != 0) {
			$("#discountPay").text(numberWithCommas(this_qty*18000*0.3)); 
			$("#discount").text(numberWithCommas(this_qty*18000*0.3)); 
			$(".ct_qty").val(this_qty);
			$(".totalprice").val(totalcount-(this_qty*18000*0.3));
			$(".totalprice").text(numberWithCommas(totalcount-(this_qty*18000*0.3)));
		} else if (teens == 0) {
			$("#discountPay").text(numberWithCommas(this_qty*6000*0.3)); 
			$("#discount").text(numberWithCommas(this_qty*6000*0.3)); 
			$(".ct_qty").val(this_qty);
			$(".totalprice").val(totalcount-(this_qty*6000*0.3));
			$(".totalprice").text(numberWithCommas(totalcount-(this_qty*6000*0.3)));
		} else {
			$("#discountPay").text(numberWithCommas(this_qty*9000*0.3)); 
			$("#discount").text(numberWithCommas(this_qty*9000*0.3)); 
			$(".ct_qty").val(this_qty);
			$(".totalprice").val(totalcount-(this_qty*9000*0.3));
			$(".totalprice").text(numberWithCommas(totalcount-(this_qty*9000*0.3)));
		}
	}
    
//로딩
function showLoading(){
  //화면의 높이와 너비를 구합니다.
  var maskHeight = $(document).height();
  var maskWidth  = window.document.body.clientWidth;

  //화면에 출력할 마스크를 설정해줍니다.
  var mask ="<div id='mask' style='position:absolute; z-index:2000; background-color:#000000; left:0; top:0;'></div>";

  //화면에 레이어 추가
  $('body')
  .append(mask)

  //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
  $('#mask').css({
  'width' : maskWidth
  ,'height': maskHeight
  ,'opacity' :'0.3'
  });

  $("#roadingStatus").show();
  }
function hideLoading(){
    $("#mask").remove();
    $("#roadingStatus").hide();
}
	
	
	//메일 ----------------------------------------------------
	function mailgo(){
				showLoading(); 
				//alert('이메일 실행');
	        	emailjs.init("uVkEWXFy64UNP3x_U");		
	                  var templateParams = {	
	                  //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
	                        name: "<%=name %>",
	                        regdate: regdate, 
	                        revnum : revNum,
	                        ticketname : "<%=exhName %>",
	                        member : "<%=member %>",
	                        revdate : "<%=revdate%>",
	                        email : "<%=email %>"
	                   				};
	                            
	                        	
	                 emailjs.send('service_7uf3uys', 'template_mqagk5w', templateParams)
	                 //emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
	                 	    .then(function(response) {
	                 	    	hideLoading();
	                 	    	//alert('메일 성공');
		              	        f.action = "completeExTicket.do";
		              	        f.submit(); 
	                 	    	console.log('SUCCESS!', response.status, response.text);
	                 	    }, function(error) {
	                 	    	alert('메일 실패', error);
	                 	       console.log('FAILED...', error);
	                 	    });
	     		
	     	}
	//아임포트-----------------------------------------------------------
	
	var IMP = window.IMP;
	IMP.init("imp16211152"); // 예: imp00000000
    function requestPay() {
    	var totalPrice = f.totalprice.value;
        if(f.pv_agree.checked!==true) {
        	alert('필수항목에 체크해 주세요.');
            return;
        }
      // IMP.request_pay(param, callback) 결제창 호출
      IMP.request_pay({ // param
          pg: "html5_inicis",
          pay_method: "card",
          merchant_uid: revNum,
          name: "<%=exhName %>",
          //amount: 100,
          amount: totalPrice,
          buyer_email: "<%=email %>",
          buyer_name: "<%=name %>",
          buyer_tel: "<%=phone %>",
          card_quota: "[]",
          //buyer_addr: "서울특별시 강남구 신사동",
          //buyer_postcode: "01181"
      }, function (rsp) { // callback
          if (rsp.success) {
        	  $("input[name='cardNum']").val(rsp.card_number);
	          $("input[name='cardName']").val(rsp.card_name);
	          $("input[name='approvalNum']").val(rsp.apply_num);
	          $("input[name='revNum']").val(revNum);
	          
	          mailgo();
        	  /* alert("결제성공 -> 고유ID : "+rsp.imp_uid+" / 상점거래ID : " + rsp.merchant_uid + "카드 승인번호" + rsp.apply_num+
	        		   "/카드사:" + rsp.card_name+ "/카드번호:"+rsp.card_number +"/할부:" +rsp.card_quota); */
          } else {
        	// 결제 실패 시 로직
	            $("input[name='errorMsg']").val(rsp.error_msg);
             	f.action = 'completeErr.do';
             	f.submit();
        		//var msg = '결제에 실패하였습니다.';
				//msg += '에러내용 : ' + rsp.error_msg;
				//alert(msg);
          }
      });
    }
 </script>


</body>
<%@ include file="/common/footer.jspf"%>
</html>