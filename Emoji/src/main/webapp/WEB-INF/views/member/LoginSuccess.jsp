<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
hd
<script type="text/javascript">
  var naver_id_login = new naver_id_login("BYXh6BlJnHeLyvt6hhbZ", "http://localhost:8080/emoji/member/loginSuccess");
  // ���� ��ū �� ���
  alert(naver_id_login.oauthParams.access_token);
  // ���̹� ����� ������ ��ȸ
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
  function naverSignInCallback() {
   /*  alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname')); */
    document.write(naver_id_login.getProfileData('email'));
  }
</script>
<!-- naver_id_login.getProfileData('email') -->
</body>
</html>