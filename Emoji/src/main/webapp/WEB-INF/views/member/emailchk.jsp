<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>회원가입</title>
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
.getnum {
	background-color: black;
}

.doregi {
	background-color: black;
}
.disablecol{
	background-color: #EBEBE4;
}
</style>
</head>

<body>
	<div class="mid2">
		<div class="bannerdiv">
			<p class="naverbanner2"><a href="<c:url value='/home'/>">EMOJI</a></p>
		</div>
		<div class="mainarea">


			<form id="register" action="<c:url value='/emailsend'/>" method="post" onsubmit="return checkValue()" enctype="multipart/form-data">
				<div class="maintext">
					<b>이메일</b>
				</div>
				
				<div class="boxarea">
					<input class="inputfocus" id="idtext" name="memberEmail" style="width: 99%" type="text">
				</div>
				
				<div id="idcheck" class="divchk"></div>
				
				<div>
					<input class="doregi" type="submit" value="이메일 인증하기" id="registerBtn" >
				</div>
			</form>
		</div>
	</div>
	
<script type="text/javascript">
	function emailcheck(strValue){
		var regExp = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
		//입력을 안했으면
		if(strValue.lenght == 0) {
			return false;
		}
		//이메일 형식에 맞지않으면
		if (!strValue.match(regExp)) {
			return false;
		}
		else
			return true;
	};
	
	$(document).ready(
			function(){
				$('#idtext').focusout(
						function() {
							if ($("#idtext").val() == '') {
								$('#idcheck').text('필수항목 입니다.').css("color", "red");
							} else { 
								if(emailcheck($("#idtext").val())){
									var email = $('#idtext').val();
									
									$.ajax({
										type : 'POST',
										url : '<c:url value='/regicheck2.json'/>',
										data : 'email=' + email,
										dataType: 'text',
										success : function(data) {
											if(data == "naverRegi")
												$('#idcheck').html('네이버로 로그인 한 회원입니다.<br> <a href="<c:url value="/loginForm"/>">여기를 클릭해서 네이버로 로그인 해 주세요.</a>').css("color", "red");
											if (data == "possibleRegi") 
												$('#idcheck').text('환영합니다. 인증을 통해 EMOJI의 가족이 되어주세요.').css("color", "green");
											if (data == "alreadyExist")
												$('#idcheck').text('이미 등록 된 이메일 입니다.').css("color", "red");
										}
									});
								} else{
									$('#idcheck').text('올바른 이메일을  입력 해 주세요.').css("color", "red");
								}
							}
						});
	});
	function checkValue() {
		console.log("ok");
		if ($("#idtext").val() == '') {
			$('#idcheck').text('필수항목 입니다.').css("color", "red");
			return false;
			}
		if(emailcheck($("#idtext").val()) == false){
			$('#idcheck').text('올바른 이메일을  입력 해 주세요.').css("color", "red");
			return false;
		}
		if($('#idcheck').text() == '이미 등록 된 이메일 입니다.'){
			return false;
		}
		if(emailcheck($("#idtext").val())){
				var email = $('#idtext').val();
				
				$.ajax({
					type : 'POST',
					url : '<c:url value='/regicheck2.json'/>',
					data : 'email=' + email,
					dataType: 'text',
					success : function(data) {
						if(data == "naverRegi")
							$('#idcheck').html('네이버로 로그인 한 회원입니다.<br> <a href="<c:url value="/loginForm"/>">여기를 클릭해서 네이버로 로그인 해 주세요.</a>').css("color", "red");
						if (data == "possibleRegi") 
							$('#idcheck').text('환영합니다. 인증을 통해 EMOJI의 가족이 되어주세요.').css("color", "green");
							
						if (data == "alreadyExist")
							$('#idcheck').text('이미 등록 된 이메일 입니다.').css("color", "red");
							return false;
					}
				});
			} else{
				$('#idcheck').text('올바른 이메일을  입력 해 주세요.').css("color", "red");
				return false;
			};
		
		setTimeout(function() {
			if($('#idcheck').text() != '환영합니다. 인증을 통해 EMOJI의 가족이 되어주세요.'){
				return false;
			}else{
				$('#idcheck').text('인증 메일을 보내는 중입니다. 잠시만 기다려 주세요.').css("color", "green");
				$('#registerBtn').prop("disabled", true);
				return true;
			}
		}, 700);
	}
</script>

</body>
</html>