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
		.product-area{
			width:850px;
			height:auto;
			border: 1px solid rgb(204, 204, 204);
			margin:auto
		}
		.product-header{
			display: flex;
			flex-wrap: wrap;
			width:100%;
			height: auto;
		}
		.product-header > div{
			float: left;
			width:50%;
			height:100%;
		}
		.product-img{
			padding:30px 20px 30px 30px;
		}
		.product-img img{
			width:100%;
			height:100%;
		}
		.product-content{
			padding:30px 30px 30px 20px;
		}
		.product-price-btn{
			margin-bottom: 15px;
			height: 30px;
			width:70%;
		}
		
		.product-price{
			float: left;
			color:rgb(211, 84, 0);
	    	font-weight:bold;
	    	font-size:18px;
		}
		.product-btn{
			float: right;
			
		}
		.product-title{
			font-weight: bold;
			font-size: 20px;
			height:60px;
			margin-bottom:45px;
		}
		.product-btn img{
			width:25px;
			height:25px;
		}
		
		.product-color, .product-size{
			width:70%;
			padding: 7px 0;
			height: 50px;
		}
		
		.product-count{
			margin: 15px 0;
			width: 100%;
			
		}
		.product-count button {
			position:relative;
            width: 30px; 
            height: 30px;
            border-radius: 5px;
            background: rgba(223, 179, 104, 0.92); 
        }
		.product-count input{
			width: 30px;
			text-align: center;
			border: 1px solid rgb(204, 204, 204);
			border-radius: 5px;
		}
		.product-payment{
			width: 70%;
		}
		.product-payment button{
			width:100%;
			height:40px;
			background: rgb(94, 87, 59);
			color: white;
			font-weight: bold;
			border:none;
			border-radius: 5px;
			
		}
		.dropdown>button{
			width:100%;
			text-align: left;
			position: relative;
		}
		.dropdown>button::after{
			position: absolute;
			top:50%;
			right:5%;
			transform: translateY(-50%);
		}
		.minus-img{
			position:absolute;
			width: 45%;
			height: 45%;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		.plus-img{
			position:absolute;
			width: 50%;
			height: 50%;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
		}
		.product-detail{
			width:100%;
			height:40px;
			font-size:12px;
		}
		.product-body{
			width:100%;
			height:200px;
			padding: 0 30px 30px 30px;
		}
		.product-detail{
			width:100%;
			height: 100%;
			border: 1px solid rgb(204, 204, 204);
			padding: 15px;
			text-align: center;
			font-weight: 600;
		}
		.dropdown-item{
			height: 24px;
		}
		.dropdown-item > div{
			width: 50%;
			float:left;
		}
		.option_btn_wrap{
			width: 100%;
			display:flex;
			justify-content: space-between;
			align-items: flex-end;
		}
		.option_title{
			border-bottom: 1px dashed rgb(204,204,204);
			padding-bottom: 15px;
			display:flex;
			justify-content: space-between;
		}
		.product-count > div{
			border: 1px solid rgb(204, 204, 204);
			padding: 15px 10px;
			margin-bottom:10px;
		}
		.option_btn{
			width: 30%;
			height: 45px;
			padding-top: 15px;
			display:flex;
			justify-content: space-between;
		}
		.sum_price{
			margin-bottom: 5px;
		}
		.sum_price input{
			border:none;
			width:100px;
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
						<div class="product-price">${ product.price }원</div>
						<div class="product-btn"><img src="${sessionScope.path}/resources/img/common/cart2.png" />&ensp;<img src="${sessionScope.path}/resources/img/common/heart2.png" /></div>
					</div>
					<div class="product-color">
						<div class="dropdown">
						  <button id="option-color" type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
						  	색상
						  </button>
						  <div id="selectColor" class="dropdown-menu dropdown-menu-right">
						  
						  </div>
						</div>
					</div>
					<div class="product-size">
						<div class="dropdown">
						  <button id="option-size" type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
						  	사이즈
						  </button>
						  <div id="selectSize" class="dropdown-menu dropdown-menu-right">
						    <a class="dropdown-item">색상을 먼저 선택해주세요</a>
						  </div>
						</div>
					</div>
					<div class="product-count">
						
					</div>
					<div class="product-payment">
						<button type="button">바로 구매</button>
					</div>
				</div>
			</div>
			<div class="product-body">
				<div class="product-detail">${ product.productDetail }</div>
			</div>
		
		</div>
	</div>
	<script>
		$(()=>{
			let num = 0;
			let maxNum = 0;
			let optionNo = 0;
			let colorName = '';
			let sizeName = '';
			let productListArray = [];
			let idNum = 0;
			let count = 0;
			let divIds = [];
			color();

			$('.product-color').on('click','.dropdown-item', e =>{
				colorName = $(e.target).text();
				$('#option-color').text(colorName);
				
				size(colorName);
			});
			
			$('.product-payment > button').click(() => {
				$('.product-count').children().each(function(){
					let optionObj = {
							optionNo : $(this).attr('id').substr(7),
							productAmount : $(this).find('.input-count').val()
					};
					divIds.push(optionObj);
					
				});

				$.ajax({
					url : 'order',
					type : 'POST',
					contentType: 'application/json',
				    dataType: 'json',
					data : JSON.stringify(divIds),
					success : result => {
						console.log(result);
						location.href = 'order/'
					}
				});
				/*location.href = 'order/'+ divIds;*/
			});
			
			$('.product-size').on('click','.dropdown-item', e =>{
				$('#option-size').text($(e.target).closest('.dropdown-item').find('.size_name').text());
				let optionNo = $(e.target).closest('.dropdown-item').attr('id');
				sizeName = $(e.target).closest('.dropdown-item').find('.size_name').text();
				maxNum = $(e.target).closest('.dropdown-item').find('.product_amount').text().substr(5);
				let productList = '<div id="option_' + optionNo + '">' +
									'<div class="option_title"><div class="option_tit">${product.productName} '+ colorName + ' ' + sizeName+'</div><div id="cansle_' + idNum +'" class="option-cansle">X</div></div>' +
									'<div class="option_btn_wrap">' +
										'<div class="option_btn">' +
											'<button class="minus-btn" type="button">' +
												'<img class="minus-img" src="${ sessionScope.path }/resources/img/common/minus.png"/>' +
											'</button>' +
											'<input class="input-count" type="text" value="0"/>' +
											'<button type="button" class="plus-btn">' +
												'<img class="plus-img" src="${ sessionScope.path }/resources/img/common/plus.png"/>' +
											'</button>' +
										'</div>' +
										'<div class="sum_price"><input value="0" disabled>' +
										'</div>' +
									'</div>' +
								'</div>';
				let productObject = {
						id : idNum,
						productList : productList
				};
				productListArray.push(productObject);
			    idNum++;
			    console.log(productListArray);
			    let text = '';
			    productListArray.forEach(item => {
			    	text += item.productList;
			    });
			    $('.product-count').html(text);
			    
				
			});
			$('.product-count').on('click','.option-cansle', e => {
				$(e.target).parent().parent().remove();
				
				count = $(e.target).attr('id').substr(7);
				productListArray = productListArray.filter(filterByID)
				
			});
			function filterByID(item) {
				  if (item.id != count) {
				    return true;
				  }
				  return false;
				}
			$('.product-count').on('click','.minus-btn',e => {
				let input = $(e.currentTarget).siblings('.input-count');
				let inputCount = input.val();
				if(inputCount == 0){
					alert('잘못됩입력입니다.');
				}
				else{
					inputCount = Number(inputCount) - 1;
					input.val(inputCount);
					let sumPrice = ${product.price} * inputCount;
					$(e.currentTarget).parent().next().children('input').val(sumPrice);
					console.log($(e.currentTarget).parent().next().children().val());
					
				}
			});
			
			$('.product-count').on('click','.plus-btn',e => {
				let input = $(e.currentTarget).siblings('.input-count');
				let inputCount = input.val();

				if(maxNum == Number(inputCount)){
					alert('잘못됩입력입니다.');
				}
				else{
					inputCount = Number(inputCount) + 1;
					input.val(inputCount);
					
					let sumPrice = ${product.price} * inputCount;
					$(e.currentTarget).parent().next().children('input').val(sumPrice);
					console.log($(e.currentTarget).parent().next().children().val());
				}
				
			});
			
			function size(color){
				$.ajax({
					url : 'size/' + '${product.productNo}/' + color,
					success : result => {
						if(result[0].sizeName == '없음'){
							$('#option-size').text('수량 : ' + result[0].productAmount).attr('disabled','true');
							maxNum = result[0].productAmount;
							optionNo = result[0].optionNo;
						}
						else{
							let text = '';
							result.forEach(item => {
								text += '<div id="' + item.optionNo + '" class="dropdown-item"><div class="size_name">'+ item.sizeName +'</div><div class="product_amount"> 수량 : ' + item.productAmount + '</div></div>'
								
							});
							
							$('#selectSize').html(text);
						}
						
					}
				});
			}
			
			
			function color() {
				$.ajax({
					url : 'color/' + '${product.productNo}',
					success : result => {
						let text = '';
						if(result[0].colorCode == 0){
							let color = result[0].colorName;
							$('#option-color').text(color).attr('disabled','true');
							size(color);
						}
						else{
						
						
						result.forEach(item => {
							text += '<a class="dropdown-item">' + item.colorName + '</a>'
						}); 
						
						$('#selectColor').html(text);
						
						}
						
						
					}
				});
			}

		});
		
		
	
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>