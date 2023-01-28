<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EXHIBITION | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
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
	.border {
		border: 1px solid #949494; 
	}
	
	.badge {
		background-color: black;
		color: white;
		padding: 10px;
		width: 100px;
		text-align: center;
		border-radius: 0;
	}
	
	#btn {
		background-color: black;
		border-radius: 0;
		color: white;
		width: 100%;
	}
	
	.modal-header {
		background-color: black;
		color: white;
		font-weight: bold;
	}	
	
	#modalcheck {
		width: 100%; 
		background-color: black;
		color: white;
		font-weight: bold;
	}
	
	ol > li {
		font-size: 1.2em;
		font-weight: bold;
	}
	
	.modalli {
		padding-left: 0;
	}
	
	.modalli > li{
		padding-left: 0;
		color: #353535;
		font-size: 0.7em;
		font-weight: 100;
		list-style: disc;
	}
	
	#pv_agree {
		accent-color: black;
		width: 20px;
		height: 20px;
	}
	
	.mbtn {border: none; width: 40px; height: 40px; margin-right: -5px; background-color: black; color: white;}
	.pbtn {border: none; width: 40px; height: 40px; margin-left: -5px; background-color: black; color: white;}
	.ct_qty {background-color: white; width: 40px; height:40px; text-align: center; border: 1px solid black;}
	
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

<!-- Modal -->
<div class="modal fade notosanskr" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">전문보기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color: white;">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <h3 style="font-weight: bold;">관람 시 유의사항 동의</h3>
      	<ol>
      		<li>입장, 티켓 환불 & 취소
      			<ul class="modalli">
      				<li>
      				 예매하신 티켓의 변경, 취소, 환불은 전시 관람 또는 프로그램 하루 전 오후 5시까지만 가능합니다. <br>
      				 이후에는 취소와 환불이 불가하오니 유의해 주세요.
      				</li>
      				<li>
      				전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.
      				</li>
      				<li>
      				관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리 되어 취소,환불이 불가능합니다.
      				</li>
      				<li>
      				재관람은 ‘사용완료’ 처리된 티켓으로만 가능합니다. 티켓을 취소 했거나, 예매 후 미술관을 방문하지 못해 기간만료 처리 된 티켓으로는 재관람이 어렵습니다.
      				</li>
      			</ul>
      		</li>
      		<li>코로나19 예방과 확산 방지를 위한 관람객 유의 사항
      			<ul class="modalli">
      				<li>
      				 미술관 안에서는 안전한 관람을 위하여 관람객 모두 마스크를 착용해야 합니다.<br>
					올바른 마스크 착용이 아니거나 마스크 착용을 거부할 경우 퇴장 조치 될 수 있습니다.
      				</li>
      			</ul>
      		</li>
      		<li>미술관 방문과 전시 관람
      			<ul class="modalli">
      				<li>
      				 전시장 안으로는 물, 껌, 사탕을 포함한 모든 음식물 반입이 불가하오니 꼭 기억해 주세요.
      				</li>
      				<li>
      				 미술관 내에는 안내견을 제외한 반려동물은 입장할 수 없습니다.
      				</li>
      				<li>
      				  플래시, 삼각대 및 셀카봉을 이용한 촬영, 상업적 용도의 촬영, 동영상 촬영은 불가합니다.
      				</li>
      				<li>
      				 14세 미만 어린이의 경우, 보호자와 함께 입장하셔야 합니다. <br>
      				 전시장에서는 어린이들이 보호자의 손을 잡고 전시를 관람할 수 있게 해 주세요.
      				</li>
      				<li>
      				 관람객이 전시 작품 및 시설물을 파괴하거나 훼손하였을 때에는 이에 상응하는 손해 배상을 하실 수 있으니, 관람에 유의해 주세요.
      				</li>
      			</ul>
      		</li>
      	</ol>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn" id="modalcheck" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="container-filid notosanskr" style="margin: 0 auto;">
	<div class="row" style="margin: 0;">
		<div class="col-8 offset-2">
			<table class="ticketTop">
				<tr>
					<td class="border" style="background-color: black; color: white;">
						01. 티켓 선택
					</td>
					<td class="border" style="background-color: black; color: white;">
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
					<img alt=".." src="${pageContext.request.contextPath}/exhibitionImg/${evo.ticketImg }" width="100%;">
				<br><br>
				<span style="font-size: 2.5em; font-weight: bold;">${evo.exhName }</span><br>
				<hr>
				<div>
				<table style="width: 100%; color: gray;">
					<tr>
						<td class="infot" width="10%" style="font-weight: bold;">
							장소
						</td>
						<td class="infot" width="40%">
							아이뮤지엄
						</td>
						<td class="infot" width="10%" style="font-weight: bold;">
							전시기간
						</td>
						<td class="infot">
							${evo.startDate.substring(0,10) } ~ ${evo.lastDate.substring(0,10) }
						</td>
					</tr>
					<tr>
						<td class="infot" rowspan="2" width="10%" style="font-weight: bold; vertical-align: top;">
							운영시간
						</td>
						<td class="infot" width="40%" style="padding-bottom: 20px;">
							화,수,목,금,일요일 11:00am ~ 8:00pm <br>
							(입장 마감 7:00pm)
						</td>
						<td class="infot" rowspan="2" width="10%" style="font-weight: bold; vertical-align: top;">
							이용요금
						</td>
						<td class="infot" rowspan="2" width="40%" style="vertical-align: top;">
							<c:forEach var="type" items="${typeList }" varStatus="status">
							${type.type } 
							<fmt:formatNumber value="${type.price }" pattern="#,###" />원 <br>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td class="infot" width="40%">
							토요일 11:00am ~ 9:00pm<br>
							(입장 마감 8:00pm)
						</td>
					</tr>
				</table>
				</div>
				<hr>
				<br>
				<p style="font-size: 1.5em; font-weight: bold;">이용 정보</p>
				<div style="color: gray;" class="infot">
				· 본 전시는 서울시 강남구 역삼동 아이뮤지엄에서 진행됩니다. <br>
				<span class="infot" style="color: #5587ED;">· 온라인회원은 결제 단계에서 정가의 30% 할인이 적용됩니다.</span> <br>
				· 관람 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요. <br>
				· 매주 월요일과 추석연휴는 휴관합니다. <br>
				· 수수료 없이 예약 취소가 가능한 기간은 관람 전일 오후 5시까지입니다. 이후에는 취소, 변경, 환불이 불가합니다. <br>
				· 예약 취소는 아이뮤지엄 홈페이지 로그인 후 ‘MY PAGE’에서 할 수 있습니다. <br>
				</div>
				</div> <!-- col-8 -->
				
				
				<div class="col-4">
				<div class="position-sticky notosanskr">
					<div class="card" style="width: 100%; border-radius: 0;">
					  <div class="card-body">
					  <form name="thisForm" action="ehpay.do" method="post">
						<%@ include file="/common/Calendar.jspf" %>
					  <input type="hidden" id="selectDate" name="selectDate">
					  	<p style="font-size: 0.8em; color: gray;">* 매주 월요일은 휴관일입니다.</p>
					    <hr>
					    <p style="font-size: 1.3em; font-weight: bold;">회차</p>
					    <button type="button" class="btn" id="btn">전일 입장 가능 11:00 ~ 21:00</button>
					    <hr>
					    
					    <div class="notosanskr" style="padding: 8px 0;">
					    <span style="font-size: 1.3em; font-weight: bold;">관람인원 및 권종</span>
					    <i class="bi bi-question-circle" style="cursor: pointer;" data-toggle="popover" 
					    title="<b>권종안내</b>" data-content="<b>성인</b> 20세 이상 <br>
					    	<b>청소년</b> 14세~19세 <br>
					     	<b>유아 및 어린이</b> 37개월~13세">
					    </i>
					    </div>
					    <i class="bi bi-info-circle"></i>
					    <span style="font-size: 0.9em;">한 개의 ID로 회당 최대 4매까지 예매 가능합니다.</span><br><br>
					    
					    <div class="qty">
					    	<span style="padding-left: 10px;">성인</span>	
					    		<span style="Float:right;">
								<span class="minus">
									<a href="javascript:change_qty('m1')">
										<input type="button" value="-" class="mbtn">
									</a>
								</span> 
								<input type="text" class="ct_qty" id="adult" name="adult" value="0"	readonly="readonly"> 
								<span class="plus">
									<a href="javascript:change_qty('p1')">
										<input id="adultp" type="button" value="+" class="pbtn">
									</a>
								</span>
							</span>
					     </div>
					     <br>
					    <div class="qty">
					    	<span style="padding-left: 10px;">청소년</span>	
					    		<span style="Float:right;">
								<span class="minus">
									<a href="javascript:change_qty('m2')">
										<input type="button" value="-" class="mbtn">
									</a>
								</span> 
								<input type="text" class="ct_qty" id="teens" name="teens" value="0"	readonly="readonly"> 
								<span class="plus">
									<a href="javascript:change_qty('p2')">
										<input id="teensp" type="button" value="+" class="pbtn">
									</a>
								</span>
							</span>
					     </div>
					     <br>
					    <div class="qty">
					    	<span style="padding-left: 10px;">유아 및 어린이</span>	
					    		<span style="Float:right;">
								<span class="minus">
									<a href="javascript:change_qty('m3')">
										<input type="button" value="-" class="mbtn">
									</a>
								</span> 
								<input type="text" class="ct_qty" id="child" name="child" value="0"	readonly="readonly"> 
								<span class="plus">
									<a href="javascript:change_qty('p3')">
										<input id="childp" type="button" value="+" class="pbtn">
									</a>
								</span>
							</span>
					     </div>
					     <br>
					     <hr>
					     <div style="font-size: 1.2em;">
							<span>성인 </span><b id="adult_txt">0</b><br>  
							<span>청소년 </span><b id="teens_txt"> 0</b><br>	     
							<span>유아 및 어린이 </span><b id="child_txt"> 0</b><br>	     
					     </div>
					     <br>
					     <table>
						 <tr>
							<td style="vertical-align: middle;">
							<input type="checkbox" id="pv_agree" name="pv_agree" class="agree_ck" style="margin-top: 5px;">
							</td>
							<td style="padding-left: 10px; font-size: 1em;">관람시 유의사항 동의</td>
							<td style="padding-left: 10px; font-size: 1em;">
								 <span style="padding-left: 80px; color: gray; cursor: pointer;" data-toggle="modal" data-target="#exampleModal">
								 	전문보기 >
								 </span>
							</td>
						 </tr>
						 </table>
						 <br>
						 <button type="button" class="btn btn-block" id="btn" style="font-weight: bold;" onclick="chk()">
						 	예매하기
						</button>
						 <input type="hidden" name="exhNum" value="${evo.exhNum }">
						 <input type="hidden" name="exhName" value="${evo.exhName }">
						 </form>
						 
					  </div>
					</div>
					<br>
					
					</div>
				</div> <!-- col-4 -->
			</div>
		</div>
	</div>
</div>


<script>
function chk() {
	var f = document.thisForm;
	var adult = $("#adult").val() * 1;
	var teens = $("#teens").val() * 1;
	var child = $("#child").val() * 1;
	var selectDate = $("#selectDate").val() * 1;
	
    if(f.pv_agree.checked!=true) {
    	alert('유의사항에 동의해 주세요.');
    } else if (selectDate == ''){
    	alert('관람일을 선택해 주세요.')
    } else if(adult == 0 && teens == 0 && child == 0) {
    	alert('관람인원을 선택해 주세요.')
    } else {
    f.submit();
    //결제페이지로 이동
	}
}
    
// ? 연령 설명
$(function () {
  $('[data-toggle="popover"]').popover({html:true});
  
})
    
//수량 클릭버튼
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

	var max_qty = '4'; // 최대 예매 갯수

	function change_qty(t) {
		var min_qty = 0;
		var adult = $("#adult").val() * 1;
		var teens = $("#teens").val() * 1;
		var child = $("#child").val() * 1;
		
		var tot_qty = adult+teens+child;
		
		
		const adultp = document.getElementById('adultp');
		const teensp = document.getElementById('teensp');
		const childp = document.getElementById('childp');
		
		if (t == "m1") {
			adult -= 1;
			if (adult < min_qty) {
				return;
			}
		} else if (t == "p1") {
			adult += 1;
			if (tot_qty == max_qty) {
				alert("최대 4매까지 예약 가능합니다.");
				return;
			}
		} else if (t == "m2"){
			teens -= 1;
			if (teens < min_qty){
				return;
			}
		} else if (t == "p2"){
			teens += 1;
			if (tot_qty == max_qty) {
				alert("최대 4매까지 예약 가능합니다.");
				return;
			}
		} else if (t == "m3"){
			child -= 1;
			if (child < min_qty){
				return;
			}
		} else if (t =="p3"){
			child += 1;
			if (tot_qty == max_qty){
				alert("최대 4매까지 예약 가능합니다.");
				return;
			}
		}
		
		$("#adult").val(adult);
		$("#teens").val(teens);
		$("#child").val(child);
		
		$("#adult_txt").text(adult);
		$("#teens_txt").text(teens);
		$("#child_txt").text(child);
		
		/* if(tot_qty == max_qty-1){
			console.log('최대 : '+ tot_qty);
			adultp.disabled = true;
			teensp.disabled = true;
			childp.disabled = true;
		} else {
			console.log('else : '+ tot_qty);
			adultp.disabled = false;
			teensp.disabled = false;
			childp.disabled = false;
		} */

	}
    
 </script>

</body>
<%@ include file="/common/footer.jspf"%>
</html>