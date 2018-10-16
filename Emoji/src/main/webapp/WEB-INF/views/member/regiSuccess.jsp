<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>[EMOJI]-회원가입 완료</title>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans" rel="stylesheet">
<link href="<c:url value="/resources/css/naverCss.css"/>" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.4.js"></script>

<style>
.bannerdiv {
	margin: 0 auto;
	padding-left: 15px;
}
.naverbanner2 {
	margin: 0 auto;
}
.naverbanner2 > a:visited{
    	color:black;
    	text-decoration:none;
    }
.naverbanner2 > a:link{
    	color:black;
    	text-decoration:none;
    }
.mainarea{
        text-align: center;
    }
.welcome{
        padding: 50px;
    }
.congra{
        padding: 10px;
    }

.doregi {
	background-color: black;
	width: 300px;
    height: 60px;
    margin-top: 30px;
    border-radius: 7px;
	}
</style>
</head>

<body>
	<div class="mid2" style="height: 600px; margin-top: 30px; background-color: white;border-radius: 20px; ">
		<div class="bannerdiv">
			<p class="naverbanner2"><a href="<c:url value='/home'/>">EMOJI</a></p>
		</div>
		<div class="mainarea">


			<p class="welcome" style="font-size: 50px;"><strong>환영합니다!</strong></p>
			<p class="congra">회원가입을 축하합니다. </p>
			<p>로그인을 하여 모두와 함께 지도를 공유 해 주세요!</p>
			<input class="doregi" type="button" value="로그인 하러가기" id="registerBtn" onclick="location.href='<c:url value='/loginForm' />'" >
		</div>
	</div>
	
<script type="text/javascript">

</script>

</body>
</html>