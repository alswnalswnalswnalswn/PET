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
<title>Insert title here</title>
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
    #content1{
        width: 100%;
        height: 20%;
    }
    #down{
        width: 95%;
        height: 10%;
        font-size: 20px;
        line-height: 7;
        margin: auto;
    }
    #down > div{
        width: 25%;
        height: 100%;
        font-size: 20px;
        font-weight: bold;
        line-height: 4;
        color: rgb(94, 87, 59);
        text-align:center;
        float: left;
    }
    #content2{
        width: 100%;
        height: 700px;
        border-top: 2px solid rgb(230, 230, 230);
        padding-top: 30px;
        padding-left: 10px;
    }
    #content1{
        list-style: none;
        border-top: 1px solid rgb(230, 230, 230);
    }
    #content1>li{
        float: left;
        text-align: center;
        width: 15%;
        margin-left: 80px;
        transform: translate(0%, 40%);
        height:62%;
        border-radius: 60% 60%;
        border: 1px solid rgba(255, 231, 192, 0.82);
        background-color: rgba(243, 222, 189, 0.82);
        font-weight: bold;
        color: rgb(78, 97, 114);
    }
    #shipment, #truck{
        margin-top: 20px;
    }
    #transit{
        margin-top: 10px;
    }
    #content2 > div{
        width: 33%;
        height: 30%;
        float: left;
        text-align: center;
        padding: 50px 80px;
    }
    #content > a{
        text-decoration: none;
        display: block;
        font-size: 17px;
        color: rgb(73, 73, 73);
        font-weight: bold;
        line-height: 70px;
    }
    #content > a:hover {
    
    }
    #content > a > img{
        width: 60px;
        height: 60px;
    }
    #main{
        margin: auto;
        width: 200px;
        height: 50px;
    }
    #main_btn{
        width: 200px;
        height: 50px;
        border: 0;
        background-color: rgb(94, 87, 59);
        color: white;
        font-size: 20px;
        font-weight: bold;
        border-radius: 10px;
    }
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	
	<c:set var="loginUser" value="${ sessionScope.loginUser }" scope="session" />
	<div id="myoutput">
        <div id="myback">
            <div id="myheader">
                <div id="myname">
                    <div id="profile">
                        <input type="file" name="프로필" id="my_profile">
                        <div id="profile_img"><img src="${sessionScope.path}/resources/img/${profile }.png" alt="기본프로필사진"></div>
                    </div>  
                    <div id="name">
                        <span>&nbsp;&nbsp;&nbsp;&nbsp;홍순자</span><span id="nim"><small>&nbsp;님</small></span>
                    </div>  
                    <div id="update">
                        <button id="update_info" type="button">정보 수정</button>
                    </div>  
                </div>
            </div>
            <div id="mycontent">
                <div id="content1">
                    <li class="circle"><img src="${sessionScope.path}/resources/img/deposit.png" alt="입금완료" width="140px" height="140px"></li>
                    <li class="circle"><img id="shipment" src="${sessionScope.path}/resources/img/shipment.png" alt="상품발송" width="110px" height="110px"></li>
                    <li class="circle"><img id="truck" src="${sessionScope.path}/resources/img/truck.png" alt="배송중" width="110px" height="110px"></li>
                    <li class="circle"><img id="transit" src="${sessionScope.path}/resources/img/transit.png" alt="배송완료" width="130px" height="130px"></li>
                </div>
                <div id="down">
                    <div>입금완료</div>
                    <div>상품발송</div>
                    <div>배송중</div>
                    <div>배송완료</div>
                </div>
                <div id="content2">
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/selectmyinfo.png" alt=""><br>내 정보 조회</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/board.png" alt=""><br>내가 쓴 게시글</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/comment.png" alt=""><br>내가 쓴 댓글</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/like2.png" alt=""><br>내 좋아요</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/heart.png" alt=""><br>내가 찜한 상품</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/mycart.png" alt=""><br>내 장바구니</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/coupon.png" alt=""><br>내 쿠폰</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/shopping.png" alt=""><br>내 결제 내역</a></div>
                    <div id="content"><a href=""><img src="${sessionScope.path}/resources/img/reser.png" alt=""><br>내 예약 내역</a></div>
                </div>
                <div id="main"><button type="button" id="main_btn" onclick="location.href='${sessionScope.path}'">메인화면</button></div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $('#my_profile').hide();
            $('#profile_img').click(function(){
                $('#my_profile').click();
            });
        });
    </script>
   			
	
</body>
</html>