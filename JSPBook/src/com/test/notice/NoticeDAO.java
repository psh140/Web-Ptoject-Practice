package com.test.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cbnu.BoardVO;
import com.cbnu.DBConn;

public class NoticeDAO {
	private static NoticeDAO instance = null;
	
	private NoticeDAO() {
		
	}
	
	public static NoticeDAO getInstance() {
		if (instance == null) {
			instance = new NoticeDAO();
		}
		
		return instance;
	}
	public List<NoticeVO> selectAll() { // 전체 레코드셋 저장
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		
		try {
			conn = DBConn.getConnection();
			sql = "select * from mvcnotice order by n_num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeVO nVo = new NoticeVO();
				nVo.setN_num(rs.getInt("n_num"));
				nVo.setN_subject(rs.getString("n_subject"));
				nVo.setN_name(rs.getString("n_name"));
				nVo.setN_date(rs.getString("n_date"));
				nVo.setN_contents(rs.getString("n_contents"));
				
				list.add(nVo);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
		return list;
	}
	
}
