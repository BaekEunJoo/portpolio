	function validateLogin(frm){
		console.log($(frm).serialize());
		$.ajax("login.do", {
			type:"post",
			data:$(frm).serialize(),
			dataType:"text",
			success: function(data){
			//로그인 성공 시
				if(data == 'true'){
					location.href="login.do";
				} else if(data ==' false'){
					alert('아이디와 비밀번호가 일치하지 않습니다.');					
				} else if(data == 'dismiss'){
					alert('탈퇴한 회원입니다. 관리자에게 문의해주세요');
				} else if(data == 'block'){
					alert('활동 정지된 회원입니다. 관리자에게 문의해주세요');
				}				
			},
			error: function(){
				alert("서버에 오류가 발생하였습니다.\n관리자에게 문의해주세요.");
			}
		});
	}
	
	function idcheck(){
		var id = $("#userId").val();
		console.log(id);
		$.ajax("idcheck.do",{
			type:"post",
			data:{id:id},
			success: function(result){
				if(id.length < 4){
					$('#userId').addClass('is-invalid');
					$('#userId').removeClass('is-valid');
					return false;
				}else {
					if(result == 'bad'){
						$('#userId').addClass('is-invalid');
						$('#userId').removeClass('is-valid');
						return false;
					} else{
						$('#userId').addClass('is-valid');
						$('#userId').removeClass('is-invalid');
						return true;
					}
				}
			},
			error: function(){
				alert("오류가 발생하였습니다.");
			}
		});
	}
	
	function pwdcheck(){
		if($('#userPw').val() != $('#userPw2').val()){
			//아닐 때
			if($('#userPw2').val() !=''){
				$('#userPw2').addClass('is-invalid');
				$('#userPw2').removeClass('is-valid');
				$('#userPw2').val('');
				$('#userPw2').focus();
			}
			//일치 할 때
		} else{
			$('#userPw2').addClass('is-valid');
			$('#userPw2').removeClass('is-invalid');
		}
	}
	
(function() {
	  "use strict";
	  window.addEventListener("load", function() {
	    var form = document.getElementById("needs-validation");
	    form.addEventListener("submit", function(event) {
	      if (form.checkValidity() == false) {
	        event.preventDefault();
	        event.stopPropagation();
	        form.classList.add("was-validated");
	      }
	      else{	    	  
				$.ajax("sign.do", {
					type:"post",
					data:$('#needs-validation').serialize(),
					dataType:"json",
					async : false,
					success: function(data){
						alert("회원 가입을 축하드립니다.");
						$('#signup').modal("hide"); //닫기 
					}
				});
	      } 
	    }, false);
	  }, false);
	}());	


