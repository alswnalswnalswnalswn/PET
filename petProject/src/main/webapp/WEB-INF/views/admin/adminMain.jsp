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
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="#">회원관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">데이트관리</a>
					<ul>
						<li><a class="nav-link" href="#">산책로</a></li>
						<li><a class="nav-link" href="#">동물병원</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">게시글관리</a>
					<li><a class="nav-link" href="#">동물병원</a></li>
					<li><a class="nav-link" href="#">동물병원</a></li>
					<li><a class="nav-link" href="#">동물병원</a></li>
				</li>
			</ul>
		</div>












	</div>




















	<jsp:include page="../common/footer.jsp" />

</body>
</html>