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
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
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
  		
  		// 답글 입력창
  		$(".rBtn").click(function(){
  			var id = $(this).parent("div").attr("id")+"Form";
			$("#"+id).toggle();
  		});
  		
  		// 답글 입력
  		$(".rrBtn").click(function(){
  			$(this).parent("div").parent("form").submit();
  		});
  		
  		// 답글 입력 취소
  		$(".crBtn").click(function(){
  			var id = $(this).parent("div").parent("form").attr("id");
			$("#"+id).hide();
  		});
  		
  		
  		// 댓글 수정 입력창
  		$(".mBtn").click(function(){
  			var id = $(this).parent("div").attr("id")+"Frm";
			$("#"+id).toggle();
  		});
  		
  		// 댓글 수정
  		$(".umBtn").click(function(){
  			$(this).parent("div").parent("form").submit();
  		});
  		
  		// 댓글 수정 취소
  		$(".cmBtn").click(function(){
  			var id = $(this).parent("div").parent("form").attr("id");
			$("#"+id).hide();
  		});
  		
  		// 댓글 삭제
  		$(".dBtn").click(function(){
  			var no = $(this).parent("div").attr("id")
  			if(confirm("정말 삭제하시겠습니까?"))
  				location.href="../qnaBoard/repDelete.do?oriNo=${oriNo}&nowPage=${nowPage}&reNo="+no;
  		});
  	});
  </script>
</head>
<body>
<div class="container">
  <h2 align="center">상세보기</h2>
  	<table class="table table-dark table-striped">
    <tbody>
		<tr>
			<td>글번호</td>
			<td>${VIEW.no}</td>
			<td>제목</td>
			<td colspan="3">${VIEW.title}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="5">${VIEW.brContent}</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${VIEW.id}</td>
			<td>작성일</td>
			<td>${VIEW.wDate}</td>
			<td>조회수</td>
			<td>${VIEW.hit}</td>
		</tr>
    </tbody>
  </table>
  <div>
   	<button type="submit" class="btn btn-dark" id="rBtn" >답변하기</button>
   	<c:if test="${sessionScope.nick eq VIEW.id}">
	   	<button type="submit" class="btn btn-dark" id="uBtn" >수정하기</button>
	   	<button type="submit" class="btn btn-dark" id="dBtn" >삭제하기</button>
   	</c:if>
   	<button type="submit" class="btn btn-dark" id="lBtn" >목록으로</button>
  </div>
</div>
<br/>

<div class="container">
  <div class="jumbotron">
		<c:forEach items="${LIST}" var="data">
			<input type="hidden" name="reNo" value="${data.reNo}" />
			<c:if test="${data.reDepth ge 1}"><i class="material-icons" style=" margin-left: <c:out value='${data.reDepth * 20}'/>px;" >subdirectory_arrow_right</i></c:if>
		 	<c:if test="${data.depth eq 0}"><br/></c:if>
		 	<div class="card" style=" margin-left: <c:out value='${data.reDepth * 30}'/>px;">
			   <div class="card-header" id="${data.reNo}">
			     <strong class="card-text">${data.id}</strong>
			     <span>${data.reWDate}</span>
			     <button class="card-link btn btn-outline-secondary rBtn">답글달기</button>
			     <c:if test="${sessionScope.nick eq data.id}">
					 <button class="card-link btn btn-outline-secondary mBtn">수정하기</button>
					 <button class="card-link btn btn-outline-secondary dBtn">삭제하기</button>
			     </c:if>
			   </div>
			   <div class="card-body">
			      <strong class="card-text">${data.reContent}</strong>
			   </div>
			   <form id="${data.reNo}Frm" action="../qnaBoard/repUpdate.do" style="display:none;">
				  <input type="hidden" name="oriNo" value="${oriNo}" />
				  <input type="hidden" name="nowPage" value="${nowPage}" />
				  <input type="hidden" name="reNo" value="${data.reNo}" />
				  <div class="form-group">
				    <label for="reContent"></label>
				    <textarea class="form-control" rows="4" id="reContent" name="reContent">${data.reContent}</textarea>
				  <button type="button" class="btn btn-outline-secondary umBtn">수정</button>
				  <button type="button" class="btn btn-outline-secondary cmBtn">취소</button>
				  </div>
			   </form>
			   <form id="${data.reNo}Form" action="../qnaBoard/repRepWrite.do" style="display:none;">
				  <input type="hidden" name="oriNo" value="${oriNo}" />
				  <input type="hidden" name="nowPage" value="${nowPage}" />
				  <input type="hidden" name="reDepth" value="${data.reDepth}" />
				  <input type="hidden" name="reNo" value="${data.reNo}" />
				  <div class="form-group">
				    <label for="reContent"></label>
				    <textarea class="form-control" rows="4" id="reContent" name="reContent"></textarea>
				  <button type="button" class="btn btn-outline-secondary rrBtn">답글달기</button>
				  <button type="button" class="btn btn-outline-secondary crBtn">취소</button>
				  </div>
			   </form>
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

</div>
</body>
</html>