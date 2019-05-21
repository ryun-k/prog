<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <style>
  #CKemail,#CKpw,#CKpw2,#CKname,#CKnick,#CKaddr,#CKphone {
  color:blue;
  }
  
  </style>
<script type="text/javascript">
$(document).ready(function(){
	//정규식
		//이메일
	var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
		//닉네임
	var reg1 = /^[\W-가-힣a-zA-Z0-9]{2,10}/;
	
		//패스워드
	var reg2 = /^[\W-가-힣a-zA-Z0-9]{4,20}/
	
		//이름
	var reg3 = /^[가-힣]{2,5}$/
	
		//휴대전화
	var reg4 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
	
	//변수선언
	var email = $("#email").val();
	var nick = $("#nick").val();
	//이메일검사.
		 $("#email").blur(function(){
				$.ajax({
					type:"POST",
					url:"../member/EmailCheck.do",
					data:{
						"email":$("#email").val(),
						"target":"email"
					},
					success:function(data){
						if($.trim(data)=='YES'){
							if($("#email").val()!=""){
								if(reg.test($("#email").val())==true){
									$("#CKemail").html("사용 가능합니다.");
								}else{
									$("#CKemail").html("형식에 맞지 않습니다.");
								$("#email").val("");
								$("#email").focus();
								}
							}
						}else{
							$("#CKemail").html("");
							if($("#email").val()!=""){
								if(reg.test($("#email").val())==false){
									$("#CKemail").html("형식에 맞지 않습니다.");
								}
								$("#CKemail").html("중복된 이메일 입니다.");
								$("#email").val("");
								$("#email").focus();
							}
						}
					}
				})
			}) 
		 
	//닉네임검사.
	 $("#nick").blur(function(){
				$.ajax({
					type:"POST",
					url:"../member/NickCheck.do",
					data:{
						"nick":$("#nick").val(),
						"target":"nick"
					},
					success:function(data){
						if($.trim(data)=='YES'){
							if($("#nick").val()!=""){
								if(reg1.test($("#nick").val())==true){
									$("#CKnick").html("사용가능한 닉네임 입니다.");
								}else{
									$("#CKnick").html("형식에 맞지 않습니다.");
								$("#nick").val("");
								$("#nick").focus();
								}
							}
						}else{
							if($("#nick").val()!=""){
								if(reg1.test($("#nick").val())==false){
									$("#CKnick").html("형식에 맞지 않습니다.");
								}
								$("#CKnick").html("중복된 닉네임 입니다.");
								$("#nick").val("");
								$("#nick").focus();
							}
						}
					}
				})
			}) 

	//패스워드 검사
	$("#pw").blur(function(){
		if($("#pw").val()!=""){
			if(reg2.test($("#pw").val())==false){
				$("#CKpw").html("형식에 맞지 않습니다.");
				$("#pw").val("");
				$("#pw").focus();
			}else{
				$("#CKpw").html("사용가능한 비밀번호입니다.");
			}
		}
	})
	
	//동일 패스워드 검사
	$("#pw2").blur(function(){
		if($("#pw2").val()!=""){
			if($("#pw").val()!=$("#pw2").val()){
				$("#CKpw2").html("패스워드가 서로 다릅니다.");
				$("#pw2").val("");
				$("#pw2").focus();
			}else{
				$("#CKpw2").html("비밀번호가 동일 합니다.");
			}
		}
	})
	
	//이름 검사
	$("#name").blur(function(){
		if($("#name").val()!=""){
			if(reg3.test($("#name").val())==false){
				$("#CKname").html("형식에 맞지 않습니다.");
				$("#name").val("");
				$("#name").focus();
			}else{
				$("#CKname").html("사용가능한 이름입니다.");
			}
		}
	})
	
	//휴대폰 번호 검사
	$("#phone").blur(function(){
		if($("#phone").val()!=""){
			if(reg4.test($("#phone").val())==false){
				$("#CKphone").html("형식에 맞지 않습니다.");
				$("#phone").val("");
				$("#phone").focus();
			}else{
				$("#CKphone").html("사용할 수 있는 번호입니다.");
			}
		}
	})
	//주소쓰기
	$("#map").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            $("#addr").val(addr+" "+data.buildingName+" ");
			$("#addr").focus();
           
        }
    }).open()
	})
	
	//카카오 로그인
			$("#kakao-login-btn").click(function(){
				Kakao.init('af6e8975be3fffc8d0f8d9b119294dea'); 
			    Kakao.Auth.loginForm({
			      
			      success: function(authObj) {
			    	  Kakao.API.request({
			    	       url: '/v1/user/me',
			    	       success: function(res) {
			    	            /*  console.log(res.id);
			    	             console.log(res.properties.nickname); 
			    	             console.log(res.kaccount_email);
			    	             console.log(res.kaccount_email_verified);
			    	             console.log(res.properties.profile_image);
			    	             console.log(res);
			    	             console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력 */
								
			    	             if(res.kaccount_email_verified){
				    	              var pw=res.id;
									  var email= res.kaccount_email;
									  var image= res.properties.profile_image;
									  var name= res.properties.nickname; 
									  var nick= name+authObj.access_token.slice(0,5);
									  
									  $("#Kemail").val(email);
									  $("#Kpw").val(pw);
									  $("#Knick").val(nick);
									  $("#Kname").val(name);
									  $("#Kkakao").val(pw);
									  
									  
									  if($("#Kemail").val()!="" && $("#Kpw").val()!=""){
										  $.ajax({
					    						type:"POST",
					    						url:"../member/CheckKakao.do",
					    						data:{
					    							"email":$("#Kemail").val(),
					    							"pw":$("#Kpw").val(),
					    							"nick":$("#Knick").val(),
					    							"name":$("#Kname").val(),
					    							"addr":$("#Kaddr").val(),
					    							"phone":$("#Kphone").val(),
					    							"kakao":$("#Kkakao").val()
					    						},
					    						success:function(data){
					    							if($.trim(data)=='YES'){
					    								alert('이미 가입된 아이디 입니다.');
					    							}
					    							else{
					    								alert('가입 되었습니다.')
					    								$(location).attr("href","../member/loginForm.do");
					    							}
					    						}
					    					})
									  }else{
										  alert('오류발생');
									  }
								}else{
									alert('귀하의 카카오 계정의 이메일은 본인확인이 필요합니다.')
							   }
			    	        }
			    	   })
			      },
			      fail: function(err) {
			         alert('로그인이 실패 되었습니다.');
			      }
			    })
			    })
	//취소버튼
	$("#cBtn").click(function(){
		$(location).attr("href","/sb");
	})

});
</script>

</head>
<body>
<div class="container">
<h1>회원가입</h1>
<hr/>
<form id = "signUp" method="post" action="../member/signUpProc.do" class="was-validated" encType="utf-8" >
<div class="form-group">
  <label for="uname">email</label>
	<input type="email" id="email" class="form-control" name="email" placeholder="이메일을 입력해주세요." required="required" maxlength="20"
	title="이메일은 반드시 입력하셔야 합니다." pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"> 
	<div id=CKemail><br/></div>


	<label for="pwd">password</label>
	 <input type="password" id="pw" class="form-control" name="pw"  placeholder="비밀번호를 입력해주세요.(4~20)" required="required" title="비밀번호를  입력해주세요"
	 pattern="^[\W-가-힣a-zA-Z0-9]{4,20}" maxlength="20"> 
	<div id=CKpw><br/></div>
	
	<label for="pwd2">password재입력</label>
	<input type="password" id="pw2" class="form-control" required="required"  placeholder="비밀번호를 똑같이 입력해주세요.(4~20)" title="비밀번호를  다시 입력해주세요"
	 pattern="^[\W-가-힣a-zA-Z0-9]{4,20}" maxlength="20">
	<div id=CKpw2><br/></div>
	
	<label for="name">이름 </label>
	<input type="text" id="name" class="form-control" name="name"  placeholder="이름을  입력해주세요." required="required" title="이름을  입력해주세요"
	pattern="^[가-힣]{2,5}$" maxlength="5">
	<div id=CKname><br/></div>
	
	
	<label for="nick">닉네임 </label>
	<input type="text" id="nick" class="form-control" name="nick"  placeholder="닉네임을  입력해주세요.(2~10)" required="required" title="닉네임을  입력해주세요"
	pattern="^[\W-가-힣a-zA-Z0-9]{2,10}" maxlength="10">
	<div id=CKnick><br/></div>

	<label for="addr">주소</label><br/><input type="button" id="map" name="map" value="주소입력">
	<input type="text" id="addr" class="form-control" name="addr"  placeholder="주소를 입력해주세요." title="선택사항입니다." maxlength="100">
	<div id=CKaddr><br/></div>
	
	<label for="addr">휴대폰 번호</label>
	<input type="text" id="phone" class="form-control" name="phone"  placeholder="휴대폰 번호를 입력해주세요." title="선택사항입니다."
	pattern="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$"> 
	<div id=CKphone><br/></div>
	
	<input type="hidden" id="kakao" name="kakao" value="code">

<hr/>
</div>
<div class = "row">
<div class = "col-2">
<input type="button" class="btn btn-warning" id="kakao-login-btn" value="카카오계정으로가입">
</div>
<div class ="col-8"></div>
<div class = "col-2">
<input type="submit" class="btn btn-primary" id="ssBtn" value="가입하기">
<input type="button" class="btn btn-outline-danger" id="cBtn" value="취소">

</div>
</div>
</form>

<form id="kakaoSignup" method="post" action="../member/CheckKakao.do">
	<input type="hidden" id="Kemail" name="email">
	<input type="hidden" id="Kpw" name="pw">
	<input type="hidden" id="Knick" name="nick">
	<input type="hidden" id="Kname" name="name">
	<input type="hidden" id="Kkakao" name="kakao">
	<input type="hidden" id="Kaddr" name="addr" value="미기입">
	<input type="hidden" id="Kphone" name="phone" >
	</form>
</div>
</body>
</html>