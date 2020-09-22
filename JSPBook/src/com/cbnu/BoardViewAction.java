package com.cbnu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 데이터가 넘나드는 공간 */
public class BoardViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_num = request.getParameter("b_num");
		String url = "./mvcboard/boardView.jsp";
		BoardDAO bDao = BoardDAO.getInstance(); // singleton
		BoardVO bVo = bDao.selectBoardItem(Integer.parseInt(b_num));
		
		request.setAttribute("boardone", bVo); // bVo를 boardone라는 이름으로 넘겨 JSTL로 처리
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
