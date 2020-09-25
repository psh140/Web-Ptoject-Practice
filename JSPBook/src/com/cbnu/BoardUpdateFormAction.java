package com.cbnu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_num = request.getParameter("b_num");
		String url = "./mvcboard/boardUpdate.jsp";
		
		BoardDAO bDao = BoardDAO.getInstance();
		BoardVO bVo = bDao.selectBoardItem(Integer.parseInt(b_num)); // 데이터를 생성만 한 상태
		request.setAttribute("boardone", bVo); // setAttribute를 통해 데이터를 넘김
		
//		RequestDispatcher dispatchcer = request.getRequestDispatcher(url); // setAttribute 한 데이터도 같이 넘어감
//		dispatchcer.forward(request, response);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 글쓰기 버튼으로 받고 글쓰기 창으로 보내기
		dispatcher.forward(request, response);
	}

}
