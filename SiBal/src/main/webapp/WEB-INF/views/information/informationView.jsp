<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			
			//목록보기 버튼 클릭시
			$("#lBtn").click(function(){
				//     <input type="checkbox" checked="checked">
				//jQuery의 attr()는 HTML속성을 다루는 함수   $('input').attr("checked")
				//참고          prop()는 javascript에서 속성을 다루는 함수   $('input').prop("checked")
				$(location).attr("href","../information/informationList.do?nowPage=${nowPage}");
			});
			
			//수정하기 버튼 클릭시
			$("#mBtn").click(function(){
				//수정을 하기위한 폼보여주기
				$(location).attr("href","../information/informationUpdateForm.do?No=${VIEW.no}&nowPage=${nowPage}")
			});
			
			//삭제하기 버튼 클릭시
			$("#dBtn").click(function(){
				
			});
			
		});
	</script>
</head>
<body>
	<table border="1" width="800" align="center">
		<tr>
			<td width="100">글번호</td>
			<td>${VIEW.no}</td>
		</tr>
		<tr>
			<td width="100">글쓴이</td>
			<td>${VIEW.writer}</td>
		</tr>
		<tr>
			<td width="100">작성일</td>
			<td>${VIEW.writeDate}</td>
		</tr>
		<tr>
			<td width="100">조회수</td>
			<td>${VIEW.hit}</td>
		</tr>
		<tr>
			<td width="100">제목</td>
			<td>${VIEW.title}</td>
		</tr>
		<tr>
			<td>본문</td>
			<td>${VIEW.body}</td>
		</tr>
		<tr>
			<td>뀨</td>
			<td>${VIEW.files}</td>
		</tr>
	</table>
	<!-- 	기타 기능 만들고	-->
	<table width="800" border="1" align="center">
		<tr>
			<td>
				<input type="button" id="lBtn" value="목록보기"/>
				<%-- 수정과 삭제기능은 글작성한 로그인 유저만 가능하도록 하겠다.
					 만약 로그인한 사용자인지 확인하고싶다면 
					<c:if test="${ not empty sessionScope.UID }"></c:if> 
				--%>
<%-- 				<c:if test="${sessionScope.UID eq VIEW.id}"> --%>
				<input type="button" id="mBtn" value="수정하기"/>
				<input type="button" id="dBtn" value="삭제하기"/>
<%-- 				</c:if> --%>
			</td>
		</tr>
	</table>
	

</body>
</html>




