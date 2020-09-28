package com.auth;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cbnu.DBConn;

public class LoginDAO {
	private static LoginDAO instance = null;
	
	private LoginDAO() {
		
	}
	
	public static LoginDAO getInstance() {
		if (instance == null) {
			instance = new LoginDAO();
		}
		return instance;
	}
	
	public boolean checkLogin(String ma_id, String ma_passwd) {
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean chk = false;
		try {
			conn = DBConn.getConnection();
			sql = "select count(ma_id) from memberadmin_tbl " +
					"where ma_id = ? and ma_passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ma_id);
			pstmt.setString(2, ma_passwd);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			int count = rs.getInt(1);
			
			if (count == 1) {
				chk = true;
			} else {
				chk = false;
			}
			
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
		
		return chk;
	}
}
