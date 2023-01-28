<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>회원등급</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	.bt {
		width:180px;
		height:40px;
		border: 1px solid black;
		background-color: white;
	}
	.dateBtn {
		width:100px;
		height:40px;
		border: 1px solid black;
		background-color: white;
	}
	.boldBorder:after {
		content: "";
		display: block;
		width: 100%;
		border-bottom: 3px solid black;
		margin-top : 15px;
	}
	li a {
		font-size: 0.9em;
		color : gray;
	}
	li a:hover { color : black; list-style : none; }
	#mp_grade {color: black;}
	.myGrade {
		background-color: black;
		color:white;
		width:250px;
		height:35px;
		padding:5px;
		margin:10px 5px 0px 0px;
		text-align:center;
	}
	.bar > ul {
		margin-left: 0px;
		padding-left:0px;
	}
	.exStartBar::before {
	    display: block;
	    bottom: 0;
	    left: 0;
	    width: 50px;
	    height: 1rem;
	    background: #111;
	    content: '';
	}
	.artStartBar::before {
	    display: block;
	    bottom: 0;
	    left: 0;
	    width: 3px;
	    height: 1rem;
	    background: #111;
	    content: '';
	}
	.bar > ul > li {
		width : 100%;
		height : 0.2px;
		background-color: lightgray;
		list-style: none;
		float:left;
		margin-left: 0px;
		padding-left:0px;
	}
	.treeGoal {
		font-weight: bold;
		padding-left:200px;
	}
	.forestGoal {
		font-weight: bold;
		float:right;
	}
	.equilateral-triangle {
		width: 0px;
        height: 0px;
        border-right: 5px solid transparent;
        border-left: 5px solid transparent;
        border-top: 10px solid black;
        margin-top:0px;
        padding:0px;
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
	#mp_grade {color: black;}
</style>
</head>
<body>
	<%@include file = "/common/MemberMenu.jspf" %>
	<%@include file = "/common/main.jspf" %>
	<div class="container-fluid notosanskr">
		<div class="row"  style="padding: 0;">
			<!-- 사이드 네비바 -->
			<div class="col-2 offset-1">
			<%@include file ="/common/mypageNav.jspf" %>
			</div>
			
			<!-- 컨텐츠 -->
			<div class="col-8">
				<!-- row div 시작 -->
				<div class="row">
				
					<!-- body 시작 -->
					<div class="container-fluid mt-5">
						<h5 style="font-weight:bold;" class="boldBorder">나의 회원등급</h5>
						<div class="py-4 border-bottom">
							<div class="row">
								<div class="col-2 offset-1">
									<c:if test="${member.grade eq 'SEED'}">
										<span><img alt="seed" src="/Imuseum/common/img/seed.png" width="70px"></span>
									</c:if>
									<c:if test="${member.grade eq 'TREE'}">
										<span><img alt="seed" src="/Imuseum/common/img/tree.png" width="70px"></span>
									</c:if>
									<c:if test="${member.grade eq 'FOREST'}">
										<span><img alt="seed" src="/Imuseum/common/img/forest.png" width="70px"></span>
									</c:if>
								</div>
								<div class="col-4">
									<span style="font-size:22px;">${member.name }님의 현재 등급은 <strong>${member.grade }</strong>입니다.<br></span>
									<span style="font-size:12px;">${member.name }님의 다음 등급은 TREE입니다.</span>
								</div>
							</div>
						</div>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">다음 등급 미션</h5>
							<strong>미션 수행 기간 2022.01.01 ~ 2023.12.31</strong><br>
							<span>※ 달성하신 미션은 미션 수행 기간 이후 1월 2일 기준으로 반영됩니다.</span>
						</div>
						
						<!--  -->
						<div>
							<table class="row pb-3">
								<tbody class="col-6">
									<tr>
										<th>전시 관람/교육/이벤트 프로그램</th>
									</tr>
									<tr>
										<td>TREE : 전시 관람/교육/이벤트 프로그램 참여 3회 이상<br>FOREST : 전시 관람/교육/이벤트 프로그램 참여 5회 이상</td>
									</tr>
									<tr>
										<td>
											<div class="myGrade">
												<strong>TREE</strong>&nbsp;등급까지 <strong>2회</strong>&nbsp;남았어요!
											</div>
											<div class="equilateral-triangle">
												
											</div>
											<div class="bar">
												<ul>
													<li>
														<span class="barBottom"></span>
														<span class="exStartBar"></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="treeGoal">TREE</span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="forestGoal">FOREST</span>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
								<tbody class="col-6">
									<tr>
										<th>아트상품</th>
									</tr>
									<tr>
										<td>TREE : 온 오프라인 뮤지엄샵 아트 상품 누적 구매액 10만원 이상<br>FOREST : 온 오프라인 뮤지엄샵 아트 상품 누적 구매액 20만원 이상</td>
									</tr>
									<tr>
										<td>
											<div class="myGrade">
												<strong>TREE</strong>&nbsp;등급까지 <strong>3회</strong>&nbsp;남았어요!
											</div>
											<div class="equilateral-triangle">
												
											</div>
											<div class="bar">
												<ul>
													<li>
														<span class="barBottom"></span>
														<span class="artStartBar"></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="treeGoal">TREE</span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span></span>
													</li>
													<li>
														<span class="barBottom"></span>
														<span class="forestGoal">FOREST</span>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<hr>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">등급별 혜택</h5>
							<div style="vertical-align:center;">
								<img alt="benefit" src="/Imuseum/common/img/gradeBenefit.JPG" width="100%">
							</div>
						</div>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">등급 산정 정책</h5>
							<div>
								<p>
									- 등급 평가 기간은 매년 1월 1일부터 다음 해 12월 31일까지입니다. (1월 1일 수행한 미션은 다음 해 등급 평가 시 합산됩니다.)<br>
									- 2022년 3월 1일 이전 가입한 회원의 경우 TREE 등급으로 시작하여 2023년 12월 31일까지 적용됩니다.<br>
									- 휴면계정 전환 시 회원 등급이 초기화됩니다.<br>
									- 회원 등급 조정은 미션 수행 이력에 따라 기존 등급 승급 시점으로부터 2년 후 1월 2일부터 적용됩니다. (단, SEED 등급은 신규 회원 가입 시점부터 적용)<br>
									- 회원 등급은 매년 1월 2일 ~ 다음 해 12월 31일까지 유지됩니다. (신규 회원의 경우 가입한 다음 해 12월 31일까지)
								</p>
							</div>
						</div>
						
						<!--  -->
						<div class="py-4">
							<h5 style="font-weight:bold;">혜택별 상세 정보</h5>
							<div>
								<p>
									- 전시 또는 프로그램 관람 횟수 카운팅은 유료 전시 및 프로그램에 한하여 적용됩니다.<br>
									- 동일 전시 재관람 혜택 이용 시 전시 관람 횟수로 카운팅되지 않습니다.<br>
									- 상품 누적 구매액은 실제 결제금액 기준으로 집계됩니다.<br>
									- 상품 쿠폰 구분 : 1) 뮤지엄샵 (오프라인 전용), 2) 온라인스토어 (온라인 전용)<br>
									- 등급별 발행된 쿠폰 및 할인 혜택은 해당 등급 유지기간 종료 시 사용 여부와 관계없이 소멸됩니다.<br>
									- 생일쿠폰은 회원정보에 등록된 생일 기준 7일 전 발급되며, 발급일로부터 1개월 간 사용 가능합니다.<br>
									- 쿠폰과 할인혜택은 중복 적용이 불가합니다.<br>
									- 혜택, 등급선정기준, 등급조정 등 회원 정책은 미술관 사정에 따라 변경될 수 있습니다.
								</p>
							</div>
						</div>
						
					</div>
					<!-- body 끝 -->
					
				</div>
				<!-- row div 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>