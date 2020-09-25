package com.cbnu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_num = request.getParameter("b_num");
		BoardDAO bDao = BoardDAO.getInstance();
		
		bDao.deleteBoard(Integer.parseInt(b_num));
		
		String url = "./BoardServlet?cmd=board_list";
		response.sendRedirect(url);
	}

}
