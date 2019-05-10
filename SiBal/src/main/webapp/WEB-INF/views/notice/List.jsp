<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
	<title>list</title>
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>*공지사항*</h2>
  <table class="table table-hover">
    <thead>
      <tr>
        <th>NO</th>
        <th>TITLE</th>
        <th>HIT</th>
        <th>DATE</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${LIST }" var="data">
      <tr>
        <td>${LIST.no }</td>
        <td>${LIST.title }</td>
        <td>${LIST.hit }</td>
        <td>${LIST.wDate }</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

</body>
</html>