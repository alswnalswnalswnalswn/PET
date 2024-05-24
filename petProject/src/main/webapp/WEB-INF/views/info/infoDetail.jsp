<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="../resources/css/info/searchForm.css" />
<style>
	#infoDetail{
		width : 1200px;
		margin : auto;
		border: 1px solid black;
	}
	#detailImg{
		width :600px;
		height: 600px;
		margin : auto;
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<div id="submenubar">
		<div id="searchForm">
			<div id="search">
				<div id="searchcon">
					<input type="text" name="searchContent" id="searchContent"/>
				</div>
				<div id="searchImg">
					<img src="${sessionScope.path}/resources/img/common/searchform.png" alt="" id="searchimg">
				</div>
			</div>
		</div>
		<div class="shop_header">
			<div class="header_search">
			</div>
			<div class="header_category">
				<div class="anmal_category">
					<ul class="nav nav-tabs nav-justified">
						<li class="nav-item" id="A1"><img class="img_dog" src="${sessionScope.path }/resources/img/common/animaldog.png"></li>
						<li class="nav-item" id="A2"><img class="img_cat" src="${sessionScope.path }/resources/img/common/animalcat.png"></li>
						<li class="nav-item" id="A3"><img class="img_rab" src="${sessionScope.path }/resources/img/common/animalrab.png"></li>
						<li class="nav-item" id="A4"><img class="img_fish" src="${sessionScope.path }/resources/img/common/animalfish.png"></li>
						<li class="nav-item" id="A5"><img class="img_bird" src="${sessionScope.path }/resources/img/common/animalbird.png"></li>
						<li class="nav-item" id="A6"><img class="img_ham" src="${sessionScope.path }/resources/img/common/animalham.png"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>	
	<div id="needgongan1"></div>	
	<div id="infoDetail">
		<div id="detailImg"><img src="${sessionScope.path }/${info.attPath}/${info.changeName}" alt="지식 이미지" /></div>
		<div id="detailCon">${info.content }</div>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
</body>
</html>