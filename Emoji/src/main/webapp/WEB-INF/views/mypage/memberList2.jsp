<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 수정</title>
<script>
 window.onload=function(){
	 alert      ")
 }
</script>
</head>
<body>
	<h1>회원정보수정</h1>

	로그인 ID : ${memberEmail }

	<table>
		<thread> <c:forEach items="${memberList }" var="memberVO">
			<tr>
				<th>아이디</th>
				<th><input name="memberEmail" value="${memberVO.memberEmail}"
					readonly="readyonly"></th>
			</tr>
			<tr>
				<th>이름</th>
				<th><input name="memberName" value="${memberVO.memberName }"
					readonly="readyonly"></th>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<th><input name="memberPassword"
					value="${memberVO.memberPassword }"></th>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<th><input name=""
					value=" "></th>
			</tr>
			<tr>
				<th>성별</th>
				<th><input name="memberGender"
					value="${memberVO.memberGender }" readonly="readyonly"></th>
			</tr>
			<tr>
				<th>핸드폰</th>
				<th><input name="memeberPhone"
					value="${memberVO.memberPhoneNum }"></th>
			</tr>
			<tr>
				<th>참여자평점</th>
				<th><input name="memberJoinGrade"
					value="${memberVO.memberJoinGrade }" readonly="readonly"></th>
			</tr>
			<tr>

				<th>원정대장 평점</th>
				<th><input name="memberCapGrade"
					value="${memberVO.memberCapGrade }" readonly="readonly"></th>
			</tr>
		</c:forEach> </thread>
	</table>
	<input type="button" value="수정" id="btnUpdate">
</body>
</html>