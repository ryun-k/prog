<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그아웃</title>
</head>
<body>
<h1>로그아웃</h1>
<c:if test="${not empty sessionScope.UID}">
<input type = "button" id="logout" value="로그아웃">
</c:if>

<c:if test="${empty sessionScope.UID}">
<h2>로그아웃 되었습니다.</h2>
</c:if>

<br/>
<a href="../"><button>메인가기</button></a>
</body>
</html>