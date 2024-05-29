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
		margin-bottom:10px;
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
		width:72%;
		height: 100%;
	}
	.user-address input{
		width: 100%;
		border: 1px solid rgb(204, 204, 204);
	}
</style>
</head>
<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
								<div id="totalPrice" class="col-sm-6 totalPrice"></div>
							</div>
							
							<h6>주문자 정보</h6>
							<div class="row">
								<div class="col-sm-6"><input type="text" placeholder="이름" value="${loginUser.memberName }" disabled></div>
								<div class="col-sm-6"><input type="text" placeholder="연락처" value="${loginUser.phone }" disabled></div>
								<div class="col-sm-12"><input type="text" placeholder="이메일" value="${loginUser.email }" disabled></div>
							</div>
							
							<div class="row">
								<div class="col-sm-12"><button type="button" class="btn btn-warning" id="kakaopay-btn">카카오페이로 결제</button></div>
							</div>
						</div>
					</div>
				</div>
			<div class="col-sm-12">
				<div class="user-address-area">
					<div class="user-address">
						<h6>배송 정보</h6>
						<div class="row">
							<div class="col-sm-6"><input type="text" placeholder="수령인" value="${loginUser.memberName }"></div>
							<div class="col-sm-6"><input type="text" placeholder="연락처" value="${loginUser.phone }"></div>
							<div class="col-sm-3"><input type="text" id="postcode" placeholder="우편번호"></div>
							<div class="col-sm-4"><button id="address-btn">주소찾기</button></div>
							<div class="col-sm-6"><input type="text" id="jibunAddress" placeholder="지번주소"></div>
							<div class="col-sm-6"><input type="text" id="roadAddress" placeholder="도로명주소"></div>
							<div class="col-sm-6"><input type="text" placeholder="상세주소"></div>
							<div class="col-sm-6"><input type="text" id="extraAddress" placeholder="참고주소"></div>
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
		$('#kakaopay-btn').click(() => {
			window.open("payment","결제팝업","width = 500, height = 500");
		});
		
		$('#address-btn').click(() => {
			new daum.Postcode({
		        oncomplete: function(data) {
		        	 var roadAddr = data.roadAddress;
		                var extraRoadAddr = ''; 

		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }

		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }

		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }

		                document.getElementById('postcode').value = data.zonecode;
		                document.getElementById("roadAddress").value = roadAddr;
		                document.getElementById("jibunAddress").value = data.jibunAddress;
		                

		                if(roadAddr !== ''){
		                    document.getElementById("extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }

		                var guideTextBox = document.getElementById("guide");

		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';

		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		});

		
		
		
	});
		
	</script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>