window.onload = function() { 
	pageChange();
  };
  
function pageChange(){
	var category = getParameterByName("category");	
	changeMenu(category);
}

function changeMenu(menu){
	if(menu == 1){		
		$("#findPassword").css('display','none');
		$("#findId").css('display','block');		
		$(".snb li").first().addClass('on');
		$(".snb li").last().removeClass('on');
		$("input:radio[id='birthCheck1']").click();
	}
	if(menu == 2){
		$("#findId").css('display','none');
		$("#findPassword").css('display','block');
		$(".snb li").last().addClass('on');
		$(".snb li").first().removeClass('on');
		$("input:radio[id='birthCheck3']").click();		
	}
}
function getParameterByName(name) {
	  name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	  var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
	  results = regex.exec(location.search);
	  return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
//DOM컨트롤
$(function(){
	//ID 찾기
	
	//라디오 버튼 체크시 메뉴 변경	
	$("input:radio[name=checkBox]").change(function(){
		var id = $(this).val();
		if(id =='idPhone'){
			let htmlTag = "";
			htmlTag += "<div class='input-area'>";
			htmlTag += "<label for='phone'>핸드폰 번호</label>";
			htmlTag += "<input type='text' class='form-control' id='phone' placeholder='하이폰을 제외한 핸드폰 번호를 입력해주세요.' name='phone' >";
			htmlTag += "<div class='valid-feedback'>확인</div>";
			htmlTag += "<div class='invalid-feedback'>올바른 핸드폰 번호를 입력해주세요.</div>";
			htmlTag += "</div>";
			$(".radiochange").html(htmlTag);			
			
		} else if(id == 'idBirth'){
			let htmlTag = "";
			htmlTag += "<div class='input-area'>";
			htmlTag += "<label for='birth'>생년월일</label>";
			htmlTag += "<input type='date' class='form-control' id='birth' placeholder='생년월일을 입력해주세요.' name='birth' >";
			htmlTag += "<div class='valid-feedback'>확인</div>";
			htmlTag += "<div class='invalid-feedback'>올바른 생년월일을 입력해주세요.</div>";
			htmlTag += "</div>";
			$(".radiochange").html(htmlTag);
		}
		
	});	
	
	//전화번호 정규식(자동 하이픈)
	$(document).on('keyup','#phone',function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	}); 
	
	$(document).on('click','#findIdBtn',function(){
		var check = $('input:radio[name=checkBox]:checked').val();		
		if($('#findIdName').val() == ''){
			$('#findIdName').addClass('is-invalid'); 
			$('#findIdName').removeClass('is-valid');
			$('#findIdName').focus();			
			return false;
		} else if(check == 'idBirth')
			if($('#birth').val() == ''){
				$('#birth').addClass('is-invalid');
				$('#birth').removeClass('is-valid');
				$('#birth').focus();
				return false;
		} else if(check == 'idPhone')
			if($('#phone').val() == ''){
				$('#phone').addClass('is-invalid');
				$('#phone').removeClass('is-valid');
				$('#phone').focus();
				return false;
		} 
			$.ajax('findId.do',{
				type:'post',
				data:$('#findIdForm').serialize(),
				dataType:'text',
				success: function(result){
					if(result == 'false'){
						alert("해당되는 ID가 없습니다.");
					} else{
						alert("찾으신 ID:" + result);
					}
				},
				error: function(){
					alert("해당되는 ID가 없습니다.");
				}		
			});			
		
	});
	
	//비밀번호 찾기
	
	$("input:radio[name=checkBoxPwd]").change(function(){		
		var id = $(this).val();
		if(id =='pwdPhone'){
			let htmlTag = "";
			htmlTag += "<div class='input-area'>";
			htmlTag += "<label for='pwdPhone'>핸드폰 번호</label>";
			htmlTag += "<input type='text' class='form-control' id='pwdPhone' placeholder='하이폰을 제외한 핸드폰 번호를 입력해주세요.' name='phone' >";
			htmlTag += "<div class='valid-feedback'>확인</div>";
			htmlTag += "<div class='invalid-feedback'>올바른 핸드폰 번호를 입력해주세요.</div>";
			htmlTag += "</div>";
			$(".radiochange2").html(htmlTag);			
			
		} else if(id == 'pwdBirth'){
			let htmlTag = "";
			htmlTag += "<div class='input-area'>";
			htmlTag += "<label for='pwdBirth'>생년월일</label>";
			htmlTag += "<input type='date' class='form-control' id='pwdBirth' placeholder='생년월일을 입력해주세요.' name='birth' >";
			htmlTag += "<div class='valid-feedback'>확인</div>";
			htmlTag += "<div class='invalid-feedback'>올바른 생년월일을 입력해주세요.</div>";
			htmlTag += "</div>";
			
			$(".radiochange2").html(htmlTag);
			
		} else if(id == 'pwdEmail'){
			let htmlTag = "";
			htmlTag += "<div class='input-area'>";
			htmlTag += "<label for='pwdEmail'>이메일</label>";
			htmlTag += "<input type='email' class='form-control' id='pwdEmail' placeholder='이메일을 입력해주세요.' name='email' >";
			htmlTag += "<div class='valid-feedback'>확인</div>";
			htmlTag += "<div class='invalid-feedback'>올바른 이메일을 입력해주세요.</div>";
			htmlTag += "</div>";		
			$(".radiochange2").html(htmlTag);
		}
	});		
	
	//비밀번호) 전화번호 정규식
	$(document).on('keyup','#pwdPhone',function(){
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	}); 
	
	//비밀번호) ajax 처리하여 비밀번호 보여주기
	
	$(document).on('click','#findPwdBtn',function(){
		var check = $('input:radio[name=checkBoxPwd]:checked').val();		
		if($('#pwdId').val() ==''){
			$('#pwdId').addClass('is-invalid'); 
			$('#pwdId').removeClass('is-valid');
			$('#pwdId').focus();		
			return false;
		} else if($('#pwdName').val() == ''){
			$('#pwdName').addClass('is-invalid'); 
			$('#pwdName').removeClass('is-valid');
			$('#pwdName').focus();			
			return false;
		} else if(check == 'pwdBirth'){
				if($('#pwdBirth').val() == ''){
				$('#pwdBirth').addClass('is-invalid');
				$('#pwdBirth').removeClass('is-valid');
				$('#pwdBirth').focus();
				return false;
				}
		} else if(check == 'pwdPhone') {
			
			if($('#pwdPhone').val() == ''){
				$('#pwdPhone').addClass('is-invalid');
				$('#pwdPhone').removeClass('is-valid');
				$('#pwdPhone').focus();
				return false;
			}
		} else if(check == 'pwdEmail') {
			
			if($('#pwdEmail').val() == ''){
				$('#pwdEmail').addClass('is-invalid');
				$('#pwdEmail').removeClass('is-valid');
				$('#pwdEmail').focus();
				return false;
			}
		} 
			$.ajax('findPwd.do',{
				type:'post',
				data:$('#findPasswordForm').serialize(),
				dataType:'text',
				success: function(result){
					if(result == 'false'){
						alert("입력하신 정보를 확인해주세요.");
					} else{
						alert('찾으신 비밀번호:' + result);
					}
				},
				error: function(){
					alert("해당되는 정보가 없습니다.");
				}		
			});
	});	
});