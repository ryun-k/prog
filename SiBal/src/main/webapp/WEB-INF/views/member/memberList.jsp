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
����� ���� �ҷ� ����.
<form>
	<table id=member, border="1", width="1000">
		<tr>
			<th>���̵�</th>
			<th>�н�����</th>
			<th>�̸�</th>
			<th>�г���</th>
			<th>����</th>
			<th>����</th>
			<th>ȸ������</th>
			<th>������</th>
			<th>�α��νð�</th>
			<th>üũ</th>
			<th>����</th>
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
<a href="/sb"><button>��������</button></a>
</body>
</html>