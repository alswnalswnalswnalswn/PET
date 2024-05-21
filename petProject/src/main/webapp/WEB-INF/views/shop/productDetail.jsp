<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>

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
		.product-price-btn{
			margin-top: 10px;
			height: 30px;
			width:70%;
		}
		
		.product-price{
			float: left;
			color:rgb(211, 84, 0);
	    	font-weight:bold
		}
		.product-btn{
			float: right;
			
		}
		.product-title{
			font-weight: bold;
			height:55px;
		}
		.product-btn img{
			width:25px;
			height:25px;
		}
		
		.product-color, .product-size{
			width:70%;
			padding: 5px 0;
			height: 50px;
		}
		.product-content select{
			width:100%;
			height:100%;
		}
		.product-content option{
			padding:10px 0;
		}
		.product-count{
			width: 40%;
			display:flex;
			justify-content: space-around;
		}
		.product-count button{
			width: 30px;
		}
		.product-count input{
			width: 30px;
			text-align: center;
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
						<div class="product-price">${ product.price }</div>
						<div class="product-btn"><img src="${sessionScope.path}/resources/img/common/cart2.png" />&ensp;<img src="${sessionScope.path}/resources/img/common/heart2.png" /></div>
					</div>
					<div class="product-color">
							<select>
								<option>블랙</option>
								<option>화이트</option>
							</select>
						</div>
						<div class="product-size">
							<select>
								<option>사이즈</option>
							</select>
						</div>
						<div class="product-count">
							<button>-</button><input class="input-count" type="text" value="0"/><button>+</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>