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
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	try {
		sql = "select count(m_id) from member_tbl where m_id = ? and m_passwd = ?";  //null을 받지 않기 위해. 값은 알 수 없음.
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		pstmt.setString(2, m_passwd);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); //1번 항목을 int형으로 받음
		
		if (cnt == 1) { // 아이디 허가
			session.setAttribute("m_id", m_id);

			pstmt.executeUpdate(); //sql문 실행 
			response.sendRedirect("../main.jsp");
		} else { 
%>
			<script>
				alert("아이디 또는 비밀번호가 틀렸습니다."); // 가독성과 많은 javascript의 처리를 위해 scriptlet을 빠져나와서 script문 작성
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