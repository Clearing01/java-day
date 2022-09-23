package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet(urlPatterns={"/TestServlet"}, initParams={@WebInitParam(name="msg1",value="HELLO"),@WebInitParam(name="msg2",value=":D")})
// URL 매핑 설정이란?
// 브라우저에서 어떤 URL 요청에대해 해당 서블릿을 서비스할지를 결정
public class TestServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      response.setContentType("text/html; charset=UTF-8");
      
      PrintWriter out=response.getWriter();
      out.println("<HTML>");
      out.println("<BODY>");
      out.println("<H1>초기화 매개변수 - @</H1>");
      out.println("msg1: "+getInitParameter("msg1")+"<BR>");
      out.println("msg2: "+getInitParameter("msg2"));
      // 서블릿 초기화 매개변수 -> @
      
      out.println("<HR>");
      out.println("name: "+getServletContext().getInitParameter("name")+"<BR>");
      out.println("encoding: "+getServletContext().getInitParameter("encoding"));
      // 웹 어플리케이션 초기화 매개변수 -> web.xml
      out.println("</BODY>");
      out.println("</HTML>");
   }

}