package com.cbnu;

/* Model */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.cbnu.MyDate;
public class BoardDAO {
	private static BoardDAO instance = null;
	
	private BoardDAO() {
		
	}
	
	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	public List<BoardVO> selectAll(int pageNum, int pageSize) { // 전체 레코드셋 저장
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			conn = DBConn.getConnection();
			sql = "select * from " + // 게시글 페이징
    				"(select * from " +
    				"(select rownum as SEQ, b_num, b_subject, b_name, b_passwd, b_date, b_contents from " + // 글정보
    				"(select * from mvcboard order by b_num desc)" + // 게시글 나열
    				") where SEQ >= ?" + // 페이징 시작 위치 지정. 페이지 번호
    				") where rownum <= ?"; // pagenum번부터 시작해서 pageSize개의 글 페이지 단위(상수)
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum - 1) * pageSize + 1);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO bVo = new BoardVO();
				bVo.setB_num(rs.getInt("b_num"));
				bVo.setB_subject(rs.getString("b_subject"));
				bVo.setB_name(rs.getString("b_name"));
				bVo.setB_passwd(rs.getString("b_passwd"));
				bVo.setB_date(rs.getString("b_date"));
				bVo.setB_contents(rs.getString("b_contents"));
				
				list.add(bVo);
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
	
	public void insertBoard(BoardVO bVo) { // 게시글 입력
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConn.getConnection();
			sql = "insert into mvcboard values(" +
					"seq_mb_num.nextval, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getB_subject());
			pstmt.setString(2, bVo.getB_name());
			pstmt.setString(3, bVo.b_passwd);
			pstmt.setString(4, MyDate.getDate());
			pstmt.setString(5, bVo.getB_contents());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
	}
	
	public BoardVO selectBoardItem(int b_num) { // 해당 글 번호에 해당하는 VO 반환
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardVO bVo = null;
		
		try {
			conn = DBConn.getConnection();
			sql = "select * from mvcboard where b_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			rs = pstmt.executeQuery();
			rs.next();
			
			bVo = new BoardVO();
			bVo.setB_subject(rs.getString("b_subject"));
			bVo.setB_name(rs.getString("b_name"));
			bVo.setB_date(rs.getString("b_date"));
			bVo.setB_num(rs.getInt("b_num"));
			bVo.setB_contents(rs.getString("b_contents"));
			bVo.setB_passwd(rs.getNString("b_passwd"));
			
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
		return bVo;
	}
	
	public boolean checkBoard(String b_passwd, String b_num) {
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean chk = false;
		try {
			conn = DBConn.getConnection();
			sql = "select count(b_num) from mvcboard " +
					"where b_num = ? and b_passwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(b_num));
			pstmt.setString(2, b_passwd);
			
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
	
	public void updateBoard(BoardVO bVo) { // 게시글 수정
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConn.getConnection();
			sql = "update mvcboard set b_subject = ?, b_name = ?, b_contents = ? " +
					"where b_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bVo.getB_subject());
			pstmt.setString(2, bVo.getB_name());
			pstmt.setString(3, bVo.getB_contents());
			pstmt.setInt(4, bVo.getB_num());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
	}
	
	public void deleteBoard(int b_num) { // 게시글 삭제
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConn.getConnection();
			sql = "delete from mvcboard where b_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_num);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
	}
	
	public PagingVO pagingBoard(int pageNum, int pageSize, int groupSize) {
		String sql = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		PagingVO pVo = null;
		int startPage = 1;
		int endPage = 0;
		int  lastPage = 0;
		
		try {
			conn = DBConn.getConnection();
			sql = "select count(b_num) from mvcboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			int total = rs.getInt(1);
			
			rs.close();
			pstmt.close();
			
			lastPage = (total - 1) / pageSize + 1;
    		startPage = (pageNum - 1) / groupSize * groupSize + 1;
			endPage = (pageNum -1) / groupSize * groupSize + groupSize;   
			
			pVo = new PagingVO();
			pVo.setPageNum(pageNum);
			pVo.setPageSize(pageSize);
			pVo.setGroupSize(groupSize);
			pVo.setStartPage(startPage);
			pVo.setEndPage(endPage);
			pVo.setLastPage(lastPage);
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConn.close(conn);
		}
		return pVo;
	}

}
