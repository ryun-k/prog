<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α׾ƿ�</title>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>
</head>
<body>
<h1>�α׾ƿ�</h1>
<c:if test="${not empty sessionScope.UID}">
<input type = "button" id="logout" value="�α׾ƿ�">
</c:if>

<c:if test="${empty sessionScope.UID}">
<h2>�α׾ƿ� �Ǿ����ϴ�.</h2>
</c:if>

<br/>

<a href="#" onclick="signOut();">Sign out</a>
<a href="../"><button>���ΰ���</button></a>
</body>
</html>