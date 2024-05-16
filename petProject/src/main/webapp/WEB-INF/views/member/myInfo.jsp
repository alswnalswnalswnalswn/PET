<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>내 정보 조회</title>
<style>
    #myoutput{
        width: 1200px;
        height: 1400px;
        border-top: 1px solid rgb(230, 230, 230);
        margin: auto;
    }
    #myheader{
        width: 100%;
        height: 200px;
        border-bottom: 2px solid rgb(230, 230, 230);
    }
    #mycontent{
        width: 100%;
        height: 1200px;
    }
    #myback{
        width: 1000px;
        height: 1300px;
        transform: translate(10%, 3%);
        border-radius: 50px;
    }
    #myname > *{
        transform: translate(0%, 5%);
    }
    #myname{
        width: 80%;
        height: 70%;
        margin: auto;
        transform: translate(0%, 20%);
    }
    #myname > div{
        float: left;
    }
    #profile{
        width: 150px;
        height: 130px;
    }
    #name{
        width: 500px;
        height: 130px;
        line-height: 180px;
        font-size: 23px;
        font-weight: 700;
    }
    #update{
        width: 140px;
        height: 130px;
    }
    #profile_img{
        border-radius: 60%;
        cursor: pointer;
        border: 3px solid black;
        width: 130px;
        height: 130px;
    }
    #profile_img > img{
        width: 120px;
        height:110px;
        padding-left: 5px;
    }
    #update_info{
        float: right;
        border-radius: 15px;
        background-color: rgba(197, 173, 135, 0.82);
        border: 0;
        color: white;
        height: 30px;
        font-weight: bold;
    }
    #mycontent{
        width: 100%;
        height: 1200px;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../common/myPageInfo.jsp" />
	
		<h3 align="center" id="myInfo">내 정보 조회</h3>
        
		<div id="info-area">
				<div class="input_form">
					<input type="text" id="memberId" name="memberId" maxlength="10" value="${loginUser.memberId }" readonly>
				</div>
					
				<div class="input_form">
					<input type="text" name="memberName" maxlength="10" value="${loginUser.memberName }">
				</div>
				<div class="input_form">
					<input type="text" id="phone" name="phone" maxlength="13" value="${loginUser.phone }" required>
				</div>
				<div class="input_form">
					<input type="text" id="email" name="email" maxlength="30" value="${loginUser.email }" required>
				</div>
				<div class="animalList"><span><small>내 추천 동물</small></span><br><br><button>다시 고르기</button>
					<input type="hidden" name="animalList" value="" >
					<label for="animaldog"><input type="checkbox" class="animal" name="animal" value="A1" id="animaldog" style="display:none;">강아지</label>
					<label for="animalcat"><input type="checkbox" class="animal" name="animal" value="A2" id="animalcat" style="display:none;">고양이</label>
					<label for="animalrab"><input type="checkbox" class="animal" name="animal" value="A3" id="animalrab" style="display:none;">토끼</label>
					<label for="animalfish"><input type="checkbox" class="animal" name="animal" value="A4" id="animalfish" style="display:none;">물고기</label>
					<label for="animalbird"><input type="checkbox" class="animal" name="animal" value="A5" id="animalbird" style="display:none;">새</label>
					<label for="animalham"><input type="checkbox" class="animal" name="animal" value="A6" id="animalham" style="display:none;">햄스터</label>
				</div>
				<div class="input_btn2"><button type="submit" id="join-btn" class="btn">내 정보 수정</button></div>
		</div>
		
		
		
		
<div class="modal fade" id="myInfo">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        
        <!-- Modal body -->
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
		
		
		
		
		
		
		</div>
		</div>
	</div>
</div>		

</body>
</html>