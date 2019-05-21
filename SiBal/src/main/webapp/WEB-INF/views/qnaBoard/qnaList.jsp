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
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <style type="text/css">
  	.gun a:link { text-decoration:none ; color:#fff}
  	.gun a:visited { text-decoration:none ; color:#fff}
  	.gun a:active { text-decoration:none ; color:#fff}
  	.gun a:hover { text-decoration:none ; color:#fff}
  </style>
  <script type="text/javascript">
  	$(function(){
  		// 글쓰기 클릭시
  		$("#wBtn").click(function(){
  			location.href="../qnaBoard/qWriteForm.do";
  		});
  		$("#lBtn").click(function(){
  			location.href="../qnaBoard/qnaList.do";
  		});
  		
  	});
  
  </script>
</head>
<body>
<div class="container">
  <h2 align="center">Q&A 리스트</h2>
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
			<tr class="gun">
				<td>${data.no }</td>
					<td>
						<a href="../qnaBoard/hitProc.do?oriNo=${data.no}&nowPage=${PINFO.nowPage}">
						<c:if test="${data.depth ge 1}">
							<c:forEach begin="1" end="${data.depth * 4}">&nbsp;</c:forEach>
							<i class="material-icons" >subdirectory_arrow_right</i>
						</c:if>
						${data.title}
						</a>
					</td>
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
 <form action="../qnaBoard/qnaSearch.do" method="POST" id="sFrm" class="col-12">
    <div class="input-group-prepend " >
      <select class="form-control col-2 " id="target" name="target">
        <option value="title">제목</option>
		<option value="body">내용</option>
		<option value="writer">작성자</option>
		<option value="both">제목+내용</option>
      </select>
      <input type="text" class="form-control col-6 "placeholder="검색할 내용을 입력해주세요" id="word" name="word">
      <button type="submit" class="btn btn-outline-secondary col-2" id="sBtn">검색</button>
      <button type="button" class="btn btn-outline-secondary col-2" id="lBtn">초기화</button>
    </div>
  </form>
  <br/>
  <div>
   	<button type="submit" class="btn btn-dark" id="wBtn" >글쓰기</button>
  </div>
  
</div>
</body>
</html>