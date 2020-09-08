<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <h1>Hello! This is Hugh's Page</h1>
	<h2>선언문</h2>
	<%!
		int cnt = 5;
	%>
	<h3>스크립트릿</h3>
	<% 
		for(int i = 0; i < 5; i++) {
			out.print("<h4>hello JSP!</h4>");
		}
	%>
	<h3>출력문</h3>
	<h1><%= "JSP 연습" + cnt %></h1>	 --%>
	<%-- <%
		String id = (String) session.getAttribute("id"); //Object type을 String type으로 형변환
		String password = (String) session.getAttribute("password"); 
	
		out.println("세션의 속성 값 1 : " + id + "<br>");
		out.println("세션의 속성 값 2 : " + password + "<br>");
	%>
	
	<h3><%= id %></h3>
	<h3><%= password %></h3>
	
	<%
	//로그인 로그아웃에서는 사용하지 않음.
/* 		if(request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다.<br>");
		} else {
			out.print("세션이 유효하지 않습니다.<br>");
		} */

	//실제 이용
		if(id != null) {
				out.print("세션이 유효합니다.<br>");
			} else {
				out.print("세션이 유효하지 않습니다.<br>");
			} 
	%> --%>
	
	<%
		Cookie[] cookies = request.getCookies();
		
		out.print("쿠키의 길이 : " + cookies.length + "<br>");
		for(int i = 0; i < cookies.length; i++) {
			out.print(cookies[i].getName() + " : ");
			out.print(cookies[i].getValue() + "<br>");
		}
	%>

</body>
</html>