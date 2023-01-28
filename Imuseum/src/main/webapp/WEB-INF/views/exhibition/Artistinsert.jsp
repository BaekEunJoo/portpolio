<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IMUSEUM - ARTIST 등록</title>
<%@ include file="/common/style.jspf" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	
	.inputarea .box3 input{
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
	
	textarea {
		text-align: left;
	}
	
	#selectbox { border: none;}
	
	
</style>
</head>
<body>

	<%@ include file="/common/adminMenu.jspf" %>
	<%@ include file="/common/main.jspf" %>
	
	<div class="container-fulid notosanskr">
		<div class="row" style="padding: 0; margin: 0;">
			<div class="col-8 offset-2" style="padding: 100px 0;">
				<div class="inputarea">
					<p style="font-size: 3em; font-weight: bold; margin-left: 10px;">작가등록</p>
					<hr>
					<form name="thisForm" action="artistInsertGo.do" method="post" enctype="multipart/form-data">
					<div class="box3">
							<table style="width: 100%;">
								<tr>
									<th width="15%">전시명</th>
									<td width="35%" style="padding: 0 20px;">
										<input type="text" id="exhName" value="${vo.exhName}" readonly="readonly">
									</td>
									<th width="15%">작가명</th>
									<td width="35%"><input type="text" placeholder="작가명을 입력하세요." name="artist" id="artist"></td>
								</tr>
								<tr>
									<th>대표이미지</th>
									<td style="height: 100%;">
										<input type="file" name="up" id="artistImage" onchange="upThumbnail(this);" >
									</td>
									<td colspan="2">
										<img id="up_container" style="width: 500px; max-height:500px; object-fit:contain;"/>
									</td>
								</tr>
								<tr>
									<th>작가소개</th>
									<td colspan="4">
										<textarea name="artistInfo" id="content" onfocus="a(this)" rows="20"
											style="width: 100%;" placeholder="내용을 입력하세요."></textarea>
									</td>
								</tr>
							</table>
							<hr>
						</div>
						<div id="layout4" style="float: right;">
							<input type="hidden" name="exhNum" value="${vo.exhNum}">
							<button class="btn btn-dark" id="btn" onclick="chk()">작가등록</button>
						</div>
					</form>	
				</div>
			</div>
		</div>
	</div>
<script>

	function chk() {
		var f = document.thisForm;
		const artist = document.getElementById('artist').value;
		const content = document.querySelector('#content').value;
		
        if(artist == '') {
            alert('작가명은 필수입력 항목입니다.');
            return;
        } else if(content == ''){
            alert('작가소개를 입력하세요.');
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
	
	
	
</script>


</body>
<%@ include file="/common/footer.jspf"%>
</html>