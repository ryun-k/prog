<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("input.btn").click(function() {
			var formObj=this.form;
			$(this.form).submit();
			//alert(  this.value );
			//$(this).value='t${status.count}';
		})
	});
</script>
<title>Home</title>
</head>
<body>
	<h1 align="center">가는날</h1>
	&nbsp;

	<div class="container">
		<table class="table table-dark">
			<thead align="center">
				<tr align="center">
					<th>번호</th>
					<th>항공사</th>
					<th>출발지</th>
					<!-- <th>출발시간</th> -->
					<th>도착지</th>
					<!-- <th>도착시간</th> -->
					<th>가격</th>
					<th>비행기</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="item" varStatus="status" items="${go}">
					<tr align="center" id="t${status.count}">
						<c:choose>
							<c:when test="${item.economyCharge!=0}">
								<td>${status.count}</td>
								<td>${item.airlineNm}</td>
								<td>${item.depAirportNm}</td>
								<%-- <td>${item.depPlandTime}</td> --%>
								<td>${item.arrAirportNm}</td>
								<%-- <td>${item.arrPlandTime}</td> --%>
								<td>${item.economyCharge}원</td>
								<td>${item.vihicleId}
								<td><form id="info${status.count}" method="GET" action="../airport/rProc.do">
									<input type="hidden" name="airlineNm" value="${item.airlineNm}" />
									<input type="hidden" name="depAirportNm" value="${item.depAirportNm}" /> 
										<input type="hidden" name="arrAirportNm" value="${item.arrAirportNm}" /> 
										<input type="hidden" name="economyCharge" value="${item.economyCharge}" /> 
										<input type="hidden" name="vihicleId" value="${item.vihicleId}" />
									<input type="button" class="btn btn-secondary"  value="예매"/> <!-- <input type="button" class="reserve" value="예매"/> -->
									<%-- <button class="reserve">예매</button> <!-- <input type="button" class="reserve" value="예매"/> -->--%>
								</form>
								</td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<h1 align="center">오는날</h1>
	&nbsp;

	<div class="container">
		<table class="table table-dark">
			<thead align="center">
				<tr align="center">
					<th>번호</th>
					<th>항공사</th>
					<th>출발지</th>
					<th>도착지</th>
					<th>가격</th>
					<th>비행기</th>
				</tr>
			</thead>
			<c:forEach var="item" varStatus="status" items="${back}">
				<tr align="center" id="t${status.count}">
						<c:choose>
							<c:when test="${item.economyCharge!=0}">
								<td>${status.count}</td>
								<td>${item.airlineNm}</td>
								<td>${item.depAirportNm}</td>
								<%-- <td>${item.depPlandTime}</td> --%>
								<td>${item.arrAirportNm}</td>
								<%-- <td>${item.arrPlandTime}</td> --%>
								<td>${item.economyCharge}원</td>
								<td>${item.vihicleId}
								<td><form id="info${status.count}" method="GET" action="../airport/rProc.do">
									<input type="hidden" name="airlineNm" value="${item.airlineNm}" />
									<input type="hidden" name="depAirportNm" value="${item.depAirportNm}" /> 
										<input type="hidden" name="arrAirportNm" value="${item.arrAirportNm}" /> 
										<input type="hidden" name="economyCharge" value="${item.economyCharge}" /> 
										<input type="hidden" name="vihicleId" value="${item.vihicleId}" />
									<input type="button" class="btn btn-secondary"  value="예매"/> <!-- <input type="button" class="reserve" value="예매"/> -->
									<%-- <button class="reserve">예매</button> <!-- <input type="button" class="reserve" value="예매"/> -->--%>
								</form>
								</td>
							</c:when>
						</c:choose>
					</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<a href='/sb//airport/airportForm.do'>돌아가기</a>
</body>
</html>
<%-- 	항공사 : ${item.airlineNm}<br> --%>
<%-- 	출발지 : ${item.depAirportNm}<br> --%>
<%-- 	출발시간 : ${item.depPlandTime}<br> --%>
<%-- 	도착지 : ${item.arrAirportNm}<br> --%>
<%-- 	도착시간 : ${item.arrPlandTime}<br> --%>
<%-- 	가격 : ${item.economyCharge}<br> --%>
<%-- 	비즈니스석 수수료 : ${item.prestigeCharge}<br> --%>
<%-- 	비행기번호 : ${item.vihicleId}<br> --%>