<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좀 쉬셔요</title>

	<style>
	.wrap123{
		width: 1200px;
		height: 1000px;
		position: relative;
        width: 100%;
        height: 100vh; /* 화면 전체 높이에 맞추려면 사용 */
	}
	
	.wrap456{
		position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
	}
	
	</style>
</head>
<body>

	<jsp:include page="../../common/header.jsp" />
	
	<div class="wrap123">
		<div class="wrap456">
			<iframe width="850" height="703" src="https://www.youtube.com/embed/ATK7gAaZTOM" title="(여자)아이들((G)I-DLE) - &#39;나는 아픈 건 딱 질색이니까(Fate)&#39; LIVE CLIP" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
		</div>
	</div>
	
	
	
	
</body>
</html>