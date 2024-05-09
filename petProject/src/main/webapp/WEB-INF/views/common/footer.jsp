<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{
            box-sizing: border-box;
        }
        #footer{
            margin: auto;
            height: 350px;
            width: 1200px;
        }

        #footer-btn-area{
            margin: auto;
            margin-top: 70px;
            width: 1000px;
            height: 60px;
            border-top: 2px solid rgb(230, 230, 230);
            border-bottom: 2px solid rgb(230, 230, 230);
        }
        #footer-btn-area a{
            color: rgb(51, 51, 51);
            line-height: 40px;

        }
        #footer-content{
            margin: auto;
            height: 220px;
            width: 1000px;
            padding-top: 50px;
            text-align:center;
        }

    </style>
</head>
<body>
    <div id="footer">
        <div id="footer-btn-area">
            <ul class="nav nav-pills nav-justified">
                <li class="nav-item">
                    <a class="nav-link" href="#">이용약관</a>
                </li>
                <li class="nav-item" style="border-left: 2px solid rgb(230, 230, 230);border-right: 2px solid rgb(230, 230, 230);">
                    <a class="nav-link" href="#">개인정보처리방침</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">공지사항</a>
                </li>
            </ul>
        </div>
        <div id="footer-content">
            COMPANY : 냥이랑 멍이랑 ㅣ OWNER : 김건희<br><br>

Tel. 010-6547-7902 l neorangofficial@gmail.com<br><br>

울산 남구 삼산로45번길 30 103동 308호 l Biz License 338-55-00507<br><br>
        </div>
    </div>
</body>
</html>