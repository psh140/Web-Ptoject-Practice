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
	String p_code = request.getParameter("p_code"); //query의 객체를 받아옴
	String cs_cnt = request.getParameter("cs_cnt");

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	int cm_code = 0;
	
 	try {
 		sql = "select count(cm_code) from cart_main " + // 이 사용자 ID를 가진 cart_main ID가 있는가
 				"where m_id = ?";
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, (String)session.getAttribute("m_id"));
 		rs = pstmt.executeQuery();
 		rs.next();
 		int cnt_cm_code = rs.getInt(1); // 레코드 갯수
 		
 		if (cnt_cm_code == 1) { // record가 있는가
 			rs.close();
 	 		pstmt.close();
 	 		sql = "select * from cart_main " + // 이 사용자 ID를 가진 cart_main ID가 있는가
 	 				"where m_id = ?";
 	 		pstmt = conn.prepareStatement(sql);
 	 		pstmt.setString(1, (String)session.getAttribute("m_id"));
 	 		rs = pstmt.executeQuery();
 	 		rs.next();
 	 		cm_code = rs.getInt("cm_code");
 	 		rs.close();
 	 		pstmt.close();
 		} else { //신규 cart_main record 추가
 			rs.close();
 			pstmt.close();
 			sql = "insert into cart_main values(seq_cm_code.nextval, ?, ?)";
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, (String)session.getAttribute("m_id"));
 			pstmt.setString(2, MyDate.getDate());
 			pstmt.executeUpdate();
 			pstmt.close();
 			
 			sql = "select * from cart_main " + // 이 사용자 ID를 가진 cart_main ID가 있는가
 	 				"where m_id = ?";
 	 		pstmt = conn.prepareStatement(sql);
 	 		pstmt.setString(1, (String)session.getAttribute("m_id"));
 	 		rs = pstmt.executeQuery();
 	 		rs.next();
 	 		cm_code = rs.getInt("cm_code");
 	 		rs.close();
 	 		pstmt.close();
 		}
 		
 		sql = "select count(cs_code) from cart_sub " +
 				"where cm_code = ? and p_code = ?";
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setInt(1, cm_code);
 		pstmt.setInt(2, Integer.parseInt(p_code));
 		rs = pstmt.executeQuery();
 		rs.next();
 		int cnt_cs_code = rs.getInt(1);
 		rs.close();
 		pstmt.close();
 		
 		if (cnt_cs_code == 1) { //이미 존재하므로 제품의 수량 업데이트
 			sql = "update cart_sub set cs_cnt = cs_cnt + ? " +
 					"where cm_code = ? and p_code = ?";
 			pstmt = conn.prepareStatement(sql);
 			
 			pstmt.setInt(1, Integer.parseInt(cs_cnt));
 			pstmt.setInt(2, cm_code);
 			pstmt.setInt(3, Integer.parseInt(p_code));
 			
 			pstmt.executeUpdate();
 		} else{ //cart_sub에 신규추가
 			
 			sql = "insert into cart_sub values(seq_cs_code.nextval, ?, ?, ?)";
 			pstmt = conn.prepareStatement(sql);
 			
 			pstmt.setInt(1, cm_code);
 			pstmt.setInt(2, Integer.parseInt(p_code));
 			pstmt.setInt(3, Integer.parseInt(cs_cnt));
 			
 			pstmt.executeUpdate();
 		}
 		
 		
	} catch(Exception e) {
		System.out.println(e.toString());
	} finally {
		if (rs != null)
			rs.close();
		if (pstmt != null) {
	pstmt.close(); //소켓 닫기
		}
		if (conn != null) {
	conn.close();
		}
		response.sendRedirect("./cart_list.jsp"); //list.jsp로 보내기
	} 

%>
<%
	} else { //로그인이 되어있지 않을 시 로그인 페이지로
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>