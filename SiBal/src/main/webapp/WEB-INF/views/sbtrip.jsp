<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>시ː발  始發</title>
<meta charset="utf-8">	
<meta name="viewport" content="width=device-width, initial-scale=1">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>	
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>	
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
//목록 클릭 시 뷰페이지 이동
	$(function(){
		
		$('#list > td').click(function(){
			var no = $(this).attr('id');
			$(location).attr("href","/sb/information/hitProc.do?oriNo="+no+"&nowPage=1");
		}); 
		$('#list1 > td').click(function(){
			var no = $(this).attr('id');
			$(location).attr("href","/sb/information/hitProc.do?oriNo="+no+"&nowPage=1");
		}); 
	
		
		//데이트픽커 포멧
		$( "#inputTime" ).datepicker();
        $( "#inputTime" ).datepicker( "option", "dateFormat", "yymmdd" );
        $( "#inputTime" ).val($.datepicker.formatDate('yymmdd', new Date()));

		
        //체인지버튼 화면크기에 따른 배치변경
        $(window).resize(function(){
        	if($(window).width()<560){
        		$('#change').addClass('col-sm');
        	}else{
        		$('#change').removeClass('col-sm');
        	}
        	
        });
       	if($(window).width()<560){
       		$('#change').addClass('col-sm');
       	}else{
       		$('#change').removeClass('col-sm');
       	}
        
       	//change 버튼 클릭시
       	$('#change').click(function(){
       		
       		var inputDep=$('#inputDep').val();
       		var inputArr=$('#inputArr').val();
       		
       		$('#inputDep').val(inputArr);
       		$('#inputArr').val(inputDep);
       		
       		
       	});
       	
	});
</script>
<style type="text/css">
	.back{
		margin-bottom:50px;
		padding: 50px;
		background-size: cover;
		background-image: url("/sb/img/canada-lake-feb.jpg");
	}
	

</style>
</head>
<body>

<div class="container-fluid back">
            <h2 class="card-title text-center text-white" style="margin-bottom:30px">티켓 검색</h2>
            <form class="form-signin" action="/sb/airport/pAir.do" method="post">
              <div class="container-fluid">
				    <div class="row">
				      <div class="col-sm ">
				       <select class="form-control" name="depAirportNm" id="inputDep">
								    <option>출발지</option>
								    <option>광주</option>
									<option>군산</option>
									<option>김포</option>
									<option>김해</option>
									<option>대구</option>
									<option>무안</option>
									<option>양양</option>
									<option>여수</option>
									<option>원주</option>
									<option>울산</option>
									<option>인천</option>
									<option>제주</option>
									<option>포항</option>
									<option>청주</option>
								  </select>
				      </div>
				      <div id="change" align="center">
					      <i class='fas fa-exchange-alt' style='font-size:35px;color:white'></i>
				      </div>
				      <div class="col-sm ">
				       <select class="form-control" name="arrAirportNm"  id="inputArr">
								    <option>도착지</option>
								    <option>광주</option>
									<option>군산</option>
									<option>김포</option>
									<option>김해</option>
									<option>대구</option>
									<option>무안</option>
									<option>양양</option>
									<option>여수</option>
									<option>원주</option>
									<option>울산</option>
									<option>인천</option>
									<option>제주</option>
									<option>포항</option>
									<option>청주</option>
								  </select>
				      </div>
				      <div class="col-sm ">
				      <input type="text" id="inputTime" name="depPlandTime" class="form-control" autocomplete="off" placeholder="출발일" required>
				      
				      </div>
				      <div class="col-sm ">          
			              <button class="btn btn-lg btn-dark btn-block" type="submit">검색</button>
		              </div>
				    </div>
				  </div>
            </form>
</div>


<table class="table table-dark">
<h2 align="center">추천 여행지</h2>
	<tbody>
      <tr id="list" align="center">
      
      <c:forEach items="${LIST}" var="data">
      	<td id="${data.no}">
			<img class="card-img-top img" src="/sb/imgs/${data.oriName}" />
			 <div class="card-body">
				<h4 class="card-title">${data.title2}</h4>
				<p class="card-text"><span class="far fa-calendar-check"> ${data.writeDate}</span> | <span class="fas fa-search"> ${data.hit}</span> | <span class="fas fa-heart"> ${data.good }</span></p>
			</div>
    	</td> 
      </c:forEach>
      
      </tr>
      <tr id="list1" align="center">
      
      <c:forEach items="${LIST1}" var="data">
      	<td id="${data.no}">
			<img class="card-img-top img" src="/sb/imgs/${data.oriName}" />
			 <div class="card-body">
				<h4 class="card-title">${data.title2}</h4>
				<p class="card-text"><span class="far fa-calendar-check"> ${data.writeDate}</span> | <span class="fas fa-search"> ${data.hit}</span> | <span class="fas fa-heart"> ${data.good }</span></p>
			</div>
    	</td>
      </c:forEach>
      
      </tr>
	</tbody>
</table>
</div>	
