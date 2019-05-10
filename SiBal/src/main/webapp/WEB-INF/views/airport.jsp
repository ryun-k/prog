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
<h1>가는날</h1>
<c:forEach var="item" items="${go}">
	항공사 : ${item.airlineNm}<br>
	출발지 : ${item.depAirportNm}<br>
	출발시간 : ${item.depPlandTime}<br>
	도착지 : ${item.arrAirportNm}<br>
	도착시간 : ${item.arrPlandTime}<br>
	가격 : ${item.economyCharge}<br>
	비즈니스석 수수료 : ${item.prestigeCharge}<br>
	비행기번호 : ${item.vihicleId}<br>
	<br>
</c:forEach>
<br>
<h1>오는날</h1>
<c:forEach var="item" items="${back}">
	항공사 : ${item.airlineNm}<br>
	출발지 : ${item.depAirportNm}<br>
	출발시간 : ${item.depPlandTime}<br>
	도착지 : ${item.arrAirportNm}<br>
	도착시간 : ${item.arrPlandTime}<br>
	가격 : ${item.economyCharge}<br>
	비즈니스석 수수료 : ${item.prestigeCharge}<br>
	비행기번호 : ${item.vihicleId}<br>
	<br>
</c:forEach>
<br>
<a href='/iedu/airportForm.do'>돌아가기</a>
</body>
</html>