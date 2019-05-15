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
  <script type="text/javascript">
  	$(function(){
  		$("#lBtn").click(function(){
  			location.href="../qnaBoard/qnaList.do?nowPage=${nowPage}";
  		});
  		
  		$("#rBtn").click(function(){
  			location.href="../qnaBoard/aWriteForm.do?no=${VIEW.no}&ref=${VIEW.ref}&step=${VIEW.step}&depth=${VIEW.depth}";
  		});
  		
  		$("#uBtn").click(function(){
  			location.href="../qnaBoard/qnaModifyForm.do?oriNo=${VIEW.no}&nowPage=${nowPage}";
  		});
  		
  		$("#dBtn").click(function(){
  			if(confirm("정말 삭제하시겠습니까?"))
  				location.href="../qnaBoard/deleteProc.do?oriNo=${VIEW.no}&nowPage=${nowPage}";
  		});
  	});
  </script>
</head>
<body>
<div class="container">
  <h2>상세보기</h2>
  	<table class="table table-dark table-striped">
    <tbody>
		<tr>
			<td>글번호</td>
			<td>${VIEW.no}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${VIEW.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${VIEW.brContent}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${VIEW.id}</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td>${VIEW.wDate}</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${VIEW.hit}</td>
		</tr>
    </tbody>
  </table>
  <div>
   	<button type="submit" class="btn btn-dark" id="rBtn" >답변하기</button>
   	<button type="submit" class="btn btn-dark" id="uBtn" >수정하기</button>
   	<button type="submit" class="btn btn-dark" id="dBtn" >삭제하기</button>
   	<button type="submit" class="btn btn-dark" id="lBtn" >목록으로</button>
  </div>

</div>
</body>
</html>