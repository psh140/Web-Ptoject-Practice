<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* ----------------------------전역 초기화---------------------------- */
/* 모든 속성에 margin, padding값을 0으로 초기화, font 설정 */
* {
	margin: 0;
	padding: 0;
	font-family: 'Nanum Gothic', sans-serif;
}

/* 밑줄 제거 */
a {
	text-decoration: none;
}
/* 이미지의 테두리 제거 */
img {
	border: 0;
}
/* 요소 말머리 제거 */
li {
	list-style: none;
}
/* 초기 배경색 설정 */
html {
	background: #f7f5f5;
}

/* --------------------------------헤더------------------------------- */
#main_header {
	/* 요소의 크기 지정 */
	width: 960px;
	height: 160px;
	/* 하위 객체가 이 배치 안에서 움직이도록 */
	position: relative;
	/* 가운데정렬 */
	margin: 0 auto;
	/* border: 1px solid black; */
}

/* 자손 선택자 */
#main_header>#title {
	/* 상위 객체 안에서 움직이도록 배정 */
	position: absolute;
	/* 객체의 위치 지정. 상위 position이 relative이므로 하위 객체에서 지정을 안했을 때 width, height 속성은 성위 객체를 따름 */
	left: 20px;
	top: 30px;
}

/* Navigation */
/* Use underscore(_) as much as you can */
/* Global Nav Bar */
#main_header>#main_gnb {
	/* 상위 객체 안에서 움직이도록 배정 */
	position: absolute;
	/* 객체의 위치 지정 */
	right: 0;
	top: 0;
}

#main_gnb>ul {
	/* ul 영역에 li가 포함되도록 함 */
	overflow: hidden;
	/* height: 50px; */
	/* border: 1px solid black; */
	/* position: relative; */
}

/* list 객체 수평정렬 */
#main_gnb>ul>li {
	float: left;
	/* height: 1000px; */
	/* border: 1px solid red; */
	/* top: 100px; */
}

/* list객체의 테두리 생성. text가 border에 달라붙지 않기 위해 padding값을 설정함 */
#main_gnb>ul>li>a {
	border: 1px solid black;
	float: left;
	padding: 5px;
	/* height: 100px; */
	/* top: 100px; */
}

/* mouse over 시 list 객체의 변화 */
#main_gnb>ul>li>a:hover {
	background: black;
	color: white;
}

/* 첫번째와 마지막 객체의 테두리 radius 속성 추가 */
#main_gnb>ul>li:first-child>a {
	border-radius: 10px 0 0 10px;
}

/* border값 설정은 한 줄에서 일괄 설정 하는 방법과 각각 설정하는 두가지 방법이 있음 */
#main_gnb>ul>li:last-child>a {
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}

/* Local Nav Bar */
/* header 안에서 움직이도록 하위 객체 position을 absolute로 설정
    style은 gnb와 동일 */
#main_header>#main_lnb {
	position: absolute;
	right: 0;
	bottom: 10px;
	font-size: 20px;
}

#main_lnb>ul {
	overflow: hidden;
}

#main_lnb>ul>li {
	float: left;
}

#main_lnb>ul>li>a {
	border: 1px solid black;
	float: left;
	padding: 10px;
}

#main_lnb>ul>li>a:hover {
	background: black;
	color: white;
}

#main_lnb>ul>li:first-child>a {
	border-radius: 10px 0 0 10px;
}

#main_lnb>ul>li:last-child>a {
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}

/* ---------------------------Content 영역---------------------------- */
/* content 영역의 크기를 width값을 주어 정하고 가운데로 지정하기 위해 margin값을 줌 
    부모 객체가 overflow hidden일 때 자식 객체는 부모의 영역을 벗어날 수 없음 */
#content {
	width: 960px;
	margin: 0 auto;
	/* border: 1px solid red; */
	position: relative;
	overflow: hidden;
}

/* Main Section */
/* main section을 왼쪽으로 배치하고 크기를 사이드바 영역과 나누어 가짐 */
#content>#main_section {
	/* margin: 5px; */
	/* padding: 20px; */
	float: left;
	width: 750px;
}

#main_section>.main_article {
	margin-bottom: 10px;
	border: 1px solid black;
	/* margin: 5px; */
	padding: 20px;
}

/* ---------------------------사이드바 영역---------------------------- */
/* Main Aside */
/* 사이드바를 오른쪽으로 배치하고 나머지 크기를 배정해줌 */
#content>#main_aside {
	float: right;
	width: 200px;
}

/* First Radio Button */
#main_aside>input:nth-of-type(1) {
	display: none;
}

/* 좌우에 표시할 div 영역 중 좌측 
    클릭시 보임*/
#main_aside>input:nth-of-type(1) ~ div:nth-of-type(1) {
	display: none;
}
/* 클릭 시 보임 */
#main_aside>input:nth-of-type(1):checked ~ div:nth-of-type(1) {
	display: block;
}
/* Second Radio Button */
#main_aside>input:nth-of-type(2) {
	display: none;
}

/* 우측 */
/* 클릭 안할시 안보임 */
#main_aside>input:nth-of-type(2) ~ div:nth-of-type(2) {
	display: none;
}

/* 클릭시 보임 */
#main_aside>input:nth-of-type(2):checked ~ div:nth-of-type(2) {
	/* 영역 모두 차지하게 */
	display: block;
}

/* label 두개를 감싸는 영역을 hidden처리  */
section.buttons {
	/* border: 1px solid black; */
	width: 100%;
	overflow: hidden;
}

/* 버튼안에서 자리를 잡아서 반반씩 영역 나누기 */
section.buttons>label {
	/* border: 1px solid black; */
	width: 50%;
	height: 30px;
	/* 오른쪽으로 붙지 않음 */
	display: block;
	float: left;
	text-align: center;
	background: black;
	color: white;
	/* 박스 크기 수평정렬 여백이 증가하면 margin과 padding이 늘어남
    box-sizing: border-box는 width를 따름, 상자가 더 커지지 않도록 함*/
	box-sizing: border-box;
}

/* Button Checked */
/* input의 속성으로 기능 삽입 */
/* 첫번째 버튼이 눌렸을 시 */
input:nth-of-type(1):checked ~ section.buttons>label:nth-of-type(1) {
	background: white;
	color: black;
}

/* 두번째 버튼이 눌렸을 시 */
input:nth-of-type(2):checked ~ section.buttons>label:nth-of-type(2) {
	background: white;
	color: black;
}

/* -----------------------------Aside 영역---------------------------- */
.item {
	/* 상위 구조 */
	overflow: hidden;
	border: 1px solid black;
	border-top: none; /* 위 라인 삭제 */
}

.thumbnail {
	float: left; /* 섬네일 사진을 왼쪽으로 정렬하여 설명글이 오른쪽으로 오게 함 */
}

.description {
	float: left;
	margin-left: 10px; /* 왼쪽 margin을 주어 사진과 간격을 줌 */
}

.description>strong {
	display: block;
	width: 120px;
	/* 공백이 안되게 줄바꿈 */
	white-space: nowrap;
	/* text가 item영역을 벗어나는 크기이면 벗어나는 만큼 생략 */
	overflow: hidden;
	text-overflow: ellipsis; /* 일부 내용 생략 가능 */
}

/* ----------------------------footer 영역---------------------------- */
/* 가운데 오도록 margin값을 지정. 너무 bottom에 붙지 않도록 10px로 설정 */
#main_footer {
	width: 960px;
	margin: 10px auto;
	text-align: center;
	background: rgba(82, 82, 82, 0.333);
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
//	session.removeAttribute("password");
//	session.invalidate(); //로그인 로그아웃에서는 사용하지 않음.
//	out.print("세션 일부를 삭제했습니다. <br>");

//	out.print("로그아웃 했습니다. <br>");

	int time = session.getMaxInactiveInterval();
	out.print(time + "<br>");
	session.setMaxInactiveInterval(60 * 60);
	time = session.getMaxInactiveInterval();
	out.print(time + "<br>");
%>
<header id="main_header">
		<div id="title">
			<h1>UI 프로그래밍</h1>
			<h2>박 상 혁</h2>

		</div>
		<nav id="main_gnb">
			<ul>
				<li><a href="#">Web</a></li>
				<li><a href="#">Mobile</a></li>
				<li><a href="#">Game</a></li>
				<li><a href="#">Simulation</a></li>
				<li><a href="#">Data</a></li>
			</ul>
		</nav>
		<nav id="main_lnb">
			<ul>
				<li><a href="#">HTML5</a></li>
				<li><a href="#">CSS3</a></li>
				<li><a href="#">JavaScript</a></li>
				<li><a href="#">jQuery</a></li>
				<li><a href="#">Node.js</a></li>
			</ul>
		</nav>
	</header>

	<div id="content">
		<section id="main_section">
			<article class="main_article">
				<h1>Main Article</h1>
				<p>Main Article</p>
			</article>
			<article class="main_article">
				<h1>Main Article</h1>
			</article>
			<article class="main_article">
				<h1>Main Article</h1>
			</article>


		</section>
		<aside id="main_aside">
			<input id="first" type="radio" name="tab" checked="checked" /> <input
				id="second" type="radio" name="tab" />
			<section class="buttons">
				<label for="first">First</label> <label for="second">Second</label>
			</section>
			<div class="tab_item">
				<ul>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>assssa</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>HTML5 Audio</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>HTML5 Video</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>HTML5 Semantic Web</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
				</ul>
			</div>
			<div class="tab_item">
				<ul>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>CSS3 Transition</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>CSS3 Animation</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>ssss</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
					<li class="item"><a href="#">
							<div class="thumbnail">
								<img src="http://placekitten.com/45/45" />
							</div>
							<div class="description">
								<strong>CSS3 Box</strong>
								<p>2020-08-18</p>
							</div>
					</a></li>
				</ul>
			</div>
		</aside>
	</div>
	<footer id="main_footer">
		<h3>HTML5 + CSS3 Basic</h3>
		<address>Website Layout Basic</address>

	</footer>
</body>
</html>