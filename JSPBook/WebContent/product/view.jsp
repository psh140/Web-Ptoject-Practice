<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<link rel="stylesheet" href="./member.css?after">
<script>
	function imgproc(p_code) {
		window.open('./imageUpload.jsp?p_code=' + p_code, '', 'width=300px, height=100px');
	}
</script>
</head>
<body>
<%
	if (session.getAttribute("m_id") != null) { // 설정이 되어있는 상태 즉 로그인이 되어있는 상태
%>
	<%@	include file="./dbconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String p_code = request.getParameter("p_code");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String p_name = "";  //제품명
		int p_price = 0; //가격
		String p_image = ""; //이미지
		String p_stat = "";  //상태
		
		try {
			sql = "select * from product where p_code = ?";
		 //query문을 이용해 board_main과 member_tbl join 후 해당 column들을 불러옴. 게시판 내용들
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(p_code));
			rs = pstmt.executeQuery();
			rs.next();
			
			p_name = rs.getString("p_name");
			p_price = Integer.parseInt(rs.getString("p_price"));
			p_image = rs.getString("p_image");
			p_stat = rs.getString("p_stat");
	%>
	
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
					<table>
						<tr>
							<td class="td_title_long" colspan="2">상세보기</td>
						</tr>
						<tr>
							<td class="td_title_base">제품 코드</td>
							<td class="td_contents"><p><%=p_code %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">제품명</td>
							<td class="td_contents"><p><%=p_name %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">이미지</td>
							<td class="td_contents">
								<p><img src="./images/<%=p_image %>" width="200"></p>
								<p><input type="button" value="image upload" onclick="imgproc('<%=p_code%>');"></p>
							</td>
						</tr>
						<tr>
							<td class="td_title_base">가격</td>
							<td class="td_contents"><p><%=p_price %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">상태</td>
							<td class="td_contents"><p><%=p_stat %></p></td>
						</tr>
						<tr>
							<td class="td_title_long" colspan="2">
								<p>
									<a href="./list.jsp">[리스트]</a>&nbsp;
									<a href="./update.jsp?p_code=<%= p_code %>">[수정]</a>&nbsp;
								</p>
							</td>
						</tr>
						

	<%		
		} catch(Exception e) { // 댓글을 불러 온 후 닫기
			System.out.println(e.toString());
		} finally {
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
			
		}
	%>
				</table>
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