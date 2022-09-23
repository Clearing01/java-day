<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardVO" %>
    
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bDAO" class="model.dao.BoardDAO" />
<jsp:useBean id="bVO" class="model.vo.BoardVO" />
<jsp:setProperty property="*" name="bVO"/>
<jsp:useBean id="v" class="model.vo.BoardVO" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<table border="2">
		<tr>
			<th>번 호</th><th>제 목</th><th>내용</th>
		</tr>

			<tr>
				<th><%=v.getBid()%></th>
				<td><%=v.getTitle()%></td>
				<td><%=v.getContent()%></td>
			</tr>
		</table>

</body>
</html>