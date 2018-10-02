<%-- <<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page session="false" %>

<!doctype html>
<html>
<head>
	<title>Home</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">



<script type="text/javascript">
	function logout(str){

		var con = confirm("로그아웃 할꺼야?");
	 	if(con == true){
	 		<%session.invalidate();%>
			location.replace("/op/user/successLogout");
	 		
	  //logout을 위해 세션을 제거하는 페이지 호출
	 	}else{}
	}
	
	function loginchk(){
		 /* var logincheck = confirm("로그인 후 볼 수 있는 페이지 입니다. 로그인 페이지로 가시겠습니까?"); */
		 if(confirm("로그인 후 볼 수 있는 페이지 입니다. 로그인 페이지로 가시겠습니까?")){
			 location.replace("naverLogin");
			 return true;
		 } else{ false;
		 }
	}
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.w3-sidebar a {
	font-family: "Roboto", sans-serif
}

body, h1, h2, h3, h4, h5, h6, .w3-wide {
	font-family: "Montserrat", sans-serif;
}

a{
	text-decoration:none;
}

button {
	background-color: #4CAF50;
	color: black;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	/* width: 100%; */
}
.loginbt {
	background-color: white;
	color: black;
	padding: 30px 10px;
	margin: 0px;
	position: fixed;
	top: 1px;
	right: 60px;
	cursor: pointer;
	z-index: 5;

	/* width: 100%; */
}

.loginbt:hover {
	background-color: #CCCCCC;
}
.blankbox{
	height:113px;
}

@media(max-width:992px){
      .loginbt {
        background-color: black;
		color: white;
		padding: 30px 20px;
		margin: 0px;
		position: fixed;
		top: 1px;
		right: 60px;
		cursor: pointer;
		z-index: 5;
		}
    }


</style>

<p class="w3-left">
	<c:if test="${loginInfo eq null }">
		<button type="button" class="loginbt" onclick="location.href='naverLogin'"
			style="width: auto;">Login</button>
	</c:if>
	<c:if test="${loginInfo ne null }">
		<button type="button" class="loginbt" onclick="logout('Main.jsp')"
			style="width: auto;">LogOut</button>
	</c:if>
</p>


<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top"
	style="z-index: 6; width: 250px" id="mySidebar">
	<div class="w3-container w3-display-container w3-padding-16">
		<i onclick="w3_close()"
			class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
		<h3 class="w3-wide">
			<b><a href="/op"><img alt="" src="<c:url value= 'img/Logo.jpg'/>"></a></b>
		</h3>
	</div>
	<div class="w3-padding-64 w3-large w3-text-grey"
		style="font-weight: bold">
		<a onclick="myAccFunc()" href="javascript:void(0)"
			class="w3-button w3-block w3-white w3-left-align" id="myBtn">
			Member <i class="fa fa-caret-down"></i>
		</a>
		<div id="demoAcc"
			class="w3-bar-block w3-hide w3-padding-large w3-medium">
			<!-- <a href="#" class="w3-bar-item w3-button w3-light-grey">
      <i class="fa fa-caret-right w3-margin-right"></i>Skinny</a> -->
			<c:if test="${loginInfo eq null }">
				<a href="#" class="w3-bar-item w3-button"
					onclick="return loginchk();">Mypage</a>
			</c:if>
			<c:if test="${loginInfo ne null }">

				<a href="mypage" class="w3-bar-item w3-button">Mypage</a>
				</button>
			</c:if>
			<a href="user/userlist" class="w3-bar-item w3-button">회원리스트</a> 
			<a href="#" class="w3-bar-item w3-button">사원 등록</a>
		</div>

		<c:if test="${loginInfo eq null }">
			<a href="#" class="w3-bar-item w3-button"
				onclick="return loginchk();">Gallery</a>
		</c:if>
		<c:if test="${loginInfo ne null }">

			<a href="gallery" class="w3-bar-item w3-button">Gallery</a>
			</button>
		</c:if>

		<a href="#" class="w3-bar-item w3-button">방명록</a> <a href="../test"
			class="w3-bar-item w3-button">test</a> <a href="test"
			class="w3-bar-item w3-button">test2</a> <a href="#"
			class="w3-bar-item w3-button">기능들</a> <a href="#"
			class="w3-bar-item w3-button">페이지들</a> <a href="#"
			class="w3-bar-item w3-button">넣어야</a> <a href="#"
			class="w3-bar-item w3-button">하는데</a> <a href="#"
			class="w3-bar-item w3-button"> ...</a>
	</div>
	<a href="#footer" class="w3-bar-item w3-button w3-padding">Contact</a>
	<a href="javascript:void(0)" class="w3-bar-item w3-button w3-padding"
		onclick="document.getElementById('newsletter').style.display='block'">Newsletter</a>
	<a href="#footer" class="w3-bar-item w3-button w3-padding">Subscribe</a>
</nav>

<!-- Top menu on small screens -->
<header class="w3-bar w3-top w3-hide-large w3-black w3-xlarge">
	<div class="w3-bar-item w3-padding-24 w3-wide">
		<b><a href="/op">Nill's</a></b>
	</div>
	<a href="javascript:void(0)"
		class="w3-bar-item w3-button w3-padding-24 w3-right"
		onclick="w3_open()"><i class="fa fa-bars"></i></a>
</header>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large" onclick="w3_close()"
	style="cursor: pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left: 250px">

	<!-- Push down content on small screens -->
	<div class="w3-hide-large" style="margin-top: 113px"></div>

<div class="blankbox">
	
</div>

	<script>
// Accordion 
function myAccFunc() {
    var x = document.getElementById("demoAcc");
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
    } else {
        x.className = x.className.replace(" w3-show", "");
    }
}

// Click on the "Jeans" link on page load to open the accordion for demo purposes
document.getElementById("myBtn").click();


// Script to open and close sidebar
function w3_open() {
    document.getElementById("mySidebar").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}
 
function w3_close() {
    document.getElementById("mySidebar").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>














 

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	
</head>
<body>

안녕hello <nav class="navbar navbar-default navbar-fixed-top" >
  <div class="container-fluid" >
    Brand and toggle get grouped for better mobile display
    <div class="navbar-header kkke">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="font-size: 25px; color: black;" ><img alt="" src="resources/img/Logo.jpg" style="width: 100px;">모두의지도 </a>
    </div>

    Collect the nav links, forms, and other content for toggling
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">맛집지도 <span class="sr-only">(current)</span></a></li>
        <li class="active"><a href="rtjhlkf">식신원정대</a></li>
        <li class="dropdown active">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">마이페이지 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">개인정보 수정</a></li>
            <li><a href="#">나의 맛집지도</a></li>
            <li><a href="#">나의 식신원정대</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="/loginForm">SIGN-IN</a></li>
      </ul>
    </div>/.navbar-collapse
  </div>/.container-fluid
</nav>


<div class="container">

	<h2>내비게이션바</h2>

	<nav class="navbar navbar-default" role="navigation">
	
	  <div class="container-fluid">
	    Brand and toggle get grouped for better mobile display
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Brand</a>
	    </div>

	    Collect the nav links, forms, and other content for toggling
	    <div class="navbar-collapse collapse" id="navbar-collapse-1">
	      <ul class="nav navbar-nav">
		<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
		<li><a href="#">Link</a></li>
		<li class="dropdown">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="#">Action</a></li>
		    <li><a href="#">Another action</a></li>
		    <li><a href="#">Something else here</a></li>
		    <li class="divider"></li>
		    <li><a href="#">Separated link</a></li>
		    <li class="divider"></li>
		    <li><a href="#">One more separated link</a></li>
		  </ul>
		</li>
	      </ul>
	      <form class="navbar-form navbar-left" role="search">
		<div class="form-group">
		  <input type="text" class="form-control" placeholder="Search">
		</div>
		<button type="submit" class="btn btn-default">Submit</button>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
		<li><a href="#">Link</a></li>
		<li class="dropdown">
		  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
		  <ul class="dropdown-menu" role="menu">
		    <li><a href="#">Action</a></li>
		    <li><a href="#">Another action</a></li>
		    <li><a href="#">Something else here</a></li>
		    <li class="divider"></li>
		    <li><a href="#">Separated link</a></li>
		  </ul>
		</li>
	      </ul>
	    </div>/.navbar-collapse
	  </div>/.container-fluid
	</nav>

</div>

<div style="height: 2000px;">
h
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
 --></body>
</html>
=======
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<a href="<c:url value='/deliciousForm' />">맛집지도</a>
</body>
</html>
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Navbar Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
<!--     <link href="navbar.css" rel="stylesheet"> -->

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Project name</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="<c:url value='/deliciousForm' />">Delicious</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="./">Default <span class="sr-only">(current)</span></a></li>
              <li><a href="../navbar-static-top/">Static top</a></li>
              <li><a href="../navbar-fixed-top/">Fixed top</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>

      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Navbar example</h1>
        <p>This example is a quick exercise to illustrate how the default, static navbar and fixed to top navbar work. It includes the responsive CSS and HTML, so it also adapts to your viewport and device.</p>
        <p>
          <a class="btn btn-lg btn-primary" href="../../components/#navbar" role="button">View navbar docs &raquo;</a>
        </p>
        <P>  The time on the server is ${serverTime}. </P>
      </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
>>>>>>> branch 'master' of https://github.com/emoji04/EMOJI.git
>>>>>>> branch 'delicious' of https://github.com/emoji04/EMOJI.git
 --%>