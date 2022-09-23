package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CalcServlet")
public class CalcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CalcServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			String op = request.getParameter("op");
			int result = calc(num1,num2,op);
			
			PrintWriter out = response.getWriter();
			out.println("<HTML>");
			out.println("<HEAD><TITLE>계산기 - 3 결과화면</TITLE></HEAD>");
			out.println("<BODY><H1>결과</H1>");
			out.println("<HR>");
			out.println(num1+" "+op+" "+num2+" = "+result);
			out.println("</BODY>");
			out.println("</HTML>");
	}

	public int calc(int num1, int num2, String op) {
		int result=0;
		if (op.equals("+")) {
			result = num1 + num2;
		} else if (op.equals("-")) {
			result = num1 - num2;
		} else if (op.equals("*")) {
			result = num1 * num2;
		} else if (op.equals("/")) {
			result = num1 / num2;
		}
		return result;
	}
}
