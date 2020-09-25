<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- JSTL 선언 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>/* 작은 창에서 통과 되는 순간 그 후 view를 띄움 */
		var b_type = "${param.b_type}";
		
		if (b_type == "update") {
			window.opener.location.href = "./BoardServlet?cmd=board_update_form&b_num=" + ${param.b_num}; // 작은 창을 띄운 큰 창에게 명령어 보냄
		} else if (b_type == "delete"){
			window.opener.location.href = "./BoardServlet?cmd=board_delete&b_num=" + ${param.b_num}; // 작은 창을 띄운 큰 창에게 명령어 보냄	
		}		
		window.close(); // 오픈된 작은 창 닫기
	</script>
</body>
</html>