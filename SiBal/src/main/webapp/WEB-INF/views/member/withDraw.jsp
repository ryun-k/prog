<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>권한 없음</title>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#cBtn").click(function(){
			$(location).attr("href","../");
		})
	});
</script>
</head>
<body>
<h1>사이트 이용 권한이 없습니다.</h1>

<input type = "button" value="메인으로" id="cBtn">
</body>
</html>