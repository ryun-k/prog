<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<meta charset="EUC-KR">
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

$(document).ready(function(){
	$("#sBtn").click(function(){
		$("#signUp").submit();
	});

});
</script> 

</head>
<body>
<h1>회원가입</h1>
<form id = "signUp" method="post" action="../member/signUpProc.do" encType="utf-8">
<table width="600" >
<tr>
	<td>
	id <input type="text" id="id" name="id"> 
	</td>
</tr>
<tr>
	<td>
	password <input type="password" id="pw" name="pw"> 
	</td>
</tr>
<!-- <tr>
	<td>
	password재입력 <input type="password" id="pw2"> 
	</td>
</tr> -->
<tr>
	<td>
	닉네임 <input type="nick" id="nick" name="nick"> 
	</td>
</tr>


</table>

<br/>
<input type="button" id="sBtn" value="가입하기">
</form>

<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
<div id='google'></div>

<input type='button' id='info' value='정보보기'>
</body>
</html>