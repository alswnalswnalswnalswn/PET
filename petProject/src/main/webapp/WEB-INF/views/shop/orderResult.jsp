<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.result{
		margin: auto;
		width: 1200px;
		text-align: center;
		margin-top: 100px;
		margin-bottom: 100px;
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="result">
		<h1>상품 구매완료되었습니다.</h1>	
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>