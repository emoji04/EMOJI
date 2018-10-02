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
		margin : 30%;
	}

</style>
</head>
<body>
<div id="all">
<%@ include file="../commons/top_bar.jsp"%>
<div id = "table">
	<h1>회원정보상세보기</h1>

	로그인 ID : ${memberEmail }

	<table>
		<thead> <c:forEach items="${memberList }" var="MemberVO">
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
				<th><input name="memberPassword" value="${MemberVO.memberName }"
					value=""></th>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<th><input name=""
					value=" "></th>
			</tr>
			<tr>
				<th>성별</th>
				<th><input name="memberGender"
					value="${MemberVO.memberGender }" readonly="readyonly"></th>
			</tr>
			<tr>
				<th>핸드폰</th>
				<th><input name="memeberPhone"value="${MemberVO.memberPhoneNum }"
					></th>
			</tr>
			<tr>
				<th>참여자평점</th>
				<th><input name="memberJoinGrade"
					value="${MemberVO.memberJoinGrade}" readonly="readonly"></th>
			</tr>
			<tr>

				<th>원정대장 평점</th>
				<th><input name="memberCapGrade"
					value="${MemberVO.memberCapGrade }" readonly="readonly"></th>
			</tr>
		</c:forEach> </thead>
	</table>
	<input type="button" value="수정" id="btnUpdate">
	</div>
	</div>
</body>
</html>
<!-- <script>
window.onload = function(){
	$.ajax({
		type:"POST",
		url:"${memberList}",
		/* data :"", */
		dataType:"json",
		cache : false,
		  
		success:function(data){
			  $.each(data, function(key, value) {
			console.log(data);
			
			$("#memberEmail").val(value.memberEmail);
			$("#memberName").val(value.memberName);
			$("#memberPassword").val(value.memberPassword);
			$("#memberGender").val(value.memberGender);
			$("#memberPhoneNum").val(value.memberPhoneNum);
			$("#memberJoinGrade").val(value.memberJoinGrade);
			$("#memberCapGrade").val(value.memberCapGrade);
			
		});
		},
	    error:function(request,status,error){

	          alert("code:"+request.status+"\n"+"message:"

	            +request.responseText+"\n"+"error:"+error);

	   }
	});
	
	$(document).ready(function(){
		$("#btnUpdate").click(function(){
			document.forml.action ="${path}/mypage/memberList";
			document.forml.sunmit();
		});
	});
	

} 


</script> -->
