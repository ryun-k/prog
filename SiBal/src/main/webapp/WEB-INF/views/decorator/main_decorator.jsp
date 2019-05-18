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
 	
 	<decorator:head />
 	
</head>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <!-- Brand/logo -->
	  <a class="navbar-brand" href="/sb">시ː발</a>
	  <!-- Links -->
		<ul class="navbar-nav mr-auto">
   		<li class="nav-item active">
     		 <a class="nav-link" href="/sb/notice/List.do">공지사항</a>
   		</li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">Left Link 2</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">Left Link 2</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="#">Left Link 2</a>
	    </li>
		</ul>
		
		<ul class="navbar-nav ml-auto">
		  <li class="nav-item">
		  <c:if test="${empty sessionScope.UID}">
		    <a class="nav-link" href="/sb/member/loginForm.do">
		    <i class='fas fa-power-off' style='font-size:14px'></i>Login</a>
		  </c:if>
		  <c:if test="${not empty sessionScope.UID}">
		  	<li class="nav-item">  <% String nick = (String)session.getAttribute("nick");%>
		  	<a class="nav-link" href="/sb/member/infoForm.do"><%=nick %> 님 환영합니다.</a>
		  	</li>
		    <a class="nav-link" href="/sb/member/logoutProc.do">
		    <i class='fas fa-power-off' style='font-size:14px'></i>Logout</a>
		  </c:if>
		    
		  </li>
		</ul>
	</nav>	
        <decorator:body />
</body>
</html>



