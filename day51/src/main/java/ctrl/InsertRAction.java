package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.ReplyVO;

public class InsertRAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO dao = new BoardDAO();
		ReplyVO vo = new ReplyVO();
		
		vo.setMid(request.getParameter("mid"));
		vo.setBid(Integer.parseInt(request.getParameter("bid")));
		vo.setRmsg(request.getParameter("rmsg"));

		if(dao.insertR(vo)) {
			System.out.println("로그: insertR 성공");
		}
		else {
			throw new Exception("insertR 오류");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("main.do");
		forward.setRedirect(false);
		
		return forward;
	}

}

/*

		if(bDAO.insertR(rVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}

*/