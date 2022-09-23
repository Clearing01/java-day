<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>

<form action="controller.jsp" method="post">
	<input type="hidden" name="action" value="login">	
	아이디: <input type="text" name="mid"> <br>
	비밀번호: <input type="text" name="mpw"> <br>
	<input type="submit" value="로그인">
</form>
<br>
<hr>
<br>
<form action="controller.jsp">
	<input type="hidden" name="action" value="signUp">
	아이디: <input type="text" name="mid"> <br>
	비밀번호: <input type="text" name="mpw"> <br>
	이름: <input type="text" name="mname"> <br>
	닉네임: <input type="text" name="role"> <br>
	<input type="submit" value="회원가입">
</form>

</body>
</html>