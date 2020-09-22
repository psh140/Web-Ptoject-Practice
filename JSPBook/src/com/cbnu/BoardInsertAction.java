package com.cbnu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* controller */
public class BoardInsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_subject = request.getParameter("b_subject");
		String b_name = request.getParameter("b_name");
		String b_passwd = request.getParameter("b_passwd");
		String b_contents = request.getParameter("b_contents");
		
		BoardVO bVo = new BoardVO();
		bVo.setB_subject(b_subject);
		bVo.setB_name(b_name);
		bVo.setB_passwd(b_passwd);
		bVo.setB_contents(b_contents);
		
		BoardDAO bDao = BoardDAO.getInstance(); // 정적 method single top
		bDao.insertBoard(bVo);
		response.sendRedirect("./BoardServlet?cmd=board_list"); // servlet 을 통해 보내기
	}

}
