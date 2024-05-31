<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
	<link rel="stylesheet" href="../resources/css/community/communityDetail.css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	<div id="infooutput">
		<div id="infoheader">
			<div id="infoheader1"><img src="/pet/resources/img/profile/${ infoList[0].memberProfile }" alt="작성자 프사"></div>
			<div id="infoheader2"><span id="infonickName">${ infoList[0].memberNo }</span>님</div>
			<div id="infoheader3">
				
			</div>
			<div id="infoheader4"><span>˚&nbsp;˚&nbsp;˚</span></div>
		</div>
		<div id="boardti">제목 : ${infoList[0].boardTitle }</div>
		
		<div id="myimg">
			<c:forEach var="attachment" items="${ infoList[0].attachmentList }">
				<img src="/pet${attachment.attPath }${attachment.changeName}" alt="첨부사진" />
			</c:forEach>
		</div>
		
		<div id="needgongan4"></div>
		<div id="myinfoContent">
			${infoList[0].boardContent }
		</div>
	</div>
	
	<div id="boardLike2">
		<div id="likeboard2"><img src=""><span>(${infoList[0].boardLike})</span></div>
		
		<div id="seeboard2"><span>조회 (${infoList[0].boardCount})</span></div>
		<div id="replyboard2"><img src="${path}/resources/img/common/reply.png"><span id="likeCount"></span></div>
		<div id="golist">
			<button id="listbtn" onclick="history.back();">이전으로</button>
		</div>
	</div>
	
	<div id="myrep">
		<div id="myreply">
			<div id="ndia">
				<div id="nickna">닉네임</div><div id="daterep">날짜</div>
			</div>
			<div id="repcon">댓글내용</div>
			<div id="btncom">댓글<img src="${path}/resources/img/common/replyarrow.png"></div>
		</div>
		<div id="inscom" style="display:none;">
			<textarea name="comment" id="inscomment" style="resize:none;"></textarea>
			<button id="replybtn">댓글 작성</button>
		</div>
	</div>
	
	<script>  
		var memberNo = 0;
		if( '${sessionScope.loginUser.memberNo}' == ''){
			memberNo = 0;
		}
		else {
			memberNo = '${sessionScope.loginUser.memberNo}';
		}
		
	    const boardNo = ${infoList[0].boardNo};
	    var resulttStr = '';
	    var like = "${sessionScope.path}/resources/img/common/like2.png";
		var noLike = "${sessionScope.path}/resources/img/common/like.png";
	
		$(() => {	
				console.log(memberNo);
				$('#btncom').click(() => {
	    			$('#inscom').toggle();
	    		});
	
				selectLike(boardNo);
				
				$('#likeboard2').click(function() {
					
					if(memberNo === ""){
						alert('로그인 부탁드려욧');
					}
					else {
			            var likeImg = $(this).find('img').attr('src');
			            
			           console.log(likeImg);
			           
			            if(likeImg == noLike){
			            	$.ajax({
			            		url : '/pet/communities/addLike',
			            		method: 'post',
			            		data : {
			            			memberNo : memberNo,
			            			boardNo : boardNo
			            		},
			            		success : result => {
			            			 likeCheck(boardNo, memberNo)
			            		},
			            	})
			            } 
			            else {
			            	$.ajax({
			            		url : '/pet/communities/deleteLike',
			            		method: 'post',
			            		data : {
			            			memberNo : memberNo,
			            			boardNo : boardNo
			            		},
			            		success : result => {
			            			 likeCheck(boardNo, memberNo)
			            		},
			            	})
			            }
					}
				});
				
				
			});
	
			function selectLike(boardNo){	
			   	$.ajax({
			   		url : '/pet/communities/likeCheck/' + boardNo,
			   		type : 'get',
			   		success : result => {
			   			$('#likeCount').html('(' + result + ')');
			   		}
			   	});
			}
		
        function likeCheck(boardNo, memberNo){
			$.ajax({
				url : '/pet/communities/likeCheck/' + boardNo + "/" + memberNo,
				success : result => {
					if(result > 0){
						$('#likeboard2 > img').attr('src', like)
					}
					else {
						$('#likeboard2 > img').attr('src', noLike)
					}
				}
			});
		}
		
		
	</script>
	
	
	
	
	
	
	
	<jsp:include page="../../common/footer.jsp" />
	
</body>
</html>