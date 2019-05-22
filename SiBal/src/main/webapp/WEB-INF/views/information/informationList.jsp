<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<title>Document</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  	<script>
		$(document).ready(function(){
			//글쓰기버튼 클릭시
			$("#wBtn").click(function(){
				$(location).attr("href","../information/informationWriteForm.do");
			});
			
			//검색하기 버튼 클릭시 / id="target" name="target" /id="word"
			$("#sBtn").click(function(){
// 				alert("#sBtn  ok");
				//무결성검사
				$("#sFrm").submit();
			});
		});	
	</script>
	</head>
<body>
    <%-- 기타 기능 --%>
    <div class="container">
    <table class="table table-hover" width="800">
			<tr>
				<td align="right">
				<c:if test="${sessionScope.UID eq 'admin'}">
					<input class="btn btn-primary" type="button" id="wBtn" value="글쓰기"/>
				</c:if>
				</td>
			</tr>
		</table>	
	
  <%-- 목록 보여주기 --%>
  		<div class="row">
			<c:forEach items="${LIST}" var="data">
			<%-- <c:if test="${status.first}">
			</c:if> --%>
<%--   			확인용:LIST.oriName=${data.oriName}<br/> --%>
				<div class="col-md-4">
				<div class="card" style="width:300px; height:450px;">
					<img class="card-img-top" src="/sb/imgs/${data.oriName}" style="width:300px; height:300px;"/>
					 <div class="card-body">
					 <h4 class="card-title"><a href="../information/hitProc.do?oriNo=${data.no}&nowPage=${PINFO.nowPage}">${data.title2}</a></h4>
					<p class="card-text">${data.writer}
					<p class="card-text"><span class="far fa-calendar-check"> ${data.writeDate}</span> | <span class="fas fa-search"> ${data.hit}</span> | <span class="fas fa-heart"> ${data.good }</span></p>
					</div>
				</div>
				<br/><br/>
				</div>
			</c:forEach>
		</div>	
  <%-- 페이지 이동 --%>
  	<table class="table table-hover" name="tbl2" id="tbl2" width="1200" align="center">
		<tbody>
			<tr>
				<td align="center">
					<%-- 1. 이전단추 만들기 --%>
					<%-- PINFO는 컨트롤러에서 페이징관련정보가 담긴 모델 --%>
					<c:if test="${PINFO.startPage eq 1}">[이전]</c:if>
					
					<c:if test="${PINFO.startPage ne 1}">
					<%-- 링크는 목록보기 --%>
					<a href="../information/informationList.do?nowPage=${PINFO.startPage-5}">[이전]</a>
					</c:if>			 
					
					<%-- 2. 페이지번호 [1][2][3][4][5]만들기 --%>
					<c:forEach  var="page"
								begin="${PINFO.startPage}"
								end="${PINFO.endPage}"   
								step="1">
					  <a href="../information/informationList.do?nowPage=${page}">[${page}]</a>
					</c:forEach>
					
					
					<%-- 3. 다음단추 만들기 --%>
					<c:if test="${PINFO.endPage eq PINFO.totalPage}">
					[다음]
					</c:if>
					
					<c:if test="${PINFO.endPage ne PINFO.totalPage}">
					<a href="../information/informationList.do?nowPage=${PINFO.endPage+5}">[다음]</a></c:if>	
				</td>
			</tr>
		</tbody>
	</table>
  

			
	<form method="POST" id="sFrm" action="../information/informationSearch.do">
		<table class="table table-hover" width="1200" align="center">
			<tr>
				<td align="center">
					<%-- 검색대상 --%>
					<select id="target" name="target" >
						<option value="title">제목</option>
						<option value="body">내용</option>
						<option value="writer">작성자</option>
						<option value="both">제목+내용</option>
					</select>
					<%-- 검색단어 --%>
					<input type="text" id="word" name="word"/>
					<%-- 검색버튼 --%>
					<input class="btn btn-primary" type="button" id="sBtn"value="검색"/>
				</td>
			</tr>
		</table>
	</form>
		</div>
</body>
</html>





