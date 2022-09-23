<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 액션</title>
</head>
<body>

<hr>
	<jsp:include page="side.jsp">
		<jsp:param value="apple" name="msg"/>
		<jsp:param value="1024" name="num"/>
	</jsp:include>
<hr>

</body>
</html>