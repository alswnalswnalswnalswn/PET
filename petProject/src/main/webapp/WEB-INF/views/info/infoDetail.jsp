<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		box-sizing : border-box;
	}
	#needgongan1{
		width : 1000px;
		height : 50px;
		margin :auto;
		position: relative;
	}
	#detailDate{
		right: 0;
		position: absolute;
		line-height :50px;
	}
	#infoDetail{
		width : 1000px;
		margin : auto;
		border: 1px solid rgb(205, 203, 203);
	}
	#detailImg{
		width :600px;
		height: 600px;
		margin : auto;
		overflow : hidden;
		display : flex;
		align-items : center;
		justify-content: center;
		border: 1px solid rgb(205, 203, 203);
	}
	#detailImg img{
		width: 100%;
		height : 100%;
		object-fit : cover;
	}
	#detailTi{
		width : 800px;
		height : 100px;
		font-size: 25px;
		font-weight: bold;
		text-align :center;
		margin : auto;
	}
	#detailCon{
		width :800px;
		height: 300px;
		margin : auto;
	}
	#contentBoard{
		width :600px;
		height: 500px;
		text-align : center;
		margin : auto;
		line-height: 50px;
		font-weight: bold;
	}
	#likeAndList{
		width : 1000px;
		margin : auto;
		height: 100px;
    	display: flex;
	}
    #boardLike{
    	width :800px;
    	height: 100px;
    	display:flex;
    }
    #boardLike > div{
    	width : 80px;
    	height: 50px;
    	float: right;
    	padding-top :10px;
    }
    #info_like>img, #info_rep>img{
    	width : 30px;
    	height: 30px;
    	cursor: pointer;
    }
    #info_like>img:hover{
    	width :32px;
    	height: 32px;
    }
    #info_rep>img:hover{
    	width : 32px;
    	height: 32px;
    }	
    #info_search >div {
       	width : 32px;
    	height: 32px;
    	line-height: 2;
    	font-weight: 700;
    	float: left;
    }
    #info_search{
    	line-height: 2;
    }
    #goList{
    	width : 200px;
    	height: 100px;
    	position :relative;
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
    #myrep {
		width: 1000px;
		height: auto;
		margin: auto;
		border: 1px solid rgb(153, 153, 153);
	}
	#myreply {
		width: 1000px;
		height : 120px;
		margin: auto;
		position: relative;
		padding-left : 20px;
	}
	#needgongan{
		width : 800px;
		height :10px;
	}
	
	#ndia {
		width: 100%;
		height: 40px;
		display: flex;
	}
	
	#nickna {
		width: 80%;
		height: 100%;
		font-weight : bold;
		font-size : 20px;
	}
	
	#daterep {
		width: 20%;
		height: 100%;
	}
	
	#repcon {
		width: 100%;
		height: 30px;
	}
	
	#btncom {
		width: 10%;
		height: 30px;
		right: 0;
		position: absolute;
		cursor: pointer;
	}
	
	#btncom img {
		width: 20px;
	}
	
	.inscom {
		width: 1000px;
		height: 100px;
		margin: auto;
	}
	
	#inscomment {
		width: 800px;
		height: 80px;
		margin: auto;
		outline: none;
		margin-left : 20px;
	}
    #replybtn {
		width: 80px;
		height: 30px;
		right: 0;
		font-size: 13px;
		border-radius: 10px;
		background-color: rgb(94, 87, 59);
		color: white;
		font-weight: bold;
		bolder: 0;
		cursor: pointer;
	}
	
	#replybtn:hover {
		font-size: 14px;
		width: 8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000px;
		height: 30px;
	}
</style>
</head>
<body>
	<script src="${sessionScope.path }/resources/script/date.js"></script>
	<jsp:include page="../common/header.jsp" />
	<div id="needgongan1"><div id="detailDate"></div></div>	
	<div id="infoDetail">
	<div id="needgongan1"></div>
		<div id="detailImg"><img src="${sessionScope.path }/${info.attachmentList[0].attPath}/${info.attachmentList[0].changeName}" alt="지식 이미지" /></div>
		<div id="needgongan1"></div>
		<div id="detailTi">${info.boardTitle }</div>
		<div id="detailCon"><div id="contentBoard">${info.boardContent }</div></div>
	</div>
	<div id="likeAndList">
		<div id="boardLike">
			<div id="info_like" class="like"><img src="${sessionScope.path }/resources/img/common/like.png">&nbsp;&nbsp;&nbsp;<span id="likeCount"></span></div>
			<div id="info_rep"><img src="${sessionScope.path }/resources/img/common/reply.png">&nbsp;&nbsp;&nbsp;<span id="replyCount"></span></div>
			<div id="info_search"><div>조회</div>&nbsp;&nbsp;&nbsp;<span id="sumCount"></span></div>
		</div>
		<div id="goList">
			<button id="listbtn" onclick="history.back();">이전</button>
		</div>
	</div>
	
	<div id="myrep" class="myrep">
	</div>	
	<jsp:include page="../common/footer.jsp" />	
	
	
	<script>
    const memberNo = '${sessionScope.loginUser.memberNo}';
    const boardNo = ${info.boardNo};
    resultStr = '';
    console.log(memberNo);
    console.log(boardNo);
		$(() => {
		selectLike(boardNo);
		selectReply(boardNo);
			
			const fullDate = '${info.createDate }';
			let createDate = fullDate.substring(0, 10);
	        $('#detailDate').append('<span>' + createDate + '</span>');
	        
			$('#info_like').click(function() {
				
				if(memberNo === ""){
					alert('로그인 부탁드려욧');
				}
				else{
					var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
					var nolikeNuroom = "${sessionScope.path}/resources/img/common/like.png";
		            var likeImg = $(this).find('img').attr('src');
		            
		            if(likeImg == nolikeNuroom){
		            	
		            	$.ajax({
		            		url : '/pet/info/addLikeCount/' + boardNo + '/' + memberNo,
		            		success : result => {
		            			$('#likeCount').text('(' + result + ')');
		            			$(this).find('img').attr('src', likeNuroom);
		            		},
		            		error : result => {
		            			alert('응 안돼요');
		            		}
		            	})
		            	
		            } else {
		            	$.ajax({
		            		url : '/pet/info/removeLikeCount/' + boardNo + '/' + memberNo,
		            		success : result => {
		            			console.log('삭제완료');
		            			$(this).find('img').attr('src', nolikeNuroom);
		            			$('#likeCount').text('(' + result + ')');
		            		},
		            		error : result => {
		            			alert('응 안돼요');
		            		}
		            	})
		            }
				}
               
			});
		});
		
        function selectLike(boardNo){	
        	$.ajax({
        		url : '/pet/info/selectLike/' + boardNo,
        		type : 'get',
        		success : result => {
        			console.log(result);
        			$('#likeCount').html('(' + result + ')');
        		},
        		error : result => {
        			console.log('실패');
        		}
        	});
        }
        function selectReply(boardNo){
        	$.ajax({
        		url : '/pet/info/selectReply/' + boardNo,
        		type : 'get',
        		success : result => {
        			if(result === "") {
        				resultStr += '<div id="myreply"><span>등록된 댓글이 없습니다.</span></div>'
        			} else {
	        			console.log(result);
	        			for(let i in result){
		        			resultStr += '<div id="myreply">'
		        							+ '<div id="needgongan"></div>'
							        		+ '<div id="ndia">'
							        			+ '<div id="nickna">' + result[i].replyWriter + '</div><div id="daterep">' + result[i].dateFormat(createDate) + '</div>'
							        		+ '</div>'
							        		+ '<div id="repcon">' + result[i].replyContent + '</div>'
							        		+ '<div id="btncom" class="btncom">댓글<img src="${sessionScope.path}/resources/img/common/replyarrow.png"></div>'
						        		+ '</div>'
						        		+ '<div class="inscom" style="display:none;">'
							        		+ '<textarea name="comment" id="inscomment"></textarea>'
							        		+ '<a href=""><button id="replybtn">댓글 작성</button></a>'
						        		+ '</div>'
	        			}
        			}
        			$('.myrep').html(resultStr);
        	    	$('.btncom').click(function(){
        	    		$(this).parent().next('.inscom').toggle();
        	    	})
        		},
        		error : result => {
        			console.log('실패');
        		}        		
        	})
        };
        
        let date = new Date();
        let createDate = dateFormat(date);
        console.log(createDate);
        
	</script>
	
	
	
	
</body>
</html>