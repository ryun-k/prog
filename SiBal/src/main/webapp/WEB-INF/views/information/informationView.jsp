<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
			
			//목록보기 버튼 클릭시
			$("#lBtn").click(function(){
				$(location).attr("href","../information/informationList.do?nowPage=${nowPage}");
			});
			
			//수정하기 버튼 클릭시
			$("#mBtn").click(function(){
				$(location).attr("href","../information/informationUpdateForm.do?oriNo=${VIEW.no}&nowPage=${nowPage}")
			});
			
			//삭제하기 버튼 클릭시
			$("#dBtn").click(function(){
				if(!confirm("정말로 삭제하시겠습니까??")){
					return false;
				};
				$(location).attr("href","../information/informationDelete.do?oriNo=${VIEW.no}&nowPage=${nowPage}")
			});
			
			$("#gBtn").click(function(){
				$(location).attr("href","../information/goodProc.do?oriNo=${VIEW.no}&nowPage=${nowPage}")
			});
			
			$("#ngBtn").click(function(){
				$(location).attr("href","../information/noGoodProc.do?oriNo=${VIEW.no}&nowPage=${nowPage}")
			});
			
		});
	</script>
	</head>
<body>
	<div class="container">
	  <div class="card">
	    <div class="card-header">${VIEW.title}</div>
	    <div class="card-body">
			<div>
			<span class="far fa-calendar-check"> ${VIEW.writeDate}</span> |<span class="fas fa-search"> ${VIEW.hit}</span> | <span class="fas fa-heart"> ${VIEW.good }</span>
			</div>
			<br/>
	    	<div align="right">
	    		<input class="btn btn-primary" type="button" id="lBtn" value="목록보기"/>
				<c:if test="${sessionScope.UID eq 'admin'}">
				<input class="btn btn-info" type="button" id="mBtn" value="수정하기"/>
				<input class="btn btn-danger" type="button" id="dBtn" value="삭제하기"/>
				</c:if>
			</div>
			<br/>
			<br/>
			
			<div align="center">
				<c:forEach items="${LIST}" var="list">
<%-- 				확인용:LIST.oriName=${list.oriName}<br/> --%>
				<img src="/imgs/${list.oriName }" width="100%;" height="400px;" style="margin-bottom: 20px;"> &nbsp; 
				</c:forEach>
			</div>
			
			<br/>
			<div>
				${VIEW.body }
			</div>
			<br/>
			<br/>
			<div align="center">
				<input class="btn btn-success" type="button" id="gBtn" value="좋아요"/>
				<input class="btn btn-warning" type="button" id="ngBtn" value="싫어요"/>
			</div>	
	    </div> 
  	  </div>
	
</div>
</body>
</html>




