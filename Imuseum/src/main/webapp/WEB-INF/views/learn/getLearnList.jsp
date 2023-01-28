<%@page import="com.spring.Imuseum.view.learn.LearnController"%>
<%@page import="com.spring.Imuseum.learn.LearnVO"%>
<%@page import="java.util.List"%>
<%@page import="com.spring.Imuseum.learn.dao.LearnDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IMUSEUM - Learn</title>
<%@ include file="/common/style.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

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
		margin-top: 50px;
	}
	
	#layout1 .container1 {
		width: 1400px;
		margin: auto;
	
	}
	
	#layout1 .container1 .box1 {
		width: 100%;
		margin: auto;
	}
	
	#layout1 .container1 .box1 p {
		margin-top: 50px;
		margin-bottom: 50px; 
		font-size: 60px;
	}
	
	#layout1 .container1 .box1 ul {
		text-align: center;
	}
	
	#layout1 .container1 .box1 ul li {
		display: inline-block;
		text-align: center;
		margin: 25px;
		
	}
	
	#layout1 .container1 .box1 ul li a {
		font-size: 20px;
		color: #c3c4c7;
		padding: 20px;
		text-decoration: none;
	}
	
	#layout1 .container1 .box1 ul li a:hover {
		color: black;
		font-weight: bold;
		padding-bottom: 41px;
		border-bottom: 5px solid black;
	}
	
	<!-- lauout2 시작 -->
	
	#layout2 {
		width: 100%;
		border-bottom: 1px solid #c3c4c7;
	}
	
	#layout2 .container2 {
		width: 1400px;
		margin: auto;
	
	}
	
	#layout2 .container2 .box2 {
		width: 100%;
		margin: auto;
	}
	
	#layout2 .container2 .box2 .now {
		margin-top: 50px;
		margin-bottom: 50px; 
		font-size: 60px;
	}
	
	#layout2 .container2 .box2 .new {
		float: right;
	}
	
	#layout2 .container2 .box2 .new li {
		display: inline-block;
		color: #c3c4c7;
	}
	
	#layout2 .container2 .box2 .new li a {
		padding-right: 10px;
		color: #c3c4c7;
	}
	
	#layout2 .container2 .box2 .new li a:hover {
		color: black;
		font-weight: bold;
	}

	#layout2 .container2 .box2 .click_area {
		display: block;
		margin-top: 120px;
	}
	
	#layout2 .container2 .box2 .click_area .left {
		display: block;
		float: left;
		width: 50%;
		height: 480px;
		border-bottom: 1px solid black;
		margin-bottom: 20px;
		
	}
	

	#layout2 .container2 .box2 .click_area .left ul li {
		margin: 25px 0px 0px 20px;
		font-size: 15px;
		color: #c3c4c7;
	}
	
	#layout2 .container2 .box2 .click_area .right {
		display: block;
		float: right;
		width: 50%;
		height: 480px;
		border-bottom: 1px solid black;
		margin-bottom: 20px;
	}
	
	
	#layout2 .container2 .box2 .click_area .right table {
		display: block;
		margin-top: 20px;
	}
	
	
	#layout2 .container2 .box2 .click_area .right table tr td {
		font-size: 15px;
		color: black;
		padding: 8px;
		width: 50%;
	}
	
	#but1 {
		transition: all 0.3s;
		background-color: black;
		color: white;
		border-radius: 5px;
		font-weight: bold;
		padding: 15px 30px;
		border: 1px solid black;
	}	
	
	#but1:hover {
		background-color: white;
		color: black;
		border-radius: 5px;
		text-decoration: none;
		border: 1px solid black;
		cursor: pointer;
	}



	

	<!-- 페이징 -->
	#layout3 {
		width: 100%;
		padding-top: 1500px;
	}
	
	#simgs {
		width: 1440px;
        margin: auto;
        text-align: center;
    }

       #imgUl {
       		width: 330px;
       		overflow: hidden;
        	text-align: center;
        	margin: auto;
        	height: 25px;
        	margin-bottom: 10px;
        }

       #imgUl li {
      	 	text-align: center;
        	display: inline-block;
        	margin: 0px 5px;
        }
        
        #imgUl li input {
        	font-weight: bold;
        	color: black;
        	text-decoration: none;
        	border-style: none;
        	font-style: italic;
        	background-color: white;
        	padding: 5px;
        }
        
        #imgUl li input:hover {
        	opacity: 0.5;
        }
        
        
        #prev {
        	clear: both;
            width: 50px;
            top: 70px;
            text-align: center;
            font-weight: bold;
            margin: 0px 10px;
            border: 1px solid black;
        	background-color: black;
        	color: white;
        	border-radius: 5px;
        	padding: 2px 5px;
        	transition: all 0.3s;
        }
        
         #next {
         	clear: both;
            width: 50px;
            top: 70px;
            text-align: center;
            font-weight: bold;
            margin: 0px 10px;
            border: 1px solid black;
        	background-color: black;
        	color: white;
        	border-radius: 5px;
        	padding: 2px 5px;
        	transition: all 0.3s;
         }

        #prev:hover {
        	cursor: pointer;
        	border: 1px solid black;
        	background-color: white;
        	color: black;
        	border-radius: 5px;
        }

        #next:hover {
        	cursor: pointer;
        	font-weight: bold;
        	border: 1px solid black;
        	background-color: white;
        	color: black;
        	border-radius: 5px;
        }

		#beforeProgram {
			list-style: none;
			display: inline-block;
			
		}
		
		#beforeProgram li {
		}
		
		
	#layout4 {
		width: 100%;
	}
	
	#layout4 .container4 {
		width: 1400px;
		margin: auto;
		padding-bottom: 100px;
		
	}
	
	#layout4 .container4 .box4 {
		width: 100%;
		margin: auto;
	}
	
	
	
	#layout4 .container4 .box4 .before {
		margin-top: 50px;
		margin-bottom: 50px; 
		font-size: 60px;
	}
	

	
	#layout4 .container4 .box4 .new li {
		display: inline-block;
		color: #c3c4c7;
	}
	
	#layout4 .container4 .box4 .new li a {
		padding-right: 10px;
		color: #c3c4c7;
	}
	
	#layout4 .container4 .box4 .new li a:hover {
		color: black;
		font-weight: bold;
		cursor: pointer;
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
 
 #paging ul li a i {
	font-style: italic;
	font-weight: bold;
	font-size: 15px;
	text-decoration: none;
	color: black;
	padding: 15px;
 }
 
  #paging ul li a i:hover {
	background-color: black;
	color: white;
	cursor: pointer;
 }
 


		
		
		
</style>
<script>
	$().ready(function() {
	    // 버튼 한 번 클릭시 이미지 3개씩 이동 처리
	    // next 버튼 : 맨 앞의 이미지 3개를 맨 뒤로 보내기
	
	    $("#next").click(function() {
	        //for (let i = 0; i <3; i++) {
	            //$("#imgUl").append($("#imgUl > li:first"));
	        //}
	        $("#imgUl").append($("#imgUl > li").slice(0, 5));
	        // 0번 인덱스에서 3번 인덱스 이전까지 자르기
	    });
	
	    // prev 버튼 : 맨 뒤의 이미지 3개를 맨 앞으로 보내기
	    $("#prev").click(function() {
	        for (let i = 0; i <5; i++) {
	            $("#imgUl").prepend($("#imgUl > li:last"));
	        }
	        
	        //$("#imgUl").prepend($("#imgUl > li").slice(-3));
	        // 맨 뒤에서 3개 자름 ( -3 )
	    });
	});

	
	$().ready(function() {
		$('.click_area').click(function () {
			if (member.id == null) {
				location.href="login.jsp";
			}
		});
	});
	
	
	function deleteLearn(a) {
		var reservationIdx = a;
		
		var result = confirm('삭제하시겠습니까?');
		if (result==true){
			alert('삭제가 완료되었습니다.');
		location.href='learnDelete2.do?learnIdx='+ reservationIdx;
		}
	}
	
	
	$().ready(function () {
	    $("#but1").click(function () {
	        Swal.fire({
	            title: '새글등록',
	            text: "새글등록 하시겠습니까?",
	            icon: 'info',
	            showCancelButton: true,
	            confirmButtonColor: '#3085d6',
	            cancelButtonColor: '#d33',
	            confirmButtonText: '등록',
	            cancelButtonText: '취소'
	        }).then((result) => {
	            if (result.isConfirmed) {
	                setTimeout(function(){
	                   location.href="moveTolearninsert.do";
	                },1000)
	            }
	        })
	    });
	});

	

</script>
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
	<div id="layout1" class="notosanskr">
		<div class="container1 notosanskr">
			<div class="box1">
				<p style="font-weight: bold;">전체보기</p>
				<ul>
					<li><a href="getLearnList.do">전체보기</a></li>
					<li><a href="categoryLearn.do?categoryNum=1">유아</a></li>
					<li><a href="categoryLearn.do?categoryNum=2">어린이</a></li>
					<li><a href="categoryLearn.do?categoryNum=3">청소년</a></li>
					<li><a href="categoryLearn.do?categoryNum=4">대학생</a></li>
					<li><a href="categoryLearn.do?categoryNum=5">성인</a></li>
					<li><a href="categoryLearn.do?categoryNum=6">교사</a></li>
					<li><a href="categoryLearn.do?categoryNum=7">전시해설</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div id="layout2" class="notosanskr">
		<div class="container2">
			<div class="box2">
				<p class="now" style="font-weight: bold;">NOW</p>
				<ul class="new">
					<span style="margin-right: 1100px; color: #c3c4c7;">전체 <b style="color: black">${learnTotal }</b>건</span>
					<li><a href="selectViews.do" style="border-right: 1px solid #c3c4c7;">조회순</a></li>
					<li><a href="selectNew.do" style="border-right: 1px solid #c3c4c7;">최신순</a></li>
					<li><a href="selectOld.do">오래된순</a></li>
				</ul>
				<c:choose>
						<c:when test="${empty learnList }"> 
							<h2 style="margin: auto; text-align: center; height: 400px; padding: 100px; border-bottom: 1px solid black;">지금은 준비 중입니다.<br>더 나은 프로그램으로 찾아뵙겠습니다.</h2>
						</c:when>
					<c:otherwise>
						<c:forEach var="learnList" items="${learnList }">
							<div id="click_area" class="click_area"><a href="getLearn.do?learnIdx=${learnList.learnIdx }&id=${member.id }">
								<div class="left">
									<c:if test="${empty learnList.fileName }">
										<ul>
											<li><img src="C:/MyStudy/70_Spring/Imuseum/src/main/webapp/learnImage/123.png" width="630px" height="400px" /></li>
										</ul>
									</c:if>
									<c:if test="${not empty learnList.fileName }">
										<ul>
											<li><img src="${pageContext.request.contextPath}/learnImage/${learnList.fileName }" width="630px" height="400px" /></li>
										</ul>
									</c:if>
								</div>
								<div class="right">
									<div style="display: black; margin-top: 30px; margin-bottom: 20px;">
										<c:if test="${learnList.educationNum == 0 }">
											<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">교육</span>
										</c:if>
										<c:if test="${learnList.educationNum == 1 }">
											<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">1회성 교육</span>
										</c:if>
										<c:if test="${learnList.educationNum == 2 }">
											<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">단체 교육</span>
										</c:if>
										<c:if test="${learnList.placeNum == 0 }">
											<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">장소</span>
										</c:if>
										<c:if test="${learnList.placeNum == 1 }">
											<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">아이뮤지엄</span>
										</c:if>
									</div>
									<span style="display:block; margin-top: 10px; font-size: 30px; font-weight: bold;">${learnList.title }</span><br>
									<span style="font-size: 16px; color: #c3c4c7;">${learnList.subtitle }</span>
									<table style="width: 600px; ">
										<tr>
											<td>교육 날짜</td>
											<td>${learnList.regdate1.replaceAll("/","-") } ~ ${learnList.regdate2.replaceAll("/","-")}</td>
										</tr>
										<tr>
											<td>장소</td>
											<td>${learnList.place }</td>
										</tr>
										<tr>
											<td>정원</td>
											<td>${learnList.memberNumber }</td>
										</tr>
										<tr>
											<td>교육시간</td>
											<td>${learnList.educationTimeNum }, ${learnList.educationTime }</td>
										</tr>
										<tr>
											<td>요금</td>
											<td>${learnList.fee }</td>
										</tr>
										<tr>
											<td>조회수</td>
											<td>${learnList.views }</td>
										</tr>
									</table>
								</div>
							</a></div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	
	
	<div style="text-align: center;">
		<div id="paging">
			<ul>
				<!-- 이전 -->
				<li>
		 			<c:if test="${page.nowPage == 1 }">
			  			<a>&#60;</a>
			  		</c:if>
			  		<c:if test="${page.nowPage != 1 }">
						<a href="getLearnList.do?page=${page.nowPage - 1 }">&#60;</a>
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
							<a href="getLearnList.do?page=${pageNo }">${pageNo }</a>
			   			</li>
					</c:if>
				</c:forEach>
			   	<!-- 다음 -->
				<li>
					<c:if test="${page.nowPage < page.totalPage }">
						<a href="getLearnList.do?page=${page.nowPage + 1 }">&#62;</a>
					</c:if>
					<c:if test="${page.nowPage >= page.totalPage }">
						<a>&#62;</a>
					</c:if>
				 </li>
			</ul>
		</div>
	</div>

		



	<!-- 지난 프로그램 -->
	<div id="layout4">
		<div class="container4 notosanskr" style="border-bottom: 1px solid black;">
			<div class="box4">
				<p class="before" style="font-weight: bold;">지난 프로그램</p>
				<ul class="new">
					<li><span style="float: left; margin-left: 20px; color: #c3c4c7;">전체 <b style="color: black">${learnTotal2 }</b>건</span></li>
				</ul>
				<c:choose>
						<c:when test="${empty learnList2 }"> 
							<h2 style="margin: auto; text-align: center; height: 300px; padding: 100px;">지난 프로그램이 없습니다.</h2>
						</c:when>
					<c:otherwise>
					<c:forEach var="learnList2" items="${learnList2 }">
						<ul style="border: 1px solid black; width: 400px; margin-top: 50px; margin-left: 50px; padding: 1px;" id="beforeProgram">
							<li><img src="${pageContext.request.contextPath}/learnImage/${learnList2.fileName }" width="396px" height="300px"/></li>
							<li><div id="flexbutton" style="display: flex;">
								<c:if test="${learnList2.placeNum == 0 }">
									<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">장소</span>
								</c:if>
								<c:if test="${learnList2.placeNum == 1 }">
									<span style="margin-top: 10px; border: 1px solid black; background-color: black; color: white; padding: 5px 10px; border-radius: 2px; margin-right: 5px; text-decoration: none;">아이뮤지엄</span>
								</c:if>
							</div></li>
							<li style="font-weight: bold; font-size: 22px; margin-top: 10px; padding: 10px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break:break-all">${learnList2.title }</li>
		                     <li style="padding: 20px; font-size: 15px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; word-break:break-all">${learnList2.subtitle }</li>
		                     <li style="margin-top: 50px; margin-bottom: 10px; padding: 20px;"><i>${learnList2.regdate1.replaceAll("/","-") } ~ ${learnList2.regdate2.replaceAll("/","-") }</i>
		                     <c:if test="${member.id == 'admin' }">
		                        <input type="submit" value="X" style="float: right; border: none; background-color: white; font-weight: bold; font-size: 15px;" id="learnDelete2" onclick="deleteLearn('${learnList2.learnIdx}')">
		                     </c:if></li>
		                  </ul>
					</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<!-- 지난프로그램 끝 -->
	
	
	<div style="width: 100%; margin-top: 30px;">
		<div style="width: 1400px; margin: auto;">
			<c:if test="${member.id == 'admin' }">
				<p style="float: right; margin-top: 20px;"><a id="but1">새글등록</a></p>
			</c:if>
		</div>
	</div>
		
		<div id="layout3">
			<div id="simgs">
				<ul id="imgUl">
					<li><input type="submit" value="2022" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2022'"></li>
					<li><input type="submit" value="2021" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2021'"></li>
					<li><input type="submit" value="2020" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2020'"></li>
					<li><input type="submit" value="2019" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2019'"></li>
					<li><input type="submit" value="2018" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2018'"></li>
					<li><input type="submit" value="2017" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2017'"></li>
					<li><input type="submit" value="2016" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2016'"></li>
					<li><input type="submit" value="2015" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2015'"></li>
					<li><input type="submit" value="2014" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2014'"></li>
					<li><input type="submit" value="2013" name="regdate2" id="regdate2" onclick="javascript:location.href='yearLearn.do?regdate2=2013'"></li>
				</ul>
				<a id="prev">&lt;</a>
    		    <a id="next">&gt;</a>
			</div>
		</div>
		
		<div class="footer" style="margin-top: 100px;">
			<%@ include file="/common/footer.jspf" %>
		</div>
</body>
</html>