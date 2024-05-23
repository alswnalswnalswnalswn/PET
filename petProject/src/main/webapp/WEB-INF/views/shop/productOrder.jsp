<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		border:none;
	}
	#warp{
		width:1200px;
		height:auto;
		margin:auto;
	}
	.productList-area{
		float:left;
		width:60%;
		height:200px;
		padding-right: 10px;
	}
	.orderList-area{
		float:left;
		width:40%;
		height:200px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="warp">
		<div class="productList-area">
			
		</div>
		<div class="orderList-area">
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>