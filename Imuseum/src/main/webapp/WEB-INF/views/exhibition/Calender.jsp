<%@page import="com.spring.Imuseum.learn.LearnVO"%>
<%@page import="com.spring.Imuseum.exhibition.ExhibitionVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CALENDER | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	#noweb { color: #949494; font-size: 0.9em; 	padding-left: 30%; margin: auto 0;}
	#searchnav a {text-decoration: none; color: black; font-size: 0.9em;}
	
	/*----------달력------------*/
	#excircle {width: 10px; height: 10px; background-color: #22741C; border-radius: 50%; display: inline-block;}
	#learncircle {width: 10px; height: 10px; background-color: #050099; border-radius: 50%; display: inline-block;}
	
	.daybody tr {height: 76px;}
	.rest {display: block; vertical-align: middle; text-align: center;}
	
	input[type=checkbox] {height: 20px; width: 20px; display: inline-block; vertical-align: middle;}
	
	#exbox {accent-color: #22741C;}
	#lebox {accent-color: #050099;}
	
	/*-------스크롤바-----------*/
	#scrolll::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
	}
	
	#scrolll::-webkit-scrollbar-thumb {
	    background: #EAEAEA; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	#scrolll::-webkit-scrollbar-track {
	    background: white;  /*스크롤바 뒷 배경 색상*/
	}
	.btn {border-radius: 0; width: 150px; font-size: 0.9em;}
	
	.clicked {
        background-color: #F6F6F6;
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

<%
		Calendar cal = Calendar.getInstance();
		
		String strYear = request.getParameter("year");
		String strMonth = request.getParameter("month");
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int date = cal.get(Calendar.DATE);
		
		if(strYear != null)	{
		  year = Integer.parseInt(strYear);
		  month = Integer.parseInt(strMonth);
		}
		
		//년도/월 셋팅
		cal.set(year, month, 1);
		
		int startDay = cal.getMinimum(java.util.Calendar.DATE);
		int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
		int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
		int newLine = 0;
		
		//오늘 날짜 저장.
		Calendar todayCal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
	%>


<div class="container notosanskr" style="margin: 0 auto; padding-bottom: 100px;">
	<div class="row">
		<div class="col-6" style="margin-top: 40px; margin-bottom: 40px;">
			<p style="font-size: 4em; font-weight: bold;">CALENDAR</p>
		</div>
		<div class="col-6 text-end" id="noweb" style="float: right;">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;CALENDAR </span>
		</div>
	</div>
	
	<div class="row" style="margin: 0;">
		<div class="col-8 offset-2 notosanskr d-flex justify-content-center" 
			style="background-color: white; padding: 20px; width: 100%; ">
		</div>
	</div>
	<div class="calenderNav" style="text-align: center; font-size: 2em; font-weight: bold; padding-bottom: 30px;">
		<span style="padding: 50px;">
		<%if(month > 0 ){ %>
			<a href="<c:url value='calender.do' />?calDay=<%=Integer.toString(year)+"-"+Integer.toString(month)+"-"+Integer.toString(1)%>&amp;year=<%=year%>&amp;month=<%=month-1%>" target="_self" style="text-decoration: none;">
				<b><i class="bi bi-chevron-left" style="color: black;"></i></b><!-- 이전달 -->
			</a>
			<%} else if(month == 0){%>
			<a href="<c:url value='calender.do' />?calDay=<%=Integer.toString(year-1)+"-"+Integer.toString(12)+"-"+Integer.toString(1)%>&amp;year=<%=year-1%>&amp;month=<%=11%>" target="_self" style="text-decoration: none;">
				<b><i class="bi bi-chevron-left" style="color: black;"></i></b><!-- 이전달 -->
			</a>
			<%} else {%>
				<b><i class="bi bi-chevron-left"></i></b>
			<%} %>
		</span><%=year%>.<%=month+1%>
		<span style="padding: 50px;">	
			<%if(month < 11){ %>
			<a href="<c:url value='calender.do' />?calDay=<%=Integer.toString(year)+"-"+Integer.toString(month+2)+"-"+Integer.toString(1)%>&amp;year=<%=year%>&amp;month=<%=month+1%>" target="_self">
				<!-- 다음달 --><b><i class="bi bi-chevron-right" style="color: black;"></i></b>
			</a>
			<%}else if(month == 11){ %>
			<a href="<c:url value='calender.do' />?calDay=<%=Integer.toString(year+1)+"-"+Integer.toString(1)+"-"+Integer.toString(1)%>&amp;year=<%=year+1%>&amp;month=<%=0%>" target="_self">
				<!-- 다음달 --><b><i class="bi bi-chevron-right" style="color: black;"></i></b>
			</a>
			<%}%>
		</span>	
	</div>	
	<hr>

	<div class="row">
	<div class="col-5">
	<div style="padding-bottom: 10px;">
		<table>
			<tr>
				<td style="height: 40px;"><input type="checkbox" id="exbox" checked="checked" onchange="chkbox()"></td>
				<td><span style="font-family: 'SUIT-Regular'; vertical-align: middle; padding-left: 5px;">EXHIBITION</span></td>
				<td style="padding-left: 10px;"><input type="checkbox" id="lebox" checked="checked" onchange="chkbox()"></td>
				<td><span style="font-family: 'SUIT-Regular'; vertical-align: middle; padding-left: 5px;">LEARN</span></td>
			</tr>
		</table>
	</div>
	
	<table border="0" cellspacing="1" cellpadding="1">
	<thead>
	<tr bgcolor="#F6F6F6" style="height: 50px; font-size: 11px; border: 1px solid #F6F6F6; border-top: 2px solid black;">
	       <td width='100px'>
	       		<div align="center"><font color="#ED2A61">SUN</font></div>
	       </td>
	       <td width='100px'>
	       		<div align="center">MON</div>
	       </td>
	       <td width='100px'>
	       		<div align="center">TUE</div>
	       </td>
	       <td width='100px'>
	       		<div align="center">WED</div>
	       </td>
	       <td width='100px'>
	       		<div align="center">THU</div>
	       </td>
	       <td width='100px'>
	       		<div align="center">FRI</div>
	       </td>
	       <td width='100px'>
	       		<div align="center"><font color="#3C6FFA";>SAT</font></div>
	       </td>
	</tr>
	</thead>
	<tbody class="daybody">
	<tr>
<c:set var="exhibitionList" value="${exList }"/>
<c:set var="learnList" value="${lnnowList }"/>
<%
List<ExhibitionVO> exhibitionList = (List<ExhibitionVO>)pageContext.getAttribute("exhibitionList");
List<LearnVO> learnList = (List<LearnVO>)pageContext.getAttribute("learnList");

//처음 빈공란 표시
for(int index = 1; index < start ; index++ )
{
  out.println("<td >&nbsp;</td>");
  newLine++;
}

for(int index = 1; index <= endDay; index++)
{
       String color = "";
       if(newLine == 0){          color = "#ED2A61";
       }else if(newLine == 6){    color = "#3C6FFA";
       }else{                     color = "BLACK"; };

       String sUseDate = Integer.toString(year); 
       sUseDate += Integer.toString(month+1).length() == 1 ? "0" + Integer.toString(month+1) : Integer.toString(month+1);
       sUseDate += Integer.toString(index).length() == 1 ? "0" + Integer.toString(index) : Integer.toString(index);

       int iUseDate = Integer.parseInt(sUseDate);

       String backColor = "white";
       if(iUseDate == intToday ) {
       	out.println("<td valign='top' align='left' class='oneday clicked' id='"+iUseDate+"' bgcolor='"+backColor+"' nowrap onclick='check(this.id)' style='cursor: pointer; width:50px; height:50px; border: 1px solid #EAEAEA;'>");
       } else {
       	out.println("<td valign='top' align='left' class='oneday' id='"+iUseDate+"' bgcolor='"+backColor+"' nowrap onclick='check(this.id)' style='cursor: pointer; width:50px; height:50px; border: 1px solid #EAEAEA;'>");
       }
       %>

       <font color='<%=color%>'>
            <span style="font-family: 'SUIT-Regular';"><%=index %></span><br>
       </font>
       <%
       if (newLine == 1){%>
       		<div class="rest">
	       <span style="font-size: 11px; font-family: 'SUIT-Regular';">휴관일</span>
	       </div>
       <%} else {
	       //out.println("<div name='excircle' id='excircle'></div>");
	       //out.println("<div name='learncircle' id='learncircle'></div>");
       }
       //out.println("<br>");
		
       //동그라미
       for (int i = 0; i < exhibitionList.size(); i++){
    	   if (newLine != 1 && iUseDate >= Integer.parseInt(exhibitionList.get(i).getStartDate().substring(0,10).replaceAll("-", "")) &&
    			   iUseDate <=Integer.parseInt(exhibitionList.get(i).getLastDate().substring(0,10).replaceAll("-", ""))){
    		   out.println("<div name='excircle' id='excircle'></div>"); 
    		   break;
    	   }
    		   
       }
       
       for (int i = 0; i < learnList.size(); i++){
    	   if (newLine != 1 && iUseDate >= Integer.parseInt(learnList.get(i).getRegdate1().replaceAll("/","")) &&
    			   iUseDate <= Integer.parseInt(learnList.get(i).getRegdate2().replaceAll("/",""))){
		       out.println("<div name='learncircle' id='learncircle'></div>");
		       break;
    	   }
       }
       
       
       
       //기능 제거 

       out.println("</td>");
       newLine++;

       if(newLine == 7)
       {
         out.println("</tr>");
         if(index <= endDay)
         {
           out.println("<tr>");
         }
         newLine=0;
       }
}
//마지막 공란 LOOP
while(newLine > 0 && newLine < 7)
{
  out.println("<td>&nbsp;</td>");
  newLine++;
}
%>
</tr>
</table>
	</div>
	<div class="col-7" style="padding-top: 50px;" >
		<div id="scrolll" style="border-top: 2px solid black; width:100%; height: 505px; overflow-y:scroll; ">
			<div id="exListbody">
				<table style="width: 100%;">
					<c:if test="${not empty exList }">
					<c:forEach var="ex" items="${exList }">
					<tbody>
					<tr>
						<td colspan="2" style="padding-left: 20px; padding-top:20px; font-size: 0.8em;">
							<i class="bi bi-circle-fill" style="padding-right: 10px; color: #22741C;"></i>EXHIBITION<br>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; padding-top: 10px;">
							<b style="font-size: 1.5em;">${ex.exhName }</b>
						</td>
						<td style="padding:10px 10px 0 20px; text-align: right;">
							<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='exhibitionDetail.do?exhNum=${ex.exhNum}'">
							자세히보기
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 20px; border-bottom: 1px solid #E5E5E5;">
							<p style="padding-top: 20px;">
							장소: 아이뮤지엄<span style="padding-left: 10px;">일시: ${ex.startDate.substring(0,10) } ~ ${ex.lastDate.substring(0,10) }</span>
							</p>
						</td>
					</tr>
					</tbody>
					</c:forEach>
					</c:if>
					</table>
			</div>
					
			<div id="learnListbody">
				<table style="width: 100%;">		
					<c:if test="${not empty lnnowList }">
					<c:forEach var="learn" items="${lnnowList }">
					<tr>
						<td colspan="2" style="padding-left: 20px; padding-top:20px; font-size: 0.8em;">
							<i class="bi bi-circle-fill" style="padding-right: 10px; color: #050099;"></i>LEARN<br>
						</td>
					</tr>
					<tr>
						<td style="padding-left: 20px; padding-top: 10px;">
							<b style="font-size: 1.5em;">${learn.title }</b>
						</td>
						<td style="padding:10px 10px 0 20px; text-align: right;">
							<button type="button" class="btn btn-outline-dark btn-lg" onclick="location.href='exhibitionDetail.do'">
							자세히보기
							</button>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 20px;">
							<span style="margin-top: 20px; color: gray; font-size: 0.8em;">
							${learn.subtitle }
							</span>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="padding-left: 20px; border-bottom: 1px solid #E5E5E5;">
							<p style="padding-top: 20px;">
							장소: ${learn.place}<span style="padding-left: 10px;">일시: ${learn.regdate1.replace("/", "-") } ~ ${learn.regdate2.replace("/", "-") }</span>
							</p>
						</td>
					</tr>
					</c:forEach>
					</c:if>
				</table>	
			</div>	
				
	</div>
	</div>
	</div>
</div>
<script>
function getJsonExhibitionCalData(calDay) {
	$.ajax("getJsonExhibitionCal.do?calDay="+calDay, {
		type: "get",
		data: calDay,
		dataType: "json",
		success: function(data){
			let dispHtml = "";
			let dayOfWeek = new Date(calDay).getDay();
			if (dayOfWeek == 1){
				dispHtml += "<table style='width: 100%;'>";
				dispHtml += "<tr><td><p style='text-align:center; padding-top:220px;'>아이뮤지엄 휴관일입니다.</p></td></tr>";
				dispHtml += "</table>";
			}else {
				for (let ex of data) {
					dispHtml +=	"<table style='width: 100%;'>";
					dispHtml +=	"<tr>";
					dispHtml +=	"<td colspan='2' style='padding-left: 20px; padding-top:20px; font-size: 0.8em;'>";
					dispHtml +=	"<i class='bi bi-circle-fill' style='padding-right: 10px; color: #22741C;'></i>EXHIBITION<br>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
					dispHtml += "<tr>";
					dispHtml += "<td style='padding-left: 20px; padding-top: 10px;'>";
					dispHtml +=	"<b style='font-size: 1.5em;'>"+ex.exhName+"</b>";
					dispHtml += "</td>";
					dispHtml += "<td style='padding:10px 10px 0 20px; text-align: right;'>";
					dispHtml += "<a style='color: inherit; text-decoration: none;' href='exhibitionDetail.do?exhNum=" + ex.exhNum + "'>";
					dispHtml +=	"<button type='button' class='btn btn-outline-dark btn-lg'>"
					dispHtml +=	"자세히보기";
					dispHtml +=	"</button>";
					dispHtml += "</a>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
					dispHtml += "<tr>";
					dispHtml += "<td colspan='2' style='padding-left: 20px; border-bottom: 1px solid #E5E5E5;'>";
					dispHtml +=	"<p style='padding-top: 20px;'>장소: 아이뮤지엄"
					dispHtml +=	"<span style='padding-left: 10px;'>일시: "+ex.startDate.substring(0,10)+" ~ "+ex.lastDate.substring(0,10)+"</span>";
					dispHtml +=	"</p>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
					dispHtml += "</table>";
				}
			}
			$("#exListbody").html(dispHtml);
		},
		error: function(){
			alert("실패~~");
		}
	}); 
}

var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dateString = year + month + day;


function getJsonLearnCalData(calDay) {
	$.ajax("getJsonLearnCal.do?calDay="+calDay, {
		type: "get",
		data: calDay,
		dataType: "json",
		success: function(data){
			let dispHtml = "";
			let dayOfWeek = new Date(calDay).getDay();
			if (dayOfWeek == 1){
				dispHtml += "";
			} else {
				for (let learn of data) {
					let lastday = learn.regdate2.replaceAll('/', '');
					dispHtml +=	"<table style='width: 100%;'>";
					dispHtml += "<tr>";
					dispHtml += "<td colspan='2' style='padding-left: 20px; padding-top:20px; font-size: 0.8em; width: 627.5px;'>";
					dispHtml +=	"<i class='bi bi-circle-fill' style='padding-right: 10px; color: #050099;'></i>LEARN<br>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
					dispHtml += "<tr>";
					dispHtml += "<td style='padding-left: 20px; padding-top: 10px;'>";
					dispHtml +=	"<b style='font-size: 1.5em;'>"+learn.title+"</b>";
					dispHtml += "</td>";
					
					if (dateString < lastday){
					dispHtml += "<td style='padding:10px 10px 0 20px; text-align: right;'>";
					dispHtml += "<a style='color: inherit; text-decoration: none;' href='getLearn.do?learnIdx=" + learn.learnIdx + "'>";
					dispHtml +=	"<button type='button' class='btn btn-outline-dark btn-lg'>";
					dispHtml += "자세히보기";
					dispHtml +=	"</button>";
					dispHtml += "</a>";
					dispHtml += "</td>";
					}	
					
					dispHtml += "</tr>";
					dispHtml += "<tr>";
					dispHtml += "<td colspan='2' style='padding-left: 20px;'>";
					dispHtml +=	"<span style='margin-top: 20px; color: gray; font-size: 0.8em;'>";
					dispHtml +=	learn.subtitle;
					dispHtml +=	"</span>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
					dispHtml += "<tr>";
					dispHtml += "<td colspan='2' style='padding-left: 20px; border-bottom: 1px solid #E5E5E5;'>";
					dispHtml +=	"<p style='padding-top: 20px;'>장소: "+learn.place;
					dispHtml +=	"<span style='padding-left: 10px;'>일시: "+learn.regdate1.replaceAll('/', '-')+" ~ "+learn.regdate2.replaceAll('/', '-')+"</span>";
					dispHtml +=	"</p>";
					dispHtml += "</td>";
					dispHtml += "</tr>";
					dispHtml += "</table>";
				}
			}
			$("#learnListbody").html(dispHtml);
		},
		error: function(){
			alert("실패~~");
		}
	}); 
}

function chkbox() {
	var exListbody = document.getElementById("exListbody");	
	var learnListbody = document.getElementById("learnListbody");	
	var excircle = document.getElementsByName("excircle");
	var exint = excircle.length;
	var learncircle = document.getElementsByName("learncircle");
	var leint = learncircle.length;
	
	if($('#exbox').is(":checked") == true){
	    //alert('체크된 상태');
	    exListbody.style.display = "inline";
	    for (i = 0; i < exint; i++){
	    	excircle[i].style.display = "inline-block";
	    }
	}
	 
	if($('#exbox').is(":checked") == false){
	    //alert('체크 안 된 상태');
	    exListbody.style.display = "none";
	    for (i = 0; i < exint; i++){
	    	excircle[i].style.display = "none";
	    }
	}
	
	if($('#lebox').is(":checked") == true){
	    //alert('체크된 상태');
	    learnListbody.style.display = "inline-block";
	    for (i = 0; i < leint; i++){
	    	learncircle[i].style.display = "inline-block";
	    }
	}
	 
	if($('#lebox').is(":checked") == false){
	    //alert('체크 안 된 상태');
	    learnListbody.style.display = "none";
	    for (i = 0; i < leint; i++){
	    	learncircle[i].style.display = "none";
	    }
	}
}



function check(a) {
	console.log(a);
	var insertday = a;
	var year = a.substr(0,4);
	var month = a.substr(4,2); 
	var day = a.substr(6,2);
	
	var calDay = year + '-' + month + '-' + day;
	console.log(calDay);
	getJsonExhibitionCalData(calDay);
	getJsonLearnCalData(calDay);
}


var oneday = document.getElementsByClassName("oneday");
var rest = document.getElementsByClassName("rest");

function handleClick(event) {
  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
    rest.classList.remove("clicked");
  } else {
    for (var i = 0; i < oneday.length; i++) {
      oneday[i].classList.remove("clicked");
    }
    event.target.classList.add("clicked");
    rest.classList.remove("clicked");
  }
}

function init() {
  for (var i = 0; i < oneday.length; i++) {
    oneday[i].addEventListener("click", handleClick);
  }
}

init();



</script>




</body>
<%@ include file="/common/footer.jspf"%>
</html>