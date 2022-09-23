<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,model.vo.BoardVO,model.dao.BoardDAO"%>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bDAO" class="model.dao.BoardDAO" />
<jsp:useBean id="bVO" class="model.vo.BoardVO" />
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 - 1</title>
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
			<th>번 호</th><th>제 목</th><th>작성자</th>
		</tr>
		<%
			for(BoardVO v:(ArrayList<BoardVO>)datas){
				
		%>
			<tr>
				<th><a href="controller.jsp?bid=<%=v.getBid()%>&action=board"><%=v.getBid()%></a></th>
				<td><%=v.getTitle()%></td>
				<td><%=v.getWriter()%></td>
			</tr>
		<%		
	}
%>
		</table>
<hr>
<a href="form.jsp">새로운 글 작성하기</a>	 <br><br>


<form action="controller.jsp">
	<input type="hidden" name="action" value="search">
	<input type="text" name="text">
	<select name="cate">
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>
	<input type="submit" value="검색하기">
</form>
<%
	}
%>
</body>
</html>