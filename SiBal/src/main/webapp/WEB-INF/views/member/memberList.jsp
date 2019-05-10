<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>member</title>
</head>
<body>
<h1>member</h1>
사용자 정보 불러 오기.
<form>
	<table id=member, border="1", width="1000">
		<tr>
			<th>아이디</th>
			<th>패스워드</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>생일</th>
			<th>성별</th>
			<th>회원상태</th>
			<th>가입일</th>
			<th>로그인시간</th>
			<th>체크</th>
			<th>사진</th>
		</tr>
		<c:forEach items="${LIST}" var="LIST">
		<tr>
			<td>${LIST.id} </td>
			<td>${LIST.pw} </td>
			<td>${LIST.name} </td>
			<td>${LIST.nick} </td>
			<td>${LIST.birth} </td>
			<td>${LIST.gender} </td>
			<td>${LIST.state} </td>
			<td>${LIST.joinDate} </td>
			<td>${LIST.loginDate} </td>
			<td>${LIST.check1} </td>
			<td>${LIST.photo} </td>
		</tr>
	</c:forEach>
	
	</table>

</form>

<br/>
<a href="/sb"><button>메인으로</button></a>
</body>
</html>