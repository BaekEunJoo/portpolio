<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {
		accent-color: black;
	}
	.bt {
		width:150px;
		height:50px;
		color : white;
		background-color: black;
	}
	#btn1{
		border : 1px solid black;
		color:black;
		background-color: white;
	}
	#btn1:hover {
		color:white;
		background-color: black;
	}
	#btn2:hover {
		border : 1px solid black;
		color : black;
		background-color: white;
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
	#mp_updateInfo {color: black;}
	.table {
		margin-top:30px;
		border-top:2.5px solid black;
		border-bottom:1px solid lightgray;
	}
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
				<!-- div 시작 -->
				<div>
				
					<!-- body 시작 -->
					<div class="container-fluid mt-5">
						<h5 style="font-weight:bold;">개인정보 변경/탈퇴</h5>
						<!-- 사유 선택 시작 -->
						<div>
							<table class="table">
								<tbody>
									<tr>
										<td>
											<strong style="font-size: 1.2em;">회원탈퇴 사유<span style="color:red;">*</span></strong>
										</td>
										<td>
											<span style="float:right;"><span style="color:red;">*</span>표시는 필수 입력 사항입니다.</span>
										</td>
									</tr>	
									<tr>
										<td rowspan="3" style="border-right:1px solid lightgray; font-weight:bold; font-size: 1.2em;">개인정보 관련</td>
										<td><input type="checkbox">&nbsp;아이디 변경을 위해 탈퇴 후 재가입</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;장기간 부재(군입대, 유학 등)</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;개인정보 누출 우려</td>
									</tr>
									<tr>
										<td rowspan="3" style="border-right:1px solid lightgray; font-weight:bold; font-size: 1.2em;">사이트 이용 관련</td>
										<td><input type="checkbox">&nbsp;컨텐츠 등 이용할만한 서비스 부족</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;사이트 속도 및 안정성 불안</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;사이트 이용 불편</td>
									</tr>	
									<tr>
										<td rowspan="6" style="border-right:1px solid lightgray; font-weight:bold; font-size: 1.2em;">컨텐츠 이용 관련</td>
										<td><input type="checkbox">&nbsp;상품의 다양성/품질 불만</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;상품 가역 불만</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;배송 불만</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;교환/환불/반품 불만</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;사후조치 불만</td>
									</tr>
									<tr>
										<td><input type="checkbox">&nbsp;기타 사항</td>
									</tr>					
								</tbody>
							</table>
						</div>
						<!-- 사유 선택 끝 -->
						
						<div class="my-5 p-0" style="text-align: center;">
							<button class="bt" id="btn1" type="button" onclick="location.href='mypage_main.do'">취소</button>
							<button class="bt" id="btn2" type="button" onclick="location.href='dissmissAccount.do'">회원탈퇴</button>
						</div> 
					</div>
					<!-- body 끝 -->
					
				</div>
				<!-- div 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
		</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
</html>