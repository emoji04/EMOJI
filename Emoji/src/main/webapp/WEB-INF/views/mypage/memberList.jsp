<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�������󼼺���</title>
</head>
<body>
	<h1>ȸ�������󼼺���</h1>

	�α��� ID : ${memberEmail }

	<table>
		<thead> <c:forEach items="${memberList }" var="MemberVO">
			<tr>
				<th>���̵�</th>
				<th><input name="memberEmail" value="${MemberVO.memberEmail}"
					readonly="readyonly"></th>
			</tr>
			<tr>
				<th>�̸�</th>
				<th><input name="memberName" value="${MemberVO.memberName }"
					readonly="readyonly"></th>
			</tr>
			
			<tr>
				<th>��й�ȣ</th>
				<th><input name="memberPassword"
					value=""></th>
			</tr>
			<tr>
				<th>��й�ȣ Ȯ��</th>
				<th><input name=""
					value=" "></th>
			</tr>
			<tr>
				<th>����</th>
				<th><input name="memberGender"
					value="${MemberVO.memberGender }" readonly="readyonly"></th>
			</tr>
			<tr>
				<th>�ڵ���</th>
				<th><input name="memeberPhone"
					value=""></th>
			</tr>
			<tr>
				<th>����������</th>
				<th><input name="memberJoinGrade"
					value="" readonly="readonly"></th>
			</tr>
			<tr>

				<th>�������� ����</th>
				<th><input name="memberCapGrade"
					value="" readonly="readonly"></th>
			</tr>
		</c:forEach> </thead>
	</table>
	<input type="button" value="����" id="btnUpdate">
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
