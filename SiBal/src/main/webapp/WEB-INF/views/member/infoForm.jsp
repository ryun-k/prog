<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>회원정보수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//수정하기
	$("#mBtn").click(function(){
		$(location).attr("href","../member/modifyForm.do");
	})
	//취소하고 메인가기
	$("#cBtn").click(function(){
		$(location).attr("href","../");
	})
	//탈퇴하기
	$("#wBtn").click(function(){
		$(location).attr("href","../member/withdrawForm.do");
	})
	//비밀번호 변경
	$("#pBtn").click(function(){
		$("#modify").submit();
	})
	
});

</script>

</head>
<body>
<div class="container">
<h1>회원정보</h1>

<form id = "modify" class="was-validated" method="post" action="../member/pwCode.do" encType="utf-8" >
<div class="form-group">
  
	<h3>${INFO.email}</h3><br/>
	<input type="hidden" id="email" name="email" value="${INFO.email}">
	
	<label for="name">이름</label>
	<input type="text" id="name" class="form-control" name="name" readonly="readonly" value="${INFO.name}"><br/>

	<label for="nick">닉네임 </label>
	<input type="text" id="nick" class="form-control" name="nick" readonly="readonly" value="${INFO.nick}"><br/>

	<label for="addr">주소</label>
	<input type="text" id="addr" class="form-control" name="addr" readonly="readonly" value="${INFO.addr}"><br/>

	<label for="phone">휴대폰 번호</label> 
	<input type="text" id="phone" class="form-control" name="phone" readonly="readonly" value="${INFO.phone}"> <br/>

<br/>
</div>
<input type="button" id="pBtn" class="btn btn-primary" value="비밀번호변경">
<input type="button" id="mBtn" class="btn btn-primary" value="수정하기">
<input type="button" id="wBtn" class="btn btn-primary" value="탈퇴하기">
<input type="button" id="cBtn" class="btn btn-primary" value="취소하기">

</form>
</div>
</body>
</html>