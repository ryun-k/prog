<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>회원탈퇴</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//탈퇴시 비번 확인
	$("#wBtn").click(function(){
		$.ajax({
			type:"POST",
			url:"../member/withdrawProc.do",
			data:{
				"email":$("#email").val(),
				"pw":$("#pw").val()
			},
			success:function(data){
				if($.trim(data)=='YES'){
					alert('회원탈퇴 처리가 완료 되었습니다.');
					$(location).attr("href","../");
				}
				else{
					alert('비밀번호가 틀렸습니다.');
					$("#pw").val("");
					$("#pw").focus();
				}
			}
		})
	})
	
	
	$("#cBtn").click(function(){
		$(location).attr("href","../");
	})
});
</script>
</head>
<body>
<div class="container">
<h1>회원탈퇴</h1>
<hr/>
<form id = "withdrawForm" class="was-validated" method="post" action="" encType="utf-8" >
<div class="form-group">
	<input type="hidden" id="email" class="form-control" name="email" value="${INFO.email}">
	<h3>${INFO.email} </h3>
<label for="uname">password</label>
	<input type="password"  class="form-control" placeholder="비밀번호를 입력하세요" id="pw" name="pw" >

<br/>
</div>
<div class="row">
<div class="col-9"></div>
<div class="col-3">
<input type="button" id="wBtn" class="btn btn-primary" value="탈퇴하기">
<input type="button" id="cBtn" class="btn btn-primary" value="취소하기">
</div>
</div>
</form>
</div>
</body>
</html>