<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forward 액션</title>
</head>
<body>

<hr>
	<jsp:forward page="side.jsp">
		<jsp:param value="apple" name="msg"/>
		<jsp:param value="1024" name="num"/>
	</jsp:forward>
<hr>

</body>
</html>