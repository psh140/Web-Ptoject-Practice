<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Ok</title>
</head>
<body>
<%
	if (session.getAttribute("m_id") != null) { // 설정이 되어있는 상태 즉 로그인이 되어있는 상태
%>
<%@ include file="./dbconn.jsp"	%>
<%
	request.setCharacterEncoding("utf-8");
	
	String bm_num = request.getParameter("bm_num");
	String bs_num = request.getParameter("bs_num");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	try {
		sql = "select count(bs_num) from board_sub where bs_num = ? and m_id = ?"; //count : 행이 있는지 없는지. 1이면 true 0이면 false. 
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(bs_num)); // ? 부분에 넣을 값
		pstmt.setString(2, (String)session.getAttribute("m_id")); // ? 부분에 넣을 값
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); //1번 항목을 int형으로 받음
		
		rs.close();
		pstmt.close();
		
		if (cnt == 1) {
			sql = "delete from board_sub where bs_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bs_num));
			pstmt.executeUpdate(); //sql문 실행 
			response.sendRedirect("./view.jsp?bm_num=" + bm_num);
		} else {
%>
			<script>
				alert('삭제 불가능합니다.');
//				history.back(); //form이 있을때 사용.
				location.href = "./view.jsp?bm_num=<%=bm_num %>"; //form이 없으니 사용가능 form이 있으면 전부 삭제
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
<%
	} else { //로그인이 되어있지 않을 시 로그인 페이지로
		response.sendRedirect("../member/login.jsp");
	}
%>
</body>
</html>