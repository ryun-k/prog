<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>View</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <script type="text/javascript">
  	$(function(){
  		$("#listback").click(function(){
  			location.href="../admin/list.do?no=${no}&nowPage=${nowPage}";
  		});
  		
  	});
  	
  </script>
</head>
<body>
<div class="container">
  <h2 align="center">${VIEW.name}의 회원정보</h2>
  <form class="form-horizontal row" method="post" action="../admin/modify.do" >
  	<input type="hidden" name="no" value="${no}"/>
  	<input type="hidden" name="nowPage" value="${nowPage}"/> 
    <div class="form-group col-12">
      <label class="control-label" for="no">회원번호:</label>
      <div class="col-12">
        <input type="text" class="form-control" id="no" name="no" value="${VIEW.no}" readonly="readonly">
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-labe" for="email">이메일(아이디):</label>
      <div class="col-12">
        <input type="text" class="form-control" id="email" name="email" value="${VIEW.email}" readonly="readonly">
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="name">이름:</label>
      <div class="col-12">
        <input type="text" class="form-control" id="name" name="name" value="${VIEW.name}" readonly="readonly">
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="nick">닉네임:</label>
      <div class="col-12">
        <input type="text" class="form-control" id="nick" name="nick" value="${VIEW.nick}" readonly="readonly">
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="address">주소:</label>
      <div class="col-12">
        <input type="text" class="form-control" id="address" name="address" value="${VIEW.address}" readonly="readonly">
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="phone">전화번호:</label>
      <div class="col-12">
        <input type="text" class="form-control" id="phone" name="phone" value="${VIEW.phone}" readonly="readonly">
      </div>
    </div>
<div class="col-12">
	<label class="control-label" >항공권 예매내역:</label>
	<table class="table table-bordered">
		<thead >
			<tr >
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
		<tbody>
			<c:forEach var="list" items="${ALIST}">
				<tr>
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
				</tr>
			</c:forEach>
		</tbody>
		<tbody>
			<c:forEach var="list" items="${BLIST}">
				<tr>
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
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
    
    <div class="form-group col-12">
      <label class="control-label" for="stat">회원등급:</label>
      <div class="col-12">
      	<c:choose>
      		<c:when test="${VIEW.stat eq 0}">
		        <input type="hidden" class="form-control" id="stat" name="stat" value="0" readonly="readonly">
		        <input type="text" class="form-control" value="탈퇴회원" readonly="readonly">
      		</c:when>
      		<c:when test="${VIEW.stat eq 1}">
		        <input type="hidden" class="form-control" id="stat" name="stat" value="1" readonly="readonly">
		        <input type="text" class="form-control" value="일반회원" readonly="readonly">
      		</c:when>
      		<c:when test="${VIEW.stat eq 9}">
		        <input type="hidden" class="form-control" id="stat" name="stat" value="9" readonly="readonly">
		        <input type="text" class="form-control" value="관리자" readonly="readonly">
      		</c:when>
      	</c:choose>
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="kakao">회원가입 경로:</label>
      <div class="col-12">
      	<c:choose>
	      	<c:when test="${VIEW.kakao eq 'code'}">
				<input type="text" class="form-control" id="kakao" name="kakao" value="일반회원가입" readonly="readonly" >
	      	</c:when>
	      	<c:when test="${VIEW.kakao ne 'code'}">
			    <input type="text" class="form-control" id="kakao" name="kakao" value="카카오회원가입" readonly="readonly">
	    	</c:when>
      	</c:choose>
      </div>
    </div>
    
	<div class="form-group col-12">        
	    <div class="col-12">
	      <button type="submit" class="btn btn-primary btn-block" >회원정보수정</button>
	    </div>
	</div>
  </form>
  <div class="form-group">        
	    <div class="col-12">
	      <button id="listback" type="button" class="btn btn-primary btn-block">목록으로</button>
	    </div>
	</div>
</div>
</body>
</html>
