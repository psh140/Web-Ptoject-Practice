<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board View</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="./member.css">
</head>
<body>
<%@ include file="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String am_code = request.getParameter("am_code");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String m_id = "";
	String m_name = "";
	String m_addr = "";
	String m_phone = "";
	String m_date = "";
	try {
		sql = "SELECT mt.m_id, mt.m_name, mt.m_addr, mt.m_phone, mt.m_date " +
			  "FROM   member_tbl mt, account_main am " +
			  "WHERE  mt.m_id = am.m_id AND " +
			  "		  am.am_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(am_code));
		rs = pstmt.executeQuery();
		rs.next();
		m_id = rs.getString("m_id");
		m_name = rs.getString("m_name");
		m_addr = rs.getString("m_addr");
		m_phone = rs.getString("m_phone");
		m_date = rs.getString("m_date");
		rs.close();
		pstmt.close();
%>
	<div id="top_nav">
        <div id="main_gnb">
            <ul>
                <li><a href="#">메뉴 1</a></li>
                <li><a href="#">메뉴 2</a></li>
                <li><a href="#">메뉴 3</a></li>
                <li><a href="#">메뉴 4</a></li>
                <li><a href="#">메뉴 5</a></li>
            </ul>
        </div>
    </div>
    <div id="header">
        <img src="https://placeimg.com/960/150/nature" alt="">
    </div>
    <div id="nav">
        <div id="main_lnb">
            <ul>
                <li><a href="#">메뉴 1</a></li>
                <li><a href="#">메뉴 2</a></li>
                <li><a href="#">메뉴 3</a></li>
                <li><a href="#">메뉴 4</a></li>
                <li><a href="#">메뉴 5</a></li>
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
                <table>
                	<tr>
                		<td class="td_title_long" colspan="2">주문 상세정보</td>
                	</tr>
                	<tr>
                		<td class="td_title_base">
                			주문자 아이디
                		</td>
                		<td class="td_contents">
                			<p><%=m_id %></p>
                		</td>
                	</tr>
                	<tr>
                		<td class="td_title_base">
                			주문자 성명
                		</td>
                		<td class="td_contents">
                			<p><%=m_name %></p>
                		</td>
                	</tr>
                	<tr>
                		<td class="td_title_base">
                			주문자 주소
                		</td>
                		<td class="td_contents">
                			<p><%=m_addr %></p>
                		</td>
                	</tr>
                	<tr>
                	<tr>
                		<td class="td_title_base">
                			주문자 전화번호
                		</td>
                		<td class="td_contents">
                			<p><%=m_phone %></p>
                		</td>
                	</tr>
                	<tr>
                		<td class="td_title_base">
                			주문자 가입일
                		</td>
                		<td class="td_contents">
                			<p><%=m_date %></p>
                		</td>
                	</tr>
<%
		sql = "SELECT SUM(p.p_price * acs.as_cnt) " +
			  "FROM account_main am, account_sub acs, product p " +
			  "WHERE am.am_code = acs.am_code AND " +
			  		"p.p_code = acs.p_code AND " +
			  		"am.m_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		rs.next();
		int priceTotal = rs.getInt(1);
		rs.close();
		pstmt.close();
%>
					<tr>
                		<td class="td_title_long" colspan="2">
                			<p>
                				<b>회원님의 총 결제금액 : <%=priceTotal %></b>
                			</p>
                		</td>
                	</tr>
                </table>
<%
		sql = "SELECT am_code, am_date " +
			  "FROM account_main " +
			  "WHERE am_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(am_code));
		rs = pstmt.executeQuery();
		rs.next();
		String am_date = rs.getString("am_date");
		rs.close();
		pstmt.close();
%>
                <table>
                	<tr>
                		<td class="td_title_base">
                			주문 코드
                		</td>
                		<td class="td_contents">
                			<p><%=am_code %></p>
                		</td>
                	</tr>
                	<tr>
                		<td class="td_title_base">
                			주문 일자
                		</td>
                		<td class="td_contents">
                			<p><%=am_date %></p>
                		</td>
                	</tr>
<%
		sql = "SELECT SUM(p.p_price * acs.as_cnt) " +
			  "FROM account_sub acs, product p " +
			  "WHERE p.p_code = acs.p_code AND " +
			  "acs.am_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(am_code));
		rs = pstmt.executeQuery();
		rs.next();
		int orderTotal = rs.getInt(1);
%>
                	<tr>
                		<td class="td_title_long" colspan="2">
                			<p>
                				<b>주문 금액 합계 : <%=orderTotal %></b>
                			</p>
                		</td>
                	</tr>
                </table>
            </div>
<%
		sql = "SELECT p.p_code, p.p_name, p.p_price, p.p_image, acs.as_cnt " +
			  "FROM account_main am, account_sub acs, product p " +
			  "WHERE am.am_code = acs.am_code AND " +
			  "p.p_code = acs.p_code AND " +
			  "am.am_code = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(am_code));
		rs = pstmt.executeQuery();
%>
			<div id="article">
				<span class="cart_item_title1">상품코드</span>
                <span class="cart_item_title2">상품명</span>
                <span class="cart_item_title3">단가</span>
                <span class="cart_item_title4">이미지</span>
                <span class="cart_item_title5">수량</span>
                <span class="cart_item_title6">가격</span>
                <br>
<%
		while (rs.next()) {
			int p_code = rs.getInt("p_code");
			String p_name = rs.getString("p_name");
			int p_price = rs.getInt("p_price");
			String p_image = rs.getString("p_image");
			int as_cnt = rs.getInt("as_cnt");
%>
				<span class="cart_item_contents1"><%=p_code %></span>
                <span class="cart_item_contents2"><%=p_name %></span>
                <span class="cart_item_contents3"><%=p_price %></span>
                <span class="cart_item_contents4"><img src="./images/<%=p_image%>.jpg" width="20" height="20"></span>
                <span class="cart_item_contents5"><%=as_cnt %></span>
                <span class="cart_item_contents6"><%=as_cnt * p_price %></span>
                <br>
<%
		}
		rs.close();
		pstmt.close();
%>

            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹프로그래밍</p>
        <p>Copyright(c) 박하영. All Right Reserved.</p>
    </div>
<%
	} catch (Exception e) {
		System.out.println(e.toString());
	} finally {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (conn != null) {
			conn.close();
		}
	}
%>
</body>
</html>