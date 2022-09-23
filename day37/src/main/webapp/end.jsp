<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마지막 페이지</title>
</head>
<body>

<h1>종료 페이지</h1>
<hr>
이름: <%= request.getParameter("uname") %> <br>
메세지: <%= request.getParameter("msg") %>

</body>
</html>