<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>VISIT | I MUSEUM</title>
<%@ include file="/common/style.jspf" %>
<style>
	#noweb {
		color: #949494;
		font-size: 0.9em;
		padding-left: 30%;
		margin: auto 0;
	}
	
	.howto {
		color: #949494;
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


<div class="container notosanskr" style="margin: 0 auto;">
	<div class="row">
		<div class="col-6" style="margin-top: 40px; margin-bottom: 40px;">
			<p style="font-size: 4em; font-weight: bold;">오시는 길</p>
		</div>
		<div class="col-6 text-end" id="noweb" style="float: right;">
			<i class="bi bi-house-fill" onclick="location.href='goHome.do'" style="cursor: pointer; font-size: 1.1em;"></i>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;오시는 길 </span>
		</div>
	</div>
</div>

<div class="main" style="margin-bottom: 50px;">
    <div class="topimg">
    	<img alt="" src="https://lh3.googleusercontent.com/p/AF1QipOE0Ar2PD_NNaBRdE7S1ROdW1goCeNaUqZn6wYV=s1360-w1360-h1020" width="100%;">
    </div>
    
    
    
    
<div class="container-filid notosanskr" style="margin-bottom: 100px;">
	<div class="row" style="margin: 0;">
		<div class="col-10 offset-1">
   			<div id="map" style="width:100%;height:450px; margin-top: 50px;"></div> 
		    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e0f3321d007e1c8104ea863a5e45bcb5"></script>
		    <script>
		      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		        mapOption = { 
		            center: new kakao.maps.LatLng(37.4987464, 127.03169), // 지도의 중심좌표
		            level: 3 // 지도의 확대 레벨
		        };
		
		        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		        var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		        // 지도를 클릭한 위치에 표출할 마커입니다
		        var marker = new kakao.maps.Marker({ 
		            // 지도 중심좌표에 마커를 생성합니다 
		            position: map.getCenter()
		        }); 
		        // 지도에 마커를 표시합니다
		        marker.setMap(map);
				
		        var iwContent = '<div style="width:360px;text-align:center;padding:6px 0;"><span style="font-weight: bold;">아이티윌</span><br>서울특별시 강남구 테헤란로 124(역삼동,삼원타워)</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		        iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

		      // 인포윈도우를 생성합니다
		      	var infowindow = new kakao.maps.InfoWindow({
		        position: iwPosition,
		        content: iwContent,
		      });

		      // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		      infowindow.open(map, marker);
		        
		    </script>
		    <br>
		    <p style="font-size: 2em; font-weight: bold;">
		    	서울특별시 강남구 테헤란로 124(역삼동,삼원타워) 4층, ITWILL
		    </p>
		    <p style="font-size: 1.3em; color: gray;">
		    	T. 02.6255.8002
		    </p>
		    <hr>
		    <table style="width: 100%;">
		    	<tr>
					<td rowspan="2" width="30%;" style="font-size: 2em; padding: 40px 0;">
					지하철로 오실 경우
					</td>
					<td width="35%;" style="font-size: 1.5em;">
					강남역 1번 출구
					</td>
					<td width="35%;" style="font-size: 1.5em;">
					역삼역 3번 출구
					</td>
		    	</tr>
		    	<tr style="vertical-align: top;">
					<td class="howto" width="25%;">
					<span class="badge badge-success">2호선</span>
					&nbsp; 도보 150m
					</td>
					<td class="howto" width="25%;">
					<span class="badge badge-success">2호선</span>
					&nbsp; 도보 200m
					</td>
		    	</tr>
		    	</table>
		    	<hr>
		    	<table style="width: 100%;">
		    	<tr>
		    		<td rowspan="4" width="30%;" style="font-size: 2em; padding: 40px 0;">
		    		버스로 오실 경우
		    		</td>
		    		<td colspan="2" width="35%;" style="font-size: 1.5em;">
		    		강남역,역삼세무서(23-287) 
		    		</td>
		    		<td colspan="2" width="35%;" style="font-size: 1.5em;">
		    		강남역,12번출구(23-284) 
		    		</td>
		    	</tr>
		    	<tr>
		    		<td width="4%;">
		    		<span class="badge badge-primary">간선</span>
		    		</td>
		    		<td class="howto" style="padding: 10px 0;">
		    		146, 341, 360, 740, N13, N61
		    		</td>
		    		<td width="4%;">
		    		<span class="badge badge-primary">간선</span>
		    		</td>
		    		<td class="howto">
		    		146, 341, 360, 740, N13, N61
		    		</td>
		    	</tr>
		    	<tr>
		    		<td rowspan="2">
		    		<span class="badge badge-danger">직행</span>
		    		</td>
		    		<td class="howto">
		    		1100, 1700, 2000, 2000-1, 3002, 3007, 
		    		</td>
		    		<td rowspan="2">
		    		<span class="badge badge-danger">직행</span>
		    		</td>
		    		<td class="howto">
		    		1100, 1700 ,2000 , 2000-1, 3600, 7007, 
		    		</td>
		    	</tr>
		    	<tr>
		    		<td class="howto">
		    		3200, 3300, 3400, 7007, 9303, 8001
		    		</td>
		    		<td class="howto">
		    		9303 ,9600 ,8001
		    		</td>
		    	</tr>
		    </table>
			</div>
		</div>
	</div>
</div>






</body>
<%@ include file="/common/footer.jspf"%>
</html>