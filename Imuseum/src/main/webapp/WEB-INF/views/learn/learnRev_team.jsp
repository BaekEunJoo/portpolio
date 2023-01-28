<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<!-- 확인창 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.6.11/dist/sweetalert2.all.min.js"></script>
<style>

	li a i {
		text-decoration: none;
		color: gray;
		font-size: 30px;
		margin-left: 10px;
	}
	
	li a span {
		text-decoration: none;
		color: black;
		font-size: 18px;
		margin-left: 10px;
	}
	
	.bi-people-fill{
		color: black;
	}
	
	.amName {
		font-size: 1.2em;
		font-weight: bold;
	}
	
	ul li a {
		font-size: 17px;
		color: gray;
		text-align: left;
		font-weight: normal;
	}
	
	ul li a:hover {
		color: black;
		font-weight: bold;
	}
	
	.btn {
		border-radius: 0;
		width: 100px;
		height: 50px;
	}
	
	
	.btn:hover {
		background-color: black;
	}
	
	input[type=date] { 
		border-radius: 0;
		border: 1px solid silver;
		width: 210px;
		height: 50px;
		margin: 0;
		vertical-align: middle;
	}
	
	
	.rvtable td {
		border-bottom: 1px solid #EAEAEA;
		height: 50px;
	}
	
	#am_learnticket { color: black; font-weight: bold; }
	
	
	#but1 {
		border: 1px solid black;
		background-color: black;
		color: white;
		border-radius: 3px;
		transition: all 0.3s;
	}
	
	#but1:hover {
		border: 1px solid black;
		background-color: white;
		color: black;
	}
	
	#but2 {	
		border: 1px solid black;
		background-color: black;
		color: white;
		border-radius: 3px;
		transition: all 0.3s;
		padding: 1px 6px;
		text-decoration: none;
	}
	
	#but2:hover {
		border: 1px solid black;
		background-color: white;
		color: black;
	}
	
	
<!-- 페이징 -->
 #paging ul {
 	display: inline;
	padding: 5px 15px;
 }
 
 #paging ul li{
 	display: inline;
 
 }
 
 #paging ul li a {

 	padding: 10px 15px;
	font-weight: bold;
	font-size: 15px;
	text-decoration: none;
	color: black;
 }
 
 #paging ul li a:hover {
	background-color: black;
	color: white;
	cursor: pointer;
 }
 

	
</style>
<script>

	function deleteLearn(a) {
		var reservationIdx = a;
		
		var result = confirm('삭제하시겠습니까?');
		if (result==true){
			alert('삭제가 완료되었습니다.');
		location.href='groupReservationDelete.do?reservationIdx='+ reservationIdx;
		}
	}
	
	// 오늘 데이터 출력
	function todayGroupReservation(frm) {
		
		$.ajax("todayGroupReservation.do", {
			
			type: "get",
			data: $(frm).serialize(),
			dataType: "json",
			success: function(data){
				console.log(data);
				let dispHtml = "";
				for (let todayList of data) {
					dispHtml += "<tr style='text-align: center;'>"; 
					dispHtml += "<td class='center'>" + todayList.regdate.substring(0, 11) + "</td>";
					dispHtml += "<td class='center'>" + todayList.reservationIdx + "</td>";
					dispHtml += "<td class='center'>" + todayList.id + "</td>";
					dispHtml += "<td class='center'>" + todayList.groupValue + "</td>";
					dispHtml += "<td class='center'>" + todayList.programTitle + "</td>";
					dispHtml += "<td class='center'>" + todayList.datepicker + "</td>";
					dispHtml += "<td class='center'>" + todayList.memberNumber + "</td>";
					dispHtml += "<td class='center'>";
					dispHtml += "<input type='submit' id='but2' value='삭제하기' onclick='deleteLearn(" + todayList.reservationIdx + ")'>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
				}
				
				$("#ajaxbody1").html(dispHtml);
			},
			error: function(){
				alert("실패~~");
			}
		}); 
	}
	
	
	
	
	// 일주일 데이터 출력
	function weekGroupReservation(frm) {
			
			$.ajax("weekGroupReservation.do", {
				type: "get",
				data: $(frm).serialize(),
				dataType: "json",
				success: function(data){
					console.log(data);
					let dispHtml = "";
					for (let weekList of data) {

						dispHtml += "<tr style='text-align: center;'>"; 
						dispHtml += "<td class='center'>" + weekList.regdate.substring(0, 11) + "</td>";
						dispHtml += "<td class='center'>" + weekList.reservationIdx + "</td>";
						dispHtml += "<td class='center'>" + weekList.id + "</td>";
						dispHtml += "<td class='center'>" + weekList.groupValue + "</td>";
						dispHtml += "<td class='center'>" + weekList.programTitle + "</td>";
						dispHtml += "<td class='center'>" + weekList.datepicker + "</td>";
						dispHtml += "<td class='center'>" + weekList.memberNumber + "</td>";
						dispHtml += "<td class='center'>";
						dispHtml += "<input type='submit' id='but2' value='삭제하기' onclick='deleteLearn(" + weekList.reservationIdx + ")'>";
						dispHtml += "</td>";
						dispHtml += "</tr>";
					}
	
	
					$("#ajaxbody1").html(dispHtml);
				},
				error: function(){
					alert("실패~~");
				}
			}); 
		}
	
	
	
	// 한달 데이터 출력
	function monthGroupReservation(frm) {
		
		$.ajax("monthGroupReservation.do", {
			type: "get",
			data: $(frm).serialize(),
			dataType: "json",
			success: function(data){
				console.log(data);
				
				let dispHtml = "";
				for (let monthList of data) {
					dispHtml += "<tr style='text-align: center;'>"; 
					dispHtml += "<td class='center'>" + monthList.regdate.substring(0, 11) + "</td>";
					dispHtml += "<td class='center'>" + monthList.reservationIdx + "</td>";
					dispHtml += "<td class='center'>" + monthList.id + "</td>";
					dispHtml += "<td class='center'>" + monthList.groupValue + "</td>";
					dispHtml += "<td class='center'>" + monthList.programTitle + "</td>";
					dispHtml += "<td class='center'>" + monthList.datepicker + "</td>";
					dispHtml += "<td class='center'>" + monthList.memberNumber + "</td>";
					dispHtml += "<td class='center'>";
					dispHtml += "<input type='submit' id='but2' value='삭제하기' onclick='deleteLearn(" + monthList.reservationIdx + ")'>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
				}
	
	
				$("#ajaxbody1").html(dispHtml);
			},
			error: function(){
				alert("실패~~");
			}
		}); 
	}
	

</script>
</head>
<body>
<%@ include file="/common/adminMenu.jspf" %>
<%@ include file="/common/main.jspf" %>
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				
				<div class="col-10">
					<p style="font-size: 1.3em; font-weight: bold;">티켓예매 목록</p>
					<div>
						<table border style="width: 100%; height:50px; text-align: center; cursor: pointer;">
							<tr style="font-size: 1.2em;">
								<td onclick="location.href='learnRevPersonal.do'">
								개인예매
								</td>
								<td onclick="location.href='groupReservation.do'"
									style="background-color: black; color: white;">
								단체예매 
								</td>
							</tr>
						</table>
					</div>
					<div>
						<table class="head" style="width: 100%; margin-top: 50px;">
							<tbody>
								<tr>
									<td><input type="button" class="btn btn-outline-dark" value="전체" onclick="javascript:location.href='groupReservation.do'"></td>
									<td><input type="button" class="btn btn-outline-dark" value="오늘" onclick="todayGroupReservation(this.form)"></td>
									<td><input type="button" class="btn btn-outline-dark" value="1주일" onclick="weekGroupReservation(this.form)"></td>
									<td><input type="button" class="btn btn-outline-dark" value="1달" onclick="monthGroupReservation(this.form)"></td>
									<td><form action="regdateSearch.do" method="post" style="margin-left: 30px;">
											<input type="date" name="regdate1">
											&nbsp;~&nbsp;
											<input type="date" name="regdate2">
											<button type="submit" class="btn btn-outline-dark" style="margin-left: 10px;">검색</button>
									</form></td>
								</tr>
							</tbody>
						</table>
					</div>
					<hr style="border: 0; height: 2px; background: black;">
				
				
					<table class="rvtable" style="width: 100%;">
						<tr style="text-align: center; height: 50px; background: black; color: white;">
							<th>예매일</th>
							<th>예매번호</th>
							<th>ID</th>
							<th>단체구분</th>
							<th>교육명</th>
							<th>교육일시</th>
							<th>인원</th>
							<th>삭제</th>
						</tr>
						<tbody id="ajaxbody1">
							<c:forEach var="groupReservation" items="${groupReservation }">
								<tr style="text-align: center;">
									<td>${groupReservation.regdate.substring(0, 11) }</td>
									<td>${groupReservation.reservationIdx }</td>
									<td>${groupReservation.id }</td>
									<td>${groupReservation.groupValue }</td>
									<td>${groupReservation.programTitle }</td>
									<td>${groupReservation.datepicker }</td>
									<td>${groupReservation.memberNumber }</td>
									<td><input type="submit" id="but1" value="삭제하기" onclick="deleteLearn('${groupReservation.reservationIdx }')"></td>
								</tr>	
							</c:forEach>
						</tbody>
					</table>
					<div style="text-align: center; margin-bottom: 40px;">
						<div id="paging" style="padding-top: 30px; padding-right: 59px;">
							<ul>
								<!-- 이전 -->
								<li>
						 			<c:if test="${page.nowPage == 1 }">
							  			<a>&#60;</a>
							  		</c:if>
							  		<c:if test="${page.nowPage != 1 }">
										<a href="groupReservation.do?page=${page.nowPage - 1 }">&#60;</a>
									</c:if>	
							  		 			
							  	</li>
							  	<!-- 페이지 번호 -->	
							  	<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
									<c:if test="${pageNo == page.nowPage }">	
										<li>
							   				<a style="background-color:black; color: white;">${pageNo }</a>
							   			</li>
									</c:if>
									<c:if test="${pageNo != page.nowPage }">
										<li>
											<a href="groupReservation.do?page=${pageNo }">${pageNo }</a>
							   			</li>
									</c:if>
								</c:forEach>
							   	<!-- 다음 -->
								<li>
									<c:if test="${page.nowPage < page.totalPage }">
										<a href="groupReservation.do?page=${page.nowPage + 1 }">&#62;</a>
									</c:if>
									<c:if test="${page.nowPage >= page.totalPage }">
										<a>&#62;</a>
									</c:if>
								 </li>
							</ul>
						</div>
					</div>
				</div>
			</div>			
		</div>
	</div>
</div>
					

</body>

<%@ include file="/common/footer.jspf"%>
</html>