package com.cbnu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardCheckAction implements Action { // 암호 점검 class cmd는 받을 필요 없음

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String b_num = request.getParameter("b_num"); // 해당 글 번호 받기
		String b_passwd = request.getParameter("b_passwd"); // 입력받은 비밀번호 받기
		
		BoardDAO bDao = BoardDAO.getInstance();
		boolean chk = bDao.checkBoard(b_passwd, b_num); // 비밀번호와 글번호 확인 후 boolean값 반환
		String url = "";
		
		if(chk) {
			url="./mvcboard/checkOk.jsp"; // 비밀번호 통과
		} else {
			url="./mvcboard/boardCheck.jsp"; // 비밀번호 틀렸을 시 돌아가기
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(url); // 비밀번호 확인 후 해당 url로 보내기
		dispatcher.forward(request, response); // 가지고 있는 객체는 싹 다 넘어감. b_num, b_passwd를 받았으므로 이것도 같이 넘어감
	} 
	
}
