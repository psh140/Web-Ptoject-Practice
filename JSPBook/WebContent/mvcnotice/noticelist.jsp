<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- core tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- formatting tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- function tags -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<link rel="stylesheet" href="./mvcnotice/member.css">
</head>
<body>

<div id="top_nav">
		<div id="login_info">
			<ul>

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
                <p class="title">게시판 리스트</p>
                
                <span class="item_title1">번호</span>
                <span class="item_title2">제목</span>
                <span class="item_title3">작성자</span>
                <span class="item_title4">작성일</span>
                <span class="item_title5">기타</span>
                
                <br>
                <c:forEach var="notice" items="${list}"> <!-- JSTL 반복문 -->
	                <span class="item_contents1">${notice.n_num}</span>
	                <span class="item_contents2"><a href="./NoticeServlet?cmd=notice_view&n_num=${notice.n_num}">${notice.n_subject}</a></span>
	                <span class="item_contents3">${notice.n_name}</span>
	                <span class="item_contents4">${fn:substring(notice.n_date, 0, 10)}
        	        <%-- <fmt:parseDate var="date" value="${board.b_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>  이렇게 파싱해도 됨 --%>
	                </span>
	                <span class="item_contents5">기타</span>
	                <br>
                </c:forEach>
                
                <p><a href="./NoticeServlet?cmd=notice_insert_form">글쓰기</a></p>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹프로그래밍</p>
        <p>Copyright(c) Hugh Park. All Right Reserved.</p>
    </div>
</body>
</html>