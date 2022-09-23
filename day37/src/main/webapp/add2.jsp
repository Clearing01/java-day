<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 로직</title>
</head>
<body>

// session에 저장된 장바구니를 불러오는 코드
<%
	request.setCharacterEncoding("UTF-8");
	ArrayList<String> list = (ArrayList)application.getAttribute("list"); // 서버에 저장된 채팅 배열을 list 배열 객체에 담음
	String msg = request.getParameter("msg"); // request가 가지고있는 정보(main2.jsp에서 넘어온) String msg 객체에 담음
	msg = session.getAttribute("id")+": "+msg; // 세션에 접속된 id와 대화내역
	if(list==null){ // list 배열이 없으면
		list = new ArrayList<String>(); // 배열 생성 
		application.setAttribute("list", list); // 서버에 배열 정보 저장
	}
	list.add(msg); // list 배열에 msg 추가
	response.sendRedirect("main2.jsp"); // main2.jsp로 새로 시작
%>

</body>
</html>