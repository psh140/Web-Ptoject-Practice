
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Ok</title>
</head>
<body>
<%@ include file="./dbconn.jsp"	%>
<%
	if (session.getAttribute("m_id") != null) { // 설정이 되어있는 상태 즉 로그인이 되어있는 상태
%>

<%
	request.setCharacterEncoding("utf-8");
 //query의 객체를 받아옴


	String bm_num = request.getParameter("bm_num"); 
	String bs_contents = request.getParameter("bs_contents");
	String bs_ip = request.getRemoteAddr(); // ip 불러오기
	Calendar cal = Calendar.getInstance(); //singleton 방식
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1; //0 ~ 11 이므로 +1
	int dd = cal.get(Calendar.DATE);
	int hh = cal.get(Calendar.HOUR);
	int ms = cal.get(Calendar.MINUTE);
	int ss = cal.get(Calendar.SECOND);
	
	String bs_date = String.format("%4d-%02d-%02d %02d:%02d:%02d", yy, mm, dd, hh, ms, ss); //날짜 담기

	PreparedStatement pstmt = null;
	String sql = "";
	try {
		sql = "insert into board_sub values(bs_autonum.nextval, ?, ?, ?, ?, ?)"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(bm_num));
		pstmt.setString(2, (String) session.getAttribute("m_id"));
		pstmt.setString(3, bs_contents);
		pstmt.setString(4, bs_date);
		pstmt.setString(5, bs_ip);
		pstmt.executeUpdate(); //sql문 실행
	} catch(Exception e) {
		System.out.println(e.toString());
	} finally {
		if (pstmt != null) {
			pstmt.close(); //소켓 닫기
		}
		if (conn != null) {
			conn.close();
		}
		response.sendRedirect("./view.jsp"); 
	}
	// 수정필요
%>
<%
	} else {
		response.sendRedirect("./view.jsp");
	}
%>
</body>
</html>