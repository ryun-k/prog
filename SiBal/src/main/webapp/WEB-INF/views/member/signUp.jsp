<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 
Client ID
645231811798-k4jflp70j4nc4s9bfvr07u93tpogio97.apps.googleusercontent.com

Client Secret
w7hqPZTNwCeqHJZkw4qaCwMz 
-->
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="645231811798-k4jflp70j4nc4s9bfvr07u93tpogio97.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<meta charset="utf-8">
<title>Insert title here</title>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
function onSignIn(googleUser) {
  // Useful data for your client-side scripts:
  var profile = googleUser.getBasicProfile();
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
$(document).ready(function(){
}

</script> 

</head>
<body>
<h1>회원가입</h1>
<form id = "signUp" method="post" action="../member/signUpProc1.do" encType="utf-8" align="center">
<table width="500" border="1" align="center">
<tr>
	<td>email</td> 
	<td><input type="email" id="email" name="email" required="required" maxlength="20"
	title="이메일은 반드시 입력하셔야 합니다." pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"> </td>
</tr>


<tr>
	<td>password</td>
	<td> <input type="password" id="pw" name="pw" required="required" title="비밀번호를  입력해주세요"
	 pattern=".{4,20}" maxlength="20"> </td>
</tr>
<tr>
	<td>password재입력</td> 
	<td><input type="password" id="pw2" required="required" title="비밀번호를  다시 입력해주세요"
	 pattern=".{4,20}" maxlength="20"></td>
</tr>
<tr>
	<td>이름 </td>
	<td><input type="text" id="name" name="name" required="required" title="이름을  입력해주세요"
	pattern=".{2,5}" maxlength="5"></td>
</tr>
<tr>
	<td>닉네임 </td>
	<td><input type="text" id="nick" name="nick" required="required" title="닉네임을  입력해주세요"
	pattern=".{2,10}" maxlength="10"></td>
</tr>
<tr>
	<td>주소</td> 
	<td><input type="text" id="add" name="addr" title="선택사항입니다." ></td>
</tr>
<tr>
	<td>전화번호</td> 
	<td><input type="text" id="phone" name="phone" title="선택사항입니다."> </td>
</tr>


</table>

<br/>
<input type="submit" id="ssBtn" value="가입하기">
</form>

<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
<div id='google'></div>

<input type='button' id='info' value='정보보기'>
</body>
</html>