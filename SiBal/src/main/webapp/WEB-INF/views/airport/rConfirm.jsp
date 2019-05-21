<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	$(function(){
		$("#bBtn").click(function(){
			location.href = "../airport/airportForm2.do"
		});
	});

</script>
<title>Insert title here</title>
</head>
<body>
	<h1>예약내역</h1>
	&nbsp;
	<h2>가는날</h2>
	<div class="container">
		<table class="table table-dark">
			<thead align="center">
				<tr align="center">
					<th>번호</th>
					<th>항공사</th>
					<th>출발지</th>
					<th>출발시간</th>
					<th>도착지</th>
					<th>도착시간</th>
					<th>가격</th>
					<th>비행기</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="list" varStatus="status" items="${LIST}">
					<tr align="center" id="t${status.index}">
								<td>${status.count}</td>
								<td>${list.airlineNm}</td>
								<td>${list.depAirportNm}</td>
								<td>${list.depPlandTime}</td>
								<td>${list.arrAirportNm}</td>
								<td>${list.arrPlandTime}</td>
								<td>${list.economyCharge}원</td>
								<td>${list.vihicleId}
								</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<button type="button" id="bBtn">오는날 예약</button>
	<c:if test="${not empty LIST1}">
	<h2>오는날</h2>
	<div class="container">
		<table class="table table-dark">
			<thead align="center">
				<tr align="center">
					<th>번호</th>
					<th>항공사</th>
					<th>출발지</th>
					<th>출발시간</th>
					<th>도착지</th>
					<th>도착시간</th>
					<th>가격</th>
					<th>비행기</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="list1" varStatus="status" items="${LIST1}">
					<tr align="center" id="t${status.index}">
								<td>${status.count}</td>
								<td>${list1.airlineNm}</td>
								<td>${list1.depAirportNm}</td>
								<td>${list1.depPlandTime}</td>
								<td>${list1.arrAirportNm}</td>
								<td>${list1.arrPlandTime}</td>
								<td>${list1.economyCharge}원</td>
								<td>${list1.vihicleId}
								</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
</body>
</html>