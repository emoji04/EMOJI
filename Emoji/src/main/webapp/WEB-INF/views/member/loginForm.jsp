<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title>EMOJI - 로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/img/favicon.icon"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js" ></script>


<!-- 구글 firebase -->
<script src="https://www.gstatic.com/firebasejs/5.5.1/firebase.js"></script>
<script>
  // Initialize Firebase
  var config = {
    apiKey: "AIzaSyCuLe_5KuHJNsGiYFNjYZEmq9Uaey8qtgU",
    authDomain: "emoji0404.firebaseapp.com",
    databaseURL: "https://emoji0404.firebaseio.com",
    projectId: "emoji0404",
    storageBucket: "emoji0404.appspot.com",
    messagingSenderId: "587972593169"
  };
  firebase.initializeApp(config);
  provider.addScope('https://www.googleapis.com/auth/contacts.readonly');
  
  
  
  var provider = new firebase.auth.GoogleAuthProvider();
  
  firebase.auth().signInWithPopup(provider).then(function(result) {
	  // This gives you a Google Access Token. You can use it to access the Google API.
	  var token = result.credential.accessToken;
	  // The signed-in user info.
	  var user = result.user;
	  // ...
	}).catch(function(error) {
	  // Handle Errors here.
	  var errorCode = error.code;
	  var errorMessage = error.message;
	  // The email of the user's account used.
	  var email = error.email;
	  // The firebase.auth.AuthCredential type that was used.
	  var credential = error.credential;
	  // ...
	});
  
//구글 로그인
  $(function(){
      function onSuccess(googleUser) {
          var profile = googleUser.getBasicProfile();
          //console.log(profile);
      }
          
      $(".g-signin2").on("click", function(){
          gapi.client.load('plus', 'v1', function () {
              gapi.client.plus.people.get({
                  'userId': 'me'
              }).execute(function (res) {
                  console.log(JSON.stringify(res));
                  
                  res.id += "@g";
                        
                  $.ajax({
                      url : "/user/json/checkDuplication/"+res.id,
                      headers : {
                            "Accept" : "application/json",
                            "Content-Type" : "application/json"
                        },
                        success : function(idChk){
                              if(idChk==true){ //DB에 아이디가 없을 경우 => 회원가입
                                  console.log("회원가입중...");
                                  $.ajax({
                                      url : "/user/json/addUser",
                                      method : "POST",
                                      headers : {
                                        "Accept" : "application/json",
                                        "Content-Type" : "application/json"
                                      },
                                      data : JSON.stringify({
                                        userId : res.id,
                                        userName : res.displayName,
                                        password : "google123",
                                      }),
                                      success : function(JSONData){
                                         alert("회원가입이 정상적으로 되었습니다.");
                                         $("form").attr("method","POST").attr("action","/user/snsLogin/"+res.id).attr("target","_parent").submit();
                                      }
                                  })
                              }
                              if(idChk==false){ //DB에 아이디가 존재할 경우 => 로그인
                                  console.log("로그인중...");
                                  $("form").attr("method","POST").attr("action","/user/snsLogin/"+res.id).attr("target","_parent").submit();
                              }
                          }
                    })
                  })
             })
      })//e.o.google.loginLogic
      
      function onFailure(error) {
          console("error : "+error);
      }
      
      function signOut() {
          var auth2 = gapi.auth2.getAuthInstance();
          auth2.signOut().then(function () {
              self.location="/user/logout";
          });
      }
      
  })//e.o.google -->

  
  
  
  
</script>
<script src="https://apis.google.com/js/client:platform.js?onload=renderButton" async defer></script>
<meta name="google-signin-client_id" content="{Client-APP-Id}.apps.googleusercontent.com"></meta>

</head>
<body>
	
	
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-80 p-b-30">
		<a href="<c:url value='/home'/>">
			<img alt="" src="https://i.imgur.com/fQDwXO6.png" style="width: 280px; border-radius: 5px;" style="padding-left:120px;"></a>
			<form class="login100-form validate-form" action="<c:url value='/login' />" method="post">
				<span class="login100-form-title p-b-37">
					Sign In
				</span>

				<div class="wrap-input100 validate-input m-b-20" data-validate="Enter email">
					<input class="input100" type="text" name="memberEmail" placeholder="email">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-25" data-validate = "Enter password">
					<input class="input100" type="password" name="memberPassword" placeholder="password">
					<span class="focus-input100"></span>
				</div>

				<div class="container-login100-form-btn">
					<button class="login100-form-btn" >
						Sign In
					</button>
				</div>

				<div class="text-center p-t-57 p-b-20">
					<span class="txt1">
							<a href="<c:url value='/emailcheck' />">회원가입</a> /
							<a href="<c:url value='/findPass' />">비밀번호 찾기</a>
					</span><br>
					<hr/>
					<span class="txt1">
						Or login with
					</span>
				</div>

				<div class="text-center">

					<!-- kakaotalk -->
					<a id="kakao-login-btn"></a>
					<a href="http://developers.kakao.com/logout"></a>
					 

  					<!-- 네이버아이디로로그인 버튼 노출 영역 -->
			    	<div id="naver_id_login"></div>
			    	
			  		<!-- facebook -->
				 <!--  	<div id="fb-root" style="margin:5px; width:220px;"></div>
					<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true" style="width:220px;"></div>
					 -->
					
					<!-- 구글 로그인 추가 -->
					<div id="googleLogin" align="center">                                                    
					    <div class="g-signin2" data-onsuccess="onSuccess" data-theme="dark" style="margin:5px; width:220px;"></div>
					</div>
					
					
					
				</div>
			</form>
		</div>
	</div>


<script type="text/javascript">
function login(){
	
}

</script>


	<!-- kakaotalk -->
	<script type='text/javascript'>
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('377fa9901a70a356db9e8b6e1ab1a3a9');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        alert(JSON.stringify(authObj));
	        alert(Kakao.Auth.setAccessToken(accessTokenFromServer));
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	</script>

    <!-- //네이버아이디로로그인 버튼 노출 영역 -->
 	<script type="text/javascript">
  		var naver_id_login = new naver_id_login("BYXh6BlJnHeLyvt6hhbZ", "http://ec2-13-125-100-1.ap-northeast-2.compute.amazonaws.com:8080/Emoji/member/loginSuccess");
  		var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("green", 3,48);
	  	//naver_id_login.setDomain("YOUR_SERVICE_URL");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	</script>
	<!-- facebook1 -->
	<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '{266379557330780}',
      cookie     : true,
      xfbml      : true,
      version    : '{v3.1}'
    });
      
    FB.AppEvents.logPageView();   
      
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
  
  
  
  
  
FB.getLoginStatus(function(response) {
    statusChangeCallback(response);
});

{
    status: 'connected',
    authResponse: {
        accessToken: '...',
        expiresIn:'...',
        signedRequest:'...',
        userID:'...'
    }
}
</script> 
	<!-- facebook2 -->
	<script>
	(function(d, s, id) {
  		var js, fjs = d.getElementsByTagName(s)[0];
  		if (d.getElementById(id)) return;
  		js = d.createElement(s); js.id = id;
  		js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.1&appId=266379557330780&autoLogAppEvents=1';
  		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	</script>
<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="resources/js/main.js"></script>

</body>
</html>