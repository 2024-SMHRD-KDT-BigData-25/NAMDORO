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

html, body {
   margin: 0;
   padding: 0;
   height: 100%; /* 전체 높이를 부모로부터 상속 */
}

h1, p {
   margin: 0; /* h1과 p 태그의 기본 여백 제거 */
   padding-top: 30px;
}

.toggle-password { 
	cursor: pointer; 
	user-select: none; 
	display: inline-block; 
	position: absolute; 
	right: 350px; 
	top: 49.5%; 
	transform: translateY(-55%); 
	width: 25px; 
	height: 20px;
} 

.pw-container { 
	position: relative; 
	display: inline-block; 
}


.information {
   font-family: 'Gmarket Sans', sans-serif;
   font-weight: 700;
   font-size: 12px;
   line-height: 30px;
   text-align: center;
   color: #000000;
   display: flex;
   flex-direction: column;
   gap: 35px;
   align-items: center;
   z-index: 1;
   padding-top: 70px;
}

.information input {
   text-align: left;
   width: 250px;
   height: 40px;
   border: none;
   padding-left: 10px;
   outline: none;
}

.information .input-feild {
   display: flex;
   align-items: center;
   justify-content: center;
   gap: 5px;
   border-radius: 20px;
   border: 3px solid black;
   height: 50px;
   width: 350px;
}

.information .input-feild span {
   display: flex;
   align-items: center;
   justify-content: center;
}

.information .input-feild span img {
   width: 24px;
   height: 20px;
}

.button {
   background-color: rgb(210, 233, 255);
   width: 350px;
   height: 50px;
   border-radius: 5px;
   margin-top: 3%;
   cursor: pointer;
   font-family: 'Gmarket Sans', sans-serif;
   font-weight: 500;
   font-size: 14px;
   line-height: 30px;
   color: #000000;
}

.joinBg {
   position: absolute;
   width: 100%;
   height: 900px;
   background: url('images/loginBg.png') no-repeat center/cover;
   z-index: -2;
}

.square1 {
   border: 1px solid rgb(123, 123, 123);
   border-radius: 20px;
   position: absolute;
   width: 500px;
   height: 650px;
   left: 50%;
   top: 130px;
   transform: translate(-50%);
   background: rgb(255, 255, 255);
   z-index: -2;
}

.join {
   font-family: 'Gmarket Sans', sans-serif;
   font-weight: 500;
   font-size: 24px;
   line-height: 20px;
}

.login-top {
   text-align: center;
   border-bottom: 1px solid black;
   font-family: 'Gmarket Sans', sans-serif;
   font-weight: 400;
   font-size: 14px;
   line-height: 20px;
}

.login-box {
   text-align: center;
   height: 600px;
}
</style>
	
	<script>
        // Spring MVC에서 전달된 플래시 속성을 확인하고, 있으면 alert로 표시
        <% if (request.getAttribute("userMessage") != null) { %>
            alert('<%= request.getAttribute("userMessage") %>');
        <% } %>
    </script>



</head>
<body>

   <div class="joinBg"></div>



   <div class="login-top">
      <h1>남도로</h1>
      <p>남도로와 함께 당신만의 여행 이야기를 만들어보세요!</p>
   </div>

   <form action="/boot/users" method="post" onsubmit="return validateForm()">
      <div class="square1"></div>
      <div class="login-box">


         <div class="information">
            <span class="join">회원가입</span>

            <div class="input-feild">
               <span><img
                  src='data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48L48 64zM0 176L0 384c0 35.3 28.7 64 64 64l384 0c35.3 0 64-28.7 64-64l0-208L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>' /></span>
               <input type="email" class="id" id="user_id" name="user_id" placeholder="이메일형식으로 입력">
            </div>
            <div class="input-feild">
               <span><img
                  src='data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M144 144l0 48 160 0 0-48c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192l0-48C80 64.5 144.5 0 224 0s144 64.5 144 144l0 48 16 0c35.3 0 64 28.7 64 64l0 192c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 256c0-35.3 28.7-64 64-64l16 0z"/></svg>' /></span>
               <input type="password" class="pw" id="user_pw" name="user_pw"
                  placeholder="비밀번호 입력">
                  <span id="toggle-password" class="toggle-password"><img src="./images/i_on.png"></span>
            </div>
            <div class="input-feild">
               <span><img
                  src='data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512l388.6 0c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304l-91.4 0z"/></svg>' /></span>
               <input type="text" class="name" id="user_name" name="user_name"
                  placeholder="사용자 이름 입력">
            </div>
            <div class="input-feild">
               <span><img
                  src='data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M372.2 52c0 20.9-12.4 39-30.2 47.2L448 192l104.4-20.9c-5.3-7.7-8.4-17.1-8.4-27.1c0-26.5 21.5-48 48-48s48 21.5 48 48c0 26-20.6 47.1-46.4 48L481 442.3c-10.3 23-33.2 37.7-58.4 37.7l-205.2 0c-25.2 0-48-14.8-58.4-37.7L46.4 192C20.6 191.1 0 170 0 144c0-26.5 21.5-48 48-48s48 21.5 48 48c0 10.1-3.1 19.4-8.4 27.1L192 192 298.1 99.1c-17.7-8.3-30-26.3-30-47.1c0-28.7 23.3-52 52-52s52 23.3 52 52z"/></svg>' /></span>
               <input type="text" class="nick" id="user_nickname"
                  name="user_nickname" placeholder="닉네임 입력">
            </div>
            <div class="input-feild">
               <span><img
                  src='data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M164.9 24.6c-7.7-18.6-28-28.5-47.4-23.2l-88 24C12.1 30.2 0 46 0 64C0 311.4 200.6 512 448 512c18 0 33.8-12.1 38.6-29.5l24-88c5.3-19.4-4.6-39.7-23.2-47.4l-96-40c-16.3-6.8-35.2-2.1-46.3 11.6L304.7 368C234.3 334.7 177.3 277.7 144 207.3L193.3 167c13.7-11.2 18.4-30 11.6-46.3l-40-96z"/></svg>' /></span>
               <input type="text" class="phone" id="user_phone" name="user_phone"
                  placeholder="전화번호 입력">
            </div>
         </div>
         <button class="button" type="submit">가입하기</button>
   </form>

   </div>






   <script>
   
      function validateForm(){
         // 현재 작성된 값 가져오기
         const user_id = document.getElementById('user_id').value.trim()
         const user_pw = document.getElementById('user_pw').value.trim()
         const user_name = document.getElementById('user_name').value.trim()
         const user_nickname = document.getElementById('user_nickname').value.trim()
         const user_phone = document.getElementById('user_phone').value.trim()
         
         if(user_id === "") {
            alert("ID를 입력해주세요");
            return false;
         }
         if(user_pw === "") {
            alert("비밀번호를 입력해주세요")
            return false;
         }
         if(user_name === "") {
            alert("이름을 입력해주세요")
            return false;
         }
         if(user_nickname==="") {
            alert("닉네임을 입력해주세요")
            return false;
         }
         
         if(user_phone==="") {
            alert("연락처를 입력해주세요")
            return false;
         }
         
         return true;
      }
   
   </script>
   
   
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



