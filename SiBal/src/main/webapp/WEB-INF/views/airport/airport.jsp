<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
   /* div {
        width: 100%;
        height: 300px;
    }
    div.left {
        width: 50%;
        float: left;
        box-sizing: border-box;
    }
    div.right {
        width: 50%;
        float: right;
        box-sizing: border-box;
    }
    div.bottom {
        width: 50%;
        float: bottom;
        box-sizing: border-box;
    }*/
    </style>
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
		//$(".gobtn").click(function() {
			//var formObj=this.form;
			//alert(formObj);
			//console.log(formObj);
			//$("#input").val(formObj);
			//$(this.form).submit();
			//alert(  this.value );
			//$(this).value='t${status.count}';
		//})
		$(".checkGo").on("click", function(){
			var ss = $("input:checkbox[name='go']:checked").val();
			alert(ss)
			console.log(ss)
		})
		
		
		$(".backbtn").click(function() {
			var formObj=this.form;
			formObj.submit();
		})
		
		
		
		
	});
	
	
</script>

<title>Home</title>
</head>
<body>


	<div class="container left">
		<h1 align="center">가는날</h1>
		&nbsp;
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
								<td>${item.vihicleId}</td>
								<td><form id="goFrm${status.index}" name="" method="GET" action="../airport/goProc.do">
									<input type="hidden" name="airlineNm" value="${item.airlineNm}" />
									<input type="hidden" name="depAirportNm" value="${item.depAirportNm}" /> 
									<input type="hidden" name="arrAirportNm" value="${item.arrAirportNm}" /> 
									<input type="hidden" name="economyCharge" value="${item.economyCharge}" /> 
									<input type="hidden" name="vihicleId" value="${item.vihicleId}" />
									<%--<input type="checkbox" class="gobtn" name="go" value="선택${status.index}"/> --%>
									<input type="checkbox" class='checkGo' name="go" value="${status.index}"/>
								</form>
								</td>
									<%-- <button class="reserve">예매</button> <!-- <input type="button" class="reserve" value="예매"/> -->--%>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	

	<div class="container right">
	<h1 align="center">오는날</h1>
	&nbsp;
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
				<tr align="center" id="t${status.index}">
						<c:choose>
							<c:when test="${item.economyCharge!=0}">
								<td>${status.count}</td>
								<td>${item.airlineNm}</td>
								<td>${item.depAirportNm}</td>
								<td>${item.arrAirportNm}</td>
								<td>${item.economyCharge}원</td>
								<td>${item.vihicleId}</td>
								<td><form id="info${status.index}" method="GET" action="../airport/backProc.do">
									<input type="hidden" name="airlineNm" value="${item.airlineNm}" />
									<input type="hidden" name="depAirportNm" value="${item.depAirportNm}" /> 
									<input type="hidden" name="arrAirportNm" value="${item.arrAirportNm}" /> 
									<input type="hidden" name="economyCharge" value="${item.economyCharge}" /> 
									<input type="hidden" name="vihicleId" value="${item.vihicleId}" />
									<input type="button" class="btn btn-secondary backbtn"  value="선택"/> <!-- <input type="button" class="reserve" value="예매"/> -->
									<%-- <button class="reserve">예매</button> <!-- <input type="button" class="reserve" value="예매"/> -->--%>
								</form>
								</td>
							</c:when>
						</c:choose>
					</tr>
			</c:forEach>
		</table>
	</div>
	
	<h1 align="center">예매확인</h1>
	<div class="container bottom">
	<%-- 예매확인용 --%>
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
			<tbody align="center">
			<tr>
								<form id="goFrm" name="" method="GET" action="../airport/goProc.do">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
									
							</form>
								
					</tr>
			</tbody>
		</table>
	</div>
	<button id="check">확인용</button>
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