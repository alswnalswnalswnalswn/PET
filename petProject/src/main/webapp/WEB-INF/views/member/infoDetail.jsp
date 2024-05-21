<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 상세보기</title>
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
		width : 800px;
		height: 100px;
	}
	#infooutput{
		width :800px;
		margin : auto;
		border:1px solid rgba(173, 173, 173);
	}
	#infoheader{
		width :800px;
		margin :auto;
		height: 120px;
		display :flex;
	}
	#infoheader1{
		width : 120px;
		height : 100%;
		border-radius : 60%;
		border:4px solid black;
	}
	#infoheader2{
		width : 180px;
		height : 40%;	
		margin-top : 8%;
		padding-left : 3%;
	}
	#infoheader3{
		width : 450px;
		height : 100%;		
	}
	#infoheader4{
		width : 200px;
		height : 30%;
		padding-left : 15%;
		font-size: 25px
	}
	#infoheader1 > img{
		width : 110px;
		height : 85%;
		margin-left : 2px;
	}
	#infonickName{
		font-size: 30px;
		font-weight : bold;
	}
	#myimg{
		width: 600px;
		height : 600px;
		margin : auto;
	}
	#myimg img{
		width: 600px;
		height : 550px;
		margin : auto;
		border: 1px solid rgba(173, 173, 173);
	}
	#myinfoContent{
		width :600px;
		text-align : center;
		padding-bottom : 70px;
	}
	#needgongan4{
		width : 800px;
		height: 150px;
	}
	#boardti{
		width : 700px;
		height: 150px;
		margin : auto;
		font-size: 25px;
		font-weight : bold;
		line-height: 100px;
	}
	#boardLike2{
		width : 800px;
		height: 100px;
		display :flex;
		margin: auto;
	}
	#boardLike2 > div{
		width : 80px;
		height: 100px;
	}
	#likeboard2 >span{
		line-height: 50px;
		font-size: 20px;
		margin-top :200px;
	}
	#seeboard2>span{
		font-size: 20px;	
		line-height: 70px;
	}
	#replyboard2>span{
		font-size: 20px;	
		line-height: 50px;
	}
	#likeboard2>img{
	}
	#replyboard2>img{
	}
	#boardLike2 > div > img{
		width : 30px;
		height: 30px;
	}
	#golist{
		width: 140px;
		height: 120px;
		margin : auto;
		position : relative;
		padding-left: 500px;
	}
	#listbtn{
		width: 140px;
		height: 50px;
		position : absolute;
		right: 0;
		transform: translate(0, 10%);
	    font-size: 15px;
	    border-radius: 10px;
	    background-color: rgb(94, 87, 59);
	    color:white;
	    font-weight: bold;
	    bolder: 0;
	    cursor :pointer;
	}
	#listbtn:hover{
		font-size: 16px;
		width: 141px;
		height: 51px;
	}
	#myrep{
		width: 800px;	
		height: auto;
		margin: auto;
	}
	#myrep>div{
		border:1px solid black;
	}
	#myrep>div>div{
		border:1px solid black;
	}
	#myreply{
		width : 750px;
		height : 90px;
		margin: auto;
		position: relative;
	}
	#ndia{
		width: 100%;
		height: 30px;
		display:flex;
	}
	#nickna{
		width :80%;
		height: 100%;
	}
	#daterep{
		width :20%;
		height: 100%;	
	}
	#repcon{
		width :100%;
		height: 30px;	
	}
	#btncom{
		width :10%;
		height: 30px;	
		right: 0;
		position: absolute;
	}
	#btncom img{
		width :20px;
	}
	#inscom{
		
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
	<div id="infooutput">
		<div id="infoheader">
			<div id="infoheader1"><img src="${sessionScope.path }/resources/img/profile/${loginUser.profile }"></div>
			<div id="infoheader2"><span id="infonickName">${info.memberNo }</span>님</div>
			<div id="infoheader3">
				
			</div>
			<div id="infoheader4"><span>˚&nbsp;˚&nbsp;˚</span></div>
		</div>
		<div id="boardti">제목 : ${info.boardLike }&nbsp;&nbsp;&nbsp;${info.boardTitle }</div>
		
		<div id="myimg">
			<img src="${sessionScope.path}/${info.attPath }/${info.changeName}" alt="" />
		</div>
		<div id="needgongan4"></div>
		<div id="myinfoContent">
			<span style="font-size: 20px;">
				${info.boardContent }
			</span>
		</div>
	</div>
	<div id="boardLike2">
		<c:choose>
			<c:when test="${ info.likeCheck != 1 }">
				<div id="likeboard2"><img src="${sessionScope.path }/resources/img/common/like.png"><span>(${info.boardLike })</span></div>
			</c:when>
			<c:otherwise>
				<div id="likeboard2"><img src="${sessionScope.path }/resources/img/common/like2.png"><span>(${info.boardLike })</span></div>
			</c:otherwise>
		</c:choose>
		<div id="seeboard2"><span>조회(${info.boardCount })</span></div>
		<div id="replyboard2"><img src="${sessionScope.path }/resources/img/common/reply.png"><span>(${info.sumCount })</span></div>
		<div id="golist">
			<a href=""><button id="listbtn">메인으로</button></a>
		</div>
	</div>
	<div id="myrep">
		<div id="myreply">
			<div id="ndia">
				<div id="nickna"></div><div id="daterep"></div>
			</div>
			<div id="repcon"></div>
			<div id="btncom">댓글<img src="${sessionScope.path }/resources/img/common/replyarrow.png"></div>
			<div id="inscom" style="display:none;"></div>
		</div>
	</div>
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>
	
	
</body>
</html>