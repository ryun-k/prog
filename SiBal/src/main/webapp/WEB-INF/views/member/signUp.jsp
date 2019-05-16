<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>회원가입</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//정규식
		//이메일
	var reg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
		//닉네임
	var reg1 = /^[\W-가-힣a-zA-Z0-9]{2,10}/;
	
		//패스워드
	var reg2 = /^[\W-가-힣a-zA-Z0-9]{4,20}/
	
		//이름
	var reg3 = /^[가-힣]{2,5}$/
	
		//휴대전화
	var reg4 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
	
	//변수선언
	var email = $("#email").val();
	var nick = $("#nick").val();
	//이메일검사.
		 $("#email").blur(function(){
				$.ajax({
					type:"POST",
					url:"../member/EmailCheck.do",
					data:{
						"email":$("#email").val(),
						"target":"email"
					},
					success:function(data){
						if($.trim(data)=='YES'){
							if($("#email").val()!=""){
								if(reg.test($("#email").val())==true){
								alert("사용가능한 이메일입니다.");
								}else{
								alert('형식에 맞지 않습니다.');
								$("#email").val("");
								$("#email").focus();
								}
							}
						}else{
							if($("#email").val()!=""){
								if(reg.test($("#email").val())==false){
									alert('형식에 맞지 않습니다.');
								}
								alert("중복된 이메일입니다.");
								$("#email").val("");
								$("#email").focus();
							}
						}
					}
				})
			}) 
		 
	//닉네임검사.
	 $("#nick").blur(function(){
				$.ajax({
					type:"POST",
					url:"../member/NickCheck.do",
					data:{
						"nick":$("#nick").val(),
						"target":"nick"
					},
					success:function(data){
						if($.trim(data)=='YES'){
							if($("#nick").val()!=""){
								if(reg1.test($("#nick").val())==true){
								alert("사용가능한 닉네임입니다.");
								}else{
								alert('형식에 맞지 않습니다.');
								$("#nick").val("");
								$("#nick").focus();
								}
							}
						}else{
							if($("#nick").val()!=""){
								if(reg1.test($("#nick").val())==false){
									alert('형식에 맞지 않습니다.');
								}
								alert("중복된 닉네임입니다.");
								$("#nick").val("");
								$("#nick").focus();
							}
						}
					}
				})
			}) 

	//패스워드 검사
	$("#pw").blur(function(){
		if($("#pw").val()!=""){
			if(reg2.test($("#pw").val())==false){
				alert('형식에 맞지 않습니다.');
				$("#pw").val("");
				$("#pw").focus();
			}
		}
	})
	
	//동일 패스워드 검사
	$("#pw2").blur(function(){
		if($("#pw2").val()!=""){
			if($("#pw").val()!=$("#pw2").val()){
				alert('패스워드가 서로 다릅니다.');
				$("#pw2").val("");
				$("#pw2").focus();
			}
		}
	})
	
	//이름 검사
	$("#name").blur(function(){
		if($("#name").val()!=""){
			if(reg3.test($("#name").val())==false){
				alert('형식에 맞지 않습니다.');
				$("#name").val("");
				$("#name").focus();
			}
		}
	})
	
	//휴대폰 번호 검사
	$("#phone").blur(function(){
		if($("#phone").val()!=""){
			if(reg4.test($("#phone").val())==false){
				alert('형식에 맞지 않습니다.');
				$("#phone").val("");
				$("#phone").focus();
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
<h1>회원가입</h1>
<form id = "signUp" method="post" action="../member/signUpProc.do" class="was-validated" encType="utf-8" >
<div class="form-group">
  <label for="uname">email</label>
	<input type="email" id="email" class="form-control" name="email" placeholder="이메일을 입력해주세요." required="required" maxlength="20"
	title="이메일은 반드시 입력하셔야 합니다." pattern="^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$"> 
	<br/>


	<label for="pwd">password</label>
	 <input type="password" id="pw" class="form-control" name="pw"  placeholder="비밀번호를 입력해주세요." required="required" title="비밀번호를  입력해주세요"
	 pattern="^[\W-가-힣a-zA-Z0-9]{4,20}" maxlength="20"> 
	<br/>
	<label for="pwd2">password재입력</label>
	<input type="password" id="pw2" class="form-control" required="required"  placeholder="비밀번호를 똑같이 입력해주세요." title="비밀번호를  다시 입력해주세요"
	 pattern="^[\W-가-힣a-zA-Z0-9]{4,20}" maxlength="20">
	<br/>
	<label for="name">이름 </label>
	<input type="text" id="name" class="form-control" name="name"  placeholder="이름을  입력해주세요." required="required" title="이름을  입력해주세요"
	pattern="^[가-힣]{2,5}$" maxlength="5">
	<br/>
	<label for="nick">닉네임 </label>
	<input type="text" id="nick" class="form-control" name="nick"  placeholder="닉네임을  입력해주세요." required="required" title="닉네임을  입력해주세요"
	pattern="^[\W-가-힣a-zA-Z0-9]{2,10}" maxlength="10">
	<br/>

	<label for="addr">주소</label>
	<input type="text" id="add" class="form-control" name="addr"  placeholder="주소를 입력해주세요." title="선택사항입니다." >
	<br/>
	<label for="addr">휴대폰 번호</label>
	<input type="text" id="phone" class="form-control" name="phone"  placeholder="휴대폰 번호를 입력해주세요." title="선택사항입니다."
	pattern="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$"> 

<br/>
</div>
<input type="submit" class="btn btn-primary" id="ssBtn" value="가입하기">
<input type="button" class="btn btn-primary" id="cBtn" value="메인가기">

</form>
</div>
</body>
</html>