
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
	%>
	<jsp:useBean id="person" class="com.cbnu.Person" scope="request"/>
	<jsp:setProperty property="id" name="person" value="<%=id %>"/>
	<jsp:setProperty property="name" name="person" value="<%=name %>"/>
	<p><%=person.getId() %></p>
	<p><%=person.getName() %></p>
	
</body>
</html>