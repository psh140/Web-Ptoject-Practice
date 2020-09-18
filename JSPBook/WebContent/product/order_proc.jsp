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
	String am_code = request.getParameter("am_code"); //query의 객체를 받아옴
	String am_stat = request.getParameter("am_stat");

	PreparedStatement pstmt = null;
	String sql = "";
 	try {
		sql = "update account_main set am_stat = ?" +
 				"where am_code = ?"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, am_stat);
		pstmt.setInt(2, Integer.parseInt(am_code));
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
		response.sendRedirect("./order_list.jsp"); //list.jsp로 보내기
	} 

%>
<%
	} else { //로그인이 되어있지 않을 시 로그인 페이지로
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>