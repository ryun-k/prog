<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="645231811798-k4jflp70j4nc4s9bfvr07u93tpogio97.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
    	alert('');
      console.log('User signed out.');
    });
  }
</script>
</head>
<body>
<h1>로그아웃</h1>
<c:if test="${not empty sessionScope.nick}">
<input type = "button" id="logout" value="로그아웃">
</c:if>

<c:if test="${empty sessionScope.nick}">
<h2>로그아웃 되었습니다.</h2>
</c:if>

<br/>

<a href="#" onclick='signOut();'>Sign out</a>
<a href="../"><button>메인가기</button></a>
</body>
</html>