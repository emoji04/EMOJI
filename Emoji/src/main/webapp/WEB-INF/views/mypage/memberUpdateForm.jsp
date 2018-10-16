<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>회원정보상세보기</title>
<style>
#table {
	margin: 30%;
}
</style>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보상세</title>
</head>
<body>
	<div id="all">
		<%@ include file="../commons/top_bar.jsp"%>
		<div id="table">
			<h1>회원정보상세보기</h1>

			로그인 ID : ${loginInfo }

			<form id = "form" action="/memberUpdateForm" method = "POST">
			
				<table>
					<thead>
						<c:forEach items="${memberUpdateForm }" var="MemberVO">
							<tr>
								<th>아이디</th>
								<th><input name="memberEmail"
									value="${MemberVO.memberEmail}" readonly="readyonly"></th>
							</tr>
							<tr>
								<th>이름</th>
								<th><input name="memberName"
									value="${MemberVO.memberName }" readonly="readyonly"></th>
							</tr>

							<tr>
								<th>비밀번호</th>
								<th><input type="text" id ="memberPassword"name="memberPassword" value="" value=""></th>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<th><input type="text" id = "memberPasswordCh" name="memberPasswordCh" value=""></th>
							</tr>
							<tr>
								<th>성별</th>
								<th><input name="memberGender"
									value="${MemberVO.memberGender }" readonly="readyonly"></th>
							</tr>
							<tr>
								<th>핸드폰</th>
								<th><input name="memberPhoneNum"
									value="${MemberVO.memberPhoneNum }"></th>
							</tr>
							<tr>
								<th>참여자평점</th>
								<th><input name="memberJoinGrade"
									value="${MemberVO.memberJoinGrade}" readonly="readonly"></th>
							</tr>
							<tr>
								<th>원정대장평점</th>
								<th><input name="memberCapGrade"
									value="${MemberVO.memberCapGrade}" readonly="readonly"></th>
							</tr>
						</c:forEach>
					</thead>
				</table>

				<input type="button" value="수정" id="btnUpdate">
			</form>
		</div>
	</div>
</body>
</html>
<script>

pw = $('#memberPassword').val();
pwch = $('#memberPasswordCh').val();
	$(document).ready(function() {
		$("#btnUpdate").click(function() {
			if(pw == pwch){
				alert($('#memberPassword').val())
				alert($('#memberPasswordCh').val())
				 $("#form").submit(); 
			} else {
				alert('비밀번호가 일치하지 않습니다');
			}
		});
	});
</script>
