<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body style="background-image: url('https://notefolio.net/data/img/63/60/6360b31b39437d1341547bc56f14886f363a16008d284ab4e1e8eb4a67d15452_v1.jpg'); background-size: 100%">

<!-- /////////// 상단바  /////////// -->
<%@ include file="commons/top_bar.jsp"%>

	<!-- 메인 검색 창 -->
	<div class="container">
		<div class="row">
	        <div class="col-sm-6 col-sm-offset-3">
	            <div id="imaginary_container"> 
	                <div class="input-group stylish-input-group" style="border: solid 2px black; border-radius: 5px">
	                    <input type="text" class="form-control"  placeholder="Search" >
	                    <span class="input-group-addon">
	                        <button type="submit">
	                            <span class="glyphicon glyphicon-search"></span>
	                        </button>  
	                    </span>
	                </div>
	            </div>
	        </div>
		</div>
	</div>
</body>
</html>