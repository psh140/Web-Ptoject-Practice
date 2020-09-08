<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<link rel="stylesheet" href="./guestbook.css">
</head>
<body>
	<%@	include file="./dbconn.jsp"%>
	<div id="top_nav">
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
				<form action="./insert_ok.jsp" method="post">
					<table>
						<tr>
							<td class="td_title_long" colspan="2">방명록 쓰기</td>
						</tr>
						<tr>
							<td class="td_title_base">제목</td>
							<td class="td_contents"><input type="text" name="guest_subject"></td>
						</tr>
						<tr>
							<td class="td_title_base">작성자</td>
							<td class="td_contents"><input type="text" name="guest_name"></td>
						</tr>
						<tr>
							<td class="td_title_base">비밀번호</td>
							<td class="td_contents"><input type="text" name="guest_passwd"></td>
						</tr>
						<tr>
							<td class="td_title_big">내용</td>
							<td class="td_contents_big">
							<textarea name="guest_contents" cols="50" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td class="td_title_long" colspan="2"><input type="submit" value="저장"></td>
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