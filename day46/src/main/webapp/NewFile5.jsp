<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var="v" items="${datas}" begin="0" end="3" varStatus="status">
	index: ${status.index} <br>
	count: ${status.count} <br>
	${v.name} | ${v.phone} <hr>
</c:forEach>

<hr>

<c:forTokens items="사과,바나나,키위" delims="," var="v">
	${v} <br>
</c:forTokens>

</body>
</html>