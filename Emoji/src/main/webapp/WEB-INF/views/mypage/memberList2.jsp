<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
<script>
 window.onload=function(){
	 alert      ")
 }
</script>
</head>
<body>
	<h1>ȸ����������</h1>

	�α��� ID : ${memberEmail }

	<table>
		<thread> <c:forEach items="${memberList }" var="memberVO">
			<tr>
				<th>���̵�</th>
				<th><input name="memberEmail" value="${memberVO.memberEmail}"
					readonly="readyonly"></th>
			</tr>
			<tr>
				<th>�̸�</th>
				<th><input name="memberName" value="${memberVO.memberName }"
					readonly="readyonly"></th>
			</tr>
			
			<tr>
				<th>��й�ȣ</th>
				<th><input name="memberPassword"
					value="${memberVO.memberPassword }"></th>
			</tr>
			<tr>
				<th>��й�ȣ Ȯ��</th>
				<th><input name=""
					value=" "></th>
			</tr>
			<tr>
				<th>����</th>
				<th><input name="memberGender"
					value="${memberVO.memberGender }" readonly="readyonly"></th>
			</tr>
			<tr>
				<th>�ڵ���</th>
				<th><input name="memeberPhone"
					value="${memberVO.memberPhoneNum }"></th>
			</tr>
			<tr>
				<th>����������</th>
				<th><input name="memberJoinGrade"
					value="${memberVO.memberJoinGrade }" readonly="readonly"></th>
			</tr>
			<tr>

				<th>�������� ����</th>
				<th><input name="memberCapGrade"
					value="${memberVO.memberCapGrade }" readonly="readonly"></th>
			</tr>
		</c:forEach> </thread>
	</table>
	<input type="button" value="����" id="btnUpdate">
</body>
</html>