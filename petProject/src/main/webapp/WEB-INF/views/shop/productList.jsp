<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 메인페이지</title>
	<style>
		div{
			box-sizing: border-box;
		}
		#wrap{
			width: 1200px;
			height: 1150px;
			margin: auto;
		}
		.shop_header{
			width: 1200px;
			height: 200px;
			display: flex;
			justify-content: space-between;
		}
		.shop_body{
			height: 950px;	
		}
		.header_search{
			height: 100%;
			width: 350px;
			padding: 65px 70px 65px 30px;
		}
		.header_category{
			height: 100%;
			width:600px;
		}
		.anmal_category{
			height: 60%;
			padding-top: 40px;
		}
		.use_category{
			height: 40%;
		}
		.nav-item > img{
			width: 90px;
			height: 70px;
		}
		.use_category > div{
			margin-top:10px;
			float: right;
		}
		.custom-col-5 {
	      flex: 0 0 20%;
	      max-width: 20%;
	    }
	    #productList{
	    	width: 1200px;
	    	margin: auto;
	    }
	    .card{
	    	margin:10px;
	    }
	    .product_img{
	    	width: 100%;
	    	height: 190px;
	    }
	    .card-text{
	    	padding-left: 5px;
	    	font-size: 12px;
	    	font-weight: bold;
	    }
	</style>

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div id="wrap">
		<div class="shop_header">
			<div class="header_search">
			
			</div>
			<div class="header_category">
				<div class="anmal_category">
					<ul class="nav nav-tabs nav-justified">
						<li class="nav-item"><img class="img_dog" src="${sessionScope.path }/resources/img/animaldog.png"></li>
						<li class="nav-item"><img class="img_cat" src="${sessionScope.path }/resources/img/animalcat.png"></li>
						<li class="nav-item"><img class="img_rab" src="${sessionScope.path }/resources/img/animalrab.png"></li>
						<li class="nav-item"><img class="img_fish" src="${sessionScope.path }/resources/img/animalfish.png"></li>
						<li class="nav-item"><img class="img_bird" src="${sessionScope.path }/resources/img/animalbird.png"></li>
						<li class="nav-item"><img class="img_ham" src="${sessionScope.path }/resources/img/animalham.png"></li>
					</ul>
				</div>
				<div class="use_category">
					<div>
						<select>
							<option>전체</option>
							<option>식품</option>
							<option>생필품</option>
						</select>
					</div>
				</div>
			</div>
		</div>
		<div class="shop_body">
			<div class="row" id="productList">
				<div class="custom-col-5" >
					<div class="card">
					  <div class="card-body">
					    <img class="product_img" src="">
					    <p class="card-text">습식사료 푸치앤머트 375g <br>
1ea</p>
					    <a href="#" class="card-link">Card link</a>
					    <a href="#" class="card-link">Another link</a>
					  </div>
					</div>
				</div>
				<div class="custom-col-5" >
					<div class="card">
					  <div class="card-body">
					    <h4 class="card-title">Card title</h4>
					    <p class="card-text">Some example text. Some example text.</p>
					    <a href="#" class="card-link">Card link</a>
					    <a href="#" class="card-link">Another link</a>
					  </div>
					</div>
				</div>
				<div class="custom-col-5" >
					<div class="card">
					  <div class="card-body">
					    <h4 class="card-title">Card title</h4>
					    <p class="card-text">Some example text. Some example text.</p>
					    <a href="#" class="card-link">Card link</a>
					    <a href="#" class="card-link">Another link</a>
					  </div>
					</div>
				</div>
				<div class="custom-col-5" >
					<div class="card">
					  <div class="card-body">
					    <h4 class="card-title">Card title</h4>
					    <p class="card-text">Some example text. Some example text.</p>
					    <a href="#" class="card-link">Card link</a>
					    <a href="#" class="card-link">Another link</a>
					  </div>
					</div>
				</div>
				<div class="custom-col-5" >
					<div class="card">
					  <div class="card-body">
					    <h4 class="card-title">Card title</h4>
					    <p class="card-text">Some example text. Some example text.</p>
					    <a href="#" class="card-link">Card link</a>
					    <a href="#" class="card-link">Another link</a>
					  </div>
					</div>
				</div>
		      
		      <div class="custom-col-5" >
					<div class="card">
					  <div class="card-body">
					    <h4 class="card-title">Card title</h4>
					    <p class="card-text">Some example text. Some example text.</p>
					    <a href="#" class="card-link">Card link</a>
					    <a href="#" class="card-link">Another link</a>
					  </div>
					</div>
				</div>
		      
		    </div>
						
		</div>
	
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>