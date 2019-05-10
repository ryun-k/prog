<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Home</title>
</head>
<body>
<form action="/iedu/airport.do" method="post">
	출발 : <input type="text" name="depAirportNm"><br/>
	도착 : <input type="text" name="arrAirportNm"><br/>
	가는날 : <input type="text" name="depPlandTime"><br/>
	오는날 : <input type="text" name="arrPlandTime"><br/>
	<input type="submit" value="확인">

</form>
</body>
</html>