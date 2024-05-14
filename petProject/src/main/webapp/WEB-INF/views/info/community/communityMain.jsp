<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
	<link rel="stylesheet" href="resources/css/community/communityMain.css" />
</head>
<body>
	<jsp:include page="../../common/header.jsp" />
	
	<div class="wrap">
		
		<div>
		
			<div>
				<div class="input-group mt-3 mb-3">
					<div class="input-group-prepend">
						<button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">Dropdown button</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Link 1</a> 
							<a class="dropdown-item" href="#">Link 2</a> 
							<a class="dropdown-item" href="#">Link 3</a>
						</div>
					</div>
					<input type="text" class="form-control" placeholder="Username">
					<button class="btn btn-primary" type="button">OK</button>
				</div>
			</div>
			
			<div>
				<div class="btn-group">
					<div class="btn-group">
						<button id="selectCategory" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">게시판 선택</button>
						<div class="dropdown-menu">
							<button class="dropdown-item category" onclick="searchCategory(this);">전체</button> 
							<button class="dropdown-item category" onclick="searchCategory(this);">자유게시판</button> 
							<button class="dropdown-item category" onclick="searchCategory(this);">질문게시판</button>
						</div>
					</div>
					<div class="btn-group">
						<select id="selectAnimal" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">동물 선택</select>
							<option class="dropdown-item animal1">전체</option> 
							<option class="dropdown-item animal2">강아지</option> 
							<option class="dropdown-item animal3">고양이</option>
							<option class="dropdown-item animal4">토끼</option>
							<option class="dropdown-item animal5">물고기</option>
							<option class="dropdown-item animal6">새</option>
							<option class="dropdown-item animal7">햄스터</option>
					</div>
				</div>
			</div>
			
			
		</div>
		
		<div>
			여따 게시글 표시
			
			
		</div>
	</div>
	
	<script>
	/*
		function ajaxText(animal, category){
			$.ajax({
				
			})
		}
		*/
		function searchCategory(result){
			
			const $selectCategory = $('#selectCategory');
			
			const category = $(this).text();
			const animal = $('.animal').text();
			
			//$selectCategory.text(category);
			
			// ajaxText(animal, category)
			
			
			console.log(category);
			//console.log(animal);

			
		}
		
		
	/*
		function searchCategory(result){
			
			const $selectCategory = $('#selectCategory');
			
			const category = $(result).text();
			const animal = $('#selectAnimal').text();
			
			$selectCategory.text(category);
			ajaxText(animal, category)
			// console.log(category);
			// console.log(animal);

			$.ajax()
			
		}
	*/
		/*
		function searchAnimal(result){
			
			const $selectAnimal = $('#selectAnimal');
			
			const animal = $(result).text();
			const category = $('#selectCategory').text();
			
			$selectAnimal.text(animal);
			
			ajaxText(animal, category);
			
			console.log(category);
			console.log(animal);
			
			$.ajax()
			
		}
		*/
		
		
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>