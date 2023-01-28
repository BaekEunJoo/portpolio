<%@page import="java.text.DecimalFormat"%>
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
		color: gray;
		font-size: 0.8em;
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
					<img alt=".." src="${pageContext.request.contextPath}/learnImage/${learn.fileName }" width="100%;">
				<br><br>
				<span class="badge">
					<c:if test="${learn.educationNum == 0 }">
					교육  
					</c:if>
					<c:if test="${learn.educationNum == 1 }">
					1회성 교육 
					</c:if>
					<c:if test="${learn.educationNum == 2 }">
					단체 교육  
					</c:if>
				</span>
				<span class="badge">
					아이뮤지엄
				</span>
				<br>
				<span style="font-size: 2.5em; font-weight: bold;">${learn.title }</span><br>
				<span style="font-size: 1.1em; color: gray;">${learn.subtitle }</span>
				<hr>
				<div>
				<table style="width: 100%; color: gray;">
					<tr>
						<td width="10%" style="font-weight: bold;">
							교육진행
						</td>
						<td width="40%">
							${learn.regdate1.replace("/", "-") } ~ ${learn.regdate2.replace("/", "-") }
						</td>
						<td width="10%" style="font-weight: bold;">
							장소
						</td>
						<td>
							${learn.place }
						</td>
					</tr>
					<tr>
						<td width="10%" style="font-weight: bold;">
							대상
						</td>
						<td width="40%">
							${learn.target }
						</td>
						<td width="10%" style="font-weight: bold;">
							교육시간
						</td>
						<td width="40%">
							${learn.educationTime }
						</td>
					</tr>
					<tr>
						<td width="10%" style="font-weight: bold;">
							교육횟수
						</td>
						<td width="40%">
							${learn.educationNumber }
						</td>
						<td width="10%" style="font-weight: bold;">
							정원 수
						</td>
						<td width="40%">
							${learn.memberNumber }
						</td>
					</tr>
					<tr>
						<td width="10%" style="font-weight: bold;">
							참가비
						</td>
						<td width="40%">
						<c:set var="price" value="${learn.fee }"/>
							<% int fee = 0;	%>
						<c:if test="${price == '무료' }">
							${price }
						</c:if>
						<c:if test="${price != '무료' }">
							<%
							String price = (String)pageContext.getAttribute("price");
							int slice = price.indexOf("원"); 
						    fee = Integer.parseInt(price.substring(0, slice));
							
							DecimalFormat decFormat = new DecimalFormat("###,###");
							%>
							<%=decFormat.format(fee) %>원
						</c:if>	
						</td>
						<td width="10%" style="font-weight: bold;">
							문의
						</td>
						<td width="40%">
							${learn.inquiry }
						</td>
					</tr>
				</table>
				</div>
				<hr>
				<br>
				<p style="font-size: 1.5em; font-weight: bold;">이용 정보</p>
				<div>
					<p>${learn.content }</p>
				</div>
				<!-- <img alt=".." src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fk.kakaocdn.net%2Fdn%2FBKOMo%2FbtrRup3iDVi%2F6SIjMJylp5ylubZjk1RaG0%2Fimg.png"
					width="100%;"> -->
				</div> <!-- col-8 -->
				
				
				<div class="col-4">
				<div class="position-sticky">
					<div class="card" style="width: 100%; border-radius: 0;">
					  <div class="card-body">
						<%@ include file="/common/CalendarLearn.jspf" %>
						<p style="font-size: 0.8em; color: gray;">* 매주 월요일은 휴관일입니다.</p>
					  <form name="thisForm" action="learnpay.do" method="post">
						<input type="hidden" id="selectDate" name="selectDate" value="0">
					    <hr>
					    <p style="font-size: 1.3em; font-weight: bold;">수업시간</p>
					    <button type="button" class="btn" id="btn">${learn.educationTimeNum }</button>
					    <hr>
					    <span style="font-size: 1.3em; font-weight: bold;">예약가능 인원</span>
					    <span style="float: right; font-size: 1.2em; font-weight: bold;">
					    <c:set var="maxmember" value="${learn.memberNumber }" />
					    <%
					    String membermax = (String)pageContext.getAttribute("maxmember");
						membermax = membermax.trim();
					    int idx = membermax.indexOf("명"); 
					    int maxmember = Integer.parseInt(membermax.substring(0, idx)); //교육정원
					    %>
					    	<span id="posMember" style="visibility: hidden;">
						    	<span style="color: red;" id="posNumber"><%=maxmember %></span>
						    		<span style="color: gray;">/</span>
					    	</span>
					    	<span style="color: gray;"><%=maxmember %> 명</span>
					    </span>
					    <hr>
					    <p style="font-size: 1.3em; font-weight: bold;">인원</p>
					    <i class="bi bi-info-circle"></i>
					    <span style="font-size: 0.9em;">한 개의 ID로 회당 최대 4매까지 예매 가능합니다.</span><br><br>
					    
					    <div class="qty">
					    	<span style="padding-left: 10px;">인원</span>	
					    		<span class="qty" style="Float:right;">
								<span class="minus">
									<a href="javascript:change_qty('m')">
										<input type="button" value="-" class="mbtn">
									</a>
								</span> 
								<input type="text" class="ct_qty" id="ct_qty" name="subscriber" value="1" readonly="readonly"> 
								<span class="plus">
									<a href="javascript:change_qty('p')">
										<input type="button" value="+" class="pbtn">
									</a>
								</span>
							</span>
					     </div>
					     <br>
					     <hr>
					     <table>
						 <tr>
							<td style="vertical-align: middle;">
							<input type="checkbox" id="pv_agree" name="pv_agree" class="agree_ck" style="margin-top: 5px;">
							</td>
							<td style="padding-left: 10px; font-size: 1em;">프로그램 참여시 유의사항 동의</td>
							<td style="padding-left: 10px; font-size: 1em;">
								 <span style="padding-left: 10px; color: gray; cursor: pointer;" data-toggle="modal" data-target="#exampleModal">
								 	전문보기 >
								 </span>
							</td>
						 </tr>
						 </table>
						 <br>
						 <button type="button" class="btn btn-block" id="btn" style="font-weight: bold;" onclick="chk()">
						 	예매하기
						</button>
						<input type="hidden" name="title" value="${learn.title }">
						<input type="hidden" name="learnIdx" value="${learn.learnIdx }">
						<input type="hidden" name="revTime" value="${learn.educationTimeNum }">
						<input type="hidden" name="place" value="${learn.place }">
						<input type="hidden" name="price" value="<%=fee%>">
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
        var selectDate = $("#selectDate").val() * 1;
        
        if(f.pv_agree.checked!==true) {
            alert('유의사항에 동의해 주세요.');
        } else if (selectDate == ''){
        	alert('교육일을 선택해 주세요.')
        } else {
            f.submit();
            //결제페이지로 이동
        }
    }
    
    
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

	function change_qty(t) {
		var f = document.thisForm;
        var selectDate = $("#selectDate").val() * 1;
		if(selectDate == ''){
			alert('교육일을 선택해 주세요.');
			return;
		}
							
		//var min_qty = '수량버튼'*1;
		var pos_qty = $("#posNumber").val() * 1;
			var min_qty = 1;
			var this_qty = $("#ct_qty").val() * 1;
			console.log('예매가능 : ' + pos_qty);
			
			if (pos_qty == 0 || pos_qty >= 4){
				var max_qty = '4'; // 최대 예매
			} else if (pos_qty < 4) {
				var max_qty = pos_qty; // 최대 예매
				if ($(".ct_qty").val() > max_qty ){
					$(".ct_qty").val(max_qty);
				}
			}
			
			
			if (t == "m") {
				this_qty -= 1;
				if (this_qty < min_qty) {
					return;
				}
			} else if (t == "p") {
				this_qty += 1;
				if (this_qty > max_qty) {
					alert("최대 "+max_qty+"매까지 예약 가능합니다.");
					return;
				}
			}

			$(".ct_qty").val(this_qty);
		}
    
 </script>

</body>
<%@ include file="/common/footer.jspf"%>
</html>