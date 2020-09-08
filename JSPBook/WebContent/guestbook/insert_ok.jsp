
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
	request.setCharacterEncoding("utf-8");
	String guest_name = request.getParameter("guest_name"); //query의 객체를 받아옴
	String guest_subject = request.getParameter("guest_subject");
	String guest_contents = request.getParameter("guest_contents");
	String guest_passwd = request.getParameter("guest_passwd");
	
	Calendar cal = Calendar.getInstance(); //singleton 방식
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH) + 1; //0 ~ 11 이므로 +1
	int dd = cal.get(Calendar.DATE);
	int hh = cal.get(Calendar.HOUR);
	int ms = cal.get(Calendar.MINUTE);
	int ss = cal.get(Calendar.SECOND);
	
	String guest_date = String.format("%4d-%02d-%02d %02d:%02d:%02d", yy, mm, dd, hh, ms, ss); //날짜 담기
//	String guest_date = yy + "-" + mm + "0" + dd + " " + hh + ":" + ms + ":" + ss;

	PreparedStatement pstmt = null;
	String sql = "";
	try {
		sql = "insert into guestbook values(auto_num.nextval, ?, ?, ?, ?, ?)"; 
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, guest_name);
		pstmt.setString(2, guest_subject);
		pstmt.setString(3, guest_contents);
		pstmt.setString(4, guest_passwd);
		pstmt.setString(5, guest_date);
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
</body>
</html>