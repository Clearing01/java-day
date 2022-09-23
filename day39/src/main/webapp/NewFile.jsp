<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.ArrayList,model.MemberVO,model.MemberDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="mDAO" class="model.MemberDAO" />
<jsp:useBean id="mvo" class="model.MemberVO" />
<jsp:setProperty property="*" name="mvo"/>
<%
	if(request.getMethod().equals("POST")){
	mDAO.insert(mvo);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style type="text/css">
	table {
		width: 200px;
	}
</style>

</head>
<body>

<form action="NewFile.jsp" method="post">
이름: <input type="text" name="name"> <br>
점수: <input type="number" min="0" max="100" name="score"> <br>
<input type="submit" value="데이터 등록하기">
</form>

<form action="NewFile1.jsp" method="post">
	<input type="submit" value="데이터 수정하기">
</form>

<hr>
<h2>데이터 목록</h2>
<table border="2">
	<tr>
		<th>학번</th>
		<th>이름</th>
	</tr>
<%
 
	ArrayList<MemberVO> datas = mDAO.selectAll(mvo); // selectAll로 가져온 DB정보(전체 학생부) datas배열 객체에 담음
	for(MemberVO v: datas){ // 전체 학생부 출력
%>	
	<tr>
		<td><a href="NewFile1.jsp?mpk=<%=v.getMpk()%>"><%=v.getMpk()%>번</a></td> <!-- 해당 번호의 학생 클릭시 pk값 매칭되어 정보 출력 페이지로 이동 -->
		<td><%=v.getName()%></td>
	</tr>
<% 
	}
%>	
</table>

</body>
</html>