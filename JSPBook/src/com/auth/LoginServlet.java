package com.auth;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 폼, submit 버튼 누른 후 처리할 명령. 처리할 것이 적으므로 doGet에서 처리해도 됨
		String cmd = request.getParameter("cmd");
		if (cmd.equals("loginform")) {
			String url = "./auth/loginform.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 해당 url로 보내기
			dispatcher.forward(request, response); // 가지고 있는 객체는 싹 다 넘어감. sendredirect로 넘겨도 됨
			
		} else if (cmd.equals("loginok")) {
			loginOk(request, response);
			
		} else if (cmd.equals("uploadform")) {
			String url = "./auth/uploadform.jsp";
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 해당 url로 보내기
			dispatcher.forward(request, response); // 가지고 있는 객체는 싹 다 넘어감. sendredirect로 넘겨도 됨
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println(cmd);
		if (cmd.equals("upload")) { // multipart일 경우
			uploadOk(request, response);
			
		} else {
			doGet(request, response);	
		}
		
	}
	
	protected void loginOk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ma_id = request.getParameter("ma_id");
		String ma_passwd = request.getParameter("ma_passwd");
		
		LoginDAO lDao = LoginDAO.getInstance();
		boolean chk = false;
		chk = lDao.checkLogin(ma_id, ma_passwd); // 유효성 검사
		String url = "";
		
		if (chk) {
			HttpSession session = request.getSession();
			session.setAttribute("ma_id", ma_id); // 세션을 설정함
			url = "./BoardServlet?cmd=board_list"; // 로그인 성공시 띄울 페이지
		} else {
			url = "./LoginServlet?cmd=loginform"; // 실패 시 다시 로그인페이지로
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 비밀번호 확인 후 해당 url로 보내기
		dispatcher.forward(request, response); // 가지고 있는 객체는 싹 다 넘어감. b_num, b_passwd를 받았으므로 이것도 같이 넘어감
	}
	
	protected void uploadOk(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		String path = "D:\\GitWeb\\Web-Ptoject-Practice\\JSPBook\\WebContent\\product\\images";
		DiskFileUpload upload = new DiskFileUpload();
		try {
			List items = upload.parseRequest(request);
			Iterator params = items.iterator();
			FileItem item = null;
			
			params.hasNext(); // 일반 폼
			item = (FileItem)params.next();
			String name = item.getFieldName();
			String value = item.getString("UTF-8");
			System.out.println(name + " : " + value);
			
			params.hasNext(); // 파일 폼
			item = (FileItem)params.next();
			String fileFieldName = item.getFieldName();
			String fileName = item.getName();
			System.out.println(fileName);
			File file = new File(path + "/" + fileName);
			
			item.write(file);

		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
