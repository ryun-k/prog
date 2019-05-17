<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#gopicker" ).datepicker();
    $( "#backpicker" ).datepicker();
  });
  
  </script>
<title>Home</title>
</head>
<body>

<h2>편도</h2>
<form action="goAir.do" method="post">
	출발 : <input type="text" name="depAirportNm"><br/>
	도착 : <input type="text" name="arrAirportNm"><br/>
	가는날 : <input type="text" id="gopicker" name="depPlandTime"><br/>
	<input type="submit" value="확인">
</form>

<h2>오는항공편</h2>
<form action="backAir.do" method="post">
	출발 : <input type="text" name="depAirportNm"><br/>
	도착 : <input type="text" name="arrAirportNm"><br/>
	가는날 : <input type="text" id="gopicker" name="depPlandTime"><br/>
	오는날 : <input type="text" id="backpicker" name="arrPlandTime"><br/>
	<input type="submit" value="확인">
</form>
</body>
</html>