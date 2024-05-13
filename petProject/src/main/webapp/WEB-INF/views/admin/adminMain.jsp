<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인페이지</title>

	<link rel="stylesheet" href="resources/css/admin/adminMain.css" />

</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div id="admin_wrap">
		
		<div class="admin_navi">
			<ul class="admin_navibar">
				<li class="nav-item"><a class="nav-link" href="#">회원관리</a></li>
				<li class="nav-item"><a class="nav-link below" href="#">데이트관리</a>
					<ul>
						<li><a class="nav-link" href="#">산책로</a></li>
						<li><a class="nav-link" href="#">동물병원</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link below" href="#">게시글관리</a>
					<ul>
						<li><a class="nav-link" href="#">커뮤니티</a></li>
						<li><a class="nav-link" href="#">지식</a></li>
						<li><a class="nav-link" href="#">공지사항</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<div class="admin_page">
			as
		</div>
	</div>

	<script>
        $(function(){

            $('.below').click(() => {
				// console.log('하이');
				// console.log(this);
                const $below = $(this).next();
               console.log($below);

                if($below.css('display') == 'none'){

                    // 기존에 열려있던 p태그는 닫아주기!
                    $below.siblings('div').slideUp(1000);

                    $below.slideDown(1000);
                }
                else{
                    $below.slideUp(1000);
                }
            });
        });
    </script>


















	<jsp:include page="../common/footer.jsp" />

</body>
</html>