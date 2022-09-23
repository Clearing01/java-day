<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작 페이지</title>
</head>
<body>

<form action="forward.jsp" method="post">
	forward 액션: <input type="text" name="uname">
	<input type="submit" value="전송!">
</form>

<hr>

<form action="response.jsp" method="post">
	response.sendRedirect(): <input type="text" name="uname">
	<input type="submit" value="전송!">
</form>

</body>
</html>