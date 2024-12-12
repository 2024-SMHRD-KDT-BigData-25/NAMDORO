<%@page import="com.smhrd.boot.model.namdoro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<style>
@font-face {
	font-family: 'Gmarket Sans';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff')
		format('woff');
	font-style: normal;
	font-weight: 400;
}

@font-face {
	font-family: 'Gmarket Sans';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-style: normal;
	font-weight: 500;
}

@font-face {
	font-family: 'Gmarket Sans';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff')
		format('woff');
	font-style: normal;
	font-weight: 700;
}

.headerColor {
	position: absolute;
	width: 100%;
	height: 100px;
	top: 0px;
	background-color: rgb(255, 255, 255);
	border-bottom: groove 3px;
}

.topbar {
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 20px;
	line-height: 30px;
	text-align: center;
	color: #000000;
}

/* 로고 */
#headerLogo {
	position: absolute;
    width: 130px;
    height: 130px;
    left: 35px;
    background: url(/boot/images/logo.png) no-repeat center / cover
}

#search {
	border-radius: 25px; /* 테두리 둥굴게 */
}

input {
	border-radius: 25px; /* input도 동일한 둥글기 적용 */
}

ul li a {
	color: black;
	border: none;
	text-decoration-line: none;
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 18px;
	line-height: 30px;
	text-align: center;
}
</style>

</head>
<body>

	<%
	namdoro member = (namdoro) session.getAttribute("member");
	%>
	<div class="headerColor"
		style="display: flex; align-items: center; justify-content: center; gap: 10%;">
		<div class="logo-area"
			style="display: flex; align-items: center; justify-content: center; gap: 10px;">
			<a id="headerLogo" href="/boot"></a>
			<div id="search">
				<input type="text"
					style="width: 400px; height: 40px; padding: 0 10%; background: url('/boot/images/search.png') no-repeat calc(100% - 10px) center; background-size: 20px 20px; background-color: white;"
					placeholder="떠나고 싶은 여행지가 있으신가요?">
			</div>
		</div>

		<ul
			style="display: flex; align-items: center; justify-content: center; gap: 100px; list-style-type: none;">
			<%
			if (member == null) {
			%>
			<li><a href="/boot/login">여행코스 생성</a></li>
			<li><a href="/boot/tours">관광지</a></li>
			<li><a href="/boot/board">게시판</a></li>
			<li><a href="/boot/login">로그인</a></li>
			<%
			} else {
			%>
			<li><a href="/boot/plan">여행코스 생성</a></li>
			<li><a href="/boot/tours">관광지</a></li>
			<li><a href="/boot/board">게시판</a></li>
			<li><a href="/boot/mypage">마이페이지</a></li>
			<%
			}
			%>

		</ul>
	</div>
</body>
</html>
