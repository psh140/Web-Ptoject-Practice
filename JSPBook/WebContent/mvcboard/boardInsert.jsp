<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 액션은 항상 controller로 보낸다 -->
	<form action="BoardServlet" method="post">
		<input type="hidden" name="cmd" value="board_insert">
		<p><input type="text" name="b_subject"></p>
		<p><input type="submit" value="제출"></p>
	</form>
</body>
</html>