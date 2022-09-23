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

<c:url value="NewFile4.jsp" var="target">
	<c:param name="sel">banana</c:param>
</c:url>

<hr>

${target} <br>
<a href="${target}">NewFile4.jsp 페이지로 banana 값(파라미터명:sel)을 보내는 링크</a>

</body>
</html>