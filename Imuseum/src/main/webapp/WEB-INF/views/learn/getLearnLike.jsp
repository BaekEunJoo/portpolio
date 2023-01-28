<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INUSEUM - 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<%@ include file="/common/style.jspf" %>
<!-- 확인창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.11/dist/sweetalert2.all.min.js"></script>
   

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script type="module" src="./index.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&v=weekly" defer></script>

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
	}
	
	#layout2 {
		width: 100%;
		margin-top: 50px;
	}
	
	#layout2 .container2 img {
		display: block;
		margin: auto;
	}
	
	#layout3 {
		width: 100%;
		margin-top: 50px;
	}
	
	#layout3 .container3 {
		width: 1280px;
		margin: auto;
		border-bottom: 1px solid black;
	}
	
	#layout3 .container3 .box3 {
		height: 300px;
	}
	
	#layout3 .container3 .box3 table {
		margin-top: 30px;
	}
	
	#layout3 .container3 .box3 input {
		display: flex;
		padding: 15px 40px;
		float: right;
		border: 1px solid black;
		background-color: black;
		color: white;
		border-radius: 5px;
		transition: all 0.3s;
		margin-bottom: 20px;
		margin-top: 110px;
	}
	
	#layout3 .container3 .box3 input:hover {
		color: black;
		background-color: white;
		border: 1px solid black;
	}
	
	#layout4 {
		width: 100%;
		margin-top: 50px;
	}
	
	#layout4 .container4 {
		width: 1280px;
		margin: auto;
	}
	
	#layout4 .container4 .box4 {
	}
	
	#layout5 {
		width: 100%;
		margin-top: 20px;
	}
	
	
	#layout5 .container5 {
		width: 1280px;
		margin: auto;
	}
	
	#layout5 .container5 input {
		float: right;
		padding: 15px 40px;
		border: 1px solid black;
		background-color: black;
		color: white;
		border-radius: 5px;
		transition: all 0.3s;
		margin-left: 5px;
	}
	
	#layout5 .container5 input:hover {
		color: black;
		background-color: white;
		border: 1px solid black;
	}
	
	#layout6 {
		width: 100%;
		margin: auto;
		margin-top: 150px;
	}
	
	
	
	
	
	
	
	
	
	
#map {
  height: 400px;
  width: 1400px;
}
	
	
	
</style>
<script>
	
	
	$().ready(function () {
	    $("#learnUpdate").click(function () {
	        Swal.fire({
	            title: '수정',
	            text: "수정화면으로 이동합니다.",
	            icon: 'success',
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: '확인',
	        }).then((result) => {
	            if (result.isConfirmed) {
	                setTimeout(function(){
	                	location.href='moveToUpdateLearn.do?learnIdx=${learn.learnIdx}'
	                },500)
	            }
	        })
	    });
	});
	
	$().ready(function () {
	    $("#learnDelete").click(function () {
	        Swal.fire({
	            title: '삭제',
	            text: " 삭제 하시겠습니까?",
	            icon: 'warning',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '삭제',
	            cancelButtonText: '취소'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                Swal.fire(
	                    '삭제 완료.','정상적으로 삭제되었습니다.','success'
	                )
	                setTimeout(function(){
	                   location.href="deleteLearn.do?learnIdx=${learn.learnIdx}";
	                },1000)
	            }
	        })
	    });
	});
	
	
	$().ready(function () {
	    $("#groupReservation").click(function () {
	        Swal.fire({
	            title: '단체 예매',
	            text: "단체예매 신청을 하시겠습니까?",
	            icon: 'info',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '예매 신청',
	            cancelButtonText: '취소'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                setTimeout(function(){
	                	location.href="moveTogroupReservation.do?learnIdx=${learn.learnIdx}";
	                },1000)
	            }
	        })
	    });
	});
	
	
	$().ready(function () {
	    $("#getLearn").click(function () {
	        Swal.fire({
	            title: '목록보기',
	            text: "목록으로 돌아갑니다.",
	            icon: 'info',
	            confirmButtonColor: '#3085d6',
	            confirmButtonText: '돌아가기'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                setTimeout(function(){
	                   location.href="getLearnList.do";
	                },500)
	            }
	        })
	    });
	});
	

	
	$().ready(function () {
	    $("#like_btn").click(function () {
	       alert("추천이 완료되었습니다.");
	    });
	});
	
	$().ready(function () {
	    $("#like_btn2").click(function () {
	       alert("추천이 이미 완료되어있습니다.");
	    });
	});
	
	// 추천 취소
	$().ready(function () {
	    $("#hate_btn").click(function () {
	       alert("추천이 취소되었습니다.");
	    });
	});
	
	
	// Initialize and add the map
	function initMap() {
	  // The location of Uluru
	  const uluru = { lat: 37.4986823, lng: 127.0319152 };
	  // The map, centered at Uluru
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 15,
	    center: uluru,
	  });
	  // The marker, positioned at Uluru
	  const marker = new google.maps.Marker({
	    position: uluru,
	    map: map,
	  });
	}

	window.initMap = initMap;


</script>
</head>
<body>
<!-- 로그인 여부에 따라 헤더 변경 -->    
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
	<div id="layout1">
		<%@ include file="/common/main.jspf" %>
	</div>
	<div id="layout2">
		<div class="container2">
			<img src="${pageContext.request.contextPath}/learnImage/${learn.fileName }"/>
		</div>
	</div>
	
	<div id="layout3">
		<div class="container3 notosanskr">
			<div class="box3">
				<c:if test="${learn.educationNum == 0 }">
					<span style="border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">교육</span>
				</c:if>
				<c:if test="${learn.educationNum == 1 }">
					<span style="border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">1회성 교육</span>
				</c:if>
				<c:if test="${learn.educationNum == 2 }">
					<span style="border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">단체 교육</span>
				</c:if>
				<c:if test="${learn.placeNum == 0 }">
					<span style="border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">장소</span>
				</c:if>
				<c:if test="${learn.placeNum == 1 }">
					<span style="border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">아이뮤지엄</span>
				</c:if>
				<br>
				<span style="font-size: 40px; font-weight: bold;">${learn.title }</span><br>
				<span style="font-size: 18px;">${learn.subtitle }</span>
				<table style="width: 800px; ">
					<tr>
						<td><b>교육 진행</b></td>
						<td colspan="3">${learn.regdate1 } ~ ${learn.regdate2 }</td>
						<td><b>교육 시간</b></td>
						<td>${learn.educationTimeNum }, ${learn.educationTime }</td>
					</tr>
					<tr>
						<td><b>장소</b></td>
						<td colspan="3">${learn.place }</td>
						<td><b>교육 횟수</b></td>
						<td>${learn.educationNumber }</td>
					</tr>
					<tr>
						<td><b>대상</b></td>
						<td colspan="3">${learn.target }</td>
						<td><b>정원 수</b></td>
						<td>${learn.memberNumber }</td>
					</tr>
					<tr>
						<td><b>문의</b></td>
						<td colspan="3">${learn.inquiry }</td>
						<td><b>참가비</b></td>
						<td>${learn.fee }</td>
					</tr>
					<tr>
						<td><b>조회수</b></td>
						<td colspan="3">${learn.views }</td>
					</tr>
					<c:if test="${learn.educationNum <= 1 }">					
						<c:if test="${not empty member.id }">
							<input type="submit" value="예매신청" onclick="javascript:location.href='ticketLearn.do?learnIdx=${learn.learnIdx}'">
						</c:if>
					</c:if>
					<c:if test="${learn.educationNum == 2 }">
						<c:if test="${not empty member.id }">
							<input type="submit" value="단체예매신청" id="groupReservation">
						</c:if>
					</c:if>
				
				</table>
			</div>
		</div>
	</div>
	
	<div id="layout4">
		<div class="container4 notosanskr">
			<div class="box4">
				<p style="font-size: 40px; font-weight: bold;">교육 정보</p>
				<p style="white-space: pre;">${learn.content }</p>
			</div>
		</div>
	</div>
	
	<div id="layout5" style="margin-top: 50px;">
		<div class="container5 notosanskr">
			<c:if test="${member.id == 'admin' }">
				<input type="submit" value="삭제하기" id="learnDelete">
				<input type="submit" value="수정하기" id="learnUpdate">
			</c:if>
			<input type="submit" value="목록보기" id="getLearn">
			<c:if test="${not empty member.id }">	
				<c:forEach var="learn2" items="${learn2 }">
					<c:if test="${learn2.likeCheck == 1 } ">
						<button type="submit" class="btn btn-warning" id="like_btn2" style="float: left; padding: 15px 40px; margin-right: 5px;">추천 완료 <b><i>${learn.likeHit }</i></b></button>
					</c:if>
				</c:forEach>
				

				
			<!--<form action="updateLikeCancel.do?learnIdx=${learn.learnIdx }" method="post">
					<button type="submit" class="btn btn-danger" id="hate_btn" style="padding: 15px 40px;">비추천</button>
				</form> -->
			</c:if>
		</div>
	</div>
	
	<div id="map" style="margin: auto; text-align: center; margin-top: 200px;"></div>
	
	<div id="layout6">
		<%@ include file="/common/footer.jspf" %>
	</div>
	
	
	

	

</body>
</html>