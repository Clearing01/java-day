<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.ArrayList,model.MemberVO,model.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mDAO" class="model.MemberDAO" />
<jsp:useBean id="mvo" class="model.MemberVO" />
<jsp:setProperty property="*" name="mvo"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업데이트 페이지</title>
</head>
<body>

<%
	mDAO.update(mvo);
	response.sendRedirect("NewFile1.jsp");
%>

</body>
</html>