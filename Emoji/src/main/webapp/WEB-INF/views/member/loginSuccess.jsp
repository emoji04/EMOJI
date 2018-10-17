<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<script type="text/javascript">
  var naver_id_login = new naver_id_login("BYXh6BlJnHeLyvt6hhbZ", "http://10.10.10.159:8080/emoji/member/loginSuccess");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
   /*  alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname')); */
    var memberEmail = naver_id_login.getProfileData('email');
    var memberName = naver_id_login.getProfileData('name');
    var memberGender = naver_id_login.getProfileData('gender');
    console.log(memberEmail + memberName + memberGender);
    
    var con = confirm(naver_id_login.getProfileData('email')+"로 로그인 하시겠습니까?");
    if(con == true){
    	//$('#check').val(naver_id_login.getProfileData('email'));
    	//document.getElementById('ee').submit();
    	$.ajax({
    		type : 'post',
    		data : {email: memberEmail, name: memberName, gender: memberGender},
    		dataType : 'text',
    		url : '<c:url value='/naver_login.json'/>',
    		success : function(data){
    			alert(memberEmail+"님 환영합니다.");
    			window.opener.top.location.href="<c:url value='/naverSuccess'/>"; 
    	    	setTimeout('window.close()',500);
    		},error: function(request, status){
    			console.log(test);
    			alert('응 안돼'+request.status);
    		}
    	});
    	
    	//window.close();
    }else{
    	window.close()
    }
    
    
    //document.write(naver_id_login.getProfileData('email')+"로 로그인 하시겠습니까?");
/*     document.write(naver_id_login.getProfileData('name'));
    document.write(naver_id_login.getProfileData('phone'));
    document.write(naver_id_login.getProfileData('gender'));
    document.write(naver_id_login.getProfileData('birthday')); */
  }
  function yes(){
	window.opener.top.location.href="/"
	window.close()
  }
  function no(){
		window.close()
	  }
</script>
<!-- naver_id_login.getProfileData('email') -->

</body>
</html>