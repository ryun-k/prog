<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>writeForm</title>

 	
 	<script type="text/javascript">
 	
 	  $( function() {
	    $( "#startDate" ).datepicker();
        $( "#startDate" ).datepicker( "option", "dateFormat", "yy-mm-dd" ).datepicker('setDate', '${DATA.startDate}');
        $( "#endDate" ).datepicker();
        $( "#endDate" ).datepicker( "option", "dateFormat", "yy-mm-dd" ).datepicker('setDate', '${DATA.endDate}');
 	 } );


 	</script>
</head>
<body>
<div class="container">
  <h1>writeForm</h1>
  <form class="form-horizontal" action="../notice/modifyProc.do" method="get">
  	<input type="hidden" id="oriNo" name="oriNo" value="${DATA.no }"/>
  	<input type="hidden" id="nowPage" name="nowPage" value="${nowPage }"/>
  	 
    <div class="form-group">
      <label class="control-label col-sm-2" >제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="title" name="title" value="${DATA.title}" />
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용</label>
      <div class="col-sm-10">          
        <textarea type="text" class="form-control" id="content" name="content">${DATA.brBody}</textarea>
      </div>
    </div>
    
	<div class="form-group">
      <label class="control-label col-sm-2" >시작일</label>
      <div class="col-sm-10">          
		<input type="text" class="form-control"  id="startDate" name="startDate" size="30"  />
      </div>
      <label class="control-label col-sm-2" >종료일</label>
      <div class="col-sm-10">          
		<input type="text" class="form-control"  id="endDate"  name="endDate" size="30" />
      </div>
    </div> 
       
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="isshow" value="Y" >공개</label>
        </div>
      </div>
    </div>
        <button type="submit" class="btn btn-primary">수정하기</button>
  </form>
</div>

</body>
