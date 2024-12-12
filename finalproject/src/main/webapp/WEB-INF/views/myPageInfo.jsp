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
	position: relative;
	left: 30px;
	height: 45px;

	}


.findinfoTitle {
	position: absolute;
	top: 30px;
	left: 49%%;
	transform: translate(-50%);
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 500;
	font-size: 24px;
	line-height: 30px;
	color: #000000;
	z-index: 2;
}

.information {
    position: relative;
    top: 70px;
	font-family: 'Gmarket Sans', sans-serif;
	font-weight: 700;
	font-size: 30px;
	padding-top: 0px;
	padding-right: 0px;
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
	position: relative;
	background-color: rgb(210, 233, 255);
	width: 290px;
	height: 50px;
	left: 40px;
	top: 20px;
	transform: translate(0%);
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
}

.toggle-password { 
	cursor: pointer; 
	user-select: none; 
	display: inline-block; 
	position: absolute; 
	top: 35%; 
	transform: translate(-120%, -35%); 
	width: 28px; 
	height: 20px;
} 

.pw-container { 
	position: relative; 
	display: inline-block; 
}

.toggle-password img {
	width: 80%; 
	height:;	
	display: block; /* 이미지가 블록 요소로 설정되어 위치가 일관되도록 합니다.
}

	
</style>
	
	<script>
        // Spring MVC에서 전달된 플래시 속성을 확인하고, 있으면 alert로 표시
        <% if (request.getAttribute("nicknameMessage") != null) { %>
            alert('<%= request.getAttribute("nicknameMessage") %>');
        <% } %>
    </script>


</head>
<body>
		
	
		<div class="square1"></div>
				
			
		<%  namdoro member = (namdoro)session.getAttribute("member"); %>
	
		<form action="myPageInfo/update">	
		<div class="information">
				<span class="mypage">회원수정</span>
				
				<div>
				<label class="label" for="title">이메일 :</label>
				<input type="email" value="${member.user_id }" class="id" id="user_id" name="user_id" readonly>
				</div>
				
				<div class="input-feild">
				<label class="label" for="title">비밀번호 :</label>
				<input type="password" value="${member.user_pw}" class="pw" id="user_pw" name="user_pw"
						placeholder="비밀번호 입력">
				<span id="toggle-password" class="toggle-password"><img src="./images/i_on.png"></span>			
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
				
				<button class="button" type="submit">수정완료</button>
			 
			</div>   
		 </form>
		 
		 
		 <script>
   	
		    // JavaScript 코드: 비밀번호 표시/숨기기 기능
		    document.addEventListener('DOMContentLoaded', function() {
		        document.getElementById('toggle-password').addEventListener('click', function() {
		            const passwordField = document.getElementById('user_pw');
		            const togglePasswordImg = document.getElementById('toggle-password').querySelector('img');
		            
		            if (passwordField.type === 'password') {
		                passwordField.type = 'text';
		                togglePasswordImg.src = './images/i_off.png';  // 아이콘 변경 (비밀번호 숨기기)
		            } else {
		                passwordField.type = 'password';
		                togglePasswordImg.src = './images/i_on.png';  // 아이콘 변경 (비밀번호 보기)
		            }
		        });
		    });

   </script>
	
		
	
</body>
</html>