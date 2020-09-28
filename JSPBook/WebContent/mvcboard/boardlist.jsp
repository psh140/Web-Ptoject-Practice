<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- core tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <!-- formatting tags -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> <!-- function tags -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List</title>
<link rel="stylesheet" href="./mvcboard/member.css?ver=1">
</head>
<body>

<div id="top_nav">
		<div id="login_info">
			<ul>
				<li>${sessionScope.ma_id}</li> <!-- 세션상태 보기 -->
				<c:choose>
					<c:when test="${not empty sessionScope.ma_id }"> <!-- 세션이 존재할 시 로그인버튼 출력 -->
						<li><a href="./BoardServlet?cmd=logout">로그아웃</a></li>
					</c:when>
				</c:choose>
				
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
                <c:forEach var="board" items="${list}"> <!-- JSTL 반복문 -->
	                <span class="item_contents1">${board.b_num}</span>
	                <span class="item_contents2"><a href="./BoardServlet?cmd=board_view&b_num=${board.b_num}&pageNum=${pagedata.pageNum}">${board.b_subject}</a></span>
	                <span class="item_contents3">${board.b_name}</span>
	                <span class="item_contents4">${fn:substring(board.b_date, 0, 10)}
        	        <%-- <fmt:parseDate var="date" value="${board.b_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
	                <fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>  이렇게 파싱해도 됨 --%>
	                </span>
	                <span class="item_contents5">기타</span>
	                <br>
                </c:forEach>
                <p>
                	<c:if test="${pagedata.startPage > 1}">
                		<a href="./BoardServlet?cmd=board_list&pageNum=${pagedata.pageNum-pagedata.groupSize}">[이전 ${pagedata.groupSize}개로]</a>
                	</c:if>
					
					<c:forEach var="i" begin="${pagedata.startPage}" end="${pagedata.endPage}">
						<c:if test="${i <= pagedata.lastPage}">
							<a href="./BoardServlet?cmd=board_list&pageNum=${i}">[${i}]</a>		
						</c:if>
					</c:forEach>
					<c:if test="${pagedata.endPage < pagedata.lastPage}">
						<a href="./BoardServlet?cmd=board_list&pageNum=${pagedata.startPage+pagedata.groupSize}">[다음 ${pagedata.groupSize}개로]</a>
					</c:if>
                </p>
                <p><a href="./BoardServlet?cmd=board_insert_form">글쓰기</a></p>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹프로그래밍</p>
        <p>Copyright(c) Hugh Park. All Right Reserved.</p>
    </div>
</body>
</html>