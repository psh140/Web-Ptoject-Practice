package com.cbnu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardInsertFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "./mvcboard/boardInsert.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 글쓰기 버튼으로 받고 글쓰기 창으로 보내기
		dispatcher.forward(request, response);
	}

}
