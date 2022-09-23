<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.vo.BoardVO,java.util.ArrayList" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="member" class="model.vo.MemberVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
<script type="text/javascript">
	function check(){
		ans=prompt('비밀번호를 입력하세요.');
		if(ans=='<%=member.getMpw()%>'){
			location.href="controller.jsp?action=mypage";
		}	
	}
</script>
<%
	if(member.getMid()!=null){
%>
<h1><a href="javascript:check()"><%=member.getMname()%></a>님, 반갑습니다!</h1>
<a href="controller.jsp?action=logout">로그아웃</a> <br><br>
<%
	} else {
%>
	<h1>GUEST님, 반갑습니다!</h1>
<%
	}
%>

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
<hr>
<form action="controller.jsp">
	<input type="hidden" name="action" value="search">
	<input type="text" name="searchContent">
	<select name="searchCondition">
		<option value="title">제목</option>
		<option value="content">내용</option>
		<option value="writer">작성자</option>
	</select>
	<input type="submit" value="검색">
</form>
<%
	if(member.getMid()!=null){
%>
	<a href="form.jsp">새로운 글 작성하기</a> <br><br> 
<%
	} else {
%>	
	<h3>새로운 글을 작성하려면 로그인을 하세요</h3>
	<a href="login.jsp">로그인</a>&nbsp&nbsp<a href="reg.jsp">회원가입</a>
<%
	}
%>



</body>
</html>