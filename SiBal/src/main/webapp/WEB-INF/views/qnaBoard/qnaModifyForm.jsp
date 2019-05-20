<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		
  		
  		$("#mBtn").click(function(){
	  		var title = RegExp(/^.{1,30}$/);  	
	  		var content = RegExp(/^.{1,1000}$/);
	  		
  			if($("#title").val()==""){
  			  alert("제목을 입력해주세요.");
  		      $("#title").focus();
  		      return false;
  			}
  			
  			if(!title.test($("#title").val())){
  			  alert("제목은 문자 30자리까지만 입력가능합니다.");
  		      $("#title").focus();
  		      return false;
  		  	}
  		  	
  			if($("#content").val()==""){
  			  alert("내용을 입력해주세요.");
  		      $("#content").focus();
  		      return false;
  			}
  			
  			if(!content.test($("#content").val())){
   			  alert("내용은 문자 1000자리까지만 입력가능합니다.");
   		      $("#content").focus();
   		      return false;
  			}
  			
   		   if($("#id").val()==""){
   			  alert("글쓰기는 로그인 상태에서 할 수 있습니다.");
   			  location.href="../member/loginForm.do";
   		      return false;
   			}
   			
  		$("#cBtn").click(function(){
  			history.back();
  		});
  	});
  		
</script>
</head>
<body>
	<div class="container">
	  <h2 align="center">수정하기</h2>
	  <form action="../qnaBoard/qnaModifyProc.do">
	 	<input type="hidden" name="oriNo" value="${VIEW.no}" />
		<input type="hidden" name="nowPage" value="${nowPage}" />
	    <div class="form-group">
	      <label for="title">제목:</label>
	      <input type="text" class="form-control" id="title" name="title" value="${VIEW.title}" required="required" maxlength="30">
	    </div>
	    <div class="form-group">
	      <label for="content">내용:</label>
	      <textarea class="form-control" rows="5" id="content" name="content" required="required" maxlength="1000">${VIEW.content}</textarea>
	    </div>
	    <div class="form-group">
	      <label for="id">작성자</label>
	      <input type="text" class="form-control" id="id" name="id" value="${VIEW.id}" readonly="readonly" required="required">
	    </div>
	    <button type="submit" class="btn btn-dark" id="mBtn">수정하기</button>
	    <button type="button" class="btn btn-dark" id="cBtn">취소</button>
	  </form>
	</div>
</body>
</html>