<%@page import="com.smhrd.boot.model.namdoro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

html, body {
	margin: 0;
	padding: 0;
	height: 100%; /* 전체 높이를 부모로부터 상속 */
}

.logo {
	position: absolute;
	width: 150px;
	height: 35px;
	left: 50%;
	top: 50px;
	transform: translate(-50%);
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 32px;
	line-height: 30px;
	text-align: center;
	color: #000000;
	z-index: 2;
}

.subTitle {
	position: absolute;
	width: 400px;
	height: 35px;
	left: 50%;
	top: 85px;
	transform: translate(-50%);
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: medium;
	font-size: 16px;
	line-height: 30px;
	text-align: center;
	color: #000000;
	z-index: 2;
}

.square2 {
	border-radius: 10px;
	position: absolute;
	width: 390px;
	height: 250px;
	left: 50%;
	top: 130px;
	transform: translate(-50%);
	background: rgb(255, 255, 255);
	z-index: 2;
	padding-top: 20px;
	padding-right: -4px;
}

.findinfoTitle {
	position: absolute;
	top: 30px;
	left: 50%;
	transform: translate(-50%);
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 24px;
	line-height: 30px;
	color: #000000;
	z-index: 2;
}

.information {
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 700;
	font-size: 30px;
	padding-top: 80px;
	text-align: -webkit-center;
	color: #000000;
	display: flex;
	flex-direction: column;
	gap: 30px;
	align-items: center;
}

.joinBtn {
	position: absolute;
	padding-right: 10px;
	padding-top: 5px;
	right: 20%;
	border: none;
	background-color: transparent;
	cursor: pointer;
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 700;
	font-size: 12px;
	line-height: 30px;
	text-align: right;
	color: #000000;
}

.findBtn {
	position: absolute;
	padding-top: 6px;
	padding-left: 10px;
	left: 42%;
	border: none;
	background-color: transparent;
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 10px;
	line-height: 30px;
	text-align: left;
	color: #000000;
}

.information input {
	text-align: left;
	width: 250px;
	height: 40px;
	padding-left: 40px;
	margin-left: 10px;
	border-radius: 5px;
	background-size: 20px 20px;
}

.button {
	position: absolute;
	background-color: rgb(210, 233, 255);
	color: #000000;
	width: 290px;
	height: 50px;
	bottom: 25px;
	left: 51%;
	transform: translate(-50%);
	border-radius: 5px;
	cursor: pointer;
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 15px;
	line-height: 30px;
	text-align: center;
	color: #000000;
}

</style>

</head>


<body>

	<%List<namdoro> pw = (List<namdoro>)request.getAttribute("res_pw"); %>
	<%request.setCharacterEncoding("UTF-8"); %>
	
	
	<div class="square1"></div>
   	 <form action="login">
		<div class="square2">
			<div class="findinfoTitle">패스워드</div>
			<div class="information">
					<%for(namdoro p: pw){ %>
				<div>
					<%=p.getUser_pw() %>
				</div>
					<%} %>
			   <button class="button" type="submit">로그인</button>
			</div>
			
	</form>		

</body>
</html>