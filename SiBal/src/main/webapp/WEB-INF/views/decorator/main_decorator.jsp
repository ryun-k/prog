<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<title>
    	<decorator:title default="" />
	</title>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
 
 	<script type="text/javascript">
 	$(function(){
 		var pathname = $(location).attr('pathname'); //uri pathname 값 가져오기 

 		var nav1 = $('#nav1 > a').attr('href');		//nav 이동경로 가져오기
		var nav2 = $('#nav2 > a').attr('href');
 		
		var nav3 = $('#nav3 > a').attr('href');		
		var nav3_1 = $('#nav3_1 > a').attr('href');		
		var nav3_2 = $('#nav3_2 > a').attr('href');
		
		var nav4 = $('#nav4 > a').attr('href');		
		var nav5 = $('#nav5 > a').attr('href');		
		
		//네비 클릭 활성화
		if(pathname == nav1){
			$('#nav1').addClass('active');
		}
		if(pathname == nav2){
			$('#nav2').addClass('active');
		}
		if(pathname == nav3||pathname == nav3_1||pathname == nav3_2){
			$('#nav3').addClass('active');
		}
		if(pathname == nav4){
			$('#nav4').addClass('active');
		}
		if(pathname == nav5){
			$('#nav5').addClass('active');
		}
		
		//창크기 가져오기
		var imgW=$(window).outerWidth();
		var h=$("#nav").outerHeight();
		$('#mainimg').css('width',imgW);
		$('body').css('margin-top', h);
		//창 크기변화에 따른 수정
		$(window).resize(function(){
			var h=$("#nav").outerHeight();
			$('body').css('margin-top', h);
			var imgW=$(window).outerWidth();
			$('#mainimg').css('width',imgW);
		});
		
 	});
 	$(function(){
 		  $(".mr-auto li").hover(function(){
 		    $('ul:first',this).show();
 		  }, function(){
 		    $('ul:first',this).hide();
 		  });
 	});	  
 	</script>
 	<style type="text/css">
 	#body{
 		margin-top: 56px;
 	}
 	#mainimg{
 	}
 	.mr-auto ul {
	  background: #333333;
	  border: 1px solid;
	  display: none;
	  padding: 0;
	  position: absolute;
	  left: 0;
	  top: 100%;
	  width: 180px;
	}
	.mr-auto ul li { float: none; }
	.mr-auto li {
	  float: left;
	  list-style:none;
	  position: relative;
	}
	.mr-auto a {
	  display: block;
	  padding: 10px 20px;
	  text-decoration: none;
	}
 	</style>


 	
 	<decorator:head />
 	

</head>
<body>
	<nav id="nav" class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="/sb/sbtrip.do">시ː발</a>
	  <!-- Links -->
		<ul class="navbar-nav mr-auto">
	   		<li class="nav-item" id="nav1">
	   			<a class="nav-link" href="/sb/notice/List.do">공지사항</a>
	   		</li>
		    <li class="nav-item" id="nav2">
		    	<a class="nav-link" href="/sb/airport/airportForm.do">티켓 예매</a>
		    </li>
		    <li class="nav-item" id="nav3">
		    	<a class="nav-link" href="#">여행 정보<i class='fa fa-angle-down'></i></a>
		    	<ul class="submenu"> 
			       	<li class="nav-item" id="nav3_1">
			    		<a class="nav-link" href="/sb/information/informationList.do">관광지</a>
		    		</li> 
			    	<li class="nav-item" id="nav3_2">
			    		<a class="nav-link" href="/sb/graph/graph.do">관광통계</a>
			    	</li> 
		    	</ul>
		    </li>
		    <li class="nav-item" id="nav4">
		    	<a class="nav-link" href="/sb/qnaBoard/qnaList.do">Q&A</a>
		    </li>
		    <c:if test="${sessionScope.UID eq 'admin'}">
		    <li class="nav-item" id="nav5">
		    	<a class="nav-link" href="/sb/admin/list.do">회원관리</a>
		    </li>
		    </c:if>
		</ul>
		
		
		<ul class="navbar-nav ml-auto">
		  <!-- 로그인 x  -->
		  <c:if test="${empty sessionScope.UID}">
			  <li class="nav-item dropdown">
			    <a class="nav-link" href="/sb/member/loginForm.do">
			    <i class='fas fa-power-off' style='font-size:14px'></i> Login</a>
			  </li>
		  </c:if> 
		  
		  <!-- 로그인 o  -->
		  <c:if test="${not empty sessionScope.UID}">
		  	<li class="nav-item dropdown">	
			  	<a class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">
				    <i class='fas fa-align-justify' style='font-size:20px'></i>
			  	</a>
		  	 <div class="dropdown-menu bg-dark">
		        <a class="nav-link" href="/sb/member/infoForm.do">회원정보 수정</a>
		        <a class="nav-link" href="/sb/airport/rConfirm.do">예매 확인</a>
	     	 </div>	  	 
		  	</li>
			<li class="nav-item">  
				<% String nick = (String)session.getAttribute("nick");%>
				<a class="nav-link" ><%=nick %> 님 환영합니다.</a>
			</li>
			<li class="nav-item">		  	
			    <a class="nav-link" href="/sb/member/logoutProc.do">
			    <i class='fas fa-power-off' style='font-size:14px'></i> Logout</a>
		  	</li>
		  </c:if>
		    
		</ul>
	</nav>	
	<img id="mainimg" src="/sb/img/SibalTrip.png" />
	
	
	<div id="body">
        <decorator:body />
	</div>
</body>
</html>



