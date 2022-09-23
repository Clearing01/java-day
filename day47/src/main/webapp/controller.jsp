<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="b1" class="vo.Bank1" />
<jsp:useBean id="b2" class="vo.Bank2" />
<jsp:useBean id="dao1" class="dao.Bank1DAO" />
<jsp:useBean id="dao2" class="dao.Bank2DAO" />

<%
		if(dao1.transfer(Integer.parseInt(request.getParameter("balance")))){
			out.print("<script>alert('성공!');location.href='NewFile.jsp';</script>");
		}
		else{
			out.print("<script>alert('실패...');location.href='NewFile.jsp';</script>");
		}

	b1=dao1.selectOne(b1);
	b2=dao2.selectOne(b2);
	session.setAttribute("b1", b1);
	session.setAttribute("b2", b2);
	// V에서 EL식으로 출력하기 위해, JSP scope 내장객체에 serAttribute() 수행함
	
%>