<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script 
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	$("#sBtn").click(function(){
		if($("#pw").val()==0||$("#pw1").val()==0){
			alert('��й�ȣ�� �Է����ּ���')
		}else if($("#pw").val()!=$("#pw1").val()){
			alert("��й�ȣ�� ���� �ٸ��ϴ�.")
		}else{
			$("#codeForm").submit();
		}
	});
});
</script>
</head>
<body>
<h1>���Ϲ߼��� �Ϸ� �Ǿ����ϴ�.<br/>
�����ڵ带 �Է����ּ���.<br/> 
</h1>
<form id="codeForm" method="POST" action="../member/modifyPw.do">
<table width ="500" border="1" align="center">

<tr>
<td>�߼� �ڵ� </td>

<td><input type="text" id="check" name="check" required="required"></td>
</tr>
<tr>
<td>�̸���</td>
<td><input type="text" id="email" name="email" required="required"></td>
</tr>
<tr>
<td>���������� ��� ��ȣ</td>
<td><input type="password" id="pw" name="pw" required="required"></td>
</tr>
<tr>

<td>��� ��ȣ �� Ȯ��</td>
<td><input type="password" id="pw1" name="pw1" required="required"></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" id="sBtn" value="��й�ȣ �����ϱ�"></td>
</tr>
</table>
</form>
</body>
</html>