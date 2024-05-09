<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>Document</title>
<style>
    div {
        box-sizing: border-box;
    }
    * {
        box-sizing: border-box;
    }
    #header{
        width: 1200px;
        height: 260px;
        margin: auto;
    }
    #header1{
        width: 1200px;
        height: 140px;
        float: left;
        position: relative;
        border-bottom: 2px solid rgb(230, 230, 230)
    }
    #logo{
        width: 150px;
        height: 100px;
        float: left;
        padding-top: 30px;
    }
    #header1 > *{
        float: left;
    }
    #search_form{
        margin: auto;
        position: absolute;
        left: 50%;
        top: 60%;
        transform: translate(-50%, -50%);
    }
    #in_text{
        width: 380px;
        height: 50px;
        border-radius: 10px;
        border: 1px solid rgb(179, 179, 179);
        margin: 0;
        padding: 0;
    }
    #search_img{
        width: 40px;
        height: 40px;
        color: rgb(204, 204, 204);
        margin-left: 10px;
    }
    #menubar{
        width: 310px;
        height: 140px;
        float: right;
    }
    #navigator{
        width: 1200px;
        height: 120px;
        font-size: 24px;
        font-weight: bold;
    }
    #navi{
        list-style: none;
        height: 100%;
    }
    #navi>li{
        float: left;
        width: 16%;
        height: 100%;
        text-align: center;
    }
    #navi a{
        text-decoration: none;
        color: rgba(122, 88, 33, 0.92);
        font-weight: 700;
        width: 100%;
        height: 100%;
        display: block;
        line-height: 100px;
    }
    #navi a:hover{
        font-size: 25px;
        color: rgba(196, 132, 30, 0.92);
    }
    #menubar > a > img{
        width: 43px;
        transform: translate(180%, 190%);
        margin-right: 20px;
    }
    #navi2{
        list-style: none;
        float: left;
    }
    #login_img:hover{
        display: block;
    }
</style>
</head>
<body>
    <div id="header">
        <div id="header1">
            <div id="logo"><img src="petLogo.png" alt="로고" width="150px" height="100px"></div>
            <div id="search_form">
                <form action="#">
                    <input type="text" name="query" id="in_text" placeholder="  검색어를 입력하세요">
                    <img src="searchform.png" alt="" id="search_img">
                </form>
            </div>
            <div id="menubar">
                <a href="#"><img src="login.png" alt="" id="login_img"><ul id="navi2"><li></li></ul></a>
                <a href="#"><img src="mypage.png" alt=""></a>
                <a href="#"><img src="cart.png" alt=""></a>
            </div>
        <div>
        <div id="navigator">
            <ul id="navi">
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">지식</a></li>
                <li><a href="#">쇼핑</a></li>
                <li><a href="#">데이트</a></li>
                <li><a href="hospital">동물병원</a></li>
                <li><a href="#">공지사항</a></li>
            </ul>
        </div>
    </div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>