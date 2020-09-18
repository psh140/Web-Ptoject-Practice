<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order View</title>
<link rel="stylesheet" href="./member.css">
</head>
<body>
<%@	include file ="./dbconn.jsp"%>
<%
	if (session.getAttribute("m_id") != null) { // 설정이 되어있는 상태 즉 로그인이 되어있는 상태
	
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
                <p class="title">주문자 세부정보</p>
                <%
	            	request.setCharacterEncoding("utf-8");
	            	String am_code = request.getParameter("am_code"); 
            	
	                PreparedStatement pstmt = null;
	            	ResultSet rs = null;
	            	String sql = "";
                	try {
                		sql = "select mt.m_name, mt.m_id, mt.m_addr, mt.m_phone, mt.m_date " +
                			    "from account_main am, member_tbl mt " +
                			    "where am.am_code = ? and am.m_id = mt.m_id"; // 주문자 상세정보
                		pstmt = conn.prepareStatement(sql);
                		pstmt.setInt(1, Integer.parseInt(am_code));
                		rs = pstmt.executeQuery();
                		
                		rs.next();
                		String m_name = rs.getString(1);
                		String m_id = rs.getString(2);
                		String m_addr = rs.getString(3);
                		String m_phone = rs.getString(4);
                		String m_date = rs.getString(5);
                		
                		rs.close();
                		pstmt.close();
                		
                		sql= "select sum(p.p_price * sa.as_cnt) as total " +
                			    "from product p, account_sub sa, account_main am " +
                			    "where p.p_code = sa.p_code and am.am_code = sa.am_code and am.m_id = ?";
            			pstmt = conn.prepareStatement(sql);
                   		pstmt.setString(1, m_id);
                    	rs = pstmt.executeQuery();
                    		
                    	rs.next();
                    	int t_price = rs.getInt(1);
                    	
                    	rs.close();
                    	pstmt.close();
            	%>                
            	
            	<span class="item_title1">아이디</span>
                <span class="item_title2">날짜</span>
                <span class="item_title3">이름</span>
                <span class="item_title4">번호</span>
                <span class="item_title5">주소</span>
                <span class="item_title6">총합</span>
	            <span class="item_contents1"><%=m_id %></span>
	            <span class="item_contents2"><%=m_date %></span>
	            <span class="item_contents3"><%=m_name %></span>
	            <span class="item_contents4"><%=m_phone %></span>
	            <span class="item_contents5"><%=m_addr %></span>
	            <span class="item_contents6"><%=t_price %></span>
				<span class="item_title1">상품코드</span>
                <span class="item_title2">상품명</span>
                <span class="item_title3">단가</span>
                <span class="item_title4">이미지</span>
                <span class="item_title5">수량</span>
                <span class="item_title6">총합</span>
                <%

                sql = "select sa.as_cnt, p.p_code, p.p_name, p.p_price, p.p_image " + //상품목록
					    "from account_main am, account_sub sa, product p, member_tbl mt " +
					    "where am.am_code = sa.as_code and p.p_code = sa.p_code " + 
					    "and mt.m_id = am.m_id and am.am_code = ?"; //다시할것

         		pstmt = conn.prepareStatement(sql);
         		pstmt.setInt(1, Integer.parseInt(am_code));
         		rs = pstmt.executeQuery();
         		while(rs.next()) {
         			int as_cnt = rs.getInt(1);
         			int p_code = rs.getInt(2);
         			String p_name = rs.getString(3);
         			int p_price = rs.getInt(4);
         			String p_image = rs.getString(5);
         %>
            <br>
            <span class="cart_item_contents1"><%=p_code %></span>
            <span class="cart_item_contents2"><%=p_name %></span>
            <span class="cart_item_contents3"><%=p_price %></span>
            <span class="cart_item_contents4">
            	<img src="../product/images/<%=p_image %>.jpg" width="30" height="30">
            </span>
            <span class="cart_item_contents5"><%=as_cnt %></span>
            <span class="cart_item_contents6"><%=as_cnt * p_price %></span>
            
            <%
            		} // while 종료
       			rs.close();
            	pstmt.close();
                		
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
                <p><a href="./order_list.jsp">리스트</a></p>
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