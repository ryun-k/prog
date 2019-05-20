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
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//정규식
		//닉네임
	var reg1 = /^[\W-가-힣a-zA-Z0-9]{2,10}/;
	
		//패스워드
	var reg2 = /^[\W-가-힣a-zA-Z0-9]{4,20}/
		
		//이름
	var reg3 = /^[가-힣]{2,5}$/
		
		//휴대전화
	var reg4 = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/
	
	//변수선언
	var nick = $("#nick").val();
	
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
	//주소쓰기
	$("#map").click(function(){
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }
            document.getElementById("addr").value = addr+data.buildingName;
            document.getElementById("addr").focus();
        }
    }).open();
	});
	
	//취소하기
	$("#cBtn").click(function(){
		$(location).attr("href","../member/infoForm.do");
	});
	
	//수정하기
	$("#mBtn").click(function(){
		$("#modify").submit();
	})
});

</script>

</head>
<body>
<div class="container">
<h1>회원정보수정</h1>
<form id = "modify" class="was-validated" method="post" action="../member/modifyProc.do" encType="utf-8" >
<div class="form-group">
  
	<input type="hidden" class="form-control" name="email" value="${INFO.email}">
	<h3>${INFO.email}</h3><br/>
	
	
	<label for="name">이름</label>
	<input type="text" id="name" class="form-control" name="name" required="required" placeholder="이름을  입력해주세요"
	pattern="^[가-힣]{2,5}$" maxlength="5" value="${INFO.name}"><br/>

	<label for="nick">닉네임 </label>
	<input type="text" id="nick" class="form-control" name="nick" required="required" placeholder="닉네임을  입력해주세요"
	pattern="^[\W-가-힣a-zA-Z0-9]{2,10}" maxlength="10" value="${INFO.nick}"><br/>

	<label for="addr">주소</label><br/><input type="button" id="map" name="map" value="주소입력">
	<input type="text" id="addr" class="form-control" name="addr" placeholder="주소를 입력해주세요" value="${INFO.addr}"><br/>

	<label for="phone">휴대폰 번호</label> 
	<input type="text" id="phone" class="form-control" name="phone" placeholder="휴대폰 번호를 입력해주세요" value="${INFO.phone}"
	 pattern="^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$"> <br/>

<br/>
</div>
<div class="row">
<div class="col-9"></div>
<div class="col-3">
<input type="button" id="mBtn" class="btn btn-primary" value="수정하기">
<input type="button" id="cBtn" class="btn btn-primary" value="취소하기">
</div>
</div>
</form>
</div>
</body>
</html>