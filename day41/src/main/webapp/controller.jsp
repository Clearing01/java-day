<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error/error.jsp" import="java.util.ArrayList,model.vo.BoardVO" %>
<%request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="bDAO" class="model.dao.BoardDAO" />
<jsp:useBean id="bVO" class="model.vo.BoardVO" />
<jsp:useBean id="mVO" class="model.vo.MemberVO" />
<jsp:useBean id="mDAO" class="model.dao.MemberDAO" />
<jsp:setProperty property="*" name="bVO"/>
<jsp:setProperty property="*" name="mVO"/>
<%
	// 컨트롤러 페이지 - 3
	// 어떤 요청을 받았는지 파악
	//  -> 해당 요청을 수행

	String action=request.getParameter("action");
	String cate=request.getParameter("cate");
	
	if(action.equals("login")){
		if(mDAO.selectOne(mVO)!=null){
			ArrayList<BoardVO> datas = bDAO.selectAll(bVO);
			request.setAttribute("datas", datas);
			pageContext.forward("main.jsp"); // forward 액션
		}
		else{
			out.println("<script>alert('로그인 실패');location.href='login.jsp';</script>");
		}
	}
	else if(action.equals("signUp")){
		if(mDAO.insert(mVO)){
			out.println("<script>alert('회원가입 성공');location.href='login.jsp';</script>");
		}
		else {
			out.println("<script>alert('회원가입 실패');location.href='login.jsp';</script>");
		}
	}
	else if(action.equals("main")){ // selectAll
		ArrayList<BoardVO> datas = bDAO.selectAll(bVO);
		request.setAttribute("datas", datas);
		pageContext.forward("main.jsp"); // forward 액션
	}
	else if(action.equals("board")){ // selectOne
		BoardVO v = bDAO.selectOne(bVO);
		if(v==null){
			response.sendRedirect("controller.jsp?action=main");
		}
		request.setAttribute("v", v);
		pageContext.forward("board.jsp");
	}
	else if(action.equals("search")){
		if(cate.equals("content")){ // selectOne
		bVO.setContent(request.getParameter("text")); 
		ArrayList<BoardVO> datas = bDAO.selectAll(bVO);
		request.setAttribute("datas", datas);
		pageContext.forward("search.jsp");			
		}
		else {
			bVO.setWriter(request.getParameter("text"));
			ArrayList<BoardVO> datas = bDAO.selectAll(bVO);
			request.setAttribute("datas", datas);
			pageContext.forward("search.jsp");	
		}
	}
	else if(action.equals("insert")){
		if(bDAO.insert(bVO)){
			response.sendRedirect("controller.jsp?action=main");
		}
		else{
			throw new Exception("insert 오류");
		}
	}
	else{
		out.println("<script>alert('action 파라미터 값이 올바르지 않습니다...');location.href='controller.jsp?action=main';</script>");
	}
%>