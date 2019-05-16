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
<br/>

<div class="container">
  <div class="jumbotron">
		<c:forEach items="${LIST}" var="data">
		 	<div class="card" style=" margin-left: <c:out value='${data.reDepth * 40}'/>px;">
			   <div class="card-header">
			     <strong class="card-text">${data.id}</strong>
			     <span>${data.reWDate}</span>
			     <button class="card-link btn btn-outline-secondary rBtn" data-toggle="modal" data-target="#myModal" >답글달기</button>
				 <button class="card-link btn btn-outline-secondary mBtn">수정하기</button>
				 <button class="card-link btn btn-outline-secondary dBtn">삭제하기</button>
			   </div>
			   <div class="card-body">
			      <strong class="card-text">${data.reContent}</strong>
			   </div>
		   </div>
	   	</c:forEach>
		<form action="../qnaBoard/repWrite.do">
		  <input type="hidden" name="oriNo" value="${oriNo}" />
		  <input type="hidden" name="nowPage" value="${nowPage}" />
		  <div class="form-group">
		    <label for="reContent"></label>
		    <textarea class="form-control" rows="4" id="reContent" name="reContent"></textarea>
		  <button type="submit" class="form-control btn-dark">댓글입력</button>
		  </div>
		</form>
	   	<table align="center">
	   	<tr>
    		<td>
			  <ul class="pagination" >
				
				<c:if test="${PINFO.startPage eq 1}">
			    <li class="page-item">
					<a  class="page-link" href="" >이전</a>
			    </li>
				</c:if>
				<c:if test="${PINFO.startPage ne 1}">
			    <li class="page-item">
					<a  class="page-link" href="../qnaBoard/qnaView.do?oriNo=${oriNo}&nowPage=${PINFO.startPage-1}">이전</a>
			    </li>
				</c:if>
			    <c:forEach  var="page" begin="${PINFO.startPage}" end="${PINFO.endPage}" step="1">
			    <li class="page-item">
			    	<a class="page-link" href="../qnaBoard/qnaView.do?oriNo=${oriNo}&nowPage=${page}">${page}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${PINFO.endPage eq PINFO.totalPage}">
				<li class="page-item">
			    	<a class="page-link" href="">다음</a>
			    </li>
				</c:if>
				<c:if test="${PINFO.endPage ne PINFO.totalPage}">
			    <li class="page-item">
			    	<a class="page-link" href="../qnaBoard/qnaView.do?oriNo=${oriNo}&nowPage=${PINFO.endPage+1}">다음</a>
			    </li>
				</c:if>
			  </ul>
	  		</td>
	  	</tr>
	   	</table>
  </div>
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">답글입력</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">답글입력</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
</body>
</html>