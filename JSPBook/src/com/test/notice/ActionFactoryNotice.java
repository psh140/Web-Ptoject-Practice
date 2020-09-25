package com.test.notice;

public class ActionFactoryNotice {
	private static ActionFactoryNotice instance = null;
	private ActionFactoryNotice() { };
	
	public static ActionFactoryNotice getInstance() {
		if (instance == null) {
			instance = new ActionFactoryNotice();
		}
		
		return instance;
	}
	
	public ActionNotice getAction(String cmd) {
		ActionNotice action = null;
		if(cmd.equals("notice_list")) {
			action = new NoticeListAction();
		}
		
		return action;
	}
}
