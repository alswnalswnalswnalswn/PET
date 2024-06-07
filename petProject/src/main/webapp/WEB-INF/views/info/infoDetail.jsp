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
    	width : 100px;
    	height: 50px;
    	float: right;
    	padding-top :10px;
    }
    #boardLike > div > span{
    	cursor: pointer;
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
    	cursor : pointer;
    }
    #info_search{
    	line-height: 2;
    	cursor : pointer;
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
    .myrep {
		width: 1000px;
		height: auto;
		margin: auto;
		border: 1px solid rgb(153, 153, 153);
		padding-bottom : 10px;
		border-radius : 15px;
	}
	.myreply {
		width: 1000px;
		margin: auto;
		position: relative;
		padding-left : 20px;
	}
	.noreply {
		width: 1000px;
		margin: auto;
		height: 100px;
		position: relative;
		padding-left : 20px;
		font-weight : bold;
		font-size : 20px;
	}
	.needgongan{
		width : 800px;
		height :10px;
	}
	
	.ndia {
		width: 100%;
		height: 40px;
		display: flex;
	}
	.nickna {
		width: 80%;
		height: 100%;
		font-weight : bold;
		font-size : 20px;
	}
	.daterep {
		width: 20%;
		height: 100%;
	}
	.repcon {
		width: 100%;
		height: 30px;
	}
	.btncom {
		height: 100px;
		right: 0;
		position: absolute;
		cursor: pointer;
		top : 50px;
	}
	
	.btncom img {
		width: 40px;
		padding-right :10px;
	}
	
	.inscom {
		width: 900px;
		height: 100px;
		margin: auto;
		padding-top : 10px;
	}	
	.inscomment {
		width: 700px;
		height: 80px;
		margin: auto;
		outline: none;
		margin-left : 20px;
		resize: none;
	}
    .replybtn {
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
	
	.replybtn:hover {
		font-size: 14px;
		width: 81px;
		height: 30px;
	}
	.commentNone{
		width : 900px;
		height : 60px;
		margin : auto;
	}
	.commentNo{
		display : flex;
	}
	.comaa{
		width : 600px;
		height : 30px;	
		font-size : 17px;
		font-weight: bold;
	}
	.combb{
		width : 200px;
		height : 30px;		
		font-size : 14px;
	}
	.comcc{
		border-bottom : 1px solid rgb(153, 153, 153);
		width : 900px;
		height : 30px;		
		font-size : 15px;
	}
	.clickBtn{
		width: 80px;
		height: 30px;
		font-size: 13px;
		border-radius: 10px;
		background-color: rgb(94, 87, 59);
		color: white;
		font-weight: bold;
		bolder: 0;
		cursor: pointer;
		margin-right: 20px;
	}
	
	.clickBtn:hover {
		font-size: 13px;
		width: 82px;
		height: 30px;
	}
    #goRep{
    	width : 250px;
    	height: 100px;
    	position :relative;
    	margin : auto;
    }
    #insRep_1, .insRep_2{
		width: 180px;
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
	#insRep_1:hover, .insRep_2:hover{
		font-size: 16px;
		width: 181px;
		height: 51px;
    }
    .insertComment{
    	width : 1000px;
    	height : 150px;
    	margin : auto;
   	 	border-radius: 10px;
   	 	display: none;
    	border : 1px solid rgb(153, 153, 153);
    }
    #textCom{
       	width : 990px;
    	height : 145px;
    	margin-left: 3px;
		border:0;
   	 	outline : none; 
   	 	resize : none;	
   	 	border-radius: 10px;
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
			<div id="info_search"><div>조회</div>&nbsp;&nbsp;&nbsp;<span id="sumCount">(${info.boardCount })</span></div>
		</div>
		<div id="goList">
			<button id="listbtn" onclick="history.back();">이전</button>
		</div>
	</div>
	<div class="myrep">
	</div>	
	
	<div id="needgongan1"></div>
	<div class="insertComment">
		<textarea id="textCom" ></textarea>
	</div>
	
	<div id="goRep">
		<button id="insRep_1">댓글 작성</button>
	</div>
	
	<jsp:include page="../common/footer.jsp" />	
	
	
	<script>
    const memberNo = '${sessionScope.loginUser.memberNo}';
    const boardNo = '${info.boardNo}';
    resultStr = '';
    console.log(memberNo);
    console.log(boardNo);
		$(() => {
		selectLike(boardNo);
		selectReply(boardNo);
		likeCheckInfo(boardNo, memberNo);
			
			const fullDate = '${info.createDate }';
			let createDate = fullDate.substring(0, 10);
	        $('#detailDate').append('<span>' + createDate + '</span>');
	        
			$('#info_like').click( e => {
				
				if(memberNo === ""){
					alert('로그인 부탁드려욧');
				}
				else{
					var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
					var nolikeNuroom = "${sessionScope.path}/resources/img/common/like.png";
		            var likeImg = $(e.currentTarget).children('img').attr('src');
		            
		            if(likeImg == nolikeNuroom){
		            	
		            	$.ajax({
		            		url : '/pet/info/addLikeCount/' + boardNo + '/' + memberNo,
		            		success : result => {
		            			$('#likeCount').text('(' + result + ')');
		            			$(e.currentTarget).children('img').attr('src', likeNuroom);
		            		},
		            		error : result => {
		            			alert('응 안돼요');
		            		}
		            	})
		            	
		            } else {
		            	$.ajax({
		            		url : '/pet/info/removeLikeCount/' + boardNo + '/' + memberNo,
		            		success : result => {
		            			$(e.currentTarget).children('img').attr('src', nolikeNuroom);
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
        function likeCheckInfo(boardNo, memberNo){	
			 var likeNuroom = "${sessionScope.path}/resources/img/common/like2.png";
			 var nolikeNuroom = "${sessionScope.path}/resources/img/common/like.png";
	       	 if(memberNo != ""){
		        	$.ajax({
		        		url : '/pet/info/likeCheckInfo/' + boardNo + '/' + memberNo,
		        		type : 'get',
		        		success : result => {
		        			if(result > 0){
		        				$('#info_like').find('img').attr('src', likeNuroom);
		        			} else {
		        				$('#info_like').find('img').attr('src', nolikeNuroom);
		        			}
		        		},
		        		error : result => {
		        			console.log('실패');
		        		}
		        	});
	       		}
	       }	
        function selectLike(boardNo){	
        	$.ajax({
        		url : '/pet/info/selectLike/' + boardNo,
        		type : 'get',
        		success : result => {
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
        			if(result.length === 0) {
        				resultStr += '<div class="needgongan"></div><div class="noreply"><span>등록된 댓글이 없습니다.</span></div>';
        				$('#replyCount').append('(0)');
        				
        			} else {
	        			console.log(result);
	        			for(let i in result){
						let createDate = result[i].createDate.date;
						console.log(result);
						var fullDate = new Date(createDate.year, createDate.month - 1, createDate.day);
		        			resultStr += '<div class="myreply">'
		        							+ '<div class="needgongan"></div>'
							        		+ '<div class="ndia">'
							        			+ '<div class="nickna">' + result[i].replyWriter + '</div>'
				        			if(result[i].commentList != ""){
									        resultStr += '<button class="clickBtn">댓글 보기</button>';
				        			}
									        
				        			 resultStr += '<div class="daterep">' + dateFormat(fullDate) + '</div>'
							        		+ '</div>'
							        		+ '<div class="repcon">' + result[i].replyContent + '</div>';
							        		
			        		for(let o in result[i].commentList){
								let comCreateDate = result[i].commentList[o].createDate;
								var comFullDate = new Date(comCreateDate.date.year, comCreateDate.date.month - 1, comCreateDate.date.day);
			        			if(result[i].replyNo == result[i].commentList[o].replyNo){
							        	resultStr += '<div class="commentNone" style="display:none;">'
							        					+ '<div class="commentNo">'
									        				+ '<div class="comaa">' + result[i].commentList[o].commentWriter + '</div>'
									        				+ '<div class="combb">' + dateFormat(comFullDate) + '</div>'
								        				+ '</div>'
								        				+ '<div class="comcc">' + result[i].commentList[o].commentContent  + '</div>'
							        				 + '</div>'
				        			}
				        		}
							        resultStr += '<div class="btncom">' + result[i].replyWriter + '님에게 댓글 쓰기<img src="${sessionScope.path}/resources/img/common/replyarrow.png"></div>'
								        		+ '</div>'
								        		+ '<div class="inscom" style="display:none;">'
									        		+ '<textarea name="commentContent" class="inscomment"></textarea>'
									        		+ '<a href=""><button class="replybtn" onclick="insertComment(' + result[i].replyNo + ',' + result[i].memberNo + ');">댓글 작성</button></a>'
								        		+ '</div>'
								    
        			}
	        			$('#replyCount').append('(' + result[0].replyCount + ')');
        			}
        			$('.myrep').html(resultStr);
        	    	$('.btncom').click(e => {
        	    		if(memberNo === ""){
        	    			alert('로그인 후 이용가능합니다.');
        	    		} else {
        	    			$(e.currentTarget).parent().next('.inscom').toggle();
        	    		}
        	    	});
        	    	$('.clickBtn').click(() => {
       	    			$('.commentNone').toggle();
        	    	});

        		},
        		error : result => {
        			console.log('실패');
        		}        		
        	})
        };
        
       	function insertComment(replyNo, seMemNo){
       	const commentContent = $('.inscomment').val();
       	console.log(commentContent);
       		console.log('성공')
       		$.ajax({
       			url : '/pet/info/insertComment/',
    			data : {replyNo : replyNo,
						commentContent: commentContent,
						memberNo : memberNo,
						seMemNo : seMemNo},
       			type : 'post',
       			success : result => {
       				console.log(result);
       				
       			},
       			error : result =>{
       				console.log('다시해!');
       			}
       		})
       	}
    	$('#insRep_1').click(() => {
    		$('#goRep').html('<button class="insRep_2">댓글 등록하기</button>');
    		$('.insertComment').show();
	    	$('.insRep_2').click(() => {
				location.reload();
	    		$.ajax({
	    			url : '/pet/info/insertReply/',
	    			data : {boardNo : boardNo,
	    					replyContent: $('#textCom').val(),
	    					memberNo : memberNo},
	    			type : 'post',
	    			succes : result => {
	    				console.log(result);
	    				if(result === 1){
	    				}
	    			},
	       			error : result =>{
	       				console.log('다시!');
	       			}
	    		})
    		})	
       	})
	</script>
	
	
	
	
</body>
</html>