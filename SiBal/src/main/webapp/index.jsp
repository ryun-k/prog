<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�â���  �ۡ</title>

<style type="text/css">

	.main-img{
		height:200px;
		background-image: url("/sb/img/canada-lake-feb.jpg");
		background-size: cover;
	}

</style>

</head>
<body>
<div class="main-img"></div>



<h1>�ӽø���</h1><br><br>


<a href='/sb/notice/List.do'>��������</a><br/><br/>

<a href='../sb/airport/airportForm.do'>�����ǥ Ȯ��</a><br/><br/>


<a href='/iedu/airportForm.do'>�����ǥ Ȯ��</a><br/><br/>
<a href="../sb/qnaBoard/qnaList.do"><button>��������Ʈ</button></a><br/><br/>

<c:choose> 
    <c:when test="${not empty sessionScope.nick }">    
        <li><a href="../sb/member/logoutProc.do"><button>�α׾ƿ�</button></a><br/><br/></li>
        <li><a href="../sb/member/modifyForm.do"><button>ȸ����������</button></a><br/><br/></li>
        <li><a href="../sb/member/withdrawForm.do"><button>ȸ��Ż��</button></a><br/><br/></li>
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

<a href="../sb/information/informationList.do">��</a><br/><br/>

<a href="../sb/member/memberList.do"><button>�������Ʈ</button></a><br/><br/>
<a href="../sb/member/test.do"><button>�׽�Ʈ</button></a><br/><br/>
</body>
</html>