<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>IMUSEUM - 단체예매하기</title>
<%@ include file="/common/style.jspf" %>
<link rel="stylesheet" href="/css/DatePicker.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 확인창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.11/dist/sweetalert2.all.min.js"></script>
<!-- 데이트피커  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />


<style>
	* {
		list-style: none;
		margin: 0px;
		padding: 0px;
		text-decoration: none;
	}
	a * { color: black;	}
	
	#layout1 {
		width: 100%;
		border-bottom: 1px solid #c3c4c7;
	}
	
	#layout2 {
		width: 100%;
	}
	
	 #layout2 .container2 {
	 	width: 1400px;
	 	margin: auto;
	 	margin-top: 40px;
	 }
	 
	 #layout2 .container2 .box2 {
	 	
	 	width: 700px;
	 	border-bottom: 1px solid #c3c4c7;
	 	margin: auto;
	 }
	 
	 #layout2 .container2 .box2 h1 {
	 	font-weight: bold;
	 }
	 
	 #layout2 .container2 .box2 p {
	 	margin-top: 50px;
	 	font-size: 20px;
	 	font-weight: bold;
	 }
	 
	 #layout2 .container2 .box2 ul {
	 	margin-bottom: 50px;
	 }
	 
	 #layout2 .container2 .box2 ul li {
	 	color: #8c8f94;
	 	font-size: 14px;
	 }
	 
	 
	 
	 #layout3 {
		width: 100%;
	}
	
	 #layout3 .container3 {
	 	width: 1400px;
	 	margin: auto;
	 	margin-top: 40px;
	 }
	 
	 #layout3 .container3 .box3 {
	 	width: 700px;
	 	margin: auto;
	 }

	
	#sub {
		width: 49%;
		float: right; 
		padding: 20px; 
		border-radius: 5px; 
		border: 1px solid black; 
		background-color: black; 
		color: white;
		transition: all 0.3s;
	}
	
	#cancleGroupReservation {
		text-decoration: none; 
		text-align: center; 
		width: 49%; 
		float: left; 
		padding: 20px; 
		border-radius: 5px; 
		border: 1px solid black; 
		background-color: white; 
		color: black;
		transition: all 0.3s;
	}
	
	#sub:hover {
		background-color: white;
		color: black;
	}
	
	#cancleGroupReservation:hover {
		background-color: black;
		color: white;
	}
	







<!-- 데이트피커 -->
.ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

 .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 

 .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 

 .ui-state-default,
 .ui-widget-content .ui-state-default,
 .ui-widget-header .ui-state-default,
 .ui-button,
 html .ui-button.ui-state-disabled:hover,
 html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 

 .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 

 .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 

 .ui-widget.ui-widget-content { border: 1px solid #eee; } 

 #datepicker:focus>.ui-datepicker { display: block; } 

 .ui-datepicker-prev,
 .ui-datepicker-next { cursor: pointer; } 

 .ui-datepicker-next { float: right; } 

 .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 

 .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 

 .ui-datepicker-calendar { width: 100%; } 

 .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 

 .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}

 .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 

 .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 

 .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 

 .ui-state-hover,
 .ui-widget-content .ui-state-hover,
 .ui-widget-header .ui-state-hover,
 .ui-state-focus,
 .ui-widget-content .ui-state-focus,
 .ui-widget-header .ui-state-focus,
 .ui-button:hover,
 .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 

 .ui-widget-header .ui-icon { background-image: url('C:/MyStudy/70_Spring/Museum/src/main/webapp/cssImage/btns.png'); } 

 .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 

 .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 

 .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 

 .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 

 .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 

 .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 

 .ui-state-highlight,
 .ui-widget-content .ui-state-highlight,
 .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 

 .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 

 .inp:focus { outline: none; background-color: #eee; }
	
	
	#modalBut1 {
		transition: all 0.3s;
	}	
	#modalBut1:hover {
		background-color: white;
		color: black;
	}
	#modalBut2 {
		transition: all 0.3s;
	}	
	#modalBut2:hover {
		background-color: white;
		color: black;
	}
		
</style>


<script>
	// 글씨 삭제 
	function a(y){
		   if (y.defaultValue==y.value) {
		      y.value = "";
		   }
		}
	
	
	// 확인 창
	$().ready(function () {
	    $("#cancleGroupReservation").click(function () {
	        Swal.fire({
	            title: '취소',
	            text: " 취소 하시겠습니까?",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#d33',
	            cancelButtonColor: '#3085d6',
	            confirmButtonText: '취소',
	            cancelButtonText: '이어서 하기'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                Swal.fire(
	                    '취소 완료.','정상적으로 취소되었습니다.','success'
	                )
	                setTimeout(function(){
	                   location.href="getLearn.do?learnIdx=${learn.learnIdx}";
	                },1500)
	            }
	        })
	    });
	});

	
	// 확인 창
//	$().ready(function() {
//	    $("#sub").click(function () {
//	        Swal.fire({
//	            title: '단체 예매',
//	            text: " 예매 하시겠습니까?",
//	            icon: 'success',
//	            showCancelButton: true,
//	            confirmButtonColor: '#3085d6',
//	            cancelButtonColor: '#d33',
//	            confirmButtonText: '예매하기',
//	            cancelButtonText: '예매 취소'
//	        }).then((result) => {
//	            if (result.isConfirmed) {
//	                Swal.fire(
//	                    '예매 완료.','정상적으로 예매가 완료되었습니다.','success'
//	                )
//	                setTimeout(function(){
//	                   location.href="InsertGroupReservation.do";
//	                },1500)
//	            }
//	        })
//	    });
//	});
	
//	$().ready(function() {
//	    $("#sub").click(function () {
//	    	Swal.fire({
//	    		title: '단체 예매',
//	            text: " 단체예매가 완료되었습니다.",
//	            icon: 'success',
//	            confirmButtonColor: '#3085d6',
//	            confirmButtonText: '확인'
//	        });
//	    });
//	}); 
	
	// 데이트 피커
	$(function(){
	    $('.datepicker').datepicker({
	    	minDate: 0,
	    	maxDate: "+30D"
	    });
	 });
	
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});
	
	
	$().ready(function groupReservation(frm) {
		$('#sub').click(function () {
			if($('.groupValue').val() == 0) {
				alert("단체 구분을 선택해 주세요.")
				$('.groupValue').focus();
				$('.groupValue').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.datepicker').val() == '') {
				alert('희망 일자를 선택해주세요.')
				$('.datepicker').focus();
				$('.datepicker').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.wantTime').val() == '교육 희망시간을 입력해 주세요.') {
				alert('희망 시간을 입력해 주세요.')
				$('.wantTime').focus();
				$('.wantTime').css({
					"border" : "2px solid red"
				});
				return;
			}else if($('.groupName').val() == '단체명을 입력해 주세요.') {
				alert('단체 정보를 입력해 주세요.')
				$('.groupName').focus();
				$('.groupName').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.groupInfomation').val() == 0) {
				alert('단체 정보를 선택해 주세요.')
				$('.groupInfomation').focus();
				$('.groupInfomation').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.memberNumber').val() == '명') {
				alert('신청 인원을 입력해 주세요.')
				$('.memberNumber').focus();
				$('.memberNumber').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.applicant').val() == 0) {
				alert('신청자 정보를 입력해 주세요.')
				$('.applicant').focus();
				$('.applicant').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.relationship').val() == '현장 인솔자분과 에매자분의 관계를 간략히 기재해 주세요.') {
				alert('신청자 및 인솔자분의 관계를 입력해 주세요.')
				$('.relationship').focus();
				$('.relationship').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.card').val() == 0) {
				alert('결제방법을 선택해 주세요.')
				$('.card').focus();
				$('.card').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.quantityMethod').val() == 0) {
				alert('수령방법을 선택해 주세요.')
				$('.quantityMethod').focus();
				$('.quantityMethod').css({
					"border" : "2px solid red"
				});
				return;
			} else if($('.content').val() == '참여 단체 또는 참가자의 특성(연령대, 미술관 교육 참여 목적 등)이나 요청 사항들을 적어 주세요. 담당 에듀케이터가 참고하여 프로그램을 준비하도록 하겠습니다.') {
				alert('내용을 입력해주세요.')
				$('.content').focus();
				$('.content').css({
					"border" : "2px solid red"
				});
				return;
			} else if($("#checkbox1").is(":checked") == false) {
				alert("전시/프로그램 참여 동의서에 체크해 주세요.")
				$('#checkbox1').focus();
                return;
            } else if($("#checkbox2").is(":checked") == false) { // 두번째 체크박스가 체크 되어있지 않은 있는경우
                alert("프로그램 참여시 유의 사항 동의에 체크해 주세요.");
                $('#checkbox2').focus();    
            	return;
            }

		});
	});
	

</script>	


</head>
<body>
	<div id="layout1">
		<%@ include file="/common/adminMenu.jspf" %>
		<%@ include file="/common/main.jspf" %>
	</div>
	
	
	<div id="layout2">
		<div class="container2">
			<div class="box2">
				<h1>단체예매 신청 (교육)</h1>
				<p>꼭! 확인하세요.</p>
				<ul>
					<li>-단체 예약은 교육팀 담당자 확인 전화를 받은 후 신청이 확정됩니다.</li>
					<li>-담당자 승인 후 48시간 내 결제가 진행되어야 예매가 완료됩니다. 결제 기한을 꼭 지켜주세요.</li>
					<li>-미술관과 교육센터 상황에 따라 신청하신 날짜와 시간에 교육 진행이 어려울 수도 있습니다.<br>&nbsp;이 경우, 담당자 확인 전화 시 안내해 드리겠습니다.</li>
					<li>-예매 취소 시, 예약하신 교육 전 일 오후 5시까지는 수수료 없이 전액 환불이 가능합니다.</li>
					<li>-취소 가능 시간 이후에는 티켓 취소, 변경 환불이 불가능합니다. 신청 시 꼭 참고해 주세요.</li>
					<li>-궁금하신 사항은 문의하기에 남겨주시면 빠르게 답변 드리겠습니다.</li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="layout3">
		<div class="container3">
			<div class="box3">
		 		<form action="InsertGroupReservation.do" method="post">
					<span style="display:block; margin-bottom: 20px; color: #646970;"><b style="color: red;">*</b>표시는 필수 입력 항목입니다.</span><br>
					
					<span style="color: #646970;">단체 구분<b style="color: red;">*</b></span><br>
					<select id="groupValue" name="groupValue" class="groupValue" style="padding: 20px; width: 100%; font-size: 18px; opacity: 0.6;">
						<option value="선택">선택</option>
						<option value="개인 단체">개인 단체</option>
						<option value="학교 단체">학교 단체</option>
						<option value="기업 단체">기업 단체</option>
					</select><br><br>
					
					<span style="color: #646970;">프로그램명<b style="color: red;">*</b></span><br>
					<select name="programTitle" class="programTitle" style="padding: 20px; width: 100%; font-size: 18px; opacity: 0.6;">
							<option value="${learn.title }">${learn.title }</option>
					</select><br><br>
					
					<span style="color: #646970;">희망 일자<b style="color: red;">*</b></span><br>
					<input name="datepicker" class="datepicker" style="padding: 20px; width: 43%; font-size: 18px; opacity: 0.6;"><br><br>
					
					<span style="color: #646970;">희망 시간<b style="color: red;">*</b></span><br>
					<input class="wantTime" name="wantTime" type="text" value="교육 희망시간을 입력해 주세요." style="padding: 20px; width: 100%; font-size: 18px; opacity: 0.6;" onfocus="a(this)">
	
					
					<span style="font-size: 14px; opacity: 0.6;">&#149;&nbsp;희망 시간을 기재해 주시면 적극 반영하도록 하겠습니다.</span><br><br>
					
					<span style="color: #646970;">단체 정보<b style="color: red;">*</b></span><br>
					<input class="groupName" name="groupName" type="text" value="단체명을 입력해 주세요." style="padding: 20px; width: 48%; font-size: 18px; opacity: 0.6;" onfocus="a(this)">
					
					<select name="groupInfomation" class="groupInfomation" style="float: right; padding: 20px; width: 48%; font-size: 18px; opacity: 0.6;">
						<option value="0">선택</option>
						<option value="1">유치원</option>
						<option value="2">어린이집</option>
						<option value="3">초등학교</option>
						<option value="4">중학교</option>
						<option value="5">고등학교</option>
						<option value="6">대학교</option>
						<option value="7">대학원</option>
						<option value="8">사설 교육 기관</option>
						<option value="9">일반 기업</option>
						<option value="10">개인 모임</option>
						<option value="11">기타</option>
					</select><br>
					
					<span style="font-size: 14px; opacity: 0.6;">&#149;&nbsp;'선택' 버튼을 눌러 참여 단체의 유형을 선택해 주세요.</span><br><br>
						
					<span style="color: #646970; ">신청 인원<b style="color: red;">*</b></span><br>
					<input class="memberNumber" name="memberNumber" type="text" value="명" style="padding: 20px; width: 48%; font-size: 18px; text-align: right; opacity: 0.6;"><br>
					
					<span style="font-size: 14px; opacity: 0.6;">&#149;&nbsp;단체의 교육 참여 신청은 10명 이상부터 가능합니다.</span><br><br>
					
					
					<span style="color: #646970;">신청자 & 인솔자 정보<b style="color: red;">*</b></span><br>
					<div style="display: block; margin-bottom: 20px;">
						<span style="padding: 20px; font-size: 18px; width: 48%; float: left; border: 1px solid #8c8f94; text-align: center; background-color: #c3c4c7; opacity: 0.6;">${member.id }</span>
						<input type="hidden" name="id" value="${member.id }">
						<span style="padding: 20px; font-size: 18px; width: 48%; float: right; border: 1px solid #8c8f94; text-align: center; background-color: #c3c4c7; opacity: 0.6;">${member.phone }</span>
					</div><br><br>
					<div style="width:100%; display: block; margin-top: 20px;">
						<select name="applicant" class="applicant" style="float: left; padding: 20px; width: 28%; font-size: 18px; opacity: 0.6;">
							<option value="0">선택</option>
							<option value="1">1명</option>
							<option value="2">2명</option>
							<option value="3">3명</option>
						</select>
						<input class="relationship" name="relationship" type="text" value="현장 인솔자분과 에매자분의 관계를 간략히 기재해 주세요." style="padding: 20px; width: 68%; font-size: 18px; float: right; opacity: 0.6;" onfocus="a(this)">
					</div><br><br><br>
					<span style="font-size: 14px; opacity: 0.6;">&#149;&nbsp;인솔자분들의 무료 입장을 위하여 예매자분을 포함한 현장 인솔자 인원과 정보를 입력해 주세요. (최대 3명)</span><br><br>
					 
					<span style="color: #646970;">결제방법<b style="color: red;">*</b></span><br>
					<select name="card" class="card" style="padding: 20px; width: 100%; font-size: 18px; opacity: 0.6;">
						<option value="0">선택</option>
						<option value="1">카드</option>
						<option value="2">무통장 입금</option>
						<option value="3">현장 결제</option>
					</select>
					
					<span style="font-size: 14px; opacity: 0.6;">&#149;&nbsp;결제하실 수단을 선택해 주세요.</span><br><br>
					
					<span style="color: #646970;">수령방법<b style="color: red;">*</b></span><br>
					<select name="quantityMethod" class="quantityMethod" style="padding: 20px; width: 100%; font-size: 18px; opacity: 0.6;">
						<option value="0">선택</option>
						<option value="1">구매자 현장 수령</option>
						<option value="2">온라인 티켓 수령</option>
						<option value="3">기업 단체</option>
					</select><br>
	
					<span style="font-size: 14px; opacity: 0.6;">&#149;&nbsp;수령하실 수단을 선택해 주세요.</span><br><br>
					
					
					<span style="color: #646970;">요청사항<b style="color: red;">*</b></span><br>
					<textarea class="content" name="content" rows="5" style="width: 100%; font-size: 18px; opacity: 0.6;" onfocus="a(this)">참여 단체 또는 참가자의 특성(연령대, 미술관 교육 참여 목적 등)이나 요청 사항들을 적어 주세요. 담당 에듀케이터가 참고하여 프로그램을 준비하도록 하겠습니다.</textarea><br><br>
					
					<input type="checkbox" name="checkbox1" id="checkbox1" style="zoom: 1.1;" required>
					<span style="font-size: 1.1rem; color: #646970;">&nbsp;&nbsp;전시/프로그램 참여 동의서&nbsp;&nbsp;<b>전문보기<button type="button" data-toggle="modal" data-target="#myModal" style="border: none; background-color: white; font-weight: bold;">&gt;</button></b></span><br>
					
					<input type="checkbox" name="checkbox2" id="checkbox2" style="zoom: 1.1;" required>
					<span style="font-size: 1.1rem; color: #646970;">&nbsp;&nbsp;프로그램 참여시 유의 사항 동의&nbsp;&nbsp;<b>전문보기<button type="button" data-toggle="modal" data-target="#myModal2" style="border: none; background-color: white; font-weight: bold;">&gt;</button></b></span><br><br><br>
	
					<input id="sub" type="submit" value="단체예매 신청하기" onclick="groupReservation()">
				</form>
				<input type="submit" id="cancleGroupReservation" value="취소">
			</div>
		</div>
	</div>
	

<!-- ========================================================MODAL===================================================================================== -->
	<!-- The Modal -->
  	<div class="modal" id="myModal">
    	<div class="modal-dialog modal-dialog-scrollable">
      		<div class="modal-content">
      
        		<!-- Modal Header -->
       			<div class="modal-header">
        			<h3 style="text-align: center;">전시/프로그램 참여 동의서</h3>
          			<button type="button" class="close" data-dismiss="modal">×</button>
      			</div>
        
       			<!-- Modal body -->
     			<div class="modal-body">
		     		<h3>전시/프로그램 참여 동의서</h3>
		      	    <p>입장, 티켓 환불 & 취소</p>
					<p>예매하신 티켓의 변경, 취소, 환불은 전시 관람 또는 프로그램 하루 전 오후 5시까지만 가능합니다.</p>
					<p>이후에는 취소와 환불이 불가하오니 유의해 주세요.</p>
					<p>전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.</p>
					<p>관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리 되어 취소,환불이 불가능합니다.</p>
					<p>재관람은 ‘사용완료’ 처리된 티켓으로만 가능합니다. 티켓을 취소 했거나, 예매 후 미술관을 방문하지 못해 기간만료 처리 된 티켓으로는 재관람이 어렵습니다.</p>
					<p>코로나19 예방과 확산 방지를 위한 관람객 유의 사항</p>
					<p>미술관 안에서는 안전한 관람을 위하여 관람객 모두 마스크를 착용해야 합니다.</p>
					<p>올바른 마스크 착용이 아니거나 마스크 착용을 거부할 경우 퇴장 조치 될 수 있습니다.</p>
					<p>미술관 방문과 전시 관람</p>
					<p>전시장 안으로는 물, 껌, 사탕을 포함한 모든 음식물 반입이 불가하오니 꼭 기억해 주세요.</p>
					<p>미술관 내에는 안내견을 제외한 반려동물은 입장할 수 없습니다.</p>
					<p>플래시, 삼각대 및 셀카봉을 이용한 촬영, 상업적 용도의 촬영, 동영상 촬영은 불가합니다.</p>
					<p>14세 미만 어린이의 경우, 보호자와 함께 입장하셔야 합니다.</p>
					<p>전시장에서는 어린이들이 보호자의 손을 잡고 전시를 관람할 수 있게 해 주세요.</p>
					<p>관람객이 전시 작품 및 시설물을 파괴하거나 훼손하였을 때에는 이에 상응하는 손해 배상을 하실 수 있으니, 관람에 유의해 주세요.</p>
		       </div>	
	
			   <!-- Modal footer -->
		       <div class="modal-footer">
		       		<button type="button" id="modalBut1" style="padding: 5px 20px; background-color: black; color: white; border: 1px solid black; border-radius: 5px;" data-dismiss="modal">확인</button>
		       </div>
			</div>
		</div>
	</div>
	
	<!-- The Modal2 -->
  	<div class="modal" id="myModal2">
    	<div class="modal-dialog modal-dialog-scrollable">
      		<div class="modal-content">
      
        		<!-- Modal Header -->
       			<div class="modal-header">
        			<h3 style="text-align: center;">프로그램 참여시 유의 사항 동의</h3>
          		<button type="button" class="close" data-dismiss="modal">×</button>
      			</div>
        
       			<!-- Modal body -->
     			<div class="modal-body">
		     		<h3>프로그램 참여시 유의 사항 동의</h3>
		      		<p>입장, 티켓 환불 & 취소</p>
					<p>예매하신 티켓의 변경, 취소, 환불은 전시 관람 또는 프로그램 하루 전 오후 5시까지만 가능합니다.</p>
					<p>이후에는 취소와 환불이 불가하오니 유의해 주세요.</p>
					<p>전시 관람 또는 프로그램 참여 당일 예매하신 티켓은 취소, 변경, 환불이 불가합니다. 꼭 기억해 주세요.</p>
					<p>관람 및 참여 여부와 관계없이 예약시간에 사용하지 않은 티켓은 기간만료 처리 되어 취소,환불이 불가능합니다.</p>
					<p>재관람은 ‘사용완료’ 처리된 티켓으로만 가능합니다. 티켓을 취소 했거나, 예매 후 미술관을 방문하지 못해 기간만료 처리 된 티켓으로는 재관람이 어렵습니다.</p>
					<p>코로나19 예방과 확산 방지를 위한 관람객 유의 사항</p>
					<p>미술관 안에서는 안전한 관람을 위하여 관람객 모두 마스크를 착용해야 합니다.</p>
					<p>올바른 마스크 착용이 아니거나 마스크 착용을 거부할 경우 퇴장 조치 될 수 있습니다.</p>
					<p>미술관 방문과 전시 관람</p>
					<p>전시장 안으로는 물, 껌, 사탕을 포함한 모든 음식물 반입이 불가하오니 꼭 기억해 주세요.</p>
					<p>미술관 내에는 안내견을 제외한 반려동물은 입장할 수 없습니다.</p>
					<p>플래시, 삼각대 및 셀카봉을 이용한 촬영, 상업적 용도의 촬영, 동영상 촬영은 불가합니다.</p>
					<p>14세 미만 어린이의 경우, 보호자와 함께 입장하셔야 합니다.</p>
					<p>전시장에서는 어린이들이 보호자의 손을 잡고 전시를 관람할 수 있게 해 주세요.</p>
					<p>관람객이 전시 작품 및 시설물을 파괴하거나 훼손하였을 때에는 이에 상응하는 손해 배상을 하실 수 있으니, 관람에 유의해 주세요.</p>
		      	 </div>	
	
			   <!-- Modal footer -->
		       <div class="modal-footer">
		       		<button type="button" id="modalBut2" style="padding: 5px 20px; background-color: black; color: white; border: 1px solid black; border-radius: 5px;" data-dismiss="modal">확인</button>
		       </div>
			</div>
		</div>
	</div>
	
	
<!-- ========================================================MODAL===================================================================================== -->
	
	
	
	<div class="footer" style="margin-top: 150px;">
		<%@ include file="/common/footer.jspf" %>
	</div>
</body>
</html>