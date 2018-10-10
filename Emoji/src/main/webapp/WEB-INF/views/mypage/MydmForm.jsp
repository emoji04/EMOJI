<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
/*전체 테두리*/
#all {
	margin: 30%;
}
/*탭 스타일*/
.tap {
	display: inline-block;
	border: 1px solid black;
	width: 100px;
}
/*테이블 스타일*/
#table {
	border: 1px solid black;
}

#sub {
	text-align: left;
}

#sub {
	display: none;
}

#sub.active sub {
	display: block;
} 
</style>
</head>

<body>
<div id="all">
    <div>
        <div id="tap_1" class="tap"><a href='<c:url value="/mypage/MydmForm" />'>내 등록 지도 </a></div>
        <div id="tap_2" class="tap"><a href='<c:url value="/mypage/MydmForm" />'>내 관심 지도</a></div>
        
            <c:forEach items="${myDmList}" var="deliciousMapVO" varStatus="status">

                <table id="table">
                    <tr >
                        <th>
                            <input type='checkbox'>
                            <input id="accordian"  class="${status.index}" name="deliciousMapName" value="${deliciousMapVO.deliciousMapName}" onclick="test(${status.index})" readonly="readyonly">
                            <span><input type="button" value="공개"></span>
                            <span><input type="button" value="수정"></span>
                            <span><input type="button" value="삭제"></span>
                        </th>
                    </tr>

                    <tr>
                        <th id="sub"  class="sub${status.index}">
                            <input name="deliciousMapTag" value="${deliciousMapVO.deliciousMapTag}" readonly="readyonly"> <br>
                            <input name="deliciousMapOpen" value="${deliciousMapVO.deliciousMapOpen}" readonly="readyonly"><br>
                            <input name="deliciousMapCreateDate" value="${deliciousMapVO.deliciousMapCreateDate}" readonly="readyonly">
                        </th>
                    </tr>
                </table>
            </c:forEach>
        </div>
</body>

</html>
<script>
	function test(value) {
		$(".sub" + value).slideToggle();
	}
</script>