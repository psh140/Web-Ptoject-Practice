<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cbnu.MyDate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account</title>
</head>
<body>
<%@ include file="./dbconn.jsp"	%>
<%
	if (session.getAttribute("m_id") != null) { // 설정이 되어있는 상태 즉 로그인이 되어있는 상태
%>

<%
	request.setCharacterEncoding("utf-8");
	String cm_code = request.getParameter("cm_code"); //query의 객체를 받아옴

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	
 	try {
 		/* 결제승인  */
 		sql = "insert into account_main values (" +
 				"seq_am_code.nextval, ?, ?, 'A')";
 		pstmt = conn.prepareStatement(sql);
 		pstmt.setString(1, (String)session.getAttribute("m_id"));
 		pstmt.setString(2, MyDate.getDate());
 		pstmt.executeUpdate();		
		pstmt.close();
		
		sql = "insert into account_sub " +
				"select seq_as_code.nextval, seq_am_code.currval, p_code, " +
				"cs_cnt from cart_sub " +
				"where cm_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(cm_code));
		pstmt.executeUpdate();
		pstmt.close();
		
		/* 결제 후 장바구니 삭제 */
		sql = "delete from cart_sub where cm_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(cm_code));
		pstmt.executeUpdate();
		pstmt.close();
		
		sql = "delete from cart_main where cm_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(cm_code));
		pstmt.executeUpdate();
		pstmt.close();
		
		
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
%>
	<script>
		alert('구매 요청 되었습니다.');
		location.href = './list.jsp';
	</script>
<%
	} 

%>
<%
	} else { //로그인이 되어있지 않을 시 로그인 페이지로
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>