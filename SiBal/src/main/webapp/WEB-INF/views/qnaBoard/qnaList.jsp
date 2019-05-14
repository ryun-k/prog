<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>list</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(function(){
  		$("#wBtn").click(function(){
  			location.href="../qnaBoard/qWriteForm.do";
  		});
  	});
  
  </script>
</head>
<body>
<div class="container">
  <h2>리스트</h2>
  <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach items="${LIST}" var="data">
			<tr>
				<td>${data.no }</td>
				<td><a href="../qnaBoard/hitProc.do?oriNo=${data.no}&nowPage=${PINFO.nowPage}">${data.title}</a></td>
				<td>${data.id }</td>
				<td>${data.wDate }</td>
				<td>${data.hit}</td>
			</tr>
		</c:forEach>
    </tbody>
    <tfoot>
    	<tr>
    		<td colspan="5">
			  <ul class="pagination justify-content-center" >
				
				<c:if test="${PINFO.startPage eq 1}">
			    <li class="page-item">
					<a  class="page-link" href="" >이전</a>
			    </li>
				</c:if>
				<c:if test="${PINFO.startPage ne 1}">
			    <li class="page-item">
					<a  class="page-link" href="../qnaBoard/qnaList.do?nowPage=${PINFO.startPage-1}">이전</a>
			    </li>
				</c:if>
			    <c:forEach  var="page" begin="${PINFO.startPage}" end="${PINFO.endPage}" step="1">
			    <li class="page-item">
			    	<a class="page-link" href="../qnaBoard/qnaList.do?nowPage=${page}">${page}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${PINFO.endPage eq PINFO.totalPage}">
				<li class="page-item">
			    	<a class="page-link" href="">다음</a>
			    </li>
				</c:if>
				<c:if test="${PINFO.endPage ne PINFO.totalPage}">
			    <li class="page-item">
			    	<a class="page-link" href="../qnaBoard/qnaList.do?nowPage=${PINFO.endPage+1}">다음</a>
			    </li>
				</c:if>
			  </ul>
	  		</td>
	  	</tr>
    </tfoot>
  </table>
  <div>
   	<button type="submit" class="btn btn-dark" id="wBtn" >글쓰기</button>
  </div>
 
</div>
</body>
</html>