<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>배송지 관리</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	.defaultBox {
		width:100px;
		height:20px;
		background-color: black;
		color:white;
		padding:5px;
		font-size: 0.5em;
		font-weight: bold;
		text-align: center;
		margin-bottom:10px;
	}
	input {accent-color: black;}
	#btn2 {
		color : white;
		background-color: black;	
	}
	.bt {
		width:150px;
		height:50px;
		margin-left:20px;
		border: 1px solid black;
		background-color: white;
	}
	#default:hover {
		color : white;
		background-color: black;
	}
	#btn2:hover {
		color : black;
		background-color: white;
	}
	.page-item > a {
		color : black;
		border : none;
	}
	.boldBorder:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 3px solid black;
		margin-top : 15px;
	}
	#modal2{z-index:999;}
	.badge {
		width:200px;
		height:50px;
		background-color: black;
		color:white;
		text-align: center;
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
	#mp_addr {color: black;}
</style>
</head>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function(){
	$('#addrPhone').on('keyup',function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );	
	});
});
function updateAddrDefault(a) {
	var addrnum = a;
	
	var result = confirm('기본 배송지로 설정하시겠습니까?');
	if (result==true){
		alert('기본배송지로 설정되었습니다.');
	location.href='updateAddrDefault.do?addrNum='+addrnum;
	}
}

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
			document.getElementById('postNum').value = data.zonecode;
			document.getElementById("addr").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("addrDetail").focus();
		}
	}).open();
}
</script>
<body>
	<!-- 배송지 추가 모달창 시작 -->
	<div class="modal notosanskr" id="insertAddr">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    <!-- Modal Header -->
	      <div class="modal-header" style="background-color:black; color:white;">
	        <h4 class="modal-title">배송지 추가</h4>
	      </div>
	      <div class="modal-body">
			<form id="insert-address" method="post" action="mp_insertAddr.do" name="getAddrList">
				<div class="form-group">
					<label for="addr"><strong>주소</strong><span style="color:red;">&nbsp;*</span></label><br>
						<span>
							<input type="text" class="form-control mb-2" id="postNum" placeholder="우편번호" readonly="readonly" name="postNum" required>
						</span>
						<span>
							<input type="button" class="form-control mb-2" onclick="daumPostcode()" value="우편번호 찾기" style="background-color:black; color:white;" name="id">
						</span>
					<input type="text" class="form-control mb-2" id="addr" placeholder="주소" readonly="readonly" name="addr" required>
					<input type="text" class="form-control mb-2" id="addrDetail" placeholder="상세주소" name="addrDetail" required>
				</div>
				<div class="form-group">
					<label for="addrGetter"><strong>수령인</strong><span style="color:red;">&nbsp;*</span></label>
					<input type="text" class="form-control" id="addrGetter" placeholder="이름을 입력해주세요." name="addrGetter" required>
				</div>
				<div class="form-group">
					<label for="addrPhone"><strong>휴대폰 번호 </strong><span style="color:red;">&nbsp;*</span> </label>
					<input type="text" class="form-control" id="addrPhone" placeholder="전화번호를 입력해주세요." name="addrPhone" required>
				</div>
				<hr>
				<div style="text-align: center;">
					<div style="display: inline-block;">													
			      		<button type="submit" id="insertAddr" class="btn" style="background-color:black; color:white;">등록</button>
						<button type="button" class="btn" style="background-color:black; color:white;" data-dismiss="modal">취소</button>					
					</div>
				</div>
			</form>
		  </div>
		 </div>
	  </div>
	</div>
	<!-- 배송지 추가 모달창 끝 -->
	<!-- ------------------------------------------------------------------------------ -->
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
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<div class="row">
					<!-- 진짜 body 시작 -->
					<div class="body container-fluid mt-5">
						<h5 style="font-weight:bold;">배송지관리</h5>
							<!-- 모달 버튼 -->
							<div>
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" data-toggle="modal" data-target="#insertAddr" id="btn2" class="bt">배송지 추가</button>
								</div>
								
								<div class="boldBorder">
									<p>총 &nbsp; <strong>${addrCnt }</strong>건</p>
								</div>
							</div>
							<!-- 배송지 정보 -->
							<div class="form-check">
							<c:forEach var="getAddrList" items="${getAddrList }" varStatus="vs">

								<div class="row border-bottom">
									<div class="col-9">
										<input class="form-check-input mx-2" style="position:relative; top:80px;" type="radio" name="addrNum" id="exampleRadios1" value="${getAddrList.addrNum }" checked>
										<label class="form-check-label" for="exampleRadios2"></label>
										<div class="form-content" style="position:relative; left:100px;">
										  <h4><b>${getAddrList.addrGetter }</b>
										  	<c:if test="${getAddrList.addrDefault == 'Y' }">
										  		<span class="defaultBox">기본배송지</span>
										  	</c:if>
										  </h4>
										  <p style="font-size:20px;">${getAddrList.addr }${getAddrList.addrDetail }</p>
										  <h6 style="font-size:7px;">[${getAddrList.postNum }]</h6>
										  <p>${getAddrList.addrPhone }</p>
										</div>
									</div>
									<div style="vertical-align:center; padding-top:25px;" class="col-3">
										<button onclick="updateAddrDefault('${getAddrList.addrNum }')" type="button" class="bt" id="btn1" style="margin-bottom:10px;">기본배송지로 설정</button><br>
										<button onclick="location.href='mp_deleteAddr.do?addrNum=${getAddrList.addrNum }'" type="button" class="bt" id="btn2">삭제</button>
									</div>
								</div>
							</c:forEach>
							</div>
							
					</div>
					<!-- 진짜 body 끝 -->
					
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
<%@include file="/common/footer.jspf" %>
 </body>
</html>