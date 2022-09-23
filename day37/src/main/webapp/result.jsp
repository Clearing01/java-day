<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>

<h1><%=session.getAttribute("uname")%>님이 구매한 상품 목록</h1> // 세션에 담긴 유저 이름
<hr>
<ol>
<%	
	ArrayList<String> list = (ArrayList)session.getAttribute("list"); // 세션이 가진 배열객체 list 배열에 담음
	if(list==null){
		out.println("<h2>구매한 상품이 없습니다</h2>"); // list가 비어있을 때
	}
	for(int i=0;i<list.size();i++){
		out.println("<li>"+list.get(i)+"</li>"); // list에 정보가 있으면 출력
	}
%>
</ol>

</body>
</html>