<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>s
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>나의 맛집 지도 목록</title>
<!-- <script src="https://code.jquery.com/jquery-1.11.3.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보상세</title>
<style type="text/css">
#accordian {
	background: #333333;
	width: 250px;
	margin: 300px auto 0 auto;
	color: black;
	box-shadow: 
		0 5px 15px 1px rgba(0, 0, 0, 0.6), 
		0 0 200px 1px rgba(255, 255, 255, 0.5);
}

/* 메뉴 스타일 */
#accordian h3 {
	font-size: 12px;
	line-height: 34px;
	padding: 0 10px;
	cursor: pointer;
	background: #064461;
	background: linear-gradient(#003040, #002535);
}

#accordian h3:hover {
	text-shadow: 0 0 1px rgba(255, 255, 255, 0.7);
}


/* 서브메뉴 스타일 */
#accordian ul ul li a {
	text-decoration: none;
	font-size: 11px;
	line-height: 27px;
	display: block;
	padding: 0 15px;
	-webkit-transition: all 0.15s;
	-moz-transition: all 0.15s;
	-o-transition: all 0.15s;
	-ms-transition: all 0.15s;
	transition: all 0.15s;
}

#accordian ul ul li a:hover {
	background: #003545;
	border-left: 5px solid #09c;
}

/* active 클래스 외에 것은 보이지 않게 하기 */
#accordian ul ul {
	display: none;
}
#accordian li.active ul {
	display: block;
}
			

</style>
</head>

<body>
	 <div id="all">
		<%@ include file="../commons/top_bar.jsp"%>
		<div id="accordian">
			<c:forEach items="${myDmList}" var="deliciousMapVO">
				<ul>
					<li>
						<h3>
							<input name="deliciousMapName"
								value="${deliciousMapVO.deliciousMapName}">
						</h3>
						<ul>
							<input name="deliciousMapTag"
								value="${deliciousMapVO.deliciousMapTag}" readonly="readyonly">
						</ul>
						<ul>
							<input name="deliciousMapDetail"
								value="${deliciousMapVO.deliciousMapDetail}"
								readonly="readyonly">
						</ul>
						<ul>
							<input name="deliciousMapOpen"
								value="${deliciousMapVO.deliciousMapOpen}" readonly="readyonly">
						</ul>
						<ul>
							<input name="deliciousMapCreateDate"
								value="${deliciousMapVO.deliciousMapCreateDate}"
								readonly="readyonly">
						</ul>
					</li>
				</ul>
			</c:forEach>
		</div> 





	<%-- 	<!-- 내등록지도 불러오기  -->

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
		</div>  --%>
	</div>
</body>
</html>
<script>
	$(document).ready(function() {
		$("#accordian h3").click(function() {
			/* $("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			} */
			$("#accordian ul ul").slideDown();
		});
		$("#accordian h3").click(function() {
			/* $("#accordian ul ul").slideUp();
			if (!$(this).next().is(":visible")) {
				$(this).next().slideDown();
			} */
			$("#accordian ul ul").slidUp();
		});
	})
</script>