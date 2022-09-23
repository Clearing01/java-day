<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include 지시어</title>
</head>
<body>

<table border="2">
	<tr>
		<td><%@ include file="header.jsp" %></td>
	</tr>
	<tr>
		<td><%@ include file="footer.jsp" %></td>
	</tr>
</table>

</body>
</html>