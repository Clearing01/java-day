<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
int result = 0; // 초기화 필수

if (request.getMethod().equals("POST")) {
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("op");
	if (op.equals("+")) {
		result = num1 + num2;
	} else if (op.equals("-")) {
		result = num1 - num2;
	} else if (op.equals("*")) {
		result = num1 * num2;
	} else if (op.equals("/")) {
		result = num1 / num2;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기 - 1</title>
</head>
<body>

	<h1>계산기</h1>
	<hr>
	<form method="post">
		<input type="text" name="num1"> 
		<select name="op">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select> 
		<input type="text" name="num2"> 
		<input type="submit" value="계산 결과보기">
	</form>
	<hr>
	<h2>
		계산 결과:<%=result%></h2>
</body>
</html>