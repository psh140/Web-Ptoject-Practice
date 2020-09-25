package com.cbnu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardUpdateAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_subject = request.getParameter("b_subject");
		String b_name = request.getParameter("b_name");
		int b_num = Integer.parseInt(request.getParameter("b_num"));
		String b_contents = request.getParameter("b_contents");
		
		BoardVO bVo = new BoardVO();
		bVo.setB_subject(b_subject);
		bVo.setB_name(b_name);
		bVo.setB_num(b_num);
		bVo.setB_contents(b_contents);
		
		BoardDAO bDao = BoardDAO.getInstance(); // 정적 method single top
		bDao.updateBoard(bVo);
		String url = "./BoardServlet?cmd=board_view&b_num=" + b_num;
		response.sendRedirect(url); // 글 수정 확인 후 리스트로 servlet 을 통해 보내기 
	}

}
