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
		setTimeout(function(){
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
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201801.png'>")
					break;
				case 1:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_02.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201802.png'>")
					break;
				case 2:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_03.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201803.png'>")
					break;
				case 3:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_04.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201804.png'>")
					break;
				case 4:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_05.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201805.png'>")
					break;
				case 5:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_06.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201806.png'>")
					break;
				case 6:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_07.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201807.png'>")
					break;
				case 7:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_08.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201808.png'>")
					break;
				case 8:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_09.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201809.png'>")
					break;
				case 9:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_10.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201810.png'>")
					break;
				case 10:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_11.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201811.png'>")
					break;
				case 11:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2018_12.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201812.png'>")
					break;
				case 12:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_01.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201901.png'>")
					break;
				case 13:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_02.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201902.png'>")
					break;
				case 14:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_03.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201903.png'>")
					break;
				case 15:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_04.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201904.png'>")
					break;
				
				case 16:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_04.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201904.png'>")
					break;
				
				case 17:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_04.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201904.png'>")
					break;
				
				case 18:
					$("#graph").html("<img src='${pageContext.request.contextPath}/img/jeju_2019_04.png'>")
					$("#graph1").html("<img src='${pageContext.request.contextPath}/img/jeju201904.png'>")
					break;
				
				}
			}
		})
		},3000);
	})
	
	
	$("#wBtn").click(function(){
		
		$("#bar").html("<img src='${pageContext.request.contextPath}/img/ajax-loader.gif'>")
		setTimeout(function(){
		$.ajax({
			type:"POST",
			url:"../graph/pie.do",
			data:{
				"no":$("#year option:selected").val()
			},
			success:function(data){
				
				switch (data){
				case 16:
					$("#bar").html("<img src='${pageContext.request.contextPath}/img/2019jeju.png'>")
					$("#bar1").html("<img src='${pageContext.request.contextPath}/img/jeju2019.png'>")
					break;
				case 17:
					$("#bar").html("<img src='${pageContext.request.contextPath}/img/2018jeju.png'>")
					$("#bar1").html("<img src='${pageContext.request.contextPath}/img/jeju2018.png'>")
					break;
				case 18:
					$("#bar").html("<img src='${pageContext.request.contextPath}/img/2017jeju.png'>")
					$("#bar1").html("<img src='${pageContext.request.contextPath}/img/jeju2017.png'>")
					break;
				}
			}
		})
		},3000);
	})
	
	
});

</script>
<style type="text/css">
#graph{
position:left;
}
#graph > img{
width:640px;
height:480px;
}
#bar{
position:left;
}
#bar > img{
width:640px;
height:480px;
}
#graph1{
position:center;
}
#graph1 > img{
width:1000px;
}
#bar1{
position:center;
}
#bar1 > img{
width:1000px;
}
</style>
</head>
<body>
<div class="container">
<div class="row">
<div></div>
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
<option value="13">2019년2월</option>
<option value="14">2019년3월</option>
<option value="15">2019년4월</option>
</select>
</div>
<div align="right">
<input type="button" id="sBtn" name="graph" value="외국인 관광객 통계보기" class="btn btn-outline-success">
</div>
</div>
<hr/>
<br/>
<div class="row">
<div class="col-4"></div>
<div id="graph"><h3>보고 싶은  연,월을 선택하고 통계보기 버튼을 눌러주세요</h3></div>
</div>
<<<<<<< HEAD
<br/>
<br/>
<div class="row">
<div class="col-3"></div>
<div id="graph1"></div>
</div>

<br/>
<br/>
<br/>
<hr/>

<div class="container">
<div class="row">
<div></div>
<select name="year" id="year">
<option value="16">2019년</option>
<option value="17">2018년</option>
<option value="18">2017년</option>
</select>
</div>
<div align="right">
<input type="button" id="wBtn" name="graph" value="국내 관광객 통계보기" class="btn btn-outline-success">
</div>
</div>
<hr/>
<br/>

<div class="row">
<div class="col-4"></div>
<div id="bar"><h3>보고 싶은 통계의 년도를 선택하고 통계보기 버튼을 눌러주세요</h3></div>
</div>
<br/>
<br/>
<br/>
<div class="row">
<div class="col-3"></div>
<div id="bar1"></div>
</div>

<br/>
<br/>
<br/>
<br/>
<br/>

=======
<br/><br/>
>>>>>>> branch 'master' of https://github.com/ryun-k/prog.git
</body>
</html>