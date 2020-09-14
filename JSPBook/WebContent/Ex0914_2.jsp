<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="com.cbnu.Person" scope="request"/>
		<p> ID : <%=person.getId() %> </p>
		<p> Name : <%=person.getName() %> </p>
	
</body>
</html>