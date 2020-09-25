<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Check</title>
</head>
<body>
	<h1>비밀번호 입력</h1>
	<form action="BoardServlet" method="post">
		<input type="hidden" value="board_check_ok" name="cmd">
		<input type="hidden" value="${param.b_num}" name="b_num">
		<input type="hidden" value="${param.b_type}" name="b_type">
		<p>${param.b_num}</p>
		<p>${param.b_type}</p>
		<p>비밀번호 : <input type="password" name="b_passwd"></p>
		<p><input type="submit" value="확인"></p>
	</form>
</body>
</html>