package com.cbnu;

import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* controller */
public class BoardListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "./mvcboard/boardlist.jsp"; // view
		
		BoardDAO bDao = BoardDAO.getInstance(); //singleton 생성
		List<BoardVO> list = bDao.selectAll();
		
		request.setAttribute("list", list); // list 데이터를 "list" 로 설정하여 view 로 전송
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
