<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-image: url('resources/img/background.jpg'); background-size: 100%">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- /////////// 상단바  //////////// -->
<%@ include file="commons/top_bar.jsp"%>

	<!-- 메인 검색 창 -->
	<div class="container">
		<div class="row">
	        <div class="col-sm-6 col-sm-offset-3">
	            <div id="imaginary_container"> 
	                <div class="input-group stylish-input-group" style="border: solid 2px black; border-radius: 5px">
	                <select id="dbchoice" class="form-control" style="text-align: center;">
	                <option value="dMap">맛집 지도</option>
	                <option value="route">식신원정대</option>
	                </select>
	                
	                    <input id="mainsearch" type="text" class="form-control"  placeholder="Search">
	                    <span class="input-group-addon">
	                        <button type="submit">
	                            <a href="javascript:searchFunction();"><span class="glyphicon glyphicon-search"></span></a>
	                        </button>  
	                    </span>
	                </div>
	            </div>
	        </div>
		</div>
	</div>
<script>
function searchFunction(){
	
	 window.location.href="<%=request.getContextPath()%>/mainsearch?"
	       +'search3='
		 +$("#mainsearch").val()
		 +'&dbchoice='
		 +$('#dbchoice').val();
}
</script>
</body>
</html>
