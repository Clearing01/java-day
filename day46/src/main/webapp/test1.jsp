<%@ page import="test.Test"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="test" class="test.Test" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL식 - 1</title>
</head>
<body>

	<form action="test2.jsp" method="post">
		<select name="sel">
			<c:forEach var="v" items="${test.datas}">
				<option>${v}</option>
			</c:forEach>
		</select>
		<input type="submit" value="선택">
	</form>

</body>
</html>