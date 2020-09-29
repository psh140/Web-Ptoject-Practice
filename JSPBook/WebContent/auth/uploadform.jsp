<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="./LoginServlet?cmd=upload">
		제목 : <input type="text" name="subject"><br>
		파일 : <input type="file" name="filename"><br>
		<input type="submit" value="파일업로드">
	</form>
</body>
</html>