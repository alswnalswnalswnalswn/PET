<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 조회</title>
<style>
	div{
		box-sizing : border-box;
	}
	#submenubar{
		width : 1200px;
		height: 150px;
		margin : auto;
	}
	#submenubar > searchForm{
		float : left;
	}
	
	#searchForm{
		width : 50%;
		height : 100%;
		position: relative;
		float: left;
	}
	
	#search{
		width : 300px;
		height : 40%;
		position : absolute;
		left: 30px;
		top : 50px;
	}
	#searchcon{
		width : 200px;
		height : 100%;
		border-bottom : 1px solid rgb(235, 235, 235);
	}
	#searchContent{
		outline : none;
		margin-top: 25px;
		margin-left: 5px;
		border : 0;
	}
	#searchImg{
		width : 30px;
		height: 60%;
		padding-top : 25px;
	}
	#searchimg{
		width : 30px;
		height: 30px;
		cursor: pointer;
	}
	#searchimg:hover{
		width : 31px;
		height: 31px;
	}
	#search > div{
		float: left;
	}
	#selectctg{
		width : 50%;
		height: 100%;
		float: left;
		position: relative;
	}
	#select{
		width : 220px;
	 	justify-content: space-between;
		height: 200px;
		position: absolute;
		transform : translate(100%);
        display: flex;
        flex-direction: column;
        top : 30%;
	}
	#selectstyle, #selectani{
		width : 50%;
		height : 30px;
		float : left;
	    display: flex;	
    	justify-content: center;
	}
	#styleboard, #styleani{
		width : 90px;
		height : 100%;
		font-size: 15px;
		font-weight: bold;
		background-color: rgb(248, 243, 221);
		color: rgba(122, 88, 33, 0.92);
		text-align : center;
		line-height: 30px;
	    border-top-left-radius: 10px;
	    border-top-right-radius: 10px; 
	    cursor: pointer;
	    float: left;
	    margin: auto;
   	}
	#styleboard:hover, #styleani:hover{
		font-size: 16px;
	}
	#line{
		width : 300px;
		margin-left: 180px;
		margin-top : 13%;
		border: 1px solid rgba(190, 190, 190, 0.2);
	}
	#sksnrl1{
		width : 100%;
		height : 22%;
		float: left;
	}
	#sksnrl2{
		width : 100%;
		height: 78%;
        display: flex;
	}
	#boardinfo{
		width : 48%;
		height: 45%;
		background-color: rgba(190, 190, 190, 0.2);
	    border-radius: 10px;
	}
	#aniinfo{
		width : 48%;
		height: 100%;
		background-color: rgba(190, 190, 190, 0.2);
	    border-radius: 10px;
	}
	#boardinfo{
		margin-right : 2%;
	}
	#aniinfo{
		margin-left : 2%;
	}
	span{
		text-align: center;
		cursor: pointer;
		font-size: 15px;
	}
	span:hover{
		font-size: 16px;
	}
	#needgongan1{
		width : 1200px;
		height: 100px;
	}
	#boardoutput{
		width :900px;
		height: auto;
		margin : auto;
	}
	#myboard{
		width : 900px;
		height: 150px;
		border: 1px solid rgb(214, 214, 214);
		margin : auto;
		border-radius: 10px;
	}
	#thumbnail{
		width :150px;
		height: 150px;
	}
	#thumbnail img{
		width :99%;
		height: 99%;
		border : 1px solid rgb(214, 214, 214);
	}
	#gomain{
		width: 900px;
		height: 120px;
		margin : auto;
		position : relative;
	}
	#mainbtn{
		width: 140px;
		height: 50px;
		position : absolute;
		right: 0;
		transform: translate(0, 10%);
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
					<img src="${sessionScope.path}/resources/img/searchform.png" alt="" id="searchimg">
				</div>
			</div>
		</div>
		<div id="selectctg">
			<div id="select">
				<div id="sksnrl1">
					<div id="selectstyle">
						<span id="styleboard">글 성격</span>
					</div>
					<div id="selectani">		
						<span id="styleani">반려 동물</span>
					</div>
				</div>
				<div id="sksnrl2">	
					<div id="boardinfo">
						<span id="freecon"># 자유</span><br>
						<span id="quescon"># 질문</span><br>
					</div>
					<div id="aniinfo">
						<span class="category" id="dogcon"># 강아지</span><br>
						<span class="category" id="catcon"># 고양이</span><br>
						<span class="category" id="rabcon"># 토끼</span><br>
						<span class="category" id="fishcon"># 물고기</span><br>
						<span class="category" id="birdcon"># 새</span><br>
						<span class="category" id="hamcon"># 햄스터</span><br>
					</div>
				</div>
			</div>
			<div id="line"></div>
		</div>
	</div>
	<div id="needgongan1"></div>
		<div id="boardoutput">
		<c:choose>
			<c:when test="${ empty boardList }">
				<table>
					<tr>
						<th style="font-size:20px;" colspan="5">작성한 게시물이 없습니다.</th>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<c:forEach var="b" items="${ boardList }">
				<div id="myboard">
					<div id="thumbnail">
					<c:choose>
						<c:when test="${ b.changeName eq null }">
							<img src="${sessionScope.path}/resources/img/profile.png" alt="">
						</c:when>
						<c:otherwise>
							<img src="${sessionScope.path}/${b.attPath }${b.changeName}" alt="">
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="gomain">
		<a href=""><button id="mainbtn">메인으로</button></a>
	</div>
	
	${bl.attPath }${bl.changeName}
	<script>
		$('.category').click(function(){
			var categoryValue = $(this).text().trim().substring(2);
			console.log(categoryValue);
			$.ajax({
				url : 'selectCategory',
				type: 'POST',
				data : {
						animalName: categoryValue,
						memberNo : '${loginUser.memberNo}'
						},
				success: function(result){
				     console.log('AJAX 요청이 성공적으로 완료되었습니다.');
				},
				error: function(result){
				    console.error('AJAX 요청 중 오류가 발생하였습니다: ' + result);
				}
			});
		});
	</script>
	
	
	
	
	
	
	
</body>
</html>