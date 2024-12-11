<%@page import="java.lang.reflect.Member"%>
<%@page import="com.smhrd.boot.model.namdoro"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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

.mypage{
	left: 100px;



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
	padding-right: 56px;
	text-align: -webkit-center;
	color: #000000;
	display: flex;
	flex-direction: column;
	gap: 20px;
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
	bottom: 17%;
	left: 50.8%;
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

.label {
	display:inline-block;
	text-align:center;
	width:60px;
	font-weight:bold;
	padding: 0px;
	border: none;
	background-color: transparent;
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 10px;
	line-height: 15px;
	text-align: left;
	color: #000000;
	

	
</style>
	
	<script>
        // Spring MVC에서 전달된 플래시 속성을 확인하고, 있으면 alert로 표시
        <% if (request.getAttribute("nicknameMessage") != null) { %>
            alert('<%= request.getAttribute("nicknameMessage") %>');
        <% } %>
    </script>


</head>
<body>
		
	<form action="myPageInfo/update">
		<div class="square1"></div>
		<div class="login-box">
				
			
		<%  namdoro member = (namdoro)session.getAttribute("member"); %>
	
		
	<div class="information">
				<span class="mypage">회원수정</span>
				
				<div class="input-feild">
				<label class="label" for="title">이메일 :</label>
				<input type="email" value="${member.user_id }" class="id" id="user_id" name="user_id" readonly>
				</div>
				
				<div class="input-feild">
				<label class="label" for="title">비밀번호 :</label>
				<input type="text" value="${member.user_pw}" class="pw" id="user_pw" name="user_pw"
						placeholder="비밀번호 입력">
				</div>
				
				<div class="input-feild">
				<label class="label" for="title">닉네임 :</label>
					<input type="text" value="${member.user_nickname}" class="nickname" id="user_nickname" name="user_nickname">
				</div>
			
				<div class="input-feild">
				<label class="label" for="title">이름 :</label>
					<input type="text" value="${member.user_name}" class="name" id="user_name" name="user_name" readonly>
				</div>
				
				<div class="input-feild">
				<label class="label" for="title">휴대폰번호 :</label>
					<input type="text" value="${member.user_phone}" class="phone" id="user_phone" name="user_phone"
						placeholder="전화번호 입력" >
				</div>
				
				<div class="input-feild">
					<button class="button" type="submit">수정완료</button>
				<div class="input-feild">
			</div>
	</form>
	</div>
	
		
	
</body>
</html>