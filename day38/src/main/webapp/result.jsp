<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mb" class="test.MemberBean" />
<jsp:setProperty property="*" name="mb" />
<jsp:useBean id="mmb" class="test.MemberManagerBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>


<h1>입력하신 정보</h1>
<%=
request.getParameter("mname")+" "
+request.getParameter("score")+" "
+request.getParameter("gender")
%>

<%
	mmb.insert(mb);
%>

<form action="main.jsp">
	<input type="submit" value="[메인으로 돌아가기]">
</form>

</body>
</html>