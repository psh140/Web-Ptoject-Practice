<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ex0914</title>
</head>
<body>
	<jsp:useBean id="person" class="com.cbnu.Person" scope="request"/>
		<p> ID : <%=person.getId() %> </p>
		<p> Name : <%=person.getName() %> </p>
		<%
		person.setId(474563);
		person.setName("Zoe");
		%>
		<p> ID : <%=person.getId() %> </p>
		<p> Name : <%=person.getName() %> </p>
	<jsp:include page="./Ex0914_2.jsp"></jsp:include>
</body>
</html>