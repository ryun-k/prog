<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<<<<<<< HEAD
<h1>SiBal</h1><br><br>
<a href='../sb/airport/airportForm.do'>�����ǥ Ȯ��</a>
=======
<h1>�ӽø���</h1><br><br>

<a href='../sb/airport/airportForm.do'>�����ǥ Ȯ��</a><br/><br/>

<c:choose> 
    <c:when test="${not empty sessionScope.nick }">    
        <li><a href="../sb/member/logoutProc.do"><button>�α׾ƿ�</button></a><br/><br/></li>
        <li><a href="../sb/member/modifyForm.do"><button>ȸ����������</button></a><br/><br/></li>
        <li><a href="#"><button>ȸ��Ż��</button></a><br/><br/></li>
        <%
	  String nick = (String)session.getAttribute("nick");
        %>
        <li>
        <%=nick %>(��)�� ������.
        </li>
    </c:when>
    <c:otherwise>   
        <li><a href="../sb/member/loginForm.do"><button>�α���</button></a><br/><br/></li>
        <li><a href="../sb/member/signUp.do"><button>ȸ������</button></a><br/><br/></li>
    </c:otherwise>                  
</c:choose>


>>>>>>> branch 'master' of https://github.com/ryun-k/prog.git
</body>
</html>