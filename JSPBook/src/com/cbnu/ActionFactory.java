package com.cbnu;
import com.cbnu.Action;

/*Singleton Pattern : 클래스의 인스턴스가 하나임을 보장하고 접근할 수 있는 전역적인 접근점을 제공하는 패턴*/
/* Controller */

public class ActionFactory {
	private static ActionFactory instance = null;
	private ActionFactory() { }; // Default Constructor, private
	
	public static ActionFactory getInstance() {
		if (instance == null) { // 객체가 생성되어있지 않다면
			instance = new ActionFactory(); //객체 생성
		}
		return instance;
	}
	public Action getAction(String cmd) {
		Action action = null;
		if (cmd.equals("board_list")) { // 초기화면은 리스트
			action = new BoardListAction();
		} else if (cmd.equals("board_insert_form")) { // 글쓰기창 
			action = new BoardInsertFormAction();
		} else if (cmd.equals("board_insert")) { // 글 올리기
			action = new BoardInsertAction();
		} else if (cmd.equals("board_view")) { // 글 상세보기 창
			action = new BoardViewAction();
		} else if(cmd.equals("board_check_form")) { // 수정할 때 비밀번호 확인 창
			action = new BoardCheckFormAction();
		} else if(cmd.equals("board_check_ok")) { // 비밀번호 확인
			action = new BoardCheckAction();
		} else if(cmd.equals("board_update_form")) { // 수정페이지
			action = new BoardUpdateFormAction();
		} else if(cmd.equals("board_update")) {
			action = new BoardUpdateAction();
		} else if(cmd.equals("board_delete")) {
			action = new BoardDeleteAction();
		}
		return action;
	}
}
