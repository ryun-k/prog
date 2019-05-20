<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
Client ID
645231811798-k4jflp70j4nc4s9bfvr07u93tpogio97.apps.googleusercontent.com

Client Secret
w7hqPZTNwCeqHJZkw4qaCwMz 
-->
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>로그인폼</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


	<!-- <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="645231811798-k4jflp70j4nc4s9bfvr07u93tpogio97.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script> -->
    <script>
		$(document).ready(function(){
			//로그인시 이메일,비번 확인
			$("#lBtn").click(function(){
				$.ajax({
					type:"POST",
					url:"../member/CheckProc.do",
					data:{
						"email":$("#email").val(),
						"pw":$("#pw").val()
					},
					success:function(data){
						if($.trim(data)=='YES1'){
							$(location).attr("href","../");
						}else if($.trim(data)=='YES2'){
							$(location).attr("href","../member/withDraw.do");
						}
						else{
							alert('이메일과 비밀번호가 올바르지 않습니다.');
							$("#pw").val("");
							$("#pw").focus();
						}
					}
				})
			})
		
			
			//비번 찾기시 프롬프트창 열기. 이메일 입력받고 확인후 코드전송함.
			$("#fBtn").click(function(){
				var email = prompt("가입하신 이메일을 입력하세요");
				$("#email1").val(email);
				$("#codeForm").submit();
			});
			
			//메인가기 버튼
			$("#cBtn").click(function(){
				$(location).attr("href","../");
			})
			
			//회원가입 버튼
			$("#sBtn").click(function(){
				$(location).attr("href","../member/signUp.do");
			})
			
			//카카오 로그인
			$("#kakao-login-btn").click(function(){
				Kakao.init('af6e8975be3fffc8d0f8d9b119294dea'); 
			    Kakao.Auth.loginForm({
			      
			      success: function(authObj) {
			    	  Kakao.API.request({
			    	       url: '/v1/user/me',
			    	       success: function(res) {
								
			    	    	   if(res.kaccount_email_verified){
				    	              var kakao=res.id;
									  var email= res.kaccount_email;
									  
									  
									  $("#Kemail").val(email);
									  $("#Kkakao").val(kakao);
									 
									 
									  if($("#Kemail").val()!="" && $("#Kkakao").val()!=""){
										 
												$.ajax({
													type:"POST",
													url:"../member/KakaoLogin.do",
													data:{
														"email":$("#Kemail").val(),
														"kakao":$("#Kkakao").val()
													},
													success:function(data){
														if($.trim(data)=='YES1'){
															$(location).attr("href","../");
														}else if($.trim(data)=='YES2'){
															$(location).attr("href","../member/withDraw.do");
														}
														else{
															alert('카카오계정으로 가입을 먼저 해주세요');
															$(location).attr("hreg","../member/signUp.do");
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
			    });
			  //카카오 로그아웃
			  
			})
			/* //구글로그인
			$("#gBtn").click(function(){
				function onSignIn(googleUser) {
					  // Useful data for your client-side scripts:
					  var profile = googleUser.getBasicProfile(){
					  console.log("ID: " + profile.getId()); // Don't send this directly to your server!
					  console.log('Full Name: ' + profile.getName());
					  console.log('Given Name: ' + profile.getGivenName());
					  console.log('Family Name: ' + profile.getFamilyName());
					  console.log("Image URL: " + profile.getImageUrl());
					  console.log("Email: " + profile.getEmail());
					  
					 // The ID token you need to pass to your backend:
					  var id_token = googleUser.getAuthResponse().id_token;
					  console.log("ID Token: " + id_token);
					  var email=profile.getEmail();
					  var name= profile.getName();
					  var image= profile.getImageUrl();
					  var id= profile.getId(); 
						document.getElementById('google').innerHTML=email+'<p/>'+name+id+
						'<p/>'+'<img src="'+image+'">';
					  }
					}
			}) */
			
		});
		</script>
<!--  	<script>
function onSignIn(googleUser) {
  // Useful data for your client-side scripts:
  var profile = googleUser.getBasicProfile(){
  console.log("ID: " + profile.getId()); // Don't send this directly to your server!
  console.log('Full Name: ' + profile.getName());
  console.log('Given Name: ' + profile.getGivenName());
  console.log('Family Name: ' + profile.getFamilyName());
  console.log("Image URL: " + profile.getImageUrl());
  console.log("Email: " + profile.getEmail());
  }
 // The ID token you need to pass to your backend:
  var id_token = googleUser.getAuthResponse().id_token;
  console.log("ID Token: " + id_token);
  var email=profile.getEmail();
  var name= profile.getName();
  var image= profile.getImageUrl();
  var id= profile.getId(); 
	document.getElementById('google').innerHTML=email+'<p/>'+name+id+
	'<p/>'+'<img src="'+image+'">';
  
}
	</script>   --> 
</head>
<body>
<div class="container">

	<form method="POST" id="loginForm" action="../member/loginProc.do" class="was-validated">
	<div class="form-group">
			
				<label for="uname">이메일</label>
				<input type="email" class="form-control" placeholder="이메일을 입력하세요" name="email" id="email"  required="required">
				<div class="valid-feedback"></div>
			   </div>
			    <div class="form-group">
				 <label for="pwd">비밀번호</label>
				<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="pw" id="pw"  required="required">
				<div class="valid-feedback"></div>
				</div>
				<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<input type="button" class="btn btn-primary" id="lBtn" value="Login">
					<input type="button" class="btn btn-primary" id="sBtn" value="회원가입">
				</div>
				</div>
				<hr/>
				<div class="row">
				<div class="col-8"></div>
				<div class="col-4">
					<input type="button" class="btn btn-primary" id="kakao-login-btn" value="카카오로그인">
					<input type="button" class="btn btn-primary" id="fBtn" value="비밀번호 찾기">
					<input type="button" class="btn btn-primary" id="cBtn" value="메인가기">
					<!-- <input type="button" class="btn btn-primary" id="gBtn" value="구글로그인"> -->
				</div>	
				</div>




	
	</form>

	<br/>

	<form id="codeForm" method="post" action="checkEmail.do">
	<input type="hidden" id="email1" name="email">
	</form>
	
	<form id="kakaoLogin" method="post" >
	<input type="hidden" id="Kemail" name="email">
	<input type="hidden" id="Kkakao" name="kakao">
	
	</form>
</div>
</body>
</html>
