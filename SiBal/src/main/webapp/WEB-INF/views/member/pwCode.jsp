<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#sBtn").click(function(){
		if($("#pw").val()==0||$("#pw1").val()==0){
			alert('비밀번호를 입력해주세요')
		}else if($("#pw").val()!=$("#pw1").val()){
			alert("비밀번호가 서로 다릅니다.")
		}else{
			$("#codeForm").submit();
		}
	});
});
</script>
</head>
<body>
<h1>메일발송이 완료 되었습니다.<br/>
인증코드를 입력해주세요.<br/> 
</h1>
<form id="codeForm" method="POST" action="../member/modifyPw.do">
<table width ="500" border="1" align="center">

<tr>
<td>발송 코드 </td>

<td><input type="text" id="check" name="check" required="required"></td>
</tr>
<tr>
<td>이메일</td>
<td><input type="text" id="email" name="email" required="required"></td>
</tr>
<tr>
<td>새로지정할 비밀 번호</td>
<td><input type="password" id="pw" name="pw" required="required"></td>
</tr>
<tr>

<td>비밀 번호 재 확인</td>
<td><input type="password" id="pw1" name="pw1" required="required"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" id="sBtn" value="비밀번호 설정하기"></td>
</tr>
</table>
</form>
</body>
</html>