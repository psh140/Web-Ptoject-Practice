<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Ok</title>
</head>
<body>
<%@ include file="./dbconn.jsp"	%>
<%
	request.setCharacterEncoding("utf-8");

	String guest_num = request.getParameter("guest_num");
	String guest_passwd = request.getParameter("guest_passwd");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	try {
		sql = "select count(guest_num) from guestbook where guest_num = ? and guest_passwd = ?"; //count : 행이 있는지 없는지. 1이면 true 0이면 false. 
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(guest_num));
		pstmt.setString(2, guest_passwd);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); //1번 항목을 int형으로 받음
		
		if (cnt == 1) {
			sql = "delete from guestbook where guest_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(guest_num));
			pstmt.executeUpdate(); //sql문 실행 
			response.sendRedirect("./list.jsp");
		} else {
			response.sendRedirect("./view.jsp?guest_num=" + guest_num);
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