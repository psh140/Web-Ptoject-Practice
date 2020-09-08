<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

	String guest_num = request.getParameter("guest_num");
	String guest_passwd = request.getParameter("guest_passwd");
	String guest_subject = request.getParameter("guest_subject");
	String guest_name = request.getParameter("guest_name");
	String guest_contents = request.getParameter("guest_contents");
	String guest_date = request.getParameter("guest_date");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";

	try {
		sql = "select count(guest_num) from guestbook where guest_num = ? and guest_passwd = ?";  //null을 받지 않기 위해. 값은 알 수 없음.
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(guest_num));
		pstmt.setString(2, guest_passwd);
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt(1); //1번 항목을 int형으로 받음
		
		if (cnt == 1) {
			sql = "update guestbook set guest_name = ?, guest_subject = ?, guest_contents = ? where guest_num = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, guest_name);
			pstmt.setString(2, guest_subject);
			pstmt.setString(3, guest_contents);
			pstmt.setInt(4, Integer.parseInt(guest_num));
			pstmt.executeUpdate(); //sql문 실행 
			response.sendRedirect("./view.jsp?guest_num=" + guest_num);
		} else { // 암호 오류. data가 지워지지 않기 위해
			/* out.print("<script>"); // 출력문은 html에서 처리되므로 여기서 javascript 문을 사용
			out.print("alert('암호가 올바르지 않습니다.');"); //큰따옴표는 java에서 쓰이므로 작은따옴포를 사용.
			out.print("history.back();"); // 뒤로가기
			out.print("</script>"); */
			%>
			<script>
				alert("암호를 확인하세요"); // 가독성과 많은 javascript의 처리를 위해 scriptlet을 빠져나와서 script문 작성
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