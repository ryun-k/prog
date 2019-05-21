<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<style>
body {
  background-image:url("https://cdn.pixabay.com/photo/2016/11/18/07/46/cozy-seopji-1833560_960_720.jpg");
  background-size: cover;
}
</style>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$(".gobtn").click(function() {
			//var formObj = this.form;
			$(this.form).submit();
		})

	});
</script>
<title>가는날</title>
</head>
<body>

	&nbsp;
	<div class="container">
	<div class="card border-0 shadow my-5">
	<div class="card-body p-5">
	
	<h1 align="center">가는날</h1>
	&nbsp;
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
				<c:forEach var="item" varStatus="status" items="${go}">
					<tr align="center" id="t${status.index}">
						<c:choose>
							<c:when test="${item.economyCharge!=0}">
								<td>${status.count}</td>
								<td>${item.airlineNm}</td>
								<td>${item.depAirportNm}</td>
								<td>${item.depPlandTime2}</td>
								<td>${item.arrAirportNm}</td>
								<td>${item.arrPlandTime2}</td>
								<td>${item.economyCharge}원</td>
								<td>${item.vihicleId}
								<td><form class="info${status.index}" method="GET"
										action="../airport/pgoProc.do">
										<input type="text" name="go${status.index}" value="go"
											hidden="hidden"> 
											<input type="hidden" name="airlineNm" value="${item.airlineNm}" /> 
											<input type="hidden" name="depAirportNm" value="${item.depAirportNm}" /> 
											<input type="hidden" name="depPlandTime" value="${item.depPlandTime2}" /> 
											<input type="hidden" name="arrAirportNm" value="${item.arrAirportNm}" /> 
											<input type="hidden" name="arrPlandTime" value="${item.arrPlandTime2}" /> 
											<input type="hidden" name="economyCharge" value="${item.economyCharge}" /> 
											<input type="hidden" name="vihicleId" value="${item.vihicleId}" /> 
											<input type="button" class="btn btn-secondary gobtn" value="예매" />
									</form></td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</div>
</body>
</html>