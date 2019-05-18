<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>시ː발  始發</title>

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



<h1>임시메인</h1><br><br>


<a href='/sb/notice/List.do'>공지사항</a><br/><br/>

<a href='../sb/airport/airportForm.do'>비행기표 확인</a><br/><br/>


<a href='/iedu/airportForm.do'>비행기표 확인</a><br/><br/>
<a href="../sb/qnaBoard/qnaList.do"><button>질문리스트</button></a><br/><br/>

<c:choose> 
    <c:when test="${not empty sessionScope.nick }">    
        <li><a href="../sb/member/logoutProc.do"><button>로그아웃</button></a><br/><br/></li>
        <li><a href="../sb/member/modifyForm.do"><button>회원정보수정</button></a><br/><br/></li>
        <li><a href="../sb/member/withdrawForm.do"><button>회원탈퇴</button></a><br/><br/></li>
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

<a href="../sb/information/informationList.do">뀨</a><br/><br/>

<a href="../sb/member/memberList.do"><button>멤버리스트</button></a><br/><br/>
<a href="../sb/member/test.do"><button>테스트</button></a><br/><br/>
</body>
</html>