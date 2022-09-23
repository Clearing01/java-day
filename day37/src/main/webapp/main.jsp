<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String uname = request.getParameter("uname"); // index.jsp에서 넘어온 정보를 String 객체에 담음
	session.setAttribute("uname", uname); // 생성한 String 객체를 세션에 담음
%>

<h1><%=request.getParameter("uname") %>님, 반갑습니다! :D</h1> // index.jsp에서 넘어온 정보

<form action="add.jsp" method="post">

	<select name="product">
		<option>연필</option>
		<option>샤프</option>
		<option>샤프심</option>
		<option>지우개</option>
		<option>볼펜</option>
	</select>
	<input type="submit" value="장바구니에 추가">
</form>
<hr>
<a href="result.jsp">구매하기</a>


</body>
</html>