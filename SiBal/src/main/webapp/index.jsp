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
<a href='../sb/airport/airportForm.do'>비행기표 확인</a>
=======
<h1>임시메인</h1><br><br>

<a href='../sb/airport/airportForm.do'>비행기표 확인</a><br/><br/>

<c:choose> 
    <c:when test="${not empty sessionScope.nick }">    
        <li><a href="../sb/member/logoutProc.do"><button>로그아웃</button></a><br/><br/></li>
        <li><a href="../sb/member/modifyForm.do"><button>회원정보수정</button></a><br/><br/></li>
        <li><a href="#"><button>회원탈퇴</button></a><br/><br/></li>
        <%
	  String nick = (String)session.getAttribute("nick");
        %>
        <li>
        <%=nick %>(으)로 접속중.
        </li>
    </c:when>
    <c:otherwise>   
        <li><a href="../sb/member/loginForm.do"><button>로그인</button></a><br/><br/></li>
        <li><a href="../sb/member/signUp.do"><button>회원가입</button></a><br/><br/></li>
    </c:otherwise>                  
</c:choose>


>>>>>>> branch 'master' of https://github.com/ryun-k/prog.git
</body>
</html>