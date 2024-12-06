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
            gap: 45px;
            align-items: flex-end;
            
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

        .button1 {
            position: absolute;
            background-color:rgb(210, 233, 255);
            color: #000000;
            width:290px;
            height:50px;
            bottom: 230px;
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

        .button2 {
            position: absolute;
            background-color:rgb(210, 200, 255);
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


    </style>


</head>
<body>

	 <div class="joinBg">
        <div class="square1"></div>
    </div>
     
	<div class="square2">
	 <div class="joinTitle">홈</div>
        <div class="information"> 
            <div>
                <button class="button1" onClick="location.href='/boot/login'">로그인</button>
            </div>
            <div>
                <button class="button2" onClick="location.href='join'">회원가입</button>
            </div>
        </div> 
 
</body>
</html>