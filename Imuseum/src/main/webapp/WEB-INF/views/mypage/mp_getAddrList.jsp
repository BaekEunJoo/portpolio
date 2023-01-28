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
	#btn1:hover {
		color : white;
		background-color: black;
	}
	#btn2:hover {
		color : black;
		background-color: white;
	}
	.form-check:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 1px solid gray;
		margin-top : 10px;
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
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
	#mp_grade {color: black;}
</style>

<script>
	$(document).on('click', '#insertAddr', function(e) {
		e.preventDefault();
		$("#address-insert").submit();
	});
	
	
</script>
</head>
<body>
	<!-- insert 모달창 -->
	<!-- 배송지 추가 모달창 시작 -->
	<div class="modal" id="insertAddr">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    <!-- Modal Header -->
	      <div class="modal-header" style="background-color:black; color:white;">
	        <h4 class="modal-title">배송지 추가</h4>
	      </div>
	      <div class="modal-body">
			<form id="address-insert" method="post" action="mp_insertAddr.do">
				<div class="form-group">
					<label for="addr"><strong>주소</strong><span style="color:red;">&nbsp;*</span> </label>
					<input type="text" class="form-control mb-2 p-2" id="postNum" placeholder="우편번호" name="postNum" minlength="4" required>
					<input type="button" class="form-control mb-2 p-2" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="background-color:black; color:white;" name="id">
					<input type="text" class="form-control mb-2 p-2" id="addr" placeholder="주소" name="addr" required>
					<input type="text" class="form-control mb-2 p-2" id="addrDetail" placeholder="상세주소" name="addrDetail" required>
				</div>
				<div class="form-group">
					<label for="userName"><strong>수령인</strong><span style="color:red;">&nbsp;*</span></label>
					<input type="text" class="form-control" id="userName" placeholder="이름을 입력해주세요." name="userName" required>
				</div>
				<div class="form-group">
					<label for="userPhone"><strong>휴대폰 번호 </strong><span style="color:red;">&nbsp;*</span> </label>
					<input type="text" class="form-control" id="userPhone" placeholder="전화번호를 입력해주세요." name="userPhone" required>
				</div>
				<hr>
				<!-- <div class="form-group">
					<input type="checkbox" class="form-control" id="userdefault" name="userdefault" minlength="4" pattern = "^[a-zA-Z0-9]*$">
					<span>기본배송지로 설정</span>
				</div> -->
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
	
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid">
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
									<button type="button" id="btn1" class="bt">기본배송지로 설정</button>
									<button type="button" data-toggle="modal" data-target="#insertAddr" id="btn2" class="bt">배송지 추가</button>
								</div>
								
								<div class="boldBorder">
									<p>총 1건</p>
								</div>
							</div>
							<!-- 배송지 정보 -->
							<div class="form-check">
							<c:forEach var="getAddrList" items="${getAddrList }">
							<div class="row">
								<div class="col-9">
									<input class="form-check-input mx-2" style="position:relative; top:80px;" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
									<label class="form-check-label" for="exampleRadios2"></label>
									<div class="form-content" style="position:relative; left:100px;">
									  <h4><b>${getAddrList.addrGetter }</b></h4>
									  <p style="font-size:20px;">${getAddrList.addr }${getAddrList.addrDetail }</p>
									  <h6 style="font-size:7px;">[${getAddrList.postNum }]</h6>
									  <p>${getAddrList.addrPhone }</p>
									</div>
								</div>
								<div style="vertical-align:center;" class="col-3 my-4">
									<button type="button" class="bt" id="btn1" style="margin-bottom:10px;" onclick="mp_update">수정</button><br>
									<button type="button" class="bt" id="btn2">삭제</button>
								</div>
							</div>
							</c:forEach>
							</div>
							
							<!-- 페이징 처리 -->
							<nav aria-label="Page navigation example" class="mt-3">
							  <ul class="pagination justify-content-center">
							    <li class="page-item disabled">
							      <a class="page-link"><<</a>
							    </li>
							    <li class="page-item"><a class="page-link" href="#">1</a></li>
							    <li class="page-item"><a class="page-link" href="#">2</a></li>
							    <li class="page-item"><a class="page-link" href="#">3</a></li>
							    <li class="page-item">
							      <a class="page-link" href="#">>></a>
							    </li>
							  </ul>
							</nav>
					</div>
					<!-- 진짜 body 끝 -->
					
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postNum').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addrDetail').focus();
        }
    }).open();
}
</script>
<%@include file="/common/footer.jspf" %>
 </body>
</html>