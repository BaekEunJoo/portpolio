<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<title>I MUSEUM</title>
<script type="text/javascript">
	$(function() {
		var context = document.getElementById('myChart').getContext('2d');
		var daytotal = $("#daytotal").val();
		var day2total = $("#day2total").val();
		var day3total = $("#day3total").val();
		var day4total = $("#day4total").val();
		var day5total = $("#day5total").val();
		var td = new Date();
		var year = td.getFullYear();
		var month = ('0' + (td.getMonth() + 1)).slice(-2);
		var day = ('0' + td.getDate()).slice(-2);
		var day2 = ('0' + (td.getDate() - 1)).slice(-2);
		var day3 = ('0' + (td.getDate() - 2)).slice(-2);
		var day4 = ('0' + (td.getDate() - 3)).slice(-2);
		var day5 = ('0' + (td.getDate() - 4)).slice(-2);
		var dateString = year + '-' + month + '-' + day;
		var dateString2 = year + '-' + month + '-' + day2;
		var dateString3 = year + '-' + month + '-' + day3;
		var dateString4 = year + '-' + month + '-' + day4;
		var dateString5 = year + '-' + month + '-' + day5;
		var myChart = new Chart(context,
				{
					type : 'bar', // 차트의 형태
					data : { // 차트에 들어갈 데이터
						labels : [
						//x 축
						dateString5, dateString4, dateString3, dateString2,
								dateString ],
						datasets : [ { //데이터
							label : '일별매출액', //차트 제목
							fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
							data : [ day5total, day4total, day3total,
									day2total, daytotal //x축 label에 대응되는 데이터 값
							],
							backgroundColor : [
							//색상
							'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)' ],
							borderColor : [
							//경계선 색상
							'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)' ],
							borderWidth : 0
						//경계선 굵기
						} ]
					},
					options : {
						scales : {
							yAxes : [ {
								ticks : {
									beginAtZero : true
								}
							} ]
						}
					}
				});
	});
</script>
<%@ include file="/common/style.jspf"%>
<style>

.col-2 li a i {
	text-decoration: none;
	color: gray;
	font-size: 30px;
	margin-left: 10px;
}

.col-2 li a span {
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

.col-2 ul li a {
	font-size: 17px;
	color: gray;
	text-align: left;
	font-weight: normal;
}

.col-2 ul li a:hover {
	color: black;
	font-weight: bold;
}

.btn {
	border-radius: 0;
}

input[type=date] { 
	border-radius: 0;
	border: 1px solid silver;
	width: 220px;
	height: 50px;
	margin: 0;
	vertical-align: middle;
}


.extable td {
	border-bottom: 1px solid #EAEAEA;
	height: 50px;
}

.extable img {
	width: 80px;
	height: 80px;
	object-fit: cover;
}

input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
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


.line_limit {
      width:250px;
      overflow:hidden;
      text-overflow:ellipsis;
      white-space:nowrap;
      display:inline-block;
      vertical-align: middle;
  }
  
 input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}

#am_sale {
	color: black;
	font-weight: bold;
}

.line_limit {
	width: 200px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	display: inline-block;
	vertical-align: middle;
}
input[type=checkbox] {
	accent-color: black;
	width: 20px;
	height: 20px;
}
</style>
</head>
<body>
	<c:set var="total" value="0" />
	<c:forEach var="result" items="${list}" varStatus="status">
		<c:set var="total" value="${total + result.totalPrice}" />
	</c:forEach>
	<c:set var="daytotal" value="0" />
	<c:forEach var="result" items="${list1}" varStatus="status">
		<c:set var="daytotal" value="${daytotal + result.totalPrice}" />
	</c:forEach>
	<c:set var="day2total" value="0" />
	<c:forEach var="result" items="${list2}" varStatus="status">
		<c:set var="day2total" value="${day2total + result.totalPrice}" />
	</c:forEach>
	<c:set var="day3total" value="0" />
	<c:forEach var="result" items="${list3}" varStatus="status">
		<c:set var="day3total" value="${day3total + result.totalPrice}" />
	</c:forEach>
	<c:set var="day4total" value="0" />
	<c:forEach var="result" items="${list4}" varStatus="status">
		<c:set var="day4total" value="${day4total + result.totalPrice}" />
	</c:forEach>
	<c:set var="day5total" value="0" />
	<c:forEach var="result" items="${list5}" varStatus="status">
		<c:set var="day5total" value="${day5total + result.totalPrice}" />
	</c:forEach>
	<c:choose>
		<c:when test="${empty member }">
			<%@include file="/common/guestMenu.jspf"%>
		</c:when>
		<c:when test="${not empty member }">
			<c:if test="${member.admin eq 'ADMIN' }">
				<%@include file="/common/adminMenu.jspf"%>
			</c:if>
			<c:if test="${member.admin eq 'NORMAL' }">
				<%@include file="/common/MemberMenu.jspf"%>
			</c:if>
		</c:when>
	</c:choose>
	<%@ include file="/common/main.jspf"%>
	<div class="container-fulid notosanskr" style="margin-bottom: 50px;">
		<div class="row" style="padding: 0; margin: 0;">
			<div class="col-8 offset-2">
				<div class="row" style="padding-top: 50px;">
					<%@ include file="/common/adminNav.jspf"%>
					<div class="col-10">
						<span style="font-size: 1.3em; font-weight: bold;">매출현황</span>
						<hr style="border: 0; height: 2px; background: black;">
						<table class="rvtable" style="width: 100%; font-size: 0.8em;"
							id="sale">
							<tr
								style="text-align: center; height: 50px; background: black; color: white;">
								<th>주문번호</th>
								<th>주문일</th>
								<!-- <th>상품번호</th>
								<th>상품명</th> -->
								<th>결제액</th>
								<th>주문자명</th>
								<th>주소</th>
								<th>연락처</th>
								<th>상태</th>
							</tr>
							<c:forEach var="order" items="${list }">
								<tr style="text-align: center;">
									<td>${order.orderNum }</td>
									<td>${order.orderDate }</td>
									<%-- <td>${order.productNum }</td>
									<td><span class="line_limit">${order.productName }</span></td> --%>
									<td><fmt:formatNumber type="number"
											pattern="###,###,###,###,###,###"
											value="${order.totalPrice }" /><span>원</span></td>
									<td>${order.orderName }</td>
									<td><span class="line_limit">${order.orderAddr }</span></td>
									<td>${order.orderPhone }</td>
									<td>${order.status }</td>
								</tr>
							</c:forEach>
						</table>
						<div>
							<table style="margin-bottom: 10px; width: 100%;">
								<tbody>
									<tr>
										<td
											style="font-weight: bold; text-align: center; font-size: 1.2em;">총
											판매액</td>
									</tr>
									<tr>
										<td style="text-align: center;"><fmt:formatNumber
												value="${total }" pattern="#,###,###,###" />원</td>
									</tr>
									<input type="hidden" class="daytotal" id="daytotal"
										name="daytotal" value="${daytotal }">
									<input type="hidden" class="day2total" id="day2total"
										name="day2total" value="${day2total }">
									<input type="hidden" class="day3total" id="day3total"
										name="day3total" value="${day3total }">
									<input type="hidden" class="day4total" id="day4total"
										name="day4total" value="${day4total }">
									<input type="hidden" class="day5total" id="day5total"
										name="day5total" value="${day5total }">
								</tbody>
							</table>
						</div>
						<div style="width: 100%; height: 520px; margin-top: 50px;">
							<!--차트가 그려질 부분-->
							<canvas id="myChart"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="/common/footer.jspf"%>
</html>