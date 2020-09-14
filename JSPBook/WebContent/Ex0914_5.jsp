<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex0914_5</title>
</head>
<body>
<jsp:useBean id="person" class="com.cbnu.Person" scope="request"/>
	<p>id : <jsp:getProperty property="id" name="person"/></p>
	<p>name : <jsp:getProperty property="name" name="person"/></p>
</body>
</html>