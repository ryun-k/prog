<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α׾ƿ�</title>
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
<a href="../"><button>���ΰ���</button></a>
</body>
</html>