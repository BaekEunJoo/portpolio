<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@include file = "/common/style.jspf" %>
<meta charset="UTF-8">
<title>리뷰</title>
<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
	input {accent-color: black;}
	input[type=date] { 
		border-radius: 0;
		border: 1px solid silver;
		width: 210px;
		height: 50px;
		margin: 0;
		vertical-align: middle;
	}
	.btn {
		border-radius: 0;
		width: 100px;
		height: 50px;
		margin-right:5px;
	}
	.bt {
		width:120px;
		height:50px;
		margin-left:20px;
		border: 1px solid black;
		background-color: white;
	}
	.bt:hover {
		color:white;
		background-color: black;
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
	#mp_review {color: black;}
#form-group .row {
	margin:0;
}	
	
	
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 25px;
  line-height: 20px;
  
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.5px;
  -webkit-text-stroke-color: #E3242B;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: #E3242B;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #E3242B;
}
.blackbtn {
	background-color: black;
	color: white;

}

.blackbtn:hover {
	border: 1px solid black;
	background-color: white;
	color: black;
}

.whitebtn {
	border: 1px solid black;
	background-color: white;
}

.whitebtn:hover {
	border: 1px solid grey;
	background-color: grey;
	color: white;
}

.modal {text-align: left;}
.modal-header {
	background-color: black;
	color: white;
	height: 65px;
}

#modal-review .modal-footer {
	height: 130px;
	border-top: none;
	text-align: center;
}

#modal-review .whitebtn,#modal-review .blackbtn {
	width: 300px; height: 50px;
}

#modal-review input[type=radio] {
	height: 100px;
	margin-right: 20px;
}

#modal-review label {
	position: relative;
	margin-top: 15px;
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
				<div class="row">
					<div class="body container-fluid mt-5">
						<h5 style="font-weight:bold;">고객리뷰</h5>
						<!-- 타이틀 부분 시작 -->
						<div class="pt-2">
						  <ul class="row p-0" style="list-style:none;">
						  	<li class="col-6 m-0 p-0">
						  		<a>
							  		<button onclick="location.href='mp_reviewWrite.do'" type="button" style="width:100%; color:white; background-color:black;" class="bt hover py-2 m-0">작성가능한 리뷰</button>
						  		</a>
					  		</li>
						  	<li class="col-6 m-0 p-0" style="color:white; background-color:white;">
						  		<a>
							  		<button onclick="location.href='mp_review.do'" type="button" style="width:100%;" class="bt py-2 m-0">작성한 리뷰</button>
						  		</a>
					  		</li>
						  </ul>
						</div>
						<!-- 타이틀 부분 끝 -->
						    <div class="mt-0" style="margin-bottom:100px;">
							    <!-- 제목 -->
								<div class="heading">
									<table class="rvtable" style="width: 100%; border-top:2px solid black;">
										<colgroup>
											<col style="width: 20%;">
											<col style="width: 70%;">
											<col style="width: 10%;">
										</colgroup>
										  <c:choose>
										  	<c:when test="${empty reviewWrite }">
										  		<tr>
										  			<td colspan="3" style="padding:25px; text-align: center;">작성 가능한 리뷰가 없습니다.</td>
										  		</tr>
										  	</c:when>
										  	<c:otherwise>
										  		<c:forEach var="reviewWrite" items="${reviewWrite }">
													<tr style="text-align: center; height: 50px; border-bottom: 1px solid gray;" class="my-5">
														<th>${reviewWrite.productName }</th>
														<th>${reviewWrite.orderDate.substring(0,10) }</th>
														<th>
															<button type="button" class="bt my-4" 
																id="writeModal" data-toggle="modal" data-target="#modal-review" 
																data-id="${reviewWrite.oproductNum}^?${reviewWrite.productNum}^?${reviewWrite.productName}">
																리뷰쓰기
															</button>
															
															<!-- 리뷰작성모달 -->
															<div class="row">
																			<div class="modal fade" id="modal-review" tabindex="-1">
																				<div class="modal-dialog modal-dialog-centered modal-lg" >
																					<div class="modal-content">
																						<div class="modal-header">
																							<span style="font-size: 22px; font-weight: bold;">리뷰 작성하기</span>
																							<button type="button" class="close" data-dismiss="modal">
																								<span aria-hidden="true" style="color: white;">&times;</span>
																							</button>
																						</div>
																						<form id="reviewModal" class="reviewModal" action="productReviewInsert.do" >
																							<div class="modal-body">
																								<div class="form-group" id="form-group">
																									<p id="md-productName" style="font-weight: bold; margin-bottom:0;"></p>
																									<div class="form-group row">
																									
																										<div class="star-rating col-xs-2">
																											<input type="radio" id="5-stars" name="star" value="5" v-model="ratings"/>
																											<label for="5-stars" class="star pr-4"><i class="bi bi-star-fill" style="margin:5px;"></i></label>
																											<input type="radio" id="4-stars" name="star" value="4" v-model="ratings"/>
																											<label for="4-stars" class="star"><i class="bi bi-star-fill" style="margin:5px;"></i></label>
																											<input type="radio" id="3-stars" name="star" value="3" v-model="ratings"/>
																											<label for="3-stars" class="star"><i class="bi bi-star-fill" style="margin:5px;"></i></label>
																											<input type="radio" id="2-stars" name="star" value="2" v-model="ratings"/>
																											<label for="2-stars" class="star"><i class="bi bi-star-fill" style="margin:5px;"></i></label>
																											<input type="radio" id="1-star" name="star" value="1" v-model="ratings" />
																											<label for="1-star" class="star"><i class="bi bi-star-fill" style="margin:5px;"></i></label>
																										</div>
																										<div style="display: inline; margin-top:18px;">별점을 입력해주세요.</div>
																									</div>
																								<label for="content" class="" >리뷰 내용</label>	
																								<textarea class="form-control" name="content" id="content" rows="10" placeholder="500자 이하로 작성해주세요."></textarea>
																							
																								</div>
																								
																							</div>
																							<div class="modal-footer d-flex justify-content-center">
																								<button type="button" class="whitebtn" data-dismiss="modal">취소</button>
																								<input type="button" class="blackbtn" value="확인" onclick="update()">
																								
																								<input type="hidden" name="oproductNum" id="md-oproductNum" value="0">
																								<input type="hidden" name="productNum" id="md-productNum" value="0">
																							</div>
																						</form>
																					</div>
																				</div>
																			</div>
																		</div>
															<!-- 리뷰 작성 모달 -->
															
														</th>
													</tr>
										  		</c:forEach>
										  	</c:otherwise>
										  </c:choose>
									</table>
								</div>
							</div>
							<!--  -->
					</div>
				</div>
				<!-- body 컨테이너 끝 -->
			</div>
			<!-- 컨텐츠 끝 -->
			</div>
	</div>
 	<%@include file="/common/footer.jspf" %>
 </body>
 <script>
 function update(){
	 var star = document.getElementsByName('star');
	 var starValue = 0;
	 for(var i = 0; i< star.length; i++){
 		if(star[i].checked == true ){
 			starValue = star[i].value;
 		}
 	}
	if (starValue == 0) {
		alert("별점을 입력해주세요.");
		return;
	} else if($('textarea[name=content]').val() == ''){
		alert("리뷰 내용을 입력해주세요.");
		return;
	} else {
		//document.reviewmodal.submit();
		//const content = document.querySelector('#content').value;
		//alert(content);
		$('#reviewModal').submit();
		//location.href="productReviewInsert.do";
		//$('.review-modal')action="productReviewInsert.do"
	}
 }
 $(document).on("click", "#writeModal", function () {
	    var orderInfo = $(this).data('id');
	    //alert(orderInfo);
	    var infos = orderInfo.split('^?');
	    //alert("oproductNum:"+infos[0]+",productNum:"+infos[1]+",productName:"+infos[2]);
	    $('#md-oproductNum').val(infos[0]); //oproductNum
	    $('#md-productNum').val(infos[1]); //productNum
	    $('#md-productName').html(infos[2]); //productName
 })
	$(document).ready(function() {
		  $(".content").hide();
		  //content 클래스를 가진 div를 표시/숨김(토글)
		  $(".heading").click(function()
		  {
		    $(this).next(".content").slideToggle(500);
		    $("i", this).toggleClass("fa-chevron-down fa-chevron-up");
		  });
		});
</script>
</html>