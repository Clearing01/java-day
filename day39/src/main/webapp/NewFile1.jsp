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
<title>수정 페이지</title>
</head>
<body>
<form action="update.jsp" method="post">
	번호: <input type="text" name="mpk"> <br>
	점수: <input type="number" min="0" max="100" name="score"> <br>
	<input type="submit" value="update">
</form>
<br>
<br>
<form action="delete.jsp" method="post">
	번호: <input type="text" name="mpk"> <br>
	<input type="submit" value="delete">
</form>
<form action="NewFile.jsp">
	<input type="submit" value="돌아가기">
</form>

<h2>데이터 목록</h2>
<table border="2">
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>점수</th>
	</tr>
<%
	MemberVO data = mDAO.selectOne(mvo); // 메인 페이지에서 넘어온 pk으로 selectOne 적용하여 data에 학생정보를 담음
%>	
	<tr> <!-- 해당 학생 정보 출력 -->
		<td><%=data.getMpk()%>번</td>
		<td><%=data.getName()%></td>
		<td><%=data.getScore()%></td>
	</tr>
<% 
%>	
</table>

</body>
</html>