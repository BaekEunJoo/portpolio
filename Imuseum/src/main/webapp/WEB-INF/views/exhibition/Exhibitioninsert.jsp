<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IMUSEUM - EXHIBITION 등록</title>
<%@ include file="/common/style.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	
	.inputarea .box3 input {
		border: 2px solid white;
		border-radius: 5px;
		width: 100%;
		padding: 20px 20px;
	}
	
	.inputarea .box3 input[type=text]:hover {
		border: 2px solid #c3c4c7;
		border-radius: 5px;
	}
	
	.inputarea .box3 input[type=date]:hover {
		border: 2px solid #c3c4c7;
		border-radius: 5px;
	}
	
	#content {
		width: 100%;
		border: none;
		color: black;
		font-size: 20px;
		border: 2px solid black;
		border-radius: 5px;
		padding: 5px;
	}

	input[type=file]::file-selector-button {
	  width: 150px;
	  height: 50px;
	  background: white;
	  border: 1px solid black;
	  border-radius: 0px;
	  cursor: pointer;
	}
	
	input[type=file]::file-selector-button:hover{
		background: black;
	    color: white;
	}
	
	th {
		background-color: black; 
		color: white; 
		border: 1px solid white; 
		font-variant: bold;
		text-align: center;
	}
	
	#btn {
		background-color: black;
		color: white;
		width: 150px; 
		height: 50px;
		border-radius: 0;
	}
	
</style>
</head>
<body>

	<%@ include file="/common/adminMenu.jspf" %>
	<%@ include file="/common/main.jspf" %>
	
	<div class="container-fulid notosanskr">
		<div class="row" style="padding: 0; margin: 0;">
			<div class="col-8 offset-2" style="padding: 100px 0;">
				<div class="inputarea">
					<p style="font-size: 3em; font-weight: bold; margin-left: 10px;">전시등록</p>
					<hr>
					<form name="thisForm" action="exhibitionInsertGo.do" method="post" enctype="multipart/form-data">
					<div class="box3">
							<span style="font-size: 40px; font-weight: bold;">
								<input type="text" placeholder="전시명을 입력해주세요." name="exhName" id="exhName"
									style="margin-bottom: 20px; font-weight: bold;" required>
							</span><br>
							<span style="font-size: 20px; margin-top: 20px;">
								<input type="text" placeholder="전시소개글을 입력해주세요." name="exhInfo" id="exhInfo"
									style="margin-bottom: 20px;">
							</span><br>
							<table style="width: 100%;" >
								<tr>
									<th width="15%">전시시작일</th>
									<td width="35%"><input type="date" name="startDate" id="startDate" onchange="lastchk()" required></td>
									<th width="15%">전시마감일</th>
									<td width="35%"><input type="date" name="lastDate" id="lastDate" required></td>
								</tr>
								<tr>
									<th>장르</th>
									<td><input type="text" placeholder="장르를 입력하세요." name="genre" id="genre"></td>
									<th>후원처</th>
									<td><input type="text" placeholder="후원처를 입력하세요." name="partnership" id="partnership"></td>
								</tr>
								<tr>
									<th>상단이미지</th>
									<td style="height: 100%;">
										<input type="file" name="up" id="upImg" onchange="upThumbnail(this);" >
									</td>
									<td colspan="2">
										<img id="up_container" style="width: 500px; max-height:500px; object-fit:contain;"/>
									</td>
								</tr>
								<tr>
									<th>포스터이미지</th>
									<td style="height: 100%;">
										<input type="file" name="poster" id="posterImg" onchange="posterThumbnail(this);" >
									</td>
									<td colspan="2">
										<img id="poster_container" style="width: 500px; max-height:500px; object-fit:contain;"/>
									</td>
								</tr>
								<tr>
									<th>티켓이미지</th>
									<td>
										<input type="file" name="ticket" id="ticketImg" onchange="ticketThumbnail(this);">
									</td>
									<td colspan="2">
										<img id="ticket_container" style="width: 500px; max-height:500px; object-fit:contain;"/>
									</td>
								</tr>
								<tr>
									<th>전시소개 이미지</th>
									<td>
										<input type="file" name="info" id="infoImg" onchange="infoThumbnail(this);">
									</td>
									<td colspan="2">
										<img id="info_container" style="width: 500px; max-height:500px; object-fit:contain;"/>
									</td>
								</tr>
							</table>
							<hr>
						</div>
						<div id="layout4" style="float: right;">
							<button class="btn btn-dark" id="btn" onclick="chk()">전시등록</button>
						</div>
					</form>	
				</div>
			</div>
		</div>
	</div>
<script>
	
	//시작일 오늘 날짜부터
	document.getElementById('startDate').min = new Date().toISOString().substring(0, 10);
	function lastchk() {
		//마감일 시작일 이후부터 선택가능
		document.getElementById('lastDate').min = document.querySelector('#startDate').value;
	}
	
	
	function chk() {
		var f = document.thisForm;
		const exhName = document.getElementById('exhName').value;
		const startDate = document.querySelector('#startDate').value;
		const lastDate = document.querySelector('#lastDate').value;
		
        if(exhName == '') {
            alert('전시명은 필수입력 항목입니다.');
            return;
        } else if(startDate == ''){
            alert('전시시작일을 선택하세요.');
            return;
        } else if(lastDate == ''){
            alert('전시마감일을 선택하세요.');
            return;
        } else {
            f.submit();
            //입력완료 페이지로 이동
        }
	}
	
	
	
	function upThumbnail(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('up_container').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('up_container').src = "";
		  }
	}
	
	function posterThumbnail(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('poster_container').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('poster_container').src = "";
		  }
	}
	
	function ticketThumbnail(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('ticket_container').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('ticket_container').src = "";
		  }
	}
	
	function infoThumbnail(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('info_container').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('info_container').src = "";
		  }
	}
	
	
</script>


</body>
<%@ include file="/common/footer.jspf"%>
</html>