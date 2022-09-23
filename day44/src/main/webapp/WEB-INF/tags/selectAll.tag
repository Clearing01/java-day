<%@ tag language="java" pageEncoding="UTF-8" import="java.util.ArrayList,model.vo.BoardVO"%>

<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />

<%
	if(datas.size()==0){		
%>
	<h2>게시글이 존재하지 않습니다.</h2>
<% 
	} else {
%>
	<table border="2">
		<tr>
			<th>번 호</th><th>제 목</th><th>작성자</th><th>작성일</th>
		</tr>
	<%
		for(BoardVO v:(ArrayList<BoardVO>)datas){
	%>
		<tr>
			<th><a href="controller.jsp?action=board&bid=<%=v.getBid()%>"><%=v.getBid()%></a></th>
			<td><%=v.getTitle()%></td>
			<td><%=v.getWriter()%></td>
			<td><%=v.getDateTime()%></td>
		</tr>
<%
		}
	}
%>
</table>