<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template 2</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
	* {
	    margin: 0;
	    padding: 0;
	    font-family: 'Noto Sans KR', sans-serif;
	}
	li {
	    list-style: none;
	}
	a {
	    text-decoration: none; /* 밑줄처리 X */
	}
	a:link { /* a 태그 글자 파란색 처리 무효화 */
		color: black;
		text-decoration: none;
	}
	a:visited { /* a 태그 글자 파란색 처리 무효화 */
		color: black;
		text-decoration: none;
	}
	a:hover { /* a 태그에 마우스 올렸을때 밑줄표시 없앰 */
		color: black;
		text-decoration: none;
	}
	img {
	    border: 0;
	}
	</style>
	<style>
	#top_nav {
	    width: 960px;
	    height: 30px;
	    margin: 0 auto;
	    position: relative;
	    border: 1px solid gray;
	}
	#header {
	    width: 960px;
	    height: 150px;
	    margin: 0 auto;
	    position: relative;
	    border: 1px solid gray;
	}
	#nav {
	    width: 960px;
	    height: 50px;
	    margin: 0 auto;
	    position: relative;
	    border: 1px solid gray;
	}
	/* height 속성값이 없고 컨텐츠가 들어가면서 height가 유동적으로 바뀜 */
	#contents {
	    overflow: hidden;
	    width: 960px;
	    margin: 0 auto;
	    position: relative;
	    border: 1px solid gray;
	}
	#aside {
	    float: left;
	    width: 200px;
	    border: 1px solid gray;
	}
	#contents > #aside > p:first-child {
	    margin-top: 10px;
	}
	#contents > #aside > p {
	    margin-bottom: 10px;
	}
	#contents > #aside > p > a:hover {
	    background: rgb(150, 150, 150);
	    color: whitesmoke;
	}
	#section {
	    float: right;
	    width: 750px;
	    border: 1px solid gray;
	}
	#article {
	    margin: 10px;
	    border: 1px solid gray;
	}
	#section > #article > p.title {
	    margin-bottom: 5px;
	}
	#section > #article > span.item_title1 {
	    display: inline-block; /* 문자열 처리를 위해 반드시 필요한 속성 inline-block */
	    width: 80px;           /* 이 속성이 없으면 width, text-align 속성이 적용되지 않음 */
	    text-align: center;
	}
	#section > #article > span.item_title2 {
	    display: inline-block;
	    width: 300px;
	    text-align: center;
	}
	#section > #article > span.item_title3 {
	    display: inline-block;
	    width: 100px;
	    text-align: center;
	}
	#section > #article > span.item_title4 {
	    display: inline-block;
	    width: 150px;
	    text-align: center;
	}
	#section > #article > span.item_contents1 {
	    display: inline-block;
	    width: 80px;
	    text-align: center;
	}
	#section > #article > span.item_contents2 {
	    display: inline-block;
	    width: 300px;
	    text-align: left;
	}
	#section > #article > span.item_contents3 {
	    display: inline-block;
	    width: 100px;
	    text-align: center;
	}
	#section > #article > span.item_contents4 {
	    display: inline-block;
	    width: 150px;
	    text-align: center;
	}
	#footer {
	    width: 960px;
	    margin: 0 auto;
	    position: relative;
	    border: 1px solid gray;
	}
	#footer > p {
	    margin-top: 5px;
	    text-align: center;
	}
</style>
</head>
<body>
	<div id="top_nav">

    </div>
    <div id="header">
        <img src="https://placeimg.com/960/150/nature" alt="">
    </div>
    <div id="nav">

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
                <br>
                <span class="item_contents1">1</span>
                <span class="item_contents2">JSP 웹프로그래밍 테스트</span>
                <span class="item_contents3">박상혁</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
                <span class="item_contents1">2</span>
                <span class="item_contents2">JSP 웹프로그래밍 테스트</span>
                <span class="item_contents3">박상혁</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
                <span class="item_contents1">3</span>
                <span class="item_contents2">JSP 웹프로그래밍 테스트</span>
                <span class="item_contents3">박상혁</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
                <span class="item_contents1">4</span>
                <span class="item_contents2">JSP 웹프로그래밍 테스트</span>
                <span class="item_contents3">박상혁</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
                <span class="item_contents1">5</span>
                <span class="item_contents2">JSP 웹프로그래밍 테스트</span>
                <span class="item_contents3">박상혁</span>
                <span class="item_contents4">2020-09-01</span>
                <br>
            </div>
        </div>
    </div>
    <div id="footer">
        <p>JSP 웹프로그래밍</p>
        <p>Copyright(c) 박상혁. All Right Reserved.</p>
    </div>
</body>
</html>