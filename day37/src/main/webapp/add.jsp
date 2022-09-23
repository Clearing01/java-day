<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니에 물건을 추가하는 로직(화면출력xxx)</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	ArrayList<String> list = (ArrayList)session.getAttribute("list"); // 세션에 있는 배열 정보를 list 배열에 담음
	// session에 저장된 장바구니를 불러오는 코드
	String product = request.getParameter("product"); // main.jsp에서 받은 product정보를 String 객체에 담음
	
	if(list==null){ // 세션에 있는 list 배열이 비어있다면
		list = new ArrayList<String>(); // list 배열 생성
		session.setAttribute("list", list); // 배열 생성 후 세션에 담아줌
	}
	list.add(product); //product 객체를 list 배열에 추가
	
%>

<script type="text/javascript">
	//alert("<%=request.getParameter("product")%>이(가) 장바구니에 추가되었습니다!")
	history.go(-1); // 로직 실행 후 이전 페이지로
</script>
</body>
</html>