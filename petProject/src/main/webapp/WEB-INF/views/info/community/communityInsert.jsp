<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
	<link rel="stylesheet" href="resources/css/community/communityInsert.css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	
	<div class="wrap">
		<form action="communities/insert" method="post" enctype="multipart/form-data">
			<div class="row titleRow">
				<div class="col-sm-2">제목</div>
				<div class="col-sm-9 boardTitle"><input name="boardTitle"></div>
			</div>
			
			<div class="row">
				<div class="col-sm-2">글성격</div>
				<div class="col-sm-6 boardCategory">
					<input type="radio" value="I1">자유
					<input type="radio" value="I2">질문
				</div>
				
			</div>
			
			<div class="row">
				<div class="col-sm-2">반려동물</div>
				<div class="col-sm-9 animalCategory">
					<input type="checkbox" value="A0">전체
					<input type="checkbox" value="A1">강아지
					<input type="checkbox" value="A2">고양이
					<input type="checkbox" value="A3">토끼
					<input type="checkbox" value="A4">물고기
					<input type="checkbox" value="A5">새
					<input type="checkbox" value="A6">햄스터
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-2">내용</div>
			</div>
			
			<textarea class="col-sm-12" style="width: 100%; height: 550px; resize: none;">
			
			</textarea>
			
			<div class="row">
				<div class="col-sm-3">첨부파일<input type="file" name="upfile"></div>
				<div class="col-sm-3">첨부파일<input type="file" name="upfile"></div>
				<div class="col-sm-3">첨부파일<input type="file" name="upfile"></div>
				<div class="col-sm-3">첨부파일<input type="file" name="upfile"></div>
			</div>
			<br><br>
			<div  class="row">
				<div class="col-sm-12"><button>제출</button></div>
			</div>
		</form>
	</div>
	
	<jsp:include page="../../common/footer.jsp" />
	
</body>
</html>