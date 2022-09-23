package ctrl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do") // *.do 요청을 수행하면 해당 어노테이션에 의해 FC로 오게됨!!!
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() { 
    	// 서블릿 파일에 기본 생성자가 반드시 필요한 이유
    	// FrontController fc = new FrontController(); 그동안 하지 않음
    	// 객체화를 하지 않았는데, 메서드를 사용할 수 있었다?
    	// 서블릿 컨테이너(== 객체를 관리하는 것) == 웹 서버 == 톰캣이 서블릿을 객체화 해주고 있었음
    	
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String command=uri.substring(cp.length());
		System.out.println(command);
		
		ActionForward forward = null;
		if(command.equals("/main.do")) {
			try {
				forward = new MainAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/login.do")) {
			
		}
		else if(command.equals("/logout.do")) {
			try {
				forward = new LogoutAction().execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/insert.do")) {
			
		}
		else if(command.equals("/insertB.do")) {
			
		}
		else if(command.equals("/insertR.do")) {
			
		}
		else if(command.equals("/deleteB.do")) {
			
		}
		else if(command.equals("/deleteR.do")) {
			
		}
		else if(command.equals("/fav.do")) {
			
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
