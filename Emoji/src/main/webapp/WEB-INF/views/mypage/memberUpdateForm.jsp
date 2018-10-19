<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
<title>회원정보상세보기</title>
<style>

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 8px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

tr:hover {background-color:#f5f5f5;}
#table {
	margin: 100px;
	width: 400px;
}
input{
border: 0px;
width: 100%;
height: 100%;
}
th{
height: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보상세</title>
</head>
<body style="background-color: #F3F3F3">

	<div id="all" style="width: 600px; height:650px;margin: 150px auto;  border-radius:20px; background-color: white;">
		<%@ include file="../commons/top_bar.jsp"%>
		<div id="table">
			<h1 style="padding: 50px;">회원정보상세보기</h1>

			

			<form id = "form" action="<c:url value="/memberUpdateForm" />" method = "POST">
				<input type="hidden" name="memberNum" value="${loginInfo }" >
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
								<th><input type="password" id ="memberPassword" name="memberPassword" value="" placeholder="변경하실 비밀번호를 입력 해 주세요."></th>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<th><input type="password" id = "memberPasswordCh" name="memberPasswordCh" value="" placeholder="다시한번 입력 해 주세요."></th>
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

				<input type="button" value="수정" id="btnUpdate" style="width: 200px;height: 40px;position: relative;left: 93px;top: 27px;border-radius: 10px;">
			</form>
		</div>
	</div>
	
	
</body>
</html>
<script>


	$(document).ready(function() {
		
	/* 	var pw = $('#memberPassword').val();
		var pwch = $('#memberPasswordCh').val(); */
		$("#btnUpdate").click(function() {
			if( $('#memberPassword').val() == $('#memberPasswordCh').val()){
				alert($('#memberPassword').val())
				alert($('#memberPasswordCh').val())
				 $("#form").submit(); 
			} else {
				alert('비밀번호가 일치하지 않습니다');
			}
		});
	});
</script>
