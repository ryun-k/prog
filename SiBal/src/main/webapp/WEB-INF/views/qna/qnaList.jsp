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
				<td><a href="../qna/hitProc.do?oriNo=${data.no}&nowPage=${PINFO.nowPage}">${data.title}</a></td>
				<td>${data.id }</td>
				<td>${data.wDate }</td>
				<td>${data.hit}</td>
			</tr>
		</c:forEach>
    </tbody>
  </table>
  <table class="table table-dark table-striped">
    <tbody>
		<tr>
			<td align="center">
				확인용:PINFO.startPage=${PINFO.startPage}<br/>
				<%-- 1. 이전단추 만들기 --%>
				<%-- PINFO는 컨트롤러에서 페이징관련정보가 담긴 모델 --%>
				<c:if test="${PINFO.startPage eq 1}">[이전]</c:if>
				
				<c:if test="${PINFO.startPage ne 1}">
				<%-- 링크는 목록보기 --%>
				<a href="../qna/qnaList.do?nowPage=${PINFO.startPage-1}">[이전]</a>
				</c:if>			 
				
				<%-- 2. 페이지번호 [1][2][3][4][5]만들기 --%>
				<c:forEach  var="page"
							begin="${PINFO.startPage}"
							end="${PINFO.endPage}"   
							step="1">
				  <a href="../qna/qnaList.do?nowPage=${page}">[${page}]</a>
				</c:forEach>
				
				
				<%-- 3. 다음단추 만들기 --%>
				<c:if test="${PINFO.endPage eq PINFO.totalPage}">
				[다음]
				</c:if>
				
				<c:if test="${PINFO.endPage ne PINFO.totalPage}">
				<a href="../qna/qnaList.do?nowPage=${PINFO.endPage+1}">[다음]</a></c:if>	
			</td>
		</tr>
	</tbody>
  </table>
  <table class="table table-dark table-striped">
      <tr>
        <td>
        	<button type="button" class="btn btn-dark">글쓰기</button>
        </td>
      </tr>
  </table>
</div>
</body>
</html>