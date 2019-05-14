<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<title>회원정보수정결과</title>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
<h1>회원정보수정결과</h1>
<form id = "modifyView" method="post" action="#" encType="utf-8" align="center">
<table width="500" border="1" align="center">
<tr>
	<td>email</td> 
	<td>${INFO.email} </td>
</tr>


<tr>
	<td>password</td>
	<td> ${INFO.pw }</td>
</tr>

<tr>
	<td>이름 </td>
	<td>${INFO.name}</td>
</tr>
<tr>
	<td>닉네임 </td>
	<td>{INFO.nick}</td>
</tr>
<tr>
	<td>주소</td> 
	<td>${INFO.addr}</td>
</tr>
<tr>
	<td>전화번호</td> 
	<td>${INFO.phone}</td>
</tr>


</table>

<br/>
<input type="button" id="lBtn" value="메인페이지로">
</form>

</body>
</html>