<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�������󼼺���</title>
</head>
<body>
	<h1>ȸ�������󼼺���</h1>

	�α��� ID : ${memberEmail }

	<table>
		<thead>
			<c:forEach items="${memberList }" var="MemberVO">
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
						value="${MemberVO.memberPassword }"></th>
				</tr>
				<tr>
					<th>��й�ȣ Ȯ��</th>
					<th><input name="memberPassword2" value=" "></th>
				</tr>
				<tr>
					<th>����</th>
					<th><input name="memberGender"
						value="${MemberVO.memberGender }" readonly="readyonly"></th>
				</tr>
				<tr>
					<th>�ڵ���</th>
					<th><input name="memeberPhoneNum"
						value="${MemberVO.memberPhoneNum }" readonly="readonly"></th>
				</tr>
				<tr>
					<th>����������</th>
					<th><input name="memberJoinGrade"
						value="${MemberVO.memberJoinGrade }" readonly="readonly"></th>
				</tr>
				<tr>

					<th>�������� ����</th>
					<th><input name="memberCapGrade"
						value="${MemberVO.memberCapGrade }" readonly="readonly"></th>
				</tr>
			</c:forEach>
		</thead>
	</table>
	<input type="button" value="����" id="btnUpdate">
</body>
</html>
<script>
	/* ajax ȸ������ ����ó�� */
	function btnUpdate() {
		alert("�����Ͻðڽ��ϱ�?");
		var memberPassword = $("#memberPassword").val();
	}
	$.ajax({
		type : "GET",
		url : "memberList.jsp",
		data : {//�÷����ӿ� �Է��� �� ��
			"memberPassword" : memeberPassword
		},
		dateType : "JSON",
		success : function(data) {
			console.log(data);
			alert('�����Ǿ����ϴ�');
		}
	});
</script>
