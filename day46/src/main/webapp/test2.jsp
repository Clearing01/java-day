<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL식 - 2</title>
</head>
<body>

	sel이라는 파라미터에 저장된 값: ${param.sel} <br>
	<hr>
	현재 session에는 test라는 이름의 객체가 저장된 상태 <br>
	${test.num1}+${test.num2}=${test.num1+test.num2}

</body>
</html>