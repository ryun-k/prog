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
			var	count = 1;
		
			//수정하기 버튼클릭시
			$("#mBtn").click(function(){
				//	무결성 검사하고
				
				$("#mfrm").submit();
			});
			
			
			//삭제 버튼클릭시
			$("#dBtn").click(function(){
				if(count == 1) {
					alert("한개는 반드시 있어야 합니다.");
					return;
				}
				//	할일
				//	현재  마지막 count 번호를 가진 tr을 구한다.
				var		tr = $("#files" + count).parents("tr");
				tr.remove();
				count--;
			});
			
			
			//추가 버튼 클릭시
			$("#aBtn").click(function(){
				//	할일
				//	추가할 폼을 만든다.
				count++;
				if(count == 6) {
					alert("5개 이상은 추가할 수 없습니다.");
					count = 5;
					return;
				}
				var	tr = "<tr><td>첨부파일</td>";
				tr += "<td><input type='file' name='files' id='files"+count+"' class='img'><img id='siba' src='#' alt=' ' width='200' height='130'/></td></tr>";
				
				//	원하는 위치에 붙인다.
				$("#copy").before(tr);
			});
		});
	
		$(document).ready(function(){ 
			function readURL(input) { 
				var files = event.target.files;
				for(var i=0; i<files.length; i++){
				if (input.files && input.files[i]) {
					var reader = new FileReader(); 
					reader.onload = function (e) { 
						$('#siba').attr('src', e.target.result);
					} 
					reader.readAsDataURL(input.files[i]); 
					}
				}
				}
				$(".img").change(function(){ 
					readURL(this); 
			}); 
		});

	
	</script>
</head>
<body>
	<form method="POST" action="../information/informationUpdateProc.do" 
			id="mfrm" encType="multipart/form-data">
		<input type="hidden" name="oriNo" value="${VIEW.no}" />
		<input type="hidden" name="nowPage" value="${nowPage}" /> <%--릴레이용--%>
		<table width="800" border="1" align="center">
			<tr>
				<td>글쓴이</td>
				<td><input type="text" name="writer" id="writer"></td>
			</tr>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" id="title" value="${VIEW.title }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="body" id="body">${VIEW.body}</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="button" value="추가" id="aBtn">
					<input type="button" value="삭제" id="dBtn">
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="files" id="files" class="img"/>
	  				<img id="siba" src="#" alt=" " width="200" height="130"/>
				</td>
			</tr>
			<tr id="copy">
				<td colspan="2" align="center">
					<input type="button" id="mBtn" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>









