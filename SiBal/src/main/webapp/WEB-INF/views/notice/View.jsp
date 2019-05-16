<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
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
 		$('#lBtn').click(function(){
 			$(location).attr("href","../notice/List.do?nowPage=${nowPage}");
 		});
 		$('#mBtn').click(function(){
 			$(location).attr("href","../notice/modifyForm.do?oriNo=${VIEW.no}&nowPage=${nowPage}");
 		});
 		$('#dBtn').click(function(){
 			$(location).attr("href","../notice/delete.do?oriNo=${VIEW.no}&nowPage=${nowPage}");
 		});
 	});
 	
 	
 	</script>
</head>
<body>

<div class="container">
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td width="10%">제목</td>
        <td>${VIEW.title }</td>
      </tr>
      <tr>
        <td width="10%">내용</td>
        <td>${VIEW.content }</td>
      </tr>
      <tr>
       
      </tr>
    </tbody>
  </table>
   <div class="btn btn-primary" id="lBtn">목록보기</div>
   <div class="btn btn-primary" id="mBtn">수정하기</div>
   <div class="btn btn-primary" id="dBtn">삭제하기</div>
</div>

</body>
</html>