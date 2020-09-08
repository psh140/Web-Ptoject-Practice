<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link rel="stylesheet" href="./member.css">
</head>
<body>
	<%@	include file="./dbconn.jsp"%>
	<div id="top_nav">
			<div id="login_info">
			<ul>
				<%
				if(session.getAttribute("m_id") != null) {
					
				
				%>
				<!-- String 타입으로 캐스팅 -->
				<li><a href="#">아이디 : <%=(String) session.getAttribute("m_id") %></a></li>
				<li><a href="./logout.jsp">로그아웃</a></li>
				<%
				}else {
					
				%>
				<li><a href="./login.jsp">로그인</a></li>
				<%
				}
				%>
			</ul>
		</div>
		<div id="main_gnb">
			<ul>
				<!-- overflow hidden 으로 주고, -->
				<li><a href="#">메뉴1</a></li>
				<!-- flow를 left로 정렬 -->
				<li><a href="#">메뉴2</a></li>
				<li><a href="#">메뉴3</a></li>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
		</div>
	</div>
	<div id="header">
		<img src="https://placeimg.com/960/150/nature" alt="">
	</div>
	<div id="nav">
		<div id="main_lnb">
			<ul>
				<!-- overflow hidden 으로 주고, -->
				<li><a href="#">메뉴1</a></li>
				<!-- flow를 left로 정렬 -->
				<li><a href="#">메뉴2</a></li>
				<li><a href="#">메뉴3</a></li>
				<li><a href="#">메뉴4</a></li>
				<li><a href="#">메뉴5</a></li>
			</ul>
		</div>
	</div>
	<div id="contents">
		<div id="aside">
			<p>
				<a href="#">메뉴 1</a>
			</p>
			<p>
				<a href="#">메뉴 2</a>
			</p>
			<p>
				<a href="#">메뉴 3</a>
			</p>
			<p>
				<a href="#">메뉴 4</a>
			</p>
			<p>
				<a href="#">메뉴 5</a>
			</p>
		</div>
		<div id="section">
			<div id="article">
				<form action="./login_ok.jsp" method="post">
					<table>
						<tr>
							<td class="td_title_long" colspan="2">로그인</td>
						</tr>
						<tr>
							<td class="td_title_base">아이디</td>
							<td class="td_contents"><input type="text" name="m_id"></td>
						</tr>
						<tr>
							<td class="td_title_base">비밀번호</td>
							<td class="td_contents"><input type="password" name="m_passwd"></td>
						</tr>
						<tr>
							<td class="td_title_long" colspan="2"><input type="submit" value="로그인"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>JSP 웹프로그래밍</p>
		<p>Copyright(c) Hugh Park. All Right Reserved.</p>
	</div>
</body>
</html>