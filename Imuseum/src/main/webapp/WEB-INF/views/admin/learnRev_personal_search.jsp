<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
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

.head .btn {
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


/*더보기*/
.js-load {
    display: none;
}
.js-load.active {
    display:table-row;
}
.is_comp.js-load:after {
    display: none;
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
<div class="container-fulid notosanskr"> 
	<div class="row" style="padding: 0; margin: 0;">
		<div class="col-8 offset-2">
			<div class="row" style="padding-top: 50px;">
				<%@ include file="/common/adminNav.jspf" %>
				<div class="col-10" style="margin-bottom: 100px;">
				<p style="font-size: 1.3em; font-weight: bold;">티켓예매 목록</p>
				<div>
					<table border style="width: 100%; height:50px; text-align: center; cursor: pointer;">
						<tr style="font-size: 1.2em;">
							<td onclick="location.href='${pageContext.request.contextPath}/admin/learnRev_personal.jsp'"
								style="background-color: black; color: white;">
							개인예매
							</td>
							<td onclick="location.href='groupReservation.do'">
							단체예매
							</td>
						</tr>
					</table>
				</div>
				
				<div>
					<table class="head" style="width: 100%; margin-top: 50px;">
						<tbody>
							<tr>
								<td>
								<form action="learnRevPersonalSearch.do" method="post">
									<select name="searchCondition" style="width: 100px; height: 30px; border: 1px solid black; border-radius: 0;">
									<c:forEach var="option" items="${conditionMap }">
										<option value="${option.value }">${option.key }</option>
									</c:forEach>
									</select>
									<input type="text" name="searchKeyword" style="width:203px; height: 30px; border: 1px solid black; border-radius: 0;" required>
									<input type="submit" class="btn btn-sm btn-outline-dark" value="검색" style="margin-bottom: 5px; height: 30px; vertical-align: middle;">
								</form>
							</tr>
							<tr>
								<td>
									<button type="button" class="btn btn-outline-dark" onclick="location.href='learnRevPersonalToday.do'">오늘</button>
									<button type="button" class="btn btn-outline-dark" onclick="location.href='learnRevPersonalWeek.do'">1주일</button>
									<button type="button" class="btn btn-outline-dark" onclick="location.href='learnRevPersonalMonth.do'">1달</button>
									<button type="button" class="btn btn-outline-dark" onclick="location.href='learnRevPersonal.do'">전체</button>
									<form action="learnRevPersonalSelect.do" method="get" style="display: inline-block;">
									<input type="date" name="regdate1" id="startDate" style="margin-left: 30px;" onchange="lastchk()" required>
									&nbsp;~&nbsp;
									<input type="date" name="regdate2" id="lastDate" required>
									<input type="submit" class="btn btn-outline-dark" style="margin-left: 20px;" value="검색">
									</form>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr style="border: 0; height: 2px; background: black;">
				
				<c:if test="${empty list }">
				<p style="text-align: center; padding: 50px; color: gray;">예매 내역이 없습니다.</p>
				</c:if>
				
				<c:set var="calcelp" value="${ cancle}"/>
				<%
				int cancle = (Integer)pageContext.getAttribute("calcelp");
				int totalprice = 0;
				DecimalFormat decFormat = new DecimalFormat("###,###");
				%>
				
				<c:if test="${not empty list }">
				<p style="font-size: 0.7em; color: gray">총 <b style="color: black;">${list.size()}</b> 건</p>
				<table class="rvtable" style="width: 100%; font-size: 0.9em;">
					<tr style="text-align: center; height: 50px; background: black; color: white;">
						<th>예매일</th>
						<th>예매번호</th>
						<th>ID</th>
						<th>예약자명</th>
						<th>티켓명</th>
						<th>교육일시</th>
						<th>인원</th>
						<th>결제금액</th>
						<th>상태</th>
					</tr>
					
					<tbody id="js-load">
					<c:forEach var="ticket" items="${list }" varStatus="status">
					<tr style="text-align: center;" class="js-load">
						<c:set var="totprice" value="${ticket.totalprice}" />
						<%
						      int totprice = (Integer)pageContext.getAttribute("totprice") ;
							  String total = decFormat.format(totprice); 
							  if (totprice == 0){
								  total = "무료";
							  }
						      
						      totalprice += totprice;
						 %>
						<td>${ticket.regdate.substring(0,10) }</td>
						<td>${ticket.revNum }</td>
						<c:if test="${ticket.snsName != 'IMUSUEM' }">
							<td>${ticket.snsName } 회원</td>
						</c:if>
						<c:if test="${ticket.snsName == 'IMUSUEM' }">
							<td>${ticket.id }</td>
						</c:if>
						<td>${ticket.name }</td>
						<td>${ticket.title }</td>
						<td><b>${ticket.revDate.substring(0,10) } ${ticket.time }</b></td>
						<td>${ticket.subscriber } <span>명</span></td>
						<td><%=total %></td>
						<td>
						<c:if test="${ticket.status == '결제완료'}">
								<button type="button" class="btn btn-sm btn-outline-dark" style="border-radius: 0;" onclick="updatechk('${ticket.revNum }')">${ticket.status}</button>
						</c:if>
						<c:if test="${ticket.status != '결제완료'}">
							<button type="button" class="btn btn-sm btn-dark" disabled style="border-radius: 0;">${ticket.status}</button>
						</c:if>
							</td>
					</tr>
					</c:forEach>
					</tbody>
				</table>
				<%
					int finalp = totalprice - cancle;
					String printtotal = decFormat.format(totalprice); 
					String printfinalp = decFormat.format(finalp); 
				%>
				<div style="background-color: #FCFCFC; height: 70px;">
					<p style="text-align: center; padding-top: 12px; font-size: 0.9em;">
						<span style="font-size: 0.9em;"><%=printtotal %>(총 결제금액) - </span>
						<span style="color: gray; font-size: 0.9em;"><fmt:formatNumber value="${cancle}" pattern="#,###"/>(예매취소)</span><br>
						합계 : <b><%=printfinalp %></b> 원
					</p>
				</div>
				
				<div id="js-btn-wrap" class="btn-wrap">
					<c:if test="${list.size() >= 10 }">
					<button type="button" id="morebtn" class="btn btn-outline-dark" style="border-radius: 0; width: 200px; height: 50px; margin: 30px 0 0 40%;">
						더보기 <i class="bi bi-chevron-down"></i>
					</button>
					</c:if>
				</div>
				
				</c:if>

				</div>
			</div>
		</div>
	</div>
</div>

<script>
//선택일 오늘이 최대
document.getElementById('startDate').max = new Date().toISOString().substring(0, 10);
document.getElementById('lastDate').max = new Date().toISOString().substring(0, 10);

function lastchk() {
	//검색 마지막일 시작일 이후부터 선택가능 최대는 오늘날짜
	document.getElementById('lastDate').min = document.querySelector('#startDate').value;
}

function updatechk(a) {
	var revnum = a;
	
	var result = confirm('사용완료로 변경하시겠습니까? \n변경 후 상태변경이 불가능합니다.');
	if (result==true){
		alert('사용완료 처리되었습니다.');
	location.href='updateLearnTicket.do?revNum='+revnum;
	}
}


//더보기
$(window).on('load', function () {
    load('#js-load', '10');
    $("#js-btn-wrap #morebtn").on("click", function () {
        load('#js-load', '10', '#js-btn-wrap');
    })
});
 
function load(id, cnt, btn) {
    var search_list = id + " .js-load:not(.active)";
    var search_length = $(search_list).length;
    var search_total_cnt;
    if (cnt < search_length) {
    	search_total_cnt = cnt;
    } else {
    	search_total_cnt = search_length;
        $('#morebtn').hide()
    }
    $(search_list + ":lt(" + search_total_cnt + ")").addClass("active");
}


</script>



</body>

<%@ include file="/common/footer.jspf"%>
</html>