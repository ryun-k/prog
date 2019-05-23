<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<style>
:root { -
	-input-padding-x: 1.5rem; -
	-input-padding-y: .75rem;
}

body {
	background-image:
		url("https://cdn.pixabay.com/photo/2016/11/18/07/46/cozy-seopji-1833560_960_720.jpg");
	background-size: cover;
}

.card-signin {
	border: 0;
	border-radius: 1rem;
	box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
	margin-bottom: 2rem;
	font-weight: 300;
	font-size: 1.5rem;
}

.card-signin .card-body {
	padding: 2rem;
}

.form-signin {
	width: 100%;
}

.form-signin .btn {
	font-size: 80%;
	border-radius: 5rem;
	letter-spacing: .1rem;
	font-weight: bold;
	padding: 1rem;
	transition: all 0.2s;
}

.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}

.form-label-group input {
	height: auto;
	border-radius: 2rem;
}

.form-label-group>input, .form-label-group>label {
	padding: var(- -input-padding-y) var(- -input-padding-x);
}

.form-label-group>label {
	position: absolute;
	top: 0;
	left: 0;
	display: block;
	width: 100%;
	margin-bottom: 0;
	/* Override default `<label>` margin */
	line-height: 1.5;
	color: #495057;
	border: 1px solid transparent;
	border-radius: .25rem;
	transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
	color: transparent;
}

.form-label-group input:-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-ms-input-placeholder {
	color: transparent;
}

.form-label-group input::-moz-placeholder {
	color: transparent;
}

.form-label-group input::placeholder {
	color: transparent;
}

.form-label-group input:not (:placeholder-shown ) {
	padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
	padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not (:placeholder-shown )~label {
	padding-top: calc(var(- -input-padding-y)/3);
	padding-bottom: calc(var(- -input-padding-y)/3);
	font-size: 12px;
	color: #777;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function() {
	  $( "#dtpicker" ).datepicker({
	    dateFormat: 'yymmdd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    showMonthAfterYear: true,
	    changeMonth: true,
	    changeYear: true,
	    yearSuffix: '년'
	  });
	});
</script>
<title>항공권 검색</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h4 class="card-title text-center">항공권 검색</h4>
						<form class="form-signin" action="pAir.do" method="post">
							<div class="form-label-group">
								<select class="form-control" name="depAirportNm">
								<option value="" selected disabled hidden>==출발지==</option>
									<option>광주</option>
									<option>군산</option>
									<option>김포</option>
									<option>김해</option>
									<option>대구</option>
									<option>무안</option>
									<option>양양</option>
									<option>여수</option>
									<option>원주</option>
									<option>울산</option>
									<option>인천</option>
									<option>제주</option>
									<option>포항</option>
									<option>청주</option>
								</select>
							</div>

							<div class="form-label-group">
								<select class="form-control" name="arrAirportNm" onscroll="onscroll">
								<option value="" selected disabled hidden>==도착지==</option>
									<option>광주</option>
									<option>군산</option>
									<option>김포</option>
									<option>김해</option>
									<option>대구</option>
									<option>무안</option>
									<option>양양</option>
									<option>여수</option>
									<option>원주</option>
									<option>울산</option>
									<option>인천</option>
									<option>제주</option>
									<option>포항</option>
									<option>청주</option>
								</select>
							</div>
							<h4 class="text-center">날짜선택</h4>
							<div class="form-label-group">
								<input type="text" id="dtpicker" name="depPlandTime"
									class="form-control" placeholder="가는날" required>
							</div>

							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">검색</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>