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
<%@	include file ="./dbconn.jsp"%>
<div id="top_nav">
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
                <p class="title">리스트</p>
                <span class="item_title1">번호</span>
                <span class="item_title2">제목</span>
                <span class="item_title3">작성자</span>
                <span class="item_title4">작성일</span>
                <%
                	PreparedStatement pstmt = null;
                	ResultSet rs = null;
                	String sql = "";
                	try {
                		sql = "select * from guestbook order by guest_num desc";
                		pstmt = conn.prepareStatement(sql);
                		rs = pstmt.executeQuery();
                		while(rs.next()) {
                			int guest_num = rs.getInt("guest_num");
                			String guest_subject = rs.getString("guest_subject");
                			String guest_name = rs.getString("guest_name");
                			String guest_date = rs.getString("guest_date");
                			guest_date = guest_date.substring(0, 10);
                		
                %>
                <br>
                <span class="item_contents1"><%=guest_num %></span>
                <span class="item_contents2">
                	<a href="./view.jsp?guest_num=<%= guest_num %>"><%=guest_subject %></a>
                </span>
                <span class="item_contents3"><%=guest_name %></span>
                <span class="item_contents4"><%=guest_date %></span>
                <%
                		}
                	}catch(Exception e) {
	            		System.out.println(e.toString());
	            	} finally {
                		if(rs != null) {
                			rs.close();
                		}
                		if(pstmt != null) {
                			pstmt.close();
                		}
                		if(conn != null) {
                			conn.close();
                		}
                	}
                	
                %>
                
                <p><a href="./insert.jsp">방명록 쓰기</a></p>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹프로그래밍</p>
        <p>Copyright(c) Hugh Park. All Right Reserved.</p>
    </div>
</body>
</html>