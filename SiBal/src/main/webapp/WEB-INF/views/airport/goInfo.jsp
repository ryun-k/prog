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
		$(".gobtn").click(function() {
		alert("클릭")
			
			var formObj=this.form;
		  $(this.form).submit();
		})
		
	});
</script>
<title>가는날</title>
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
			<tr align="center" id="t${status.index}">
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
						<td><form class="info${status.index}" method="GET" action="../airport/goProc.do">
						   <input type="text" name="go${status.index}" value="go" hidden="hidden">
							<input type="hidden" name="airlineNm" value="${item.airlineNm}" />
							<input type="hidden" name="depAirportNm" value="${item.depAirportNm}" /> 
					 		<input type="hidden" name="arrAirportNm" value="${item.arrAirportNm}" /> 
							<input type="hidden" name="economyCharge" value="${item.economyCharge}" /> 
							<input type="hidden" name="vihicleId" value="${item.vihicleId}" />
							<input type="button" class="btn btn-secondary gobtn"  value="예매"/> <!-- <input type="button" class="reserve" value="예매"/> -->
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
</body>
</html>