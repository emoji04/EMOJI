<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
#imaginary_container {
	margin-top: 80%; /* Don't copy this */
}

.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	box-shadow: 0 0 0;
	border: solid 0px black;
	border-right: 0;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}
</style>





<nav class="navbar navbar-default navbar-fixed-top"
	style="background-color: white; padding-bottom: 0px; border: 2px solid black; border-radius: 10px; margin: 20px;">
	<div></div>
	<div class="container-fluid ">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header " style="padding-bottom: 25px;">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> 
				<span class="icon-bar"></span> <span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>

			<a class="navbar-brand" id="div2" href="<c:url value='/home'/>" style="font-size: 25px; padding-top: 18px">
			<img alt="" src="https://i.imgur.com/fQDwXO6.png" style="width: 100px; border-radius: 5px; padding-right: 20px;">모두의지도 </a>


		</div>
		<div style="width: 100px"></div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1" style="font-size: 20px;">
			<ul class="nav navbar-nav navbar-right "
				style="margin-top: 10px; margin-left: 5px">
				<ul class="nav navbar-nav ">

					<%-- <li><a href="<c:url value='/deliciousForm' />">맛집지도 <span
							class="sr-only">(current) </span></a></li> --%>

					<li><a href="<c:url value='deliciousForm' /> ">맛집지도 <span
							class="sr-only">(current) </span></a></li>


					<li><a href="<c:url value='goRoute' />">식신원정대</a></li>
					<li class="dropdown" style="margin-right: 10px;"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown" role="button"
						aria-haspopup="true" aria-expanded="false">마이페이지 <span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href='<c:url value="/memberUpdateForm" />'
								onclick='function()'>개인정보 수정</a></li>
							<li><a href='<c:url value="/MydmForm" />'>나의 맛집지도</a></li>
							<li><a href='<c:url value="/MydmRoute" />'>나의 식신원정대</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">Separated</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
				<li style="font-size: 17px; margin-right: 0px;"><c:if
						test="${loginInfo eq null }">
						<a href="<c:url value='/loginForm' />">LOGIN</a>
					</c:if> <c:if test="${loginInfo ne null }">
						<a href="<c:url value='/logOut' />">LOGOUT</a>
					</c:if></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
