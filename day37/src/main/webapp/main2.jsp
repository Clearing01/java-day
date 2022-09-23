<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id"); // request가 가진 정보를 String id 객체에 담음
	if(id!=null){ // index2.jsp를 통해서 페이지를 출력할때에만
		session.setAttribute("id", id); // id에 정보를 가지고 있을때에만 String 객체 정보를 담음
	}
%>
<form action="add2.jsp" method="post">
	<h1><%=session.getAttribute("id")%>님: // 세션이 가지고 있는 id
		[<input type="text" name="msg">]
		<input type="submit" value="[글쓰기]">
	</h1>
</form>
<hr>
<h2>채팅창</h2>
<h3>
banana: 하이 :D <br>
banana:	(*^▽^*)	<br>
</h3>
<%	
	ArrayList<String> list = (ArrayList)application.getAttribute("list"); // 서버에 저장된 채팅 배열 리스트
	if(list==null){ // 리스트가 비어 있다면
		out.println("");
	}
	else {
		for(int i=0;i<list.size();i++){ // 리스트에 정보가 있으면 대화내용 출력
			out.println("<h3>"+list.get(i)+"</h3>");
		}
	}
%>

</body>
</html>