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
  		$("#cBtn").click(function(){
  			history.back();
  		});
  		
  		$("#mBtn").click(function(){
  			var name = RegExp(/^[가-힣]{2,5}$/);  	
	  		var phone = RegExp(/^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/);
	  		
  			if($("#name").val()==""){
  			  alert("이름을 입력해주세요.");
  		      $("#name").focus();
  		      return false;
  			}
  			
  			if(!name.test($("#name").val())){
  			  alert("이름은 2자이상 5자이하의 한글로만 가능합니다.");
  		      $("#name").focus();
  		      return false;
  		  	}
  			
  			if($("#phone").val()==""){
				return true;  				
  			}else{
	   			if(!phone.test($("#phone").val())){
	   			  alert("휴대전화번호 형식에 맞게 입력해주세요.");
	   		      $("#phone").focus();
	   		      return false;
	   		  	}
  			}
  		});
  		
  		
  	});
  	
  </script>
</head>
<body>
<div class="container">
  <h2 align="center">${VIEW.name}의 회원정보</h2>
  <form class="form-horizontal row" method="post" action="../admin/modifyP.do">
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
        <input type="text" class="form-control" id="name" name="name" value="${VIEW.name}" required="required"
        pattern="^[가-힣]{2,5}$">
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
        <input type="text" class="form-control" id="address" name="address" value="${VIEW.address}" >
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="phone">전화번호:</label>
      <div class="col-12">
        <input type="text" class="form-control" id="phone" name="phone" value="${VIEW.phone}" >
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="stat">회원등급:</label>
      <div class="col-12">
      	<select class="form-control " name="stat" >
      		<c:choose>
      			<c:when test="${VIEW.stat eq 0}">
      				<option value="${VIEW.stat}">탈퇴</option>
      			</c:when>
      			<c:when test="${VIEW.stat eq 1}">
      				<option value="${VIEW.stat}">일반</option>
      			</c:when>
      			<c:when test="${VIEW.stat eq 9}">
      				<option value="${VIEW.stat}">관리자</option>
      			</c:when>
      		</c:choose>
      			<option class="stat" value="0" >탈퇴</option>
				<option class="stat" value="1" >일반</option>
				<option class="stat" value="9" >관리자</option>
		</select>
      </div>
    </div>
    <div class="form-group col-12">
      <label class="control-label" for="kakao">회원가입 경로:</label>
      <div class="col-12">
      	<c:choose>
	      	<c:when test="${VIEW.kakao eq 'code'}">
				<input type="text" class="form-control" id="kakao" name="kakao" value="일반회원가입" readonly="readonly">
	      	</c:when>
	      	<c:when test="${VIEW.kakao ne 'code'}">
			    <input type="text" class="form-control" id="kakao" name="kakao" value="카카오회원가입" readonly="readonly">
	    	</c:when>
      	</c:choose>
      </div>
    </div>
    
	<div class="form-group col-12">        
	    <div class="col-12">
	      <button type="submit" class="btn btn-primary btn-block" id="mBtn" >수정하기</button>
	      <button id="cBtn" type="button" class="btn btn-primary btn-block">수정취소</button>
	    </div>
	</div>
  </form>
</div>
</body>
</html>
