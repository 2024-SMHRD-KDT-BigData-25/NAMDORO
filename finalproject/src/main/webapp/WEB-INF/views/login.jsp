<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        @font-face {
            font-family: 'Gmarket Sans';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
            font-style: normal;
            font-weight: 400;
        }

        @font-face {
            font-family: 'Gmarket Sans';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
            font-style: normal;
			font-weight : 500;
        }

        @font-face {
            font-family: 'Gmarket Sans';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-style: normal;
            font-weight: 700;
        }

        html, body {
            margin: 0;
            padding: 0;
            height: 100%; /* 전체 높이를 부모로부터 상속 */
        }

        .joinBg {
            position: absolute;
            width: 100%;
            height: 100%;
            background: url('images/loginBg.png') no-repeat center/cover;
        }


        .logo {
            position: absolute;
			width: 150px;
			height: 35px;
            left: 50%;
            top :50px;
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
            top :85px;
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
            border: 1px solid black;
            border-radius: 10px;
            position: absolute;
            width: 390px;
            height: 350px;
            left: 50%;
            top :180px;
            transform: translate(-50%);
            background: rgb(255, 255, 255);
            z-index: 2;	
            padding-top: 90px;
            padding-right: 90px;
        }

        .joinTitle {
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
			font-size: 12px;
			line-height: 30px;
			text-align: center;
			color: #000000;
            display:flex;
            flex-direction: column;
            gap: 30px;
            align-items: flex-end;
            
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

        .information input{
            text-align:left;
            width:250px;
            height:40px;
            padding-left:40px ;
            margin-left: 10px;
            border-radius: 5px;
            background-size: 20px 20px;
            
        }

        .button {
            position: absolute;
            background-color:rgb(210, 233, 255);
            color: #000000;
            width:290px;
            height:50px;
            bottom: 130px;
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
        
        .id {
            background-repeat: no-repeat;
            background-position: 8px center; /* 가로로 5px 이동 */
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48L48 64zM0 176L0 384c0 35.3 28.7 64 64 64l384 0c35.3 0 64-28.7 64-64l0-208L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>');
        }

        .pw {
            background-repeat: no-repeat;
            background-position: 8px center; /* 가로로 5px 이동 */
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path d="M144 144l0 48 160 0 0-48c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192l0-48C80 64.5 144.5 0 224 0s144 64.5 144 144l0 48 16 0c35.3 0 64 28.7 64 64l0 192c0 35.3-28.7 64-64 64L64 512c-35.3 0-64-28.7-64-64L0 256c0-35.3 28.7-64 64-64l16 0z"/></svg>')
        }

        .kakao {
            position: absolute;
            width:290px;
            height:50px;
            bottom: 50px;
            left: 51%;
            transform: translate(-50%);
            border-radius: 5px;
            background-image: url('./images/kakao.png');
        }


    </style>

</head>
<body>

    <div class="joinBg">
        <div class="square1"></div>
    </div>

    <div class="logo">남도로</div>
    <div class="subTitle">남도로와 함께 당신만의 여행 이야기를 만들어보세요!</div>

    <div class="square2">
        <div class="joinTitle">로그인</div>
        <div class="information"> 
            <div>
                <input type="email" class="id" placeholder="이메일형식으로 입력">
            </div>
            <div>
                <input type="password" class="pw" placeholder="비밀번호 입력">
            </div>
        </div>
        
		<button class="findBtn">아이디/비밀번호찾기</button>
        <button class="joinBtn" onClick="location.href='join'">회원가입</button>
        <button class="button" onClick="location.href='main'">로그인</button>
        <button class="kakao"></button>
        
    </div>



</body>
</html>



