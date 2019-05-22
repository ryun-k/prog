<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>그래프 보여주기</title>
<script>
$(document).ready(function(){
	$("#sBtn").click(function(){
		$("#graph").html("<img src='${pageContext.request.contextPath}/img/ajax-loader.gif'>")
		$.ajax({
			type:"POST",
			url:"../graph/pie.do",
			data:{
				"no":$("#month option:selected").val()
				
			},
			success:function(data){
				
				switch (data){
				case 0:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_01.png'>")
					break;
				case 1:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_02.png'>")
					break;
				case 2:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_03.png'>")
					break;
				case 3:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_04.png'>")
					break;
				case 4:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_05.png'>")
					break;
				case 5:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_06.png'>")
					break;
				case 6:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_07.png'>")
					break;
				case 7:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_08.png'>")
					break;
				case 8:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_09.png'>")
					break;
				case 9:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_10.png'>")
					break;
				case 10:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_11.png'>")
					break;
				case 11:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_12.png'>")
					break;
				case 12:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_01.png'>")
					break;
				case 13:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_02.png'>")
					break;
				case 14:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_03.png'>")
					break;
				case 15:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_04.png'>")
					break;
				}
			}
		})
	})
});

</script>
</head>
<body>

<select name="month" id="month">
<option value="0">2018년1월</option>
<option value="1">2018년2월</option>
<option value="2">2018년3월</option>
<option value="3">2018년4월</option>
<option value="4">2018년5월</option>
<option value="5">2018년6월</option>
<option value="6">2018년7월</option>
<option value="7">2018년8월</option>
<option value="8">2018년9월</option>
<option value="9">2018년10월</option>
<option value="10">2018년11월</option>
<option value="11">2018년12월</option>
<option value="12">2019년1월</option>
<option value="13">2019년2월</option>
<option value="14">2019년3월</option>
<option value="15">2019년4월</option>
</select>
<input type="button" id="sBtn" name="graph" value="외국인 관광객 통계보기">
<hr/>
<br/>
<div id="graph"></div>
<%-- <img src='${pageContext.request.contextPath}/img/jeju_2018_01.png'> --%>
</body>
</html>