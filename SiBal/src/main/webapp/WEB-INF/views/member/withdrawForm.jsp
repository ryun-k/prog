<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>회원탈퇴</title>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$("#wBtn").click(function(){
		if($("#pw").val()==0||$("#pw").val()==null){
			alert('비밀번호를 입력하세요')
		}else{
			$("#withdrawForm").submit();
		}
		
	});
});
</script>
</head>
<body>
<h1>회원탈퇴</h1>
<form id = "withdrawForm" method="post" action="../member/withdrawProc.do" encType="utf-8" align="center">
<table width="500" border="1" align="center">
<tr>
	<td>email</td> 
	<input type="hidden" name="email" value="${INFO.email}">
	<td>${INFO.email} </td>
</tr>

<tr>
	<td>password</td>
	<td><input type="password" id="pw" name="pw" ></td>
</tr>

</table>

<br/>
<input type="button" id="wBtn" value="탈퇴하기">
</form>

</body>
</html>