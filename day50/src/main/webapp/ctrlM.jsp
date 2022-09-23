<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mDAO" class="member.MemberDAO" />
<jsp:useBean id="mVO" class="member.MemberVO" />
<jsp:setProperty property="*" name="mVO" />

<%
	String action=request.getParameter("action");

	if(action.equals("insert")){
		if(mDAO.insert(mVO)){
			out.println("<script>alert('회원가입 성공!');opener.parent.location.reload();window.close();</script>");
		}
		else{
			out.println("<script>alert('회원가입 실패!');history.go(-1);</script>");
		}
	}
	else if(action.equals("login")){
		mVO=mDAO.selectOne(mVO);
		if(mVO!=null){
			session.setAttribute("mid", mVO.getMid());
			session.setAttribute("datas2", mDAO.selectAll_F(mVO));
			out.println("<script>alert('로그인 성공!');opener.parent.location.reload();window.close();</script>");
		}
		else{
			out.println("<script>alert('로그인 실패!');history.go(-1);</script>");
		}
	}
	else if(action.equals("logout")){
		session.invalidate();
		response.sendRedirect("ctrlB.jsp?action=main");
	}
%>