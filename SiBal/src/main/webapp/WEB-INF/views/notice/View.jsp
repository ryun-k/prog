<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
	<title>View</title>

 	<script type="text/javascript">
 	$(function(){
 		$('#lBtn').click(function(){
 			$(location).attr("href","../notice/List.do?nowPage=${nowPage}");
 		});
 		$('#mBtn').click(function(){
 			$(location).attr("href","../notice/modifyForm.do?oriNo=${VIEW.no}&nowPage=${nowPage}");
 		});
 		$('#dBtn').click(function(){
 			$(location).attr("href","../notice/delete.do?oriNo=${VIEW.no}&nowPage=${nowPage}");
 		});
 	});
 	
 	
 	</script>
</head>
<body>

<div class="container">
  <table class="table table-bordered">
    <tbody>
      <tr>
        <td width="10%">제목</td>
        <td>${VIEW.title }</td>
      </tr>
      <tr>
        <td width="10%">내용</td>
        <td>${VIEW.brBody }</td>
      </tr>
      <tr>
       
      </tr>
    </tbody>
  </table>
   <div class="btn btn-primary" id="lBtn">목록보기</div>
   <div class="btn btn-primary" id="mBtn">수정하기</div>
   <div class="btn btn-primary" id="dBtn">삭제하기</div>
</div>

</body>
