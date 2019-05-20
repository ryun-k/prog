<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<style type="text/css">
        ul.tabs {
            margin: 0;
            padding: 0;
            float: left;
            list-style: none;
            height: 32px; /*--Set height of tabs--*/
            border-bottom: 1px;
            border-left: 1px;
            width: 100%;
        }
        ul.tabs li {
            float: left;
            margin: 0;
            padding: 0;
            height: 31px; /*--Subtract 1px from the height of the unordered list--*/
            line-height: 31px; /*--Vertically aligns the text within the tab--*/
            border: 1px;
            border-left: none;
            margin-bottom: -1px; /*--Pull the list item down 1px--*/
            overflow: hidden;
            position: relative;
            background: #e0e0e0;
        }
        ul.tabs li a {
            text-decoration: none;
            color: #000;
            display: block;
            font-size: 1.2em;
            padding: 0 20px;
            border: 1px solid #fff; 
            outline: none;
        }
        ul.tabs li a:hover {
            background: #ccc;
        }
        html ul.tabs li.active, html ul.tabs li.active a:hover  {
            background: #fff;
            border-bottom: 1px solid #fff; 
        }

        .tab_container {
            border: 1px solid #999;
            border-top: none;
            overflow: hidden;
            clear: both;
            float: left; 
            width: 100%;
            background: #fff;
        }
        .tab_content {
            padding: 20px;
            font-size: 1.2em;
        }
    </style>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $(document).ready(function() {

      //When page loads...
      $(".tab_content").hide(); //Hide all content
      $("ul.tabs li:first").addClass("active").show(); //Activate first tab
      $(".tab_content:first").show(); //Show first tab content

      //On Click Event
      $("ul.tabs li").click(function() {

          $("ul.tabs li").removeClass("active"); //Remove any "active" class
          $(this).addClass("active"); //Add "active" class to selected tab
          $(".tab_content").hide(); //Hide all tab content

          var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
          $(activeTab).fadeIn(); //Fade in the active ID content
          return false;
      });

  });
  
  $( function() {
    $( "#gopicker" ).datepicker();
    $( "#backpicker" ).datepicker();
  });
  
  </script>
<title>Home</title>
</head>
<body>

<<<<<<< HEAD
<h2>편도</h2>
<form action="goAir.do" method="post">
	출발 : <input type="text" name="depAirportNm"><br/>
	도착 : <input type="text" name="arrAirportNm"><br/>
	가는날 : <input type="text" id="gopicker" name="depPlandTime"><br/>
	<input type="submit" value="확인">
</form>

<h2>오는항공편</h2>
<form action="backAir.do" method="post">
=======
<div id="wrapper">    
    <!--탭 메뉴 영역 -->
    <ul class="tabs">
        <li><a href="#tab1">편도</a></li>
        <li><a href="#tab2">왕복</a></li>
    </ul>

    <!--탭 콘텐츠 영역 -->
    <div class="tab_container">

        <div id="tab1" class="tab_content">
           <form action="goAir.do" method="post">
	출발 : <input type="text" name="depAirportNm"><br/>
	도착 : <input type="text" name="arrAirportNm"><br/>
	가는날 : <input type="text" id="gopicker" name="depPlandTime"><br/>
	<input type="submit" value="확인">
</form>
        </div>

        <div id="tab2" class="tab_content">
          <form action="backAir.do" method="post">
>>>>>>> branch 'master' of https://github.com/ryun-k/prog.git
	출발 : <input type="text" name="depAirportNm"><br/>
	도착 : <input type="text" name="arrAirportNm"><br/>
	가는날 : <input type="text" id="gopicker" name="depPlandTime"><br/>
	오는날 : <input type="text" id="backpicker" name="arrPlandTime"><br/>
	<input type="submit" value="확인">
</form>
        </div>

    </div>

</div>




</body>
</html>