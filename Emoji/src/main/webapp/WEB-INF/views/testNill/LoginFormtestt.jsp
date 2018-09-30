<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Login Demo - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style type="text/css">


</style>

</head>
<body>

<a id="kakao-login-btn"></a>
<a href="http://developers.kakao.com/logout"></a>  카카오톡에서 이메일을 가져 올 수 없음(보안정책)/이메일을 추가 입력 시키는 방법은 있음
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
  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
  <div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("BYXh6BlJnHeLyvt6hhbZ", "http://localhost:8080/emoji/member/loginSuccess");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("green", 3,48);
  	//naver_id_login.setDomain("YOUR_SERVICE_URL");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
  
  

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

</script>  






<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v3.1&appId=266379557330780&autoLogAppEvents=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="true"></div>








<script type="text/javascript">
  function logout(){
	  alert(getAttributeNames()) ;
  
  }
</script>
  
  
  
<%session.invalidate(); %>
 
</br>
<button onclick='mOAuthLoginModule.logout(mContext);'>섹션삭제</button>




</body>
</html>