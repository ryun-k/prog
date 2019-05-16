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
	<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="645231811798-k4jflp70j4nc4s9bfvr07u93tpogio97.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script>
		$(document).ready(function(){
			$("#lBtn").click(function(){
				//무결성검사
				if($("#email").val()==0 || $("#pw").val()==0){
					alert("이메일과 비밀번호를 입력하세요");
				}else{
				$("#loginForm").submit();
			}
			});
			//비번 찾기시 프롬프트창 열기. 이메일 입력받고 확인후 코드전송함.
			$("#fBtn").click(function(){
				var email = prompt("가입하신 이메일을 입력하세요");
				$("#email1").val(email);
				$("#codeForm").submit();
			});
		});
		</script>
<!-- 		<script>
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
	</script>  -->
</head>
<body>
<%
		//세션에서 데이터 꺼내보자
		//왜? 로그인 했는지 안했는지의 차이는 세션에  (특정)데이터가 있고 없고의 차이니까..
	  String nick = (String)session.getAttribute("nick");
	  if(nick==null||nick.length()==0){ 
	%>
			<%-- 로그인 안 했다면 	로그인폼  --%>
	<form method="POST" id="loginForm" action="../member/loginProc.do">
		<table width="500" border="1" align="center">
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email" id="email" required="required"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" id="pw" required="required"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" id="lBtn" value="Login">
					<input type="button" id="fBtn" value="비밀번호 찾기">
				</td>
			</tr>
		</table>
	</form>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
	<div id='google'></div>
	<br/>
	
	<% 
		}else{  
	%>
			<%-- 로그인    했다면 	출력  --%>
			<table width="400" border="1" align="center">
				<tr>
					<td><%= nick %>님 접속중</td>
				</tr>
				<tr>
					<td>
					<!-- <a href="../member/logout.jsp">로그아웃</a>
					&nbsp;-->
					<a href="../index.jsp">메인대문</a>
					</td>
				</tr>
			</table>
	<%	  
	  }
	%>	
	<form id="codeForm" method="post" action="checkEmail.do">
	<input type="hidden" id="email1" name="email">
	</form>
	${MSG}
</body>
</html>
