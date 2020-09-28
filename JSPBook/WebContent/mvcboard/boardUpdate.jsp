<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 선언 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Update Form</title>
<link rel="stylesheet" href="./mvcboard/member.css">

</head>
<body>

<div id="top_nav">
		<div id="login_info">
			<ul>
				<li>${sessionScope.m_id}</li> <!-- 세션상태 보기 -->
				<li><a href="./BoardServlet?cmd=logout">로그아웃</a></li>
			</ul>
		</div>
        <div id="main_gnb">
            <ul>
                <!-- overflow hidden 으로 주고, -->
                <li><a href="#">메뉴1</a></li> <!-- flow를 left로 정렬 -->
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
                <li><a href="#">메뉴1</a></li> <!-- flow를 left로 정렬 -->
                <li><a href="#">메뉴2</a></li>
                <li><a href="#">메뉴3</a></li>
                <li><a href="#">메뉴4</a></li>
                <li><a href="#">메뉴5</a></li>
            </ul>
        </div>
    </div>
    <div id="contents">
        <div id="aside">
            <p><a href="#">메뉴 1</a></p>
            <p><a href="#">메뉴 2</a></p>
            <p><a href="#">메뉴 3</a></p>
            <p><a href="#">메뉴 4</a></p>
            <p><a href="#">메뉴 5</a></p>
        </div>
        <div id="section">
            <div id="article">
            	<p class="title">수정페이지</p>
            	<form method="post" action="BoardServlet">
            	<input type="hidden" name="cmd" value="board_update">
            	<input type="hidden" name="b_num" value="${boardone.b_num}">
					<table>
						<tr>
							<td class="td_title_long" colspan="2"><p>수정하기</p></td>
						</tr>
						<tr>
							<td class="td_title_base">글번호</td>
							<td class="td_contents"><p>${boardone.b_num}</p></td>
						</tr>
						<tr>
							<td class="td_title_base">제목</td>
							<td class="td_contents"><input type="text" name="b_subject" value="${boardone.b_subject}"></td>
						</tr>
						<tr>
							<td class="td_title_base">작성자</td>
							<td class="td_contents"><input type="text" name="b_name" value="${boardone.b_name}"></td>
						</tr>
						<tr>
							<td class="td_title_base">작성일</td>
							<td class="td_contents"><p>${boardone.b_date}</p></td>
						</tr>
						<tr>
							<td class="td_title_big">내용</td>
							<td class="td_contents_big">
								<textarea name="b_contents" cols="50" rows="10">${boardone.b_contents}</textarea>
							</td>
						</tr>
						<tr>
							<td class="td_title_long" colspan="2">
								<input type="submit" value="수정">
							</td>
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