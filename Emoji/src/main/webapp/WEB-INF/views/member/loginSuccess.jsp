<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>

<script type="text/javascript">
  var naver_id_login = new naver_id_login("BYXh6BlJnHeLyvt6hhbZ", "http://localhost:8080/emoji/member/loginSuccess");
  // ���� ��ū �� ���
  //alert(naver_id_login.oauthParams.access_token);
  // ���̹� ����� ������ ��ȸ
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
  function naverSignInCallback() {
   /*  alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname')); */
    var test = naver_id_login.getProfileData('email');
    var con = confirm(naver_id_login.getProfileData('email')+"�� �α��� �Ͻðڽ��ϱ�?");
    if(con == true){
    	//$('#check').val(naver_id_login.getProfileData('email'));
    	//document.getElementById('ee').submit();
    	$.ajax({
    		type : 'GET',
    		data : 'email='+ test ,
    		dataType : 'text',
    		url : '<c:url value='/naver_login.json'/>',
    		success : function(data){
    			alert(data+"�� ȯ���մϴ�.");
    			window.opener.top.location.href="<c:url value='/naverSuccess'/>"; 
    	    	setTimeout('window.close()',500);
    		},error: function(request, status){
    			console.log(test);
    			alert('�� �ȵ�'+request.status);
    		}
    	});
    	
    	//window.close();
    }else{
    	window.close()
    }
    
    
    //document.write(naver_id_login.getProfileData('email')+"�� �α��� �Ͻðڽ��ϱ�?");
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

<button onclick="yes()">yes</button>
<button onclick="no()">no</button>
�ƹ��͵� �ȵ�??
<h1>dddddd</h1>
<button onclick="naverSignInCallback()">�̰� Ŭ���غ�</button>
<form action="<c:url value='/naver_login'/>" id="ee">
<input type="hidden" id="check" name="check">
</form> 
</body>
</html>