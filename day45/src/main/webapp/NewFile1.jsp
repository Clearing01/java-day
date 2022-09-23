<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="test" class="test.Test" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL식 - 1</title>
</head>
<body>

<form action="NewFile2.jsp" method="post">
	<select name="sel">
	<%
		for(String v: test.getDatas()){
	%>
		<option><%=v%></option>
	<%
		}
	%>
	</select>
	<input type="submit" value="선택">
</form>

</body>
</html>