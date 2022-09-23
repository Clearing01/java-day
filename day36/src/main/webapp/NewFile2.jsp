<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="cb" class="model.CalcBean" />
<%-- test 패키지에 있는 CalcBean 클래스를 cb라는 이름으로 객체화 --%>

<jsp:setProperty property="*" name="cb"/>
<%-- cb 라는 이름을 가진 객체의 setter 메서드 자동매핑 호출 --%>

<% cb.calc(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기 - 2</title>
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
		계산 결과:
		<jsp:getProperty property="result" name="cb"/></h2>

</body>
</html>