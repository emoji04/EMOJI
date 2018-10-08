<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


			<form id="register" action="naverRegi" method="post" onsubmit="return checkValue()" enctype="multipart/form-data">
				<div class="maintext">
					<b>이메일</b>
				</div>
				
				<div class="boxarea" id="box1">
					<input class="inputfocus" id="idtext" name="id" style="width: 100%" type="text">
				</div>
				
				<div id="idcheck" class="divchk"></div>
				
				<div class="maintext">
					<b>비밀번호</b>
				</div>
				
				<div class="boxarea">
					<input class="passwordarea inputfocus" id="pass1" name="password" type="password">
				</div>
				
				<div id="passchk1" class="divchk"></div>
				
				<div class="maintext">
					<b>비밀번호 재확인</b>
				</div>
				
				<div class="boxarea">
					<input class="passwordarea inputfocus" id="pass2" type="password">
				</div>
				
				<div id="passchk2" class="divchk"></div>
				
				<div class="maintext">
					<b>이름</b>
				</div>
				
				<div class="boxarea">
					<input class="widthtext inputfocus" id="name" type="text">
				</div>
				
				<div id="namechk" class="divchk"></div>
				
				<div class="maintext">
					<b>성별</b>
				</div>
				<div class="genderarea">
					<input id="manchk" class="genderchkbox" type="radio" name="gender"
						value="man"> <label class="genderchk" for="manchk">
						<span>남자</span>
					</label> <input id="womanchk" class="genderchkbox" type="radio"
						name="gender" value="woman"> <label class="genderchk"
						for="womanchk"> <span>여자</span>
					</label>
				</div>
				
				<div class="maintext">
					<b>휴대전화</b>
				</div>
				
				<div>
					<select name="" class="inputfocus" id="internum">
						<script>
							var internum = [ "가나 +233", "멕시코 +52", "대한민국 +82",
									"미국/캐나다 +1", "영국 +44", "이렇게는 +998",
									"노가다자나 +999" ]
							for (i = 0; i < internum.length; i++) {
								document.write("<option>" + internum[i]
										+ "</option>");
							}
						</script>
					</select>
				</div>

				<div id="getnumtext">
					<input class="widthtext inputfocus" id="phone" type="text" placeholder="전화번호 입력">
				</div>
				
				<div class="getnum">
					<input type="button" class="getnum" value="인증번호 받기">
				</div>
				
				<div class="boxarea disablecol" >
					<input class="widthtext inputfocus" type="text" id="chkNum" placeholder="인증번호를 입력하세요" disabled>
				</div>
				<div>
				
					<input class="doregi" type="button" value="가입하기" id="registerBtn">
				</div>
			</form>
			<ul class="ul2">
				<li><a href="#">이용약관</a></li>
				<li><a href="#"><b>개인정보처리방침</b></a></li>
				<li><a href="#">책임의 한계와 법적고지</a></li>
				<li style="border-right: none;"><a href="#">회원정보 고객센터</a></li>
			</ul>


		</div>
	</div>

	<script>
		/* 이메일 형식 정규식 */
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
		}
	
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

					$('#idtext').focusout(
							function() {
								if ($("#idtext").val() == '') {
									$('#idcheck').text('필수항목 입니다.').css("color", "red");
								} else { 
									if(emailcheck($("#idtext").val())){
										var email = $('#idtext').val();
										
										$.ajax({
											type : 'POST',
											url : '<c:url value='/regicheck.json'/>',
											data : 'email=' + email,
											dataType: 'text',
											success : function(data) {
												console.log(data);
												if (data == "a") {
													$('#idcheck').text('멋진 아이디 입니다!').css("color", "green");
												} else {
													$('#idcheck').text('중복된 아이디 입니다.').css("color", "red");
												}
											}
										});
									} else{
										$('#idcheck').text('올바르지 않은 이메일 형식 입니다.').css("color", "red");
									}
								}
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
							}
					});
					
					$('#name').focusout(function(){
						var text = $(this).val();
						
						if(text.length == 0)
							$('#namechk').text('필수 입력사항입니다.').css('color', 'red');
						else
							$('#namechk').css('color', '');
					});
					
					$('#getnum').click(function(){
						var phone = $('#phone').val();
						
						if(phone.length > 0)
							$('#chkNum').removeAttr('disabled');
					});
					
					
					$('#registerBtn').click(function(){
						var id = $('#id').val();
						var pass = $('#pass').val();
						var pass2 = $('#pass2').val();
						var name = $('#name').val();
						
						if(id.length == 0)
							$('#idchk').text('필수 입력사항입니다.').css('color', 'red');
						if(pass.length == 0)
							$('#passchk').text('필수 입력사항입니다.').css('color', 'red');
						if(pass2.length == 0)
							$('#pass2chk').text('필수 입력사항입니다.').css('color', 'red');
						if(name.length == 0)
							$('#namechk').text('필수 입력사항입니다.').css('color', 'red');
						else
							$('#register').submit();
					});
				});
		
/* 		function checkValue() {
			if ($('#idcheck').text() != '멋진 아이디 입니다!') {
				alert("아이디를 확인해주세요");
				return false;
			};
			if ($('#passchk1').text() != '안전한 비밀번호 입니다.') {
				alert("비밀번호를 확인해주세요");
				return false;
			};
			if ($('#passchk2').text() != '비밀번호가 일치합니다.') {
				alert("비밀번호를 확인해주세요");
				return false;
			};
		} */
	</script>
</body>
</html>