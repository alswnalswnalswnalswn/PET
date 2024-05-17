<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑 메인페이지</title>
	<style>
		#wrap div{
			border: 1px solid red;
		
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
		.nav-item > img{
			width: 90px;
			height: 55px;
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
				</div>
			</div>
		</div>
		<div class="shop_body">
		</div>
	
	
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>