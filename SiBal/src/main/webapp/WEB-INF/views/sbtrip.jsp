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

</head>
<body>
<h2 align="center">추천 여행지</h2>
<table class="table table-dark">
      <tr>
      
      <c:forEach items="${LIST}" var="data">
      	<td>
			<img class="card-img-top" src="/sb/imgs/${data.oriName}" />
			 <div class="card-body">
				<h4 class="card-title"><a href="/sb/information/hitProc.do?oriNo=${data.no}&nowPage=1">${data.title2}</a></h4>
				<p class="card-text"><span class="far fa-calendar-check"> ${data.writeDate}</span> | <span class="fas fa-search"> ${data.hit}</span> | <span class="fas fa-heart"> ${data.good }</span></p>
			</div>
    	</td>
      </c:forEach>
      
      </tr><tr>
      
      <c:forEach items="${LIST1}" var="data">
      	<td>
			<img class="card-img-top" src="/sb/imgs/${data.oriName}" />
			 <div class="card-body">
				<h4 class="card-title"><a href="/sb/information/hitProc.do?oriNo=${data.no}&nowPage=1">${data.title2}</a></h4>
				<p class="card-text"><span class="far fa-calendar-check"> ${data.writeDate}</span> | <span class="fas fa-search"> ${data.hit}</span> | <span class="fas fa-heart"> ${data.good }</span></p>
			</div>
    	</td>
      </c:forEach>
      
      </tr>
</table>
</div>	
