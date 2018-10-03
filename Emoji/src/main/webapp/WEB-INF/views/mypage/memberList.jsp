<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보상세보기</title>
</head>
<body>
	<h1>회원정보상세보기</h1>

	로그인 ID : ${memberEmail }

	<table>
		<thead>
			<c:forEach items="${memberList }" var="MemberVO">
				<tr>
					<th>아이디</th>
					<th><input name="memberEmail" value="${MemberVO.memberEmail}"
						readonly="readyonly"></th>
				</tr>
				<tr>
					<th>이름</th>
					<th><input name="memberName" value="${MemberVO.memberName }"
						readonly="readyonly"></th>
				</tr>

				<tr>
					<th>비밀번호</th>
					<th><input name="memberPassword"
						value="${MemberVO.memberPassword }"></th>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<th><input name="memberPassword2" value=" "></th>
				</tr>
				<tr>
					<th>성별</th>
					<th><input name="memberGender"
						value="${MemberVO.memberGender }" readonly="readyonly"></th>
				</tr>
				<tr>
					<th>핸드폰</th>
					<th><input name="memeberPhoneNum"
						value="${MemberVO.memberPhoneNum }" readonly="readonly"></th>
				</tr>
				<tr>
					<th>참여자평점</th>
					<th><input name="memberJoinGrade"
						value="${MemberVO.memberJoinGrade }" readonly="readonly"></th>
				</tr>
				<tr>

					<th>원정대장 평점</th>
					<th><input name="memberCapGrade"
						value="${MemberVO.memberCapGrade }" readonly="readonly"></th>
				</tr>
			</c:forEach>
		</thead>
	</table>
	<input type="button" value="수정" id="btnUpdate">
</body>
</html>
<script>
	/* ajax 회원정보 수정처리 */
	function btnUpdate() {
		alert("수정하시겠습니까?");
		var memberPassword = $("#memberPassword").val();
	}
	$.ajax({
		type : "GET",
		url : "memberList.jsp",
		data : {//컬럼네임에 입력한 값 담
			"memberPassword" : memeberPassword
		},
		dateType : "JSON",
		success : function(data) {
			console.log(data);
			alert('수정되었습니다');
		}
	});
</script>
