<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<style>
	div{
		box-sizing: border-box;
	}
	#submenubar{
		width : 1200px;
		height: 150px;
		margin : auto;
		border : 1px solid black;
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
		border-bottom : 1px solid black;
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
		border : 1px solid black;
		float: left;
		position: relative;
	}
	#select{
		width : 220px;
	 	justify-content: space-between;
		height: 100%;
		position: absolute;
		transform : translate(100%);
	}
	#selectstyle, #selectani{
		width : 50%;
		height : 30px;
		float : left;
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
		border: 1px solid rgb(204, 204, 204);
		margin-left: 180px;
		margin-top : 30px;
	}
	#boardinfo, #aniinfo{
	}
	#boardinfo{
	}
	#sksnrl1{
		width : 100%;
		height : 25%;
		float: left;
		border : 1px solid red;
		
	}
	#sksnrl2{
		width : 100%;
		height: 75%;
	}
</style>
</head>
<body>
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
					<div id="aniinfo">
						
					</div>
					<div id="boardinfo">
						
					</div>
				</div>
			</div>
			<div id="line"></div>
		</div>
	</div>
	
	<script>
		$(() => {
			
		})
	</script>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>