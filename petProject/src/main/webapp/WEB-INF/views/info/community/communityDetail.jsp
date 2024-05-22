<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
	<link rel="stylesheet" href="resources/css/community/communityDetail.css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
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
		<div id="selectctg">
			<div id="select">
				<div id="styleboardform">
					<div id="selectstyle" class="boardCategory">
						<span id="styleboard">글 성격</span>
					</div>
					<div id="boardinfo">
						<span id="freecon"># 자유</span><br>
						<span id="quescon"># 질문</span><br>
					</div>
				</div>
				<div id="styleaniform">
					<div id="selectani" class="aniCategory">	
						<span id="styleani">반려 동물</span>
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
			<div id="infoheader1"><img src="${sessionScope.path }/resources/img/common/${loginUser.profile}"></div>
			<div id="infoheader2"><span id="infonickName"></span>님</div>
			<div id="infoheader3">
				
			</div>
			<div id="infoheader4"><span>˚&nbsp;˚&nbsp;˚</span></div>
		</div>
		<div id="boardti">제목 : &nbsp;&nbsp;&nbsp;</div>
		
		<div id="myimg">
			<img src="${sessionScope.path }/" alt="" />
		</div>
		<div id="needgongan4"></div>
		<div id="myinfoContent">
			<span style="font-size: 20px;">
				
			</span>
		</div>
	</div>
	<div id="boardLike2">
		<c:choose>
			<c:when test="">
				<div id="likeboard2"><img src="${sessionScope.path }/resources/img/common/like.png"><span>  ()</span></div>
			</c:when>
			<c:otherwise>
				<div id="likeboard2"><img src="${sessionScope.path }/resources/img/common/like2.png"><span>  ()</span></div>
			</c:otherwise>
		</c:choose>
		<div id="seeboard2"><span>조회 ()</span></div>
		<div id="replyboard2"><img src="${sessionScope.path }/resources/img/common/reply.png"><span>  ()</span></div>
		<div id="golist">
			<a href=""><button id="listbtn">메인으로</button></a>
		</div>
	</div>
	<div id="myrep">
		<div id="myreply">
			<div id="ndia">
				<div id="nickna">닉네임</div><div id="daterep">날짜</div>
			</div>
			<div id="repcon">댓글내용</div>
			<div id="btncom">댓글<img src="${sessionScope.path }/resources/img/common/replyarrow.png"></div>
		</div>
		<div id="inscom" style="display:none;">
			<textarea name="comment" id="inscomment"></textarea>
			<a href=""><button id="replybtn">댓글 작성</button></a>
		</div>
	</div>
	
	<script>
	    $(document).ready(function(){
	        $('.boardCategory').click(function(){
	            $('#boardinfo').toggle();
	        });
	        $('.aniCategory').click(function(){
	            $('#aniinfo').toggle();
	        });
	    });
	    
	    $(document).ready(function(){
	    	$('#btncom').click(function(){
	    		$('#inscom').toggle();
	    	})
	    })
			
	</script>
	
	
	
	
	
	
	
	<jsp:include page="../../common/footer.jsp" />
	
	
	
	
	
	
	
	
</body>
</html>