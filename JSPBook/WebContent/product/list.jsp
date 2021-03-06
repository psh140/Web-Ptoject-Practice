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
<%@	include file ="./dbconn.jsp"%>
<%
	if (session.getAttribute("m_id") != null) { // 설정이 되어있는 상태 즉 로그인이 되어있는 상태
		
		/* 페이징 */
		String pageNum = request.getParameter("pagenum");
		
		int currPage = 1;   //현재 페이지
		int pageSize = 10;   //페이징 단위
		int startPage = 1;  //해당 그룹의 첫번째 페이지 번호 
		int endPage = 0;    //해당 그룹의 마지막 페이지 번호
		int groupSize = 10;  //페이지 리스트 단위 
		int lastPage = 0;   //전체 레코드의 마지막 페이지
		
		try {
			if (pageNum == null) {
				currPage = 1;
			} else {
				currPage = Integer.parseInt(pageNum);
			}
		} catch(NumberFormatException e) {
			currPage = 1; // pagenum에 숫자가 아닌 값이 들어왔을 때 첫번째 페이지로 설정
		}
		

%>

<div id="top_nav">
		<div id="login_info">
			<ul>
				<%
				if(session.getAttribute("m_id") != null) {
				%>
				<!-- String 타입으로 캐스팅 -->
				<li><a href="#">아이디 : <%=(String) session.getAttribute("m_id") %></a></li>
				<li><a href="../member/logout.jsp">로그아웃</a></li>
				<%
				}else {
					
				%>
				<li><a href="../member/login.jsp">로그인</a></li>
				<%
				}
				%>
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
                <p class="title">리스트</p>
                
                
                <span class="item_title1">상품코드</span>
                <span class="item_title2">상품명</span>
                <span class="item_title3">가격</span>
                <span class="item_title4">이미지</span>
                <span class="item_title5">상태</span>
                <%
                	PreparedStatement pstmt = null;
                	ResultSet rs = null;
                	String sql = "";
                	
                	try {
                		sql = "select count(p_code) from product"; // 상품에 담긴 품목 갯수를 알아내기 위한 query
                		pstmt = conn.prepareStatement(sql);
                		rs = pstmt.executeQuery();
                		rs.next();
                		int total = rs.getInt(1); // 전체 레코드 갯수
                		rs.close();
                		pstmt.close();
                		
                		lastPage = (total - 1) / pageSize + 1;
                		startPage = (currPage - 1) / groupSize * groupSize + 1;
  						endPage = (currPage -1) / groupSize * groupSize + groupSize;   
  						
                		sql = "select * from " + // 게시글 페이징
                				"(select * from " +
                				"(select rownum as SEQ, p_code, p_name, p_price, p_image, p_stat from " + // 글정보
                				"(select * from product order by p_code desc)" + // 게시글 나열
                				") where SEQ >= ?" + // 페이징 시작 위치 지정. 페이지 번호
                				") where rownum <= ?"; // pagenum번부터 시작해서 pageSize개의 글 페이지 단위(상수)
                		pstmt = conn.prepareStatement(sql);
                		pstmt.setInt(1, (currPage - 1) * pageSize + 1);
                		pstmt.setInt(2, pageSize);
                		rs = pstmt.executeQuery();
                		while(rs.next()) {
                			int p_code = rs.getInt("p_code");
                			String p_name = rs.getString("p_name");
                			String p_price = rs.getString("p_price");
                			String p_image = rs.getString("p_image");
                			String p_stat = rs.getString("p_stat");
                			
                		
                %>
                <br>
                <span class="item_contents1"><%=p_code %></span>
                <span class="item_contents2">
                	<a href="./view.jsp?p_code=<%= p_code %>"><%=p_name %></a>
                </span>
                <span class="item_contents3"><%=p_price %></span>
                <span class="item_contents4"><img src="./images/<%=p_image %>.jpg" width="30" height="30"></span>
                <span class="item_contents5"><%=p_stat %></span>
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
                <p>
<%
				if(startPage > 1) {
%>
                		<a href="./list.jsp?pagenum=<%=startPage - groupSize %>">[이전 <%=groupSize %>개로]</a>
<%
                }
%>
                		

<%
	for (int i = startPage; i <= endPage; i++) {
		if (i > lastPage) {
			break;
		}
%>
	[<a href="./list.jsp?pagenum=<%=i%>"><%=i%></a>]
<%
	}
	if(endPage < lastPage ) {
		
	
%>
<a href="./list.jsp?pagenum=<%=startPage + groupSize %>">[다음 <%=groupSize %>개로]</a>                
<%
	}
%>
                </p>
                <p><a href="./insert.jsp">상품등록</a></p>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹프로그래밍</p>
        <p>Copyright(c) Hugh Park. All Right Reserved.</p>
    </div>
	<%
	} else { //로그인이 되어있지 않을 시 로그인 페이지로
		response.sendRedirect("../member/login.jsp");
	}
	%>
</body>
</html>