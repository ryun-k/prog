<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<title>Document</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script>

	$(document).ready(function(){
			var	count = 1;
		
			//수정하기 버튼클릭시
			$("#mBtn").click(function(){
				
				if($("#title").val()==""){
		  			  alert("제목을 입력하지 않으셨습니다.");
		  		      $("#title").focus();
		  		      return;
		  			}
				
				if($("#body").val()==""){
		  			  alert("내용을 입력하지 않으셨습니다.");
		  		      $("#body").focus();
		  		      return;
		  			}
				
				$("#mfrm").submit();
			});
			
			
			$("#aBtn").click(function(){
				count++;
				if(count==6){
					alert("최대 5개까지 파일을 첨부할 수 있어요");
					count=5;
					return;
				}
				
				var div = "          ";
				div +="<div id='ggg'><input type='file' name='files' id='files"+count+"' class='img'><img id='siba' src='#' alt=' ' width='200' height='130'/></div>";
				
				$("#copy").before(div);
			});
			
			$("#dBtn").click(function(){
				if(count==1){
					alert("최소 1개는 있어야 합니다");
					return;
				}
				
				var div = $("#files"+count).parents("div#ggg");
				div.remove();
				count--;
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
	 <div class="container">
 		<form method="POST" action="../information/informationUpdateProc.do" 
			id="mfrm" encType="multipart/form-data">
		<input type="hidden" name="oriNo" value="${VIEW.no}" />
		<input type="hidden" name="nowPage" value="${nowPage}" />
<%--     	<div class="form-group">    
			<label for="writer">작성자</label>
 			<input class="form-control" type="text" name="writer" id="writer"> 
 		</div> --%>
  		<div class="form-group">
  			<label for="title">제목</label>
  			<input class="form-control" type="text" name="title" id="title" required="required" placeholder="제목을 입력해주세요" value="${VIEW.title }">
  		</div>
  		<div class="form-group">
  			<label for="body">내용</label>
  			<textarea class="form-control" name="body" id="body" rows="15" style="resize:none; margin:1px;">${VIEW.body }</textarea>
  		</div>
  		<div class="form-group">
  			<label for="f">첨부파일</label>
  				<input class="btn btn-primary" type="button" value="추가" id="aBtn">
  				<input class="btn btn-primary" type="button" value="삭제" id="dBtn">
  		</div>
  		<div id="ggg">
  			<label for="files">첨부파일</label>
  			<input type="file" name="files" id="files" class="img"/>
  			<img id="siba" src="#" alt=" " width="200" height="130"/>
  		</div>		
  		<div class="form-group" id="copy" align="center">
  				<input class="btn btn-primary" type="button" id="mBtn" value="글쓰기" />
  		</div>
  </form>
  </div>		 
</body>
</html>









