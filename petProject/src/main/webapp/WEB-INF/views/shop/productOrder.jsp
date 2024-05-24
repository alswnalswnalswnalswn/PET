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
	#wrap{
		width:900px;
		height:auto;
		margin:auto;
	}
	.productList-area{
		width:100%;
		height:auto;
	}
	.orderList-area{
		width:100%;
		height:auto;
		border: 1px solid rgb(204, 204, 204);
		padding: 10px;
		height: 240px;
	}
	.productList-detail{
		width: 100%;
		height: auto;
		padding: 10px;
		border: 1px solid rgb(204, 204, 204);
	}
	.item{
		display: flex;
		border: 1px solid rgb(204, 204, 204);
	}
	.item-img{
		width:20%;
		height: 100%;
		padding: 5px;
	}
	.item-detail{
		width:80%;
		padding: 20px 5px;
		font-weight: 500;
		
	}
	.item-img img{
		width: 100%;
		height: 100%;
	}
	.order-area{
		width:100%;
		
	}
	.order-area > .row{
		width:100%;
		margin:auto;
		margin-bottom:15px;
	}
	.order-area button{
		width:100%;
		height: 100%;
	}
	.row > div{
		margin-bottom: 5px;
	}
	.order-area input {
		width: 100%;
		border: 1px solid rgb(204, 204, 204);
	}
	.user-address{
		margin-top: 10px;
		width: 100%;
		height: auto;
		padding: 10px;
		border: 1px solid rgb(204, 204, 204);
	}
	.user-address button{
		width:100%;
		height: 100%;
	}
	.user-address input{
		width: 100%;
		border: 1px solid rgb(204, 204, 204);
	}
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<c:set var="item" value="${ sessionScope.productOptions }"/>
	
	<div id="wrap">
		<div class="row">
			<div class="col-sm-6">
				<div class="productList-area">
					<div class="productList-detail">
						
					</div>
					
				</div>
			
			</div>
			<div class="col-sm-6">
				<div class="orderList-area">
					<div class="order-area">
						<h6>주문 요약</h6>
							<div class="row">
								<div class="col-sm-6">총 주문금액</div>
								<div class="col-sm-6 totalPrice"></div>
							</div>
							
							<h6>주문자 정보</h6>
							<div class="row">
								<div class="col-sm-6"><input type="text" placeholder="이름"></div>
								<div class="col-sm-6"><input type="text" placeholder="연락처"></div>
								<div class="col-sm-12"><input type="text" placeholder="이메일"></div>
							</div>
							
							<div class="row">
								<div class="col-sm-12"><button type="button" class="btn btn-warning">카카오페이로 결제</button></div>
							</div>
						</div>
					</div>
				</div>
			<div class="col-sm-12">
				<div class="user-address-area">
					<div class="user-address">
						<h6>배송 정보</h6>
						<div class="row">
							<div class="col-sm-6"><input type="text" placeholder="수령인"></div>
							<div class="col-sm-6"><input type="text" placeholder="연락처"></div>
							<div class="col-sm-3"><input type="text" placeholder="우편번호"></div>
							<div class="col-sm-3"><button id="address-btn">주소찾기</button></div>
							<div class="col-sm-12"><input type="text" placeholder="주소"></div>
							<div class="col-sm-12"><input type="text" placeholder="상세주소"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
	</div>
	
	<script>
	$(() => {
		let totalPrice = 0;
		const data = JSON.parse(sessionStorage.getItem('data'));
		console.log(data);
		let text = '<h6>주문 상품 정보</h6>';
		data.forEach(item => {
			totalPrice = totalPrice + Number(item.price);
			text += '<div class="item">' +
			'<div class="item-img"><img src="' + item.src + '"/></div>' +
			'<div class="item-detail"><span>' + item.productName +' ' + item.productAmount + '</span><br><span>' + item.price + '원</span></div>' +
			'</div>';
			
			
		});
		$('.totalPrice').text(totalPrice+'원');
		$('.productList-detail').html(text);
		


		
		
		
	});
		
	</script>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>