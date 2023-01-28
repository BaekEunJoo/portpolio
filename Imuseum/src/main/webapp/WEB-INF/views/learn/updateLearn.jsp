<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IMUSEUM - Learn수정하기</title>
<%@ include file="/common/style.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- 데이트피커  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
	a * {
		list-style: none;
		margin: 0px;
		padding: 0px;
		color: black;
		text-decoration: none;
		font-family: sans-serif;
	}
	
	<!-- lauout2 시작 -->

	#layout1 {
		width: 100%;
	}
	
	#layout2 {
		width: 100%;
		margin-top: 50px;
	}
	#layout2 .container2 {
		width: 100%;
		margin: auto;
	}
	
	

	
	<!-- layout3 시작 -->
	
	#layout3 {
		width: 100%;
	}
	
	#layout3 .container3 {
		width: 1280px;
		margin: auto;
	}
	
	#layout3 .container3 .box3 {
		margin-top: 10px;
	}
	
	#layout3 .container3 .box3 table {
		margin-top: 30px;
		padding: 10px;

	}
	
	#layout3 .container3 .box3 table tr td {
		padding: 10px;
	}
	
	#layout3 .container3 .box3 table tr td {
		
	}
	
	#layout3 .container3 .box3 input {
		border: 2px solid white;
		border-radius: 5px;
		width: 100%;
		padding: 3px;
		color: #c3c4c7;
	}
	
	
	#layout3 .container3 .box3 input:hover {
		border: 2px solid #c3c4c7;
		border-radius: 5px;
	}
	
	#content {
		width: 100%;
		border: none;
		color: black;
		font-size: 20px;
		border: 2px solid black;
		border-radius: 5px;
		padding: 5px;
	}
	
	<!-- layout4 시작 -->

	
	#layout4 {
		width: 100%;
	}
	
	#layout4 .container4 {
		width: 1280px;
		margin: auto;
	}
	
	#layout4 .container4 label {
		float: right;
	}
	

	
	#layout4 .container4 #insert {
		width: 150px;
		border: 1px solid black;
		background-color: black;
		color: white; 
		padding: 15px 40px; 
		border-radius: 5px; 
		text-align: center; 
		border: 1px solid black;
		float: right;
		margin-left: 5px;
		transition: all 0.3s;
		font-weight: bold;
	}
	
	#layout4 .container4 #insert:hover {
		background-color: white;
		color: black;
		border: 1px solid black;
		
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



	


	
</style>
<script>
	function a(y){
		   if (y.defaultValue==y.value) {
		      y.value = "";
		   }
		}
	
	// 사진 1개
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
	}
	
	
	// 사진2
	function readURL2(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview2').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview2').src = "";
		  }
	}
	
	
	
	// 데이트 피커
	$(function(){
	    $('.datepicker').datepicker({
	    	minDate: 0,
	    	maxDate: "+90D"
	    });
	 });
	
	$.datepicker.setDefaults({
	  dateFormat: 'yy/mm/dd',
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
	
	
</script>
</head>
<body>
	<div id="layout1">
		<%@ include file="/common/adminMenu.jspf" %>
		<%@ include file="/common/main.jspf" %>
	</div>
	<div id="layout2">
		<div class="container2">
			<img id="preview" style="display:block; margin: auto; margin-bottom: 20px;" src="${pageContext.request.contextPath}/learnImage/${learn.fileName }"/>
		</div>
	</div>
	
	<div id="layout3">
		<div class="container3 notosanskr">
			<form action="updateLearn.do" method="post" enctype="multipart/form-data">
			<label for="fileName" class="fileName" style="border: none; background-color: black; color: white; padding: 15px 40px; border-radius: 5px; text-align: center; border: 1px solid black;">메인사진 수정</label>
			<input type="file" name="uploadFile" id="fileName" onchange="readURL(this);" style="display: none;">
			<input type="hidden" name="fileName">
			<div class="box3">
					<span style="font-size: 40px; font-weight: bold;"><input type="text" value="${learn.title }" name="title" id="title" onfocus="a(this)" style="margin-bottom: 20px; color: #c3c4c7; font-weight: bold;"></span><br>
					<span style="font-size: 20px; margin-top: 20px;"><input type="text" value="${learn.subtitle }" name="subtitle" id="subtitle" onfocus="a(this)" style="margin-bottom: 20px;"></span><br>
					<select name="categoryNum" class="categoryNum" style="padding: 10px 30px;">
						<option value="0">연령대상</option>
						<option value="1">유아</option>
						<option value="2">어린이</option>
						<option value="3">청소년</option>
						<option value="4">대학생</option>
						<option value="5">성인</option>
						<option value="6">교사</option>
						<option value="7">전시해설</option>
					</select>	
					
					<select name="educationNum" class="educationNum" style="padding: 10px 30px;">
						<option value="0">교육</option>
						<option value="1">1회성 교육</option>
						<option value="2">단체 교육</option>
					</select>
					<select name="placeNum" class="placeNum" style="padding: 10px 30px;">
						<option value="0">장소</option>
						<option value="1">아이뮤지엄</option>
					</select>		
					
					<table style="width: 1100px; ">
						<tr>
							<td><b>교육 진행</b></td>
							<td><input name="regdate1" class="datepicker" style="text-align: center;" value="${learn.regdate1 }"></td>
							<td>~</td>
							<td><input name="regdate2" class="datepicker" style="text-align: center;" value="${learn.regdate2 }"></td>
							<td><b>교육 시간</b></td>
							<td><select name="educationTimeNum" id="educationTimeNum" style="width: 100%; padding: 3px; border-radius: 5px; ">
								<option value="${learn.educationTimeNum }">${learn.educationTimeNum }</option>
								<option value="아침(09:00)">아침(09:00)</option>
								<option value="점심(13:00)">점심(13:00)</option>
								<option value="저녁(19:00)">저녁(19:00)</option>
								<option value="종일(09:00 ~ 21:00)">종일(09:00 ~ 21:00)</option>
							</select></td>
							<td><select name="educationTime" id="educationTime" style="width: 100%; padding: 3px; border-radius: 5px;">
								<option value="${learn.educationTime }">${learn.educationTime }</option>
								<option value="60분">60분</option>
								<option value="120분">120분</option>
								<option value="180분">180분</option>
							</select></td>
						</tr>
						<tr>
							<td><b>장소</b></td>
							<td colspan="3"><input type="text" value="${learn.place }" name="place" id="place" onfocus="a(this)"></td>
							<td><b>교육 횟수</b></td>
							<td><input type="text" value="${learn.educationNumber }" name="educationNumber" id="educationNumber" onfocus="a(this)"></td>
						</tr>
						<tr>
							<td><b>대상</b></td>
							<td colspan="3"><input type="text" value="${learn.target }" name="target" id="target" onfocus="a(this)"></td>
							<td><b>정원 수</b></td>
							<td><input type="text" value="${learn.memberNumber }" name="memberNumber" id="memberNumber" onfocus="a(this)"></td>
						</tr>
						<tr>
							<td><b>문의</b></td>
							<td colspan="3"><input type="text" value="${learn.inquiry }" name="inquiry" id="inquiry" onfocus="a(this)"></td>
							<td><b>참가비</b></td>
							<td><input type="text" value="${learn.fee }" name="fee" id="fee" onfocus="a(this)"></td>
						</tr>
					</table>
					
					<p style="margin-top: 50px; font-size: 40px; font-weight: bold; border-top: 1px solid black; margin-bottom: 30px; padding-top: 20px;">교육 정보</p>
					<textarea name="content" id="content" rows="30" cols="80" title="내용" onfocus="a(this)">${learn.content }</textarea><br>
					
					
						<img id="preview2" style="display:block; margin: auto; width: 100%; margin-top: 10px; margin-bottom: 10px;" src="${pageContext.request.contextPath}/learnImage/${learn.fileName2 }"/>
				
					
					<div id="layout4">
						<div class="container4">	
							<span><input id="insert" type="submit" value="수정하기" onclick="insert()"></span>
							<label for="fileName2" class="fileName2" style="border: none; background-color: black; color: white; padding: 15px 40px; border-radius: 5px; text-align: center; border: 1px solid black;">추가사진 업로드</label>
							<span><input type="file" name="uploadFile2" id="fileName2" onchange="readURL2(this);" style="display: none;"></span>
							<input type="hidden" name="fileName2">
						</div>
					</div>
				</div>
			</form>	
			
			<div id="images_container"></div>
		</div>
	</div>
	
	<div class="footer" style="margin-top: 150px;">
		<%@ include file="/common/footer.jspf" %>
	</div>
	
</body>
</html>