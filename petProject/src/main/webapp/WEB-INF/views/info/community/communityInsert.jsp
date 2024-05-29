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
<body onload="manageCheckboxes()">
	<jsp:include page="../../common/header.jsp" />
	
	<div class="wrap">
		<form action="insertCommunity" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
			<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo}">
			<div class="row titleRow">
				<div class="col-sm-2">제목</div>
				<div class="col-sm-9 boardTitle"><input name="boardTitle"></div>
			</div>
			
			<div class="row">
				<div class="col-sm-2">글성격</div>
				<div class="col-sm-6 boardCategory" name="categoryCode">
					<input type="radio" name="categoryCode" value="I1">자유
					<input type="radio" name="categoryCode" value="I2">질문
				</div>
				
			</div>
			
			<div class="row">
				<div class="col-sm-2">반려동물</div>
				<div class="col-sm-9 animalCategory" name="animalCode">
					<input type="checkbox" name="animalCode" value="A0"><label for="A0" class="animalLabel">전체</label>
					<input type="checkbox" name="animalCode" value="A1"><label for="A1" class="animalLabel">강아지</label>
					<input type="checkbox" name="animalCode" value="A2"><label for="A2" class="animalLabel">고양이</label>
					<input type="checkbox" name="animalCode" value="A3"><label for="A3" class="animalLabel">토끼</label>
					<input type="checkbox" name="animalCode" value="A4"><label for="A4" class="animalLabel">물고기</label>
					<input type="checkbox" name="animalCode" value="A5"><label for="A5" class="animalLabel">새</label>
					<input type="checkbox" name="animalCode" value="A6"><label for="A6" class="animalLabel">햄스터</label>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-2">내용</div>
			</div>
			
			<textarea class="col-sm-12" style="width: 100%; height: 550px; resize: none;" name="boardContent">
			
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
	
	<script>
	
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
	
</body>
</html>