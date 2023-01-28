<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
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
			<%
				String title = request.getParameter("title"); 
				int learnIdx = Integer.parseInt(request.getParameter("learnIdx")); 
				String revTime = request.getParameter("revTime"); 
				String place = request.getParameter("place"); 
				int fee = Integer.parseInt(request.getParameter("price"));
				int subscriber = Integer.parseInt(request.getParameter("subscriber")); 
				
				DecimalFormat decFormat = new DecimalFormat("###,###");
			%>
			
						
			<div class="row" style="padding-bottom: 50px;">
				<div class="col-8" style="height: auto;">
					<p style="font-size: 2em; font-weight: bold;">티켓 정보</p>
					<hr>
					<table style="width: 100%;">
						<tr>
							<td class="pname" style="width: 20%;">교육명</td>
							<td style="font-size: 1.8em; font-weight: bold;">
								
								<%=title %>
							</td>
						</tr>
						<tr>
							<td class="pname">교육일시</td>
							<td style="font-weight: bold; color: #747474; font-size: 1.1em;">
							<%
								String selectDate = request.getParameter("selectDate"); 

								DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
								LocalDate date = LocalDate.parse(selectDate, formatter);

								System.out.println(date);
								String year = selectDate.substring(0,4);
								String month = selectDate.substring(4,6);
								String day = selectDate.substring(6,8);
								
								String revdate = year+"."+month+"."+day;
								
							%>
								<%=date %>
								<%=revTime.substring(3,8) %>
							</td>
						</tr>
						<tr>
							<td class="pname">장소</td>
							<td style="font-size: 1.1em;"><%=place %></td>
						</tr>
					</table>
					<hr>
					<table style="width: 100%;">
						<tr style="color: gray;">
							<td style="width: 30%;">교육프로그램</td>
							<td style="width: 20%;"><%=decFormat.format(fee) %>원</td>
							<td style="width: 15%; text-align: right; color: black;"><%=subscriber %>인</td>
							<td style="width: 35%; text-align: right; color: black; font-weight: bold;">
								<%=decFormat.format(fee*subscriber) %><span>원</span>
							</td>
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
					  				<td>참가비</td>
					  				<td class="fprint"><span><%=decFormat.format(fee) %></span>원</td>
					  			</tr>
					  			<tr>
					  				<td>인원</td>
					  				<td class="fprint"><span><%=subscriber %></span>명</td>
					  			</tr>
					  			<tr>
					  				<td style="padding-top: 50px;">최종 결제금액</td>
					  				<td class="fprint" style="padding-top: 40px; font-size: 1.5em; font-weight:900;">
					  					<span><%=decFormat.format(fee*subscriber) %></span>원
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
						 %>
					
					<p style="font-size: 0.8em;">예약하신 티켓의 가격, 할인 내역, 취소 정책을 최종확인 하였으며, 구매에 동의합니다. <br> (전자거래법 제8조 제2항)</p>
					<input type="hidden" name="id" value="${member.id }">
					<input type="hidden" name="name" value="${member.name }">
					<input type="hidden" name="learnIdx" value="<%=learnIdx %>">
					<input type="hidden" name="title" value="<%=title %>">
					<input type="hidden" name="revDate" value="<%=date %>">
					<input type="hidden" name="subscriber" value="<%=subscriber %>">
					<input type="hidden" name="totalprice" value="<%=fee*subscriber %>">
					<input type="hidden" name="place" value="<%=place %>">
					<input type="hidden" name="time" value="<%=revTime %>">
					<input type="hidden" name='cardNum' value="">
					<input type="hidden" name='cardName' value="">
					<input type="hidden" name='approvalNum' value="">
					<input type="hidden" name='revNum' value="">
					<input type="hidden" name='errorMsg' value="">
				  		<button type="button" class="btn btn-lg btn-block" id="btn" style="font-weight: bold;" onclick="requestPay()">
							결제하기</button>
				    </form>
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
			//alert('이메일 실행');
			showLoading(); 
        	emailjs.init("uVkEWXFy64UNP3x_U");		
                  var templateParams = {	
                  //각 요소는 emailJS에서 설정한 템플릿과 동일한 명으로 작성!
                        name: "<%=name %>",
                        regdate: regdate, 
                        revnum : revNum,
                        ticketname : "<%=title %>",
                        member : "<%=subscriber %>명",
                        revdate : "<%=revdate%> <%=revTime %>",
                        place : "<%=place %>",
                        email : "<%=email %>"
                   				};
                            
                        	
                 emailjs.send('service_7uf3uys', 'template_3qx8pl9', templateParams)
                 //emailjs.send('service ID', 'template ID', 보낼 내용이 담긴 객체)
                 	    .then(function(response) {
                 	    	hideLoading();
                 	    	f.action = 'completeticket.do';
                 	    	f.submit();
                 	    	console.log('SUCCESS!', response.status, response.text);
                 	    }, function(error) {
                 	    	alert('메일 실패', error);
                 	       console.log('FAILED...', error);
                 	    });
     		
     	}

var IMP = window.IMP;
IMP.init("imp16211152"); // 예: imp00000000
    function requestPay() {
        var totalprice = <%=fee*subscriber %>;
        if(f.pv_agree.checked!==true) {
            alert('필수항목에 체크해 주세요.');
            return;
        } else if (totalprice == 0){
        	mailgo();
        	$("input[name='revNum']").val(revNum);
            //예약완료 페이지로 이동
        } else {
        	//아임포트-----------------------------------------------------------
              // IMP.request_pay(param, callback) 결제창 호출
              IMP.request_pay({ // param
                  pg: "html5_inicis",
                  pay_method: "card",
                  merchant_uid: revNum,
                  name: "<%=title %>",
                  //amount: 100,
                  amount: totalprice,
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
        	          //예약완료 페이지로 이동
                  } else {
                	// 결제 실패 시 로직
                		$("input[name='errorMsg']").val(rsp.error_msg);
                		f.action = 'completelearnErr.do';
                		f.submit();
        	            //var msg = '결제에 실패하였습니다.';
        				//msg += '에러내용 : ' + rsp.error_msg;
        				//alert(msg);
                  }
              });
            }
        }
    
 </script>




</body>
<%@ include file="/common/footer.jspf"%>
</html>