<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러페이지</title>
</head>
<body>

<h1>에러가 발생했습니다...</h1>
<%=exception%> <br>
<img alt="일러스트" src="./images/6.png">
<hr>
<a href="./webapp/main.jsp">메인으로 돌아가기</a>

</body>
</html>