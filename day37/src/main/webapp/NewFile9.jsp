<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application - 2</title>
</head>
<body>

<%
	int cnt=(Integer)application.getAttribute("cnt");
	cnt++;
	application.setAttribute("cnt", cnt);
%>

<%=application.getAttribute("id") %>님의 방문자수: <%=cnt %>명

</body>
</html>