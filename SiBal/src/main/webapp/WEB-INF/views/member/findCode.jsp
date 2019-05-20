<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<meta charset="utf-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#sBtn").click(function(){
		alert('비밀번호가 설정 되었습니다.');
		$("#codeForm").submit();
	
	})
	//code 정규식
	var reg = /^[a-zA-Z0-9]{10,16}$/
	
	//이메일
	var reg1 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
	//패스워드
	var reg2 = /^[\W-가-힣a-zA-Z0-9]{4,20}/
	
	//code 정규식
	$("#check").blur(function(){
		if($("#check").val()!=""){
			if(reg.test($("#check").val())==false){
				alert('코드의 형식이 맞지 않습니다.');
				$("#check").val("");
				$("#check").focus();			
			}
		}
	})
	//이메일 정규식
	$("#email").blur(function(){
		if($("#email").val()!=""){
			if(reg1.test($("#email").val())==false){
				alert('이메일의 형식이 맞지 않습니다.');
				$("#email").val("");
				$("#email").focus();			
			}
		}
	})
	//비밀번호 정규식
	$("#pw").blur(function(){
		if($("#pw").val()!=""){
			if(reg2.test($("#pw").val())==false){
				alert('비밀번호의 형식이 맞지 않습니다.');
				$("#pw").val("");
				$("#pw").focus();			
			}
		}
	})
	
	//동일 패스워드 검사
	$("#pw1").blur(function(){
		if($("#pw1").val()!=""){
			if($("#pw").val()!=$("#pw1").val()){
				alert('패스워드가 서로 다릅니다.');
				$("#pw1").val("");
				$("#pw1").focus();
			}
		}
	})
	
	$("#cBtn").click(function(){
	
		$(location).attr("href","../");
	})
});
</script>
</head>
<body>
<div class="container">
<h1>메일발송이 완료 되었습니다.<br/>
인증코드를 입력해주세요.<br/> <hr/>
</h1>
<form id="codeForm" class="was-validated" method="POST" action="../member/findPw.do">
 <div class="form-group">

 <label for="check">발송 코드 </label>

<input type="text" id="check" class="form-control" placeholder="코드를 입력하세요" name="check" required="required">
<br/>

 <label for="email">이메일</label>
<input type="text" id="email" class="form-control" value="${INFO}" name="email" readonly="readonly">
<br/>

 <label for="pw">새로지정할 비밀 번호</label>
<input type="password" id="pw" class="form-control" placeholder="비밀번호를 입력하세요(4~20)" name="pw" required="required">
<br/>


 <label for="pw1">비밀 번호 재 확인</label>
<input type="password" id="pw1" class="form-control" placeholder="비밀번호를 입력하세요(4~20)" name="pw1" required="required">


</div>
<hr/>
<input type="button" id="sBtn" class="btn btn-primary" value="비밀번호 설정하기">
<input type="button" id="cBtn" class="btn btn-primary" value="취소">

</form>
</div>
</body>
</html>