<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="../resources/css/member/header.css" />	
<title>회원가입</title>
</head>
<body>
	<div id="join-area">
			<form action="${sessionScope.path}/member/join" method="post">
			<input type="hidden" name="code" id="myCode">
				<div class="input_form">
					<input type="text" id="memberId" name="memberId" maxlength="10" placeholder="아이디를 입력해주세요 (3~10 영/숫자)" required>
					<div id="checkId" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="${sessionScope.path}/resources/img/common/check.png" class="check" style="display:none;">
				</div>
					
					
				<div class="input_form">
					<input type="text" id="memberPwd1" name="memberPwd" maxlength="16" placeholder="비밀번호를 입력해주세요 (4~15 영/숫자)" required>
				</div>
				<div class="input_form">
					<input type="text" id="memberPwd2" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" required>
					<div id="checkPwd" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="${sessionScope.path}/resources/img/common/check.png" class="checkPwd" style="display:none;">
				</div>
					<span class="danger_pwd"></span>
				<div class="input_form">
					<input type="text" name="memberName" maxlength="10" placeholder="성함을 입력해주세요">
				</div>
				<div class="input_form">
					<input type="text" id="nickname" name="nickname" maxlength="30" placeholder="닉네임을 입력해주세요" required>
					<div id="checkNick" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="${sessionScope.path}/resources/img/common/check.png" class="checkNick" style="display:none;">
				</div>
				<div class="input_form">
					<input type="text" id="phone" name="phone" maxlength="13" placeholder="'-' 를 포함한 전화번호를 입력해주세요" required>
					<div id="checkPhone" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="${sessionScope.path}/resources/img/common/check.png" class="checkPhone" style="display:none;">
				</div>
				<div class="input_form">
					<input type="text" id="email" name="email" maxlength="30" placeholder="이메일을 입력해주세요" required>
					<div id="checkEmail" class="danger" style="font-size:0.7em; display:none;"></div>
					<img src="${sessionScope.path}/resources/img/common/check.png" class="checkEmail" style="display:none;">
					<button type="button" id="checkMyEmail">이메일 인증</button>
				</div>
				<div class="input_code" style="font-size:15px; display:none;">
					&nbsp;&nbsp;인증번호를 입력하세요 <input type="text" name="emailCode" id="emailCode">
					&nbsp;&nbsp;<button type="button" id="checkEmailCode">인증하기</button>
				</div>
					
				<div class="animalList"><span><small>추천 받을 동물을 고르세요 (선택)</small></span><br><br>
					<input type="hidden" name="animalList" value="" >
					<label for="animaldog"><input type="checkbox" class="animal" name="animal" value="A1" id="animaldog" style="display:none;">강아지</label>
					<label for="animalcat"><input type="checkbox" class="animal" name="animal" value="A2" id="animalcat" style="display:none;">고양이</label>
					<label for="animalrab"><input type="checkbox" class="animal" name="animal" value="A3" id="animalrab" style="display:none;">토끼</label>
					<label for="animalfish"><input type="checkbox" class="animal" name="animal" value="A4" id="animalfish" style="display:none;">물고기</label>
					<label for="animalbird"><input type="checkbox" class="animal" name="animal" value="A5" id="animalbird" style="display:none;">새</label>
					<label for="animalham"><input type="checkbox" class="animal" name="animal" value="A6" id="animalham" style="display:none;">햄스터</label>
				</div>
				<div class="input_btn2"><button type="submit" id="join-btn" class="btn">회원가입</button></div>
		    </form>	
		</div>
</body>
</html>