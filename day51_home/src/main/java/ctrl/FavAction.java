package ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;
import board.BoardVO;

public class FavAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		
		vo.setBid(Integer.parseInt(request.getParameter("bid")));
		
		if(dao.update(vo)) {
			forward = new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		else {
			throw new Exception("Fav 오류");
		}
		
		return forward;
	}
}

/*
		if(bDAO.update(bVO)){
			pageContext.forward("ctrlB.jsp?action=main");
		}
*/