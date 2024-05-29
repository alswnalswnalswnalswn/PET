<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>Insert title here</title>
</head>
<body>

	<script>
	
		$(() => {
			$('#kakaoSubmit').submit();
			$.ajax({
				url : '${ sessionScope.path }/kakaopay',
				type : 'post',
				success : result => {
					location.href = result;
				}
			});
			
			
		});
	</script>
</body>
</html>