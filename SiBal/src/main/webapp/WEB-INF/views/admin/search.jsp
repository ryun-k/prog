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
  		
  		$("#lBtn").click(function(){
  			location.href="../admin/list.do";
  		});
  		
  	});
  
  </script>
</head>
<body>
<div class="container">
  <h2 align="center">회원 리스트</h2>
  <table class="table table-dark table-striped">
    <thead>
      <tr>
        <th>번호</th>
        <th>이메일</th>
        <th>닉네임</th>
        <th>이름</th>
        <th>회원등급</th>
      </tr>
    </thead>
    <tbody>
		<c:forEach items="${LIST}" var="data">
			<tr class="gun">
				<td>${data.no}</td>
					<td>
						<a href="../admin/detail.do?no=${data.no}&nowPage=${PINFO.nowPage}&nick=${data.nick}">
						${data.email}
						</a>
					</td>
				<td>${data.nick }</td>
				<td>${data.name }</td>
				<c:choose>
				<c:when test="${data.status eq 0}">
				<td>탈퇴회원</td>
				</c:when>
				<c:when test="${data.status eq 1}">
				<td>일반회원</td>
				</c:when>
				<c:when test="${data.status eq 9}">
				<td>관리자</td>
				</c:when>
				</c:choose>
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
					<a  class="page-link" href="../admin/search.do?nowPage=${PINFO.startPage-1}">이전</a>
			    </li>
				</c:if>
			    <c:forEach  var="page" begin="${PINFO.startPage}" end="${PINFO.endPage}" step="1">
			    <li class="page-item">
			    	<a class="page-link" href="../admin/search.do?nowPage=${page}">${page}</a>
			    </li>
			    </c:forEach>
			    <c:if test="${PINFO.endPage eq PINFO.totalPage}">
				<li class="page-item">
			    	<a class="page-link" href="">다음</a>
			    </li>
				</c:if>
				<c:if test="${PINFO.endPage ne PINFO.totalPage}">
			    <li class="page-item">
			    	<a class="page-link" href="../admin/search.do?nowPage=${PINFO.endPage+1}">다음</a>
			    </li>
				</c:if>
			  </ul>
	  		</td>
	  	</tr>
    </tfoot>
  </table>
 <form action="../admin/search.do" method="POST" id="sFrm" class="col-12">
    <div class="input-group-prepend " >
      <select class="form-control col-2 " id="target" name="target">
        <option value="email">이메일</option>
		<option value="nick">닉네임</option>
		<option value="name">이름</option>
      </select>
      <input type="text" class="form-control col-6 "placeholder="검색할 내용을 입력해주세요" id="word" name="word">
      <button type="submit" class="btn btn-outline-secondary col-2" id="sBtn">검색</button>
      <button type="button" class="btn btn-outline-secondary col-2" id="lBtn">초기화</button>
    </div>
  </form>
</div>
</body>
</html>