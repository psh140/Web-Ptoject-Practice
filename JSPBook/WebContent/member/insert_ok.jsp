<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update OK</title>
</head>
<body>
<%@ include file="./dbconn.jsp"	%>
<%
	request.setCharacterEncoding("utf-8");

	String m_id = request.getParameter("m_id");
	String m_passwd = request.getParameter("m_passwd");
	String m_addr = request.getParameter("m_addr");
	String m_phone = request.getParameter("m_phone");
	String m_name = request.getParameter("m_name");
	
	Calendar cal = Calendar.getInstance(); //singleton 방식
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1; //0 ~ 11 이므로 +1
	int dd = cal.get(Calendar.DATE);
	int hh = cal.get(Calendar.HOUR);
	int ms = cal.get(Calendar.MINUTE);
	int ss = cal.get(Calendar.SECOND);
	
	String m_date = String.format("%4d-%02d-%02d %02d:%02d:%02d", yy, mm, dd, hh, ms, ss); //날짜 담기
//	String guest_date = yy + "-" + mm + "0" + dd + " " + hh + ":" + ms + ":" + ss;
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	try {
		sql = "select count(m_id) from member_tbl where m_id = ?";  //null을 받지 않기 위해. 값은 알 수 없음.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); //1번 항목을 int형으로 받음
		
		if (cnt == 0) { // 아이디 허가
			sql = "insert into member_tbl values(?, ?, ?, ?, ?, ?, 'Y') ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_name);
			pstmt.setString(3, m_addr);
			pstmt.setString(4, m_phone);
			pstmt.setString(5, m_passwd);
			pstmt.setString(6, m_date);
			
			pstmt.executeUpdate(); //sql문 실행 
			response.sendRedirect("./login.jsp");
		} else { 
%>
			<script>
				alert("아이디가 중복입니다."); // 가독성과 많은 javascript의 처리를 위해 scriptlet을 빠져나와서 script문 작성
				history.back();
			</script>			
<%
				}
					
				} catch(Exception e) {
					System.out.println(e.toString());
				} finally {
					if (rs != null) //소켓 닫기
						rs.close();
					if (pstmt != null) {
						pstmt.close(); 
					}
					if (conn != null) {
						conn.close();
					}
			
				}
				
			%>

</body>
</html>