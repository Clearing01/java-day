<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"
	import="test.MemberBean"    
%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="mb" class="test.MemberBean"/>
<jsp:useBean id="mmb" class="test.MemberManagerBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<form action="form.html">
	<input type="submit" value="[등록하기]">
</form>
<br>
<ol>
	<li>홍길동 90점 남</li>
<%
	ArrayList<MemberBean> datas = mmb.selectAll(mb);
	for(MemberBean v: datas){
%>
	<li><%=v.getMname()%> <%=v.getScore()%>점 <%=v.getGender()%> </li>
<% 
	}
%>
</ol>

</body>
</html>