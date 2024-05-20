<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		div{
			border:1px solid red;
		}
		#warp{
			width:1200px;
			height:auto;
			margin:auto;
		}
		.product-area{
			width:850px;
			height:auto;
			border: 1px solid rgb(94,94,94);
			margin:auto
		}
		.product-header{
			width:100%;
			height:420px;
		}
		.product-header > div{
			float: left;
			width:50%;
			height:100%;
		}
		.product-img{
			padding:30px 15px 15px 30px;
		}
		.product-img img{
			width:100%;
			height:100%:
		}
		.product-content{
			padding:30px 30px 15px 15px;
		}
	</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="wrap">
		<c:set var="product" value="${requestScope.product}"/>

		<c:set var="att" value="${ product.attachment }"/>
		<div class="product-area">
			<div class="product-header">
				<div class="product-img">
					<img src="${ sessionScope.path }${att.attPath}${att.changeName}"/>
				</div>
				<div class="product-content">
					<div class="product-title">${ product.productName }</div>
					<div class="product-price-btn">
						<div class="product-price"></div>
						<div class="product-btn"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>