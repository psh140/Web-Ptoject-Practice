
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cbnu.MyDate" %>
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
	String m_id = request.getParameter("m_id"); //query의 객체를 받아옴
	String bm_subject = request.getParameter("bm_subject");
	String bm_contents = request.getParameter("bm_contents");
	String bm_ip = request.getRemoteAddr(); // ip 불러오기
	
	
	
	String bm_date = MyDate.getDate(); //날짜 담기

	PreparedStatement pstmt = null;
	String sql = "";
	try {
		sql = "insert into board_main values(bm_autonum.nextval, ?, ?, ?, ?, 0, ?)"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setString(2, bm_subject);
		pstmt.setString(3, bm_contents);
		pstmt.setString(4, bm_date);
		pstmt.setString(5, bm_ip);
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
		response.sendRedirect("./list.jsp"); //list.jsp로 보내기
	}
%>
<%
	} else { //로그인이 되어있지 않을 시 로그인 페이지로
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>