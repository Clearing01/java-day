<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.vo.BoardVO,model.dao.BoardDAO" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bDAO" class="model.dao.BoardDAO" />
<jsp:useBean id="bVO" class="model.vo.BoardVO" />
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if(datas.size()==0){
			out.println("게시글이 없습니다...");
	}
	else {
		%>
		<table border="2">
		<tr>
			<th>번 호</th><th>제 목</th><th>내 용</th><th>작성자</th>
		</tr>
		<%
			for(BoardVO v:(ArrayList<BoardVO>)datas){
				
		%>
			<tr>
				<th><a href="controller.jsp?bid=<%=v.getBid()%>&action=board"><%=v.getBid()%></a></th>
				<td><%=v.getTitle()%></td>
				<td><%=v.getContent()%></td>
				<td><%=v.getWriter()%></td>
			</tr>
		<%		
	}
%>
		</table>
<%
	}
%>
		

</body>
</html>