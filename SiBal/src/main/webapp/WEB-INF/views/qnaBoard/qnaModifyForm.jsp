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
  		$("#cBtn").click(function(){
  			history.back();
  		});
  	});
  </script>
</head>
<body>
	<div class="container">
	  <h2>질문하기</h2>
	  <form action="../qnaBoard/qnaModifyProc.do">
	 	<input type="hidden" name="oriNo" value="${VIEW.no}" />
		<input type="hidden" name="nowPage" value="${nowPage}" />
	    <div class="form-group">
	      <label for="title">제목:</label>
	      <input type="text" class="form-control" id="title" name="title" value="${VIEW.title}">
	    </div>
	    <div class="form-group">
	      <label for="content">내용:</label>
	      <textarea class="form-control" rows="5" id="content" name="content">${VIEW.content}</textarea>
	    </div>
	    <div class="form-group">
	      <label for="id">작성자</label>
	      <input type="text" class="form-control" id="id" name="id" value="${VIEW.id}">
	    </div>
	    <button type="submit" class="btn btn-dark">수정하기</button>
	    <button type="button" class="btn btn-dark" id="cBtn">취소</button>
	  </form>
	</div>
</body>
</html>