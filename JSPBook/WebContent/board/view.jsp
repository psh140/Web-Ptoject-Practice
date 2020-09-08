<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View</title>
<link rel="stylesheet" href="./member.css?after">
</head>
<body>
	<%@	include file="./dbconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
		String bm_num = request.getParameter("bm_num");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String m_id = ""; // 작성자 아이디
		String m_name = ""; //작성자 이름
		String bm_subject = ""; // 제목
		String bm_contents = ""; // 내용
		String bm_date = ""; //날짜
		int bm_cnt = 0; // 조회수
		String bm_ip = ""; //IP
		
		try {
			sql = "select mt.m_id, mt.m_name, bm.bm_subject, " +
					"bm.bm_contents, bm.bm_date, bm.bm_cnt, bm.bm_ip " +
					" from member_tbl mt, board_main bm " +
			 		"where mt.m_id = bm.m_id and bm.bm_num = ?";
		 //query문을 이용해 board_main과 member_tbl join 후 해당 column들을 불러옴. 게시판 내용들
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bm_num));
			rs = pstmt.executeQuery();
			rs.next();
			
			m_id = rs.getString("m_id");
			m_name = rs.getString("m_name");
			bm_subject = rs.getString("bm_subject");
			bm_contents = rs.getString("bm_contents");
			bm_contents = bm_contents.replace("\r\n", "<br>");
			bm_date = rs.getString("bm_date");
			bm_cnt = rs.getInt("bm_cnt");
			bm_ip = rs.getString("bm_ip");
			
			rs.close(); // 쿼리 종료 후 다시 쿼리문 작성
			pstmt.close();

			sql = "select mt.m_id, mt.m_name, bs.bs_contents " +
					"from member_tbl mt, board_sub bs, board_main bm " +
					"where mt.m_id = bs.m_id and bm.bm_num = bs.bm_num and bs.bm_num = ?"; //댓글 불러오기.
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bm_num));
			rs = pstmt.executeQuery();
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
							<td class="td_title_base">번호</td>
							<td class="td_contents"><p><%=bm_num %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">제목</td>
							<td class="td_contents"><p><%=bm_subject %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">아이디</td>
							<td class="td_contents"><p><%=m_id %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">작성자</td>
							<td class="td_contents"><p><%=m_name %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">작성일</td>
							<td class="td_contents"><p><%=bm_date %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">조회수</td>
							<td class="td_contents"><p><%=bm_cnt %></p></td>
						</tr>
						<tr>
							<td class="td_title_base">IP</td>
							<td class="td_contents"><p><%=bm_ip %></p></td>
						</tr>
						<tr>
							<td class="td_title_big">내용</td>
							<td class="td_contents_big"><p><%=bm_contents %></p></td>
						</tr>
						<tr>
							<td class="td_title_long" colspan="2">
								<p>
									<a href="./list.jsp">[리스트]</a>&nbsp;
									<a href="./update.jsp?bm_num=<%= bm_num %>">[수정]</a>&nbsp;
								</p>
							</td>
						</tr>
						
	<% //댓글 반복 출력
		while(rs.next()) {
			String m_id_bs = rs.getString(1);
			String m_name_bs = rs.getString(2);
			String bs_contents_bs = rs.getString(3);
			bs_contents_bs = bs_contents_bs.replace("\r\n", "<br>");
	%>
						<!-- 댓글 반복영역 -->
						
						<tr>
							<td class="td_bs_contents" colspan="2">
								<p><%=m_id_bs %></p>
								<p><%=m_name_bs %></p>
								<P><%=bs_contents_bs %></P>
							</td>
						</tr>
	<%		
			}
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
							<tr>
							<td class="td_bs_contents" colspan="2">
								<p>
									댓글 작성창
								</p>
							</td>
						</tr>
					</table>
			</div>
		</div>
	</div>
	<div id="footer">
		<p>JSP 웹프로그래밍</p>
		<p>Copyright(c) Hugh Park. All Right Reserved.</p>
	</div>
</body>
</html>