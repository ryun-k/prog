<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
	body {
  	background-image:url("https://cdn.pixabay.com/photo/2016/11/18/07/46/cozy-seopji-1833560_960_720.jpg");
  	background-size: cover;
			}
	.container {
  padding-right: 1px;
  padding-left: 1px;
  margin-right: auto;
  margin-left: auto;
}

출처: https://dgkim5360.tistory.com/entry/bootstrap-adjust-container-width [개발새발로그]
</style>
<script type="text/javascript">
	$(function(){
		$("#bBtn").click(function(){
			location.href = "../airport/airportForm2.do"
		});
		
		$(".calChk").click(function(){
			var value = $(".calChk").val();
			no = this.value;
			alert(no);
		});
	});
	
	$(document).ready(function() {
		$(".gdelbtn").click(function() {
			alert("예매취소되었습니다.")
			$(this.form).submit();
		})
		
		$(".bdelbtn").click(function() {
			alert("예매취소되었습니다.")
			$(this.form).submit();
		})
		
		$(".gcal").click(function() {
			alert("결제가 완료되었습니다.")
			$(this.form).submit();
		})
		
		$(".bcal").click(function() {
			alert("결제가 완료되었습니다.")
			$(this.form).submit();
		})

	});
</script>
<title>Insert title here</title>
</head>
<body>
&nbsp;
	
	<c:if test="${not empty LIST}">
	<h1 align="center">예약내역</h1>
	<div class="container">
	<div class="card border- shadow my-5">
	<div class="card-body p-2">
	<h2 align="center">가는날</h2>
	&nbsp;
		<table class="table table-dark">
			<thead align="center">
				<tr align="center">
					<th>항공사</th>
					<th>출발지</th>
					<th>출발시간</th>
					<th>도착지</th>
					<th>도착시간</th>
					<th>가격</th>
					<th>비행기</th>
					<th>결제여부</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach var="list" varStatus="status" items="${LIST}">
								<input type="hidden" value="${list.no}" />
					<tr align="center" id="t${status.index}">
								<td>${list.airlineNm}</td>
								<td>${list.depAirportNm}</td>
								<td>${list.depPlandTime}</td>
								<td>${list.arrAirportNm}</td>
								<td>${list.arrPlandTime}</td>
								<td>${list.economyCharge}원</td>
								<td>${list.vihicleId}</td>
								<c:choose>
								<c:when test="${list.cal eq 1}">
								<td>미결제</td>
								</c:when>
								<c:when test="${list.cal eq 2}">
								<td>결제완료</td>
								</c:when>
								</c:choose>
								<td>
								<form class="info${status.index}" method="GET" action="../airport/gCal.do">
								 <input type="hidden" name="no" value="${list.no}" /> 
								 <input type="button" class="btn btn-secondary gcal" value="결제" />
								 </form>
								</td>
								<td>
								 <form class="info${status.index}" method="GET" action="../airport/gDelete.do">
								 <input type="text" name="go${status.index}" value="go" hidden="hidden"> 
								 <input type="hidden" name="no" value="${list.no}" /> 
								 <input type="button" class="btn btn-secondary gdelbtn" value="예매취소" />
								 </form>
								</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	</div>
	</c:if>
	
	<c:if test="${not empty LIST1}">
	<div class="container">
	<div class="card border-0 shadow my-5">
	<div class="card-body p-2">
	<h2 align="center">오는날</h2>
	&nbsp;
		<table class="table table-dark">
			<thead align="center">
				<tr align="center">
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
				<input type="hidden" value="${list1.no}" />
					<tr align="center" id="t${status.index}">
								<td>${list1.airlineNm}</td>
								<td>${list1.depAirportNm}</td>
								<td>${list1.depPlandTime}</td>
								<td>${list1.arrAirportNm}</td>
								<td>${list1.arrPlandTime}</td>
								<td>${list1.economyCharge}원</td>
								<td>${list1.vihicleId}</td>
								<c:choose>
								<c:when test="${list1.cal eq 1}">
								<td>미결제</td>
								</c:when>
								<c:when test="${list1.cal eq 2}">
								<td>결제완료</td>
								</c:when>
								</c:choose>
								<td>
								<form class="info${status.index}" method="GET" action="../airport/bCal.do">
								 <input type="hidden" name="no" value="${list1.no}" /> 
								 <input type="button" class="btn btn-secondary bcal" value="결제" />
								 </form>
								</td>
								<td><form class="info${status.index}" method="GET" action="../airport/bDelete.do">
									<input type="text" name="go${status.index}" value="go" hidden="hidden"> 
									<input type="hidden" name="no" value="${list1.no}" /> 
									<input type="button" class="btn btn-secondary bdelbtn" value="예매취소" />
								</form>
								</td>			
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
	</div>
	</c:if>
	<div align="center">
	<c:if test="${empty LIST1}">
	<button type="button" class="btn btn-secondary" id="bBtn">오는날 예약</button>
	</c:if>
	</div>
</body>
</html>