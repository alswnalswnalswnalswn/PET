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
							<a class="dropdown-item" href="#">전체</a> 
							<a class="dropdown-item" href="#">글 제목</a> 
							<a class="dropdown-item" href="#">글 내용</a>
						</div>
					</div>
					<input type="text" class="form-control">
					<button class="btn btn-primary" type="button">검색</button>
				</div>
			</div>
			
			<div>
				<div class="btn-group">
					<div class="btn-group">
						<button id="selectCategory" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" value="categoryAll">게시판 선택</button>
						<div class="dropdown-menu">
							<button class="dropdown-item category" onclick="searchCategory(this);" value="categoryAll">전체</button> 
							<button class="dropdown-item category" onclick="searchCategory(this);" value="I1">자유게시판</button> 
							<button class="dropdown-item category" onclick="searchCategory(this);" value="I2">질문게시판</button>
						</div>
					</div>
					<div class="btn-group">
						<button id="selectAnimal" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" value="animalAll">동물 선택</button>
						<div class="dropdown-menu">
							<button class="dropdown-item" onclick="searchAnimal(this);" value="animalAll">전체</button> 
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A1">강아지</button> 
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A2">고양이</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A3">토끼</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A4">물고기</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A5">새</button>
							<button class="dropdown-item" onclick="searchAnimal(this);" value="A6">햄스터</button>
						</div>
					</div>
				</div>
			</div>
			
			
		</div>

		<div class="communityList">
			
		</div>
		
		<div class="btnDiv">
		
		</div>






	</div>
	
	<script>
		
		// 초기 변수 선언
		var $selectCategory = $('#selectCategory');
		var $selectAnimal = $('#selectAnimal');	
		var categoryVal, animalVal = '';
		var categoryText, animalText = '';
		var page = 1;

		function searchCategory(result){
			
			categoryVal = $(result).val();
			categoryText = $(result).text();
			
			$selectCategory.text(categoryText);
			
			ajaxTest(animalVal, categoryVal, 1);
			
			
		}
		
		function searchAnimal(result){
			
			animalVal = $(result).val();
			animalText = $(result).text();
			
			$selectAnimal.text(animalText);
			
			ajaxTest(animalVal, categoryVal, 1);
			
			
		}
		
		function ajaxTest(animal, category, page){
			
			$.ajax({
				url : 'selectCommunityList',
				data : {
					page : page,
					animal : animal,
					category : category
				},
				success : result => {
					console.log(result);
					var str = '';
					for(let i in result){
						str += '<div class="strList">'
							+ '<div>' + result[i].boardContent + '</div>'
							+ '</div>';
					};
					
					$('.communityList').html(str);
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').html('<button id="showMoreBtn" onclick="showMore();">더 보기</button>');
					}
					else{
						$('.btnDiv').html('');
					}
					
				}
			});
		}
		
		function showMore(animal, category){
			$.ajax({
				url : 'selectCommunityList',
				data : {
					page : ++page,
					animal : animal,
					category : category
				},
				success : result => {
					var str = '';
					for(let i in result){
						str += '<div class="strList">'
							+ '<div>' + result[i].boardContent + '</div>'
							+ '</div>';
					};
					$('.communityList').append(str);
					
					if(result[0].pageInfo.currentPage != result[0].pageInfo.maxPage){
						$('.btnDiv').html('<button id="showMoreBtn" onclick="showMore();">더 보기</button>');
					}
					else{
						$('.btnDiv').html('');
					}
					
				}
			});
		}
		
		
		
		$(() => {
			ajaxTest('A0', 'I0');
		});
		
		$(() => {
			$('.strList div').click(() => {
				var num = $(this).text();
				console.log(num);
			});
		});
		
	</script>
	
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>