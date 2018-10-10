<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 맛집 지도 목록</title>
<style>
#table {
	margin: 10%;
}
</style>
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보상세</title>
<style>
</style>
</head>

<body>
	<div id="all">
		<%@ include file="../commons/top_bar.jsp"%>
		<div id="table">
			<h1>내등록지도</h1>

			<!-- 맛집 지도 목록 출력 폼  -->
			<!-- 체크박스 출력해줘야함 -->
			로그인 ID : ${loginInfo }

			<table id="MyDmList">

				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>태그</th>
						<th>세부정보</th>
						<th>공개여부</th>
						<th>생성날짜</th>
					</tr>
				</thead>
				<c:forEach items="${myDmList}" var="deliciousMapVO">

					<tr>
						<th><input name="deliciousMapNum"
							value="${deliciousMapVO.deliciousMapNum}"></th>
						<!-- 제목을 클릭하면 해당 정보를 뿌려줌 -->
						<th id="title"><input type="button" name="deliciousMapName"
							value="${deliciousMapVO.deliciousMapName}"></th>
						<th><input name="deliciousMapTag"
							value="${deliciousMapVO.deliciousMapTag}" readonly="readyonly"></th>
						<th><input name="deliciousMapDetail"
							value="${deliciousMapVO.deliciousMapDetail}" readonly="readyonly"></th>
						<th><input name="deliciousMapOpen"
							value="${deliciousMapVO.deliciousMapOpen}" readonly="readyonly"></th>
						<th><input name="deliciousMapCreateDate"
							value="${deliciousMapVO.deliciousMapCreateDate}"
							readonly="readyonly"></th>
					</tr>
				</c:forEach>

			</table>

			<input type="button" value="수정" id="btnUpdate">
			</form>
		</div>
	</div>
</body>
</html>
<script>
	$('#title').click(function() {

	});
</script>