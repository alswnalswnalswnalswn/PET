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
	
	<form action="communities/insert" method="post">
		<div id="infooutput">
			<div id="infoheader">
				<div id="infoheader1"><img src="" alt="작성자 프사"></div>
				<div id="infoheader2"><span id="infonickName">${ loginUser.memberNo }</span>님</div>
				<div id="infoheader3">
					
				</div>
				<div id="infoheader4"><span>˚&nbsp;˚&nbsp;˚</span></div>
			</div>
			<div id="boardti">제목 : <input name="boardTitle"></div>
			
			
			<div id="needgongan4"></div>
			<div id="myinfoContent">
				<span style="font-size: 20px;">
					<textarea name="boardContent"></textarea>
				</span>
			</div>
			
			<div>
				<!-- 첨부파일 -->
			</div>
			
			
		</div>
	
	
		<button>제출</button>
	</form>
	
	

	
	
	
	
	
	
	
	<jsp:include page="../../common/footer.jsp" />
	
</body>
</html>