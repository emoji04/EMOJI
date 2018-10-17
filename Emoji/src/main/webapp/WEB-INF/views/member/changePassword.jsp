<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
request.setCharacterEncoding("utf-8"); 
String certificateKey= request.getParameter("emailKey"); 
String allowedEmail = request.getParameter("allowedEmail");
%> 
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


			<form id="register" action="<c:url value='/changePasswordOk'/>" method="post" onsubmit="return checkValue()" enctype="multipart/form-data">
				<input name="memberEmail" value="<%=allowedEmail %>" style="width: 99%" type="hidden" >
				<div id="idcheck" class="divchk"></div>
				<input type="hidden" id ="emailKey" name="emailKey" value="<%=certificateKey %>">
				
				<div class="maintext">
					<b>변경 할 비밀번호를 입력 해 주세요</b>
				</div>
				
				<div class="boxarea">
					<input class="passwordarea inputfocus" id="pass1" name="memberPassword" type="password" style="width: 99%">
				</div>
				
				<div id="passchk1" class="divchk"></div>
				
				<div class="maintext">
					<b>다시한번 입력 해 주세요</b>
				</div>
				
				<div class="boxarea">
					<input class="passwordarea inputfocus" id="pass2" type="password" style="width: 99%">
				</div>
				
				<div id="passchk2" class="divchk"></div>
				
				<div>
					<input class="doregi" type="submit" value="가입하기" id="registerBtn" >
				</div>
			</form>


		</div>
	</div>

	<script>
		/*비밀번호 정규식*/
		function chkPwd(str){
		    var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
		    if(reg_pwd.test(str)){
		        return true;
		    }
		    else
		    	return false;
		} 

		$(document).ready(
				function() {
					
					//이메일 인증 단계를 안걷쳤거나 인증 후 한시간이 지났을 때.
					if($('#emailKey').val()== "null"){
						alert('이메일 인증 후 한 시간이 지났거나  잘못된 접근입니다. ')
						document.location.href = "home";
					};
					
					$('.boxarea, #getnumtext').click(function() {
						$(this).children('input').focus();
						$(this).css("border-color", "green")
					});
					
					$('.boxarea, #getnumtext').focusin(function() {
						$(this).css("border-color", "green")
					});
					
					$('.boxarea, #getnumtext').focusout(function() {
						$(this).css("border-color", "#DADADA");

						/*              이건 input 하나 빠져나가는데 멘트 다  튀어 나오게
						 if($(this).children('input').val()==$("#idtext").val()){
						 if($("#idtext").val()==''){
						 $('#idcheck').text('필수항목 입니다.').css("color","red");
						 }else{
						 $('#idcheck').text('멋진 아이디 입니다!').css("color","green");
						 }  ......................
						 }; */

					});

					$('#pass1').focusout(
							function() {
								if ($('#pass1').val() == '') {
									$('#passchk1').text('필수항목 입니다.').css("color", "red");
								} else {
									if (chkPwd($.trim($('#pass1').val()))) {
										$('#passchk1').text('안전한 비밀번호 입니다.').css("color", "green");
									} else {
										$('#passchk1').text('영문과 숫자를 혼합하여 6~12자리의 비밀번호를 입력해 주세요.').css("color", "red");
								}
							}
					});
					
					$('#pass2').focusout(
							function() {
								if ($('#pass2').val() != $('#pass1').val()) {
									$('#passchk2').text('비밀번호가 일치하지 않습니다.').css("color", "red");
								} else{
									$('#passchk2').text('비밀번호가 일치합니다.').css("color", "green");
								if ($('#pass2').val().length == 0){
									$('#passchk2').text('필수 입력사항입니다.').css("color", "red");
								}
							}
					});
					
					
					
				});
		
		//가입 버튼 눌렀을때
 		function checkValue() {
			var pass = $('#pass1').val();
			var pass2 = $('#pass2').val();

			if (pass.length == 0) {
				$('#passchk1').text('필수항목 입니다.').css("color", "red");
			} else {
				if (chkPwd($.trim($('#pass1').val()))) {
					$('#passchk1').text('안전한 비밀번호 입니다.').css("color", "green");
				} else {
					$('#passchk1').text('영문과 숫자를 혼합하여 6~12자리의 비밀번호를 입력해 주세요.').css("color", "red");
				}
			};
			if (pass != pass2) {
				$('#passchk2').text('비밀번호가 일치하지 않습니다.').css("color", "red");
			} else{
				if(pass2.length == 0){
					$('#passchk2').text('필수 입력사항입니다.').css('color', 'red');
				}else{
				$('#passchk2').text('비밀번호가 일치합니다.').css("color", "green");
				}
			};
			if ($('#passchk1').text() != '안전한 비밀번호 입니다.') {
				return false;
			};
			if ($('#passchk2').text() != '비밀번호가 일치합니다.') {
				return false;
			};
		} 
	</script>
</body>
</html>