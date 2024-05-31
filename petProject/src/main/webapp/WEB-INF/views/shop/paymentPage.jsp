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
			const data = JSON.parse(sessionStorage.getItem('data'));
			let check = sessionStorage.getItem('check');
			if(check == 1){
				$.ajax({
					url : '${ sessionScope.path }/kakaopay',
					contentType:'application/json',
					type : 'post',
					data : JSON.stringify(data),
					success : result => {
						sessionStorage.setItem('check',0);
						location.href = result;
						
					}
				});
			}
			else {
				window.opener.location.href="${sessionScope.path}/kakaopay/result";
				window.close()
			}
			
			
		});
	</script>
</body>
</html>