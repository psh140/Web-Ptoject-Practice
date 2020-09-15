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
                <p class="title">장바구니 리스트</p>
                
                <span class="cart_item_title1">상품코드</span>
                <span class="cart_item_title2">상품명</span>
                <span class="cart_item_title3">단가</span>
                <span class="cart_item_title4">이미지</span>
                <span class="cart_item_title5">수량</span>
                <span class="cart_item_title6">총합</span>
             <%
             	PreparedStatement pstmt = null;
             	ResultSet rs = null;
             	String sql = "";
             	
             	int cm_code = 0; // 구매절차에 필요
             	int chk_cnt = 0; // 카트에 상품이 있는지 
             	
             	try {
					sql = "select mt.m_name, cm.cm_code, cs.cs_code, cs.cs_cnt, " +
							"p.p_code, p.p_name, p.p_price, p.p_image " +
						    "from cart_main cm, cart_sub cs, product p, member_tbl mt " +
						    "where cm.cm_code = cs.cm_code and p.p_code = cs.p_code " + 
						    "and mt.m_id = cm.m_id and mt.m_id = ?";

             		pstmt = conn.prepareStatement(sql);
             		pstmt.setString(1, (String)session.getAttribute("m_id"));
             		rs = pstmt.executeQuery();
             		while(rs.next()) {
             			int p_code = rs.getInt("p_code");
             			String p_name = rs.getString("p_name");
             			int p_price = rs.getInt("p_price");
             			String p_image = rs.getString("p_image");
             			int cs_cnt = rs.getInt("cs_cnt");
             			cm_code = rs.getInt("cm_code"); // 여러번 중복 처리 가능성 존재(동일값이니 상관없음)
             %>
                <br>
                <span class="cart_item_contents1"><%=p_code %></span>
                <span class="cart_item_contents2"><%=p_name %></span>
                <span class="cart_item_contents3"><%=p_price %></span>
                <span class="cart_item_contents4">
                	<img src="../product/images/<%=p_image %>.jpg" width="30" height="30">
                </span>
                <span class="cart_item_contents5"><%=cs_cnt %></span>
                <span class="cart_item_contents6"><%=cs_cnt * p_price %></span>
                
                <%
                		chk_cnt++; // while loop 돌 때 증가
                		} // while 종료
             			if (chk_cnt > 0) { //카트에 상품이 있을 경우
       			%>
           		<p>
           			<form method="post" action="./buy.jsp">
           				<input type="hidden" name="cm_code" value="<%=cm_code %>">
           				<input type="submit" value="상품구입">
           			</form>
           		</p>
             		
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