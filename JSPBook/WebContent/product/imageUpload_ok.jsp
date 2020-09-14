<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@	include file="./dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String fileUploadPath = "D:\\GitWeb\\Web-Ptoject-Practice\\JSPBook\\WebContent\\product\\images";
	DiskFileUpload upload = new DiskFileUpload();
	List items = upload.parseRequest(request);
	Iterator params = items.iterator();
	FileItem item = null;
	
	params.hasNext();
	item = (FileItem)params.next();
	String p_code = item.getString("UTF-8");
	
	params.hasNext();
	item = (FileItem)params.next();
	String fileName = item.getName();
	
	String imgFile = fileUploadPath + "/" + p_code + ".jpg";
	File file = new File(imgFile);
	item.write(file); //파일 저장
	
	PreparedStatement pstmt = null;
	String sql = "";
	
	try { // 이미지 업로드 sql
		sql = "update product set p_image = ? where p_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, p_code);
		pstmt.setInt(2, Integer.parseInt(p_code));
		pstmt.executeUpdate();
	} catch(Exception e) {
		System.out.println(e.toString());
	} finally {
		if(pstmt != null) 
			pstmt.close();
		if(conn != null) 
			conn.close();
		
%>
<script>
	window.opener.document.reload(); // 이전 window 갱신
	window.self.close(); // 현재 창 닫기 
</script>
<%
	}
%>
</body>
</html>