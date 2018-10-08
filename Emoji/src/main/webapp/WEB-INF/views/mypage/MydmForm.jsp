<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 맛집 지도 목록 </title>
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
			<h1>내등록지도</h1>

			<!-- 맛집 지도 목록 출력 폼  -->
			<!-- 체크박스 출력해줘야함 -->
			

				<table>
					<thead>
						<c:forEach items="${memberUpdateForm }" var="MemberVO">
						<tr>
								<th>선택공개 </th>
								<th><input name="memberEmail"
									value="${MemberVO.memberEmail}" readonly="readyonly"></th>
							</tr>
							<tr>
								<th>선택삭제 </th>
								<th><input name="memberEmail"
									value="${MemberVO.memberEmail}" readonly="readyonly"></th>
							</tr>
							<tr>
								<th>번호 </th>
								<th><input name="memberEmail"
									value="${MemberVO.memberEmail}" readonly="readyonly"></th>
							</tr>
							<tr>
								<th>이름</th>
								<th><input name="memberName"
									value="${MemberVO.memberName }" readonly="readyonly"></th>
							</tr>

							<tr>
								<th>비공개 버튼</th>
								<th><input type="text" id ="memberPassword"name="memberPassword" value="" value=""></th>
							</tr>
							<tr>
								<th>수정버튼 </th>
								<th><input type="text" id = "memberPasswordCh" name="memberPasswordCh" value=""></th>
							</tr>
							<tr>
								<th>삭제 버튼</th>
								<th><input name="memberGender"
									value="${MemberVO.memberGender }" readonly="readyonly"></th>
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