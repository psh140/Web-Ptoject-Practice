package com.cbnu;

import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/* controller */
public class BoardListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pageNum = request.getParameter("pageNum");
		
		int pgNum = 1; // 페이지 번호 초기화
		if (pageNum == null) {
			pgNum = 1;
		} else {
			pgNum = Integer.parseInt(pageNum);
		}
		
		String url = "./mvcboard/boardlist.jsp"; // view
		
		BoardDAO bDao = BoardDAO.getInstance(); //singleton 생성
		List<BoardVO> list = bDao.selectAll(pgNum, 5); // 페이지 시작위치와 페이지 사이즈
		PagingVO pVo = bDao.pagingBoard(pgNum, 5, 3); // 페이징 사이즈
		
		HttpSession session = request.getSession(); // 세션 로그인 정보 받아오기
		Object ma_id = session.getAttribute("ma_id"); // 관리자 아이디 받아오기
		session.setAttribute("ma_id", ma_id); // 관리자 아이디 세팅 후 넘기기
		
		request.setAttribute("list", list); // list 데이터를 "list" 로 설정하여 view 로 전송
		request.setAttribute("pagedata", pVo); // pVo클래스의 객체를 "pagedata" 로 넘김. view 에 paging 정보 전송
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
