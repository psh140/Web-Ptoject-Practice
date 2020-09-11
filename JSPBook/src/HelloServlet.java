

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
//		out.print("<h1>안녕 서블릿</h1>");
//		String pagenum = request.getParameter("pagenum");
//		out.print(pagenum + "<br>");
		
		String menu = request.getParameter("menu");
		if(menu.equals("1")) {
			doInsert(request, response);
		} else if(menu.equals("2")) {
			doUpdate(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 동적으로 뿌려주기만 하는 doPost 여기에서 처리하지 않고 method를 만들어 사용
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8"); // doPost에서는 선언 필수
		PrintWriter out = response.getWriter();
		
		String menu = request.getParameter("menu");
		if(menu.equals("I")) {
			doInsertEnd(request, response);
		} else if(menu.equals("U")) {
			doUpdateEnd(request, response);
		}
		
		
	}
	
	protected void doInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>doInsert Page</h1>");
		out.print("<form method='post' action='./HelloServlet'>");
		out.print("<input type='hidden' name='menu' value='I'>");
		out.print("<input type='text' name='name'><br>" +
					"<input type='password' name='passwd'><br>" +
					"<input type='submit' value='submit'>");
		out.print("</form>");
		
	}

	protected void doInsertEnd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String passwd = request.getParameter("passwd");
		String menu = request.getParameter("menu");
		out.print("<h1>dnInsertEnd Page</h1>");
		out.print("Name : " + name + "<br>" + "Password : " + passwd + "<br>" + "Key : " + menu);
	}
	
	protected void doUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("<h1>doUpdate Page</h1>");
		out.print("<form method='post' action='./HelloServlet'>");
		out.print("<input type='hidden' name='menu' value='U'>");
		out.print("<input type='text' name='name'><br>" +
					"<input type='password' name='passwd'><br>" +
					"<input type='submit' value='submit'>");
		out.print("</form>");
	}
	
	protected void doUpdateEnd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String passwd = request.getParameter("passwd");
		String menu = request.getParameter("menu");
		out.print("<h1>doUpdateEnd Page</h1>");
		out.print("Name : " + name + "<br>" + "Password : " + passwd + "<br>" + "Key : " + menu);
	}

}
