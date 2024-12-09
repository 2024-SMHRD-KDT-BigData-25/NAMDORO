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

        body,html {
            background-color: #F4F8FE;
            z-index: -5;
        }

        .bgImg {
            background: url(images/tour.png) no-repeat center / 100% 550px;
            height: 60%;
            width: 100%;
            position: absolute;
            padding-top: 215px;
            opacity: 0.5;
            z-index: -4;
            transition: background-image 1s ease-in-out; /* 배경 이미지 변경 시 애니메이션 추가 */
        }
        
        .tourImg {
            background: url(images/tour.png) no-repeat center / 100% 450px;
            height: 60%;
            width: 50%;
            position: absolute;
            padding-top: 205px;
        }

        .square1 {
            position: absolute;
            width: 100%;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 150px;
            z-index: -3;
        }

        .nextBtn {
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM241 377c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l87-87-87-87c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L345 239c9.4 9.4 9.4 24.6 0 33.9L241 377z"/></svg>');
            position: absolute;
            width: 30px;
            height: 50px;
            right: 20%;
            border: none;
            background-color: transparent;
            cursor: pointer;

            background-repeat: no-repeat;
        }

        .beforeBtn {
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM271 135c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-87 87 87 87c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L167 273c-9.4-9.4-9.4-24.6 0-33.9L271 135z"/></svg>');
            position: absolute;
            width: 30px;
            height: 50px;
            left: 20%;
            border: none;
            background-color: transparent;
            cursor: pointer;

            background-repeat: no-repeat;
        }

        .square2 {
            position: absolute;
            width: 1000px;
            height: 130px;
            top: 93%;
            left : 50%;
			transform: translate(-50%);
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 80px;
        }

        .tour2 {
            background: url(images/tour2.JPG) no-repeat center/cover;
            width: 190px;
            height: 120px;
            border-radius: 20px;
        }

        .tour3 {
            background: url(images/tour3.JPG) no-repeat center/cover;
            width: 190px;
            height: 120px;
            border-radius: 20px;
        }

        .tour4 {
            background: url(images/tour4.JPG) no-repeat center/cover;
            width: 190px;
            height: 120px;
            border-radius: 20px;
        }

        .square3 {
            position: absolute;
            width: 900px;
            height: 600px;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(255, 255, 255);
            top: 115%;
            border-radius: 20px;
            padding-top: 50px;
            padding-left: 50px;
        }

 

        .title {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: bold;
			font-size: 24px;
			line-height: 30px;
			text-align: left;
            padding-left: 100px;
		
			color: #000000;
        }

        .address {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: 400;
			font-size: 18px;
			line-height: 30px;
			text-align: left;
            padding-left: 100px;
		
			color: #000000;
        }

        .tel {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: medium;
			font-size: 16px;
			line-height: 30px;
			text-align: left;
            padding-left: 100px;
		
			color: #000000;
        }

        .hour {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: medium;
			font-size: 16px;
			line-height: 30px;
			text-align: left;
            padding-left: 100px;
		
			color: #000000;
        }

        .closeDay {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: medium;
			font-size: 16px;
			line-height: 30px;
			text-align: left;
            padding-left: 100px;
		
			color: #000000;
        }

        .activity {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: medium;
			font-size: 16px;
			line-height: 30px;
			text-align: left;
            padding-left: 100px;
		
			color: #000000;
        }

        
        .reviewWrite {
            position: absolute;
            width: 900px;
            height: 100px;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(255, 255, 255);
            top: 220%;
            border-radius: 20px;
            padding-top: 50px;
            padding-left: 50px;
        }
        
        .reviewBox {
            position: absolute;
            width: 900px;
            height: 600px;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(255, 255, 255);
            top: 245%;
            border-radius: 20px;
            padding-top: 50px;
            padding-left: 50px;
        }
        
        
        
        </style>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>


    <div class="bgImg"></div>

    <div class="square1">
        <button class="nextBtn"></button>
        <div class="tourImg"></div>
        <button class="beforeBtn"></button>
    </div>

    <div class="square2">
        <div class="tour2"></div>
        <div class="tour3"></div>
        <div class="tour4"></div>
    </div>

    <div class="square3">
     
        <div class="title">빛가람 호수공원</div><br>
        <div class="address">전라남도 나주시 호수로 77(빛가람동)</div><br>
        <div class="tel">문의 및 안내 : 061-333-1501</div><br>
        <div class="hour">이용시간 : 상시 개방</div><br>
        <div class="closeDay">쉬는날 : 공원 휴무 없음 / 음악분수 매주 월요일 휴장</div><br>
        <div class="activity">
                체험안내 :
                빛가람 전망대 모노레일 이용시간<br>하절기(3월~10월) 09:00~22:00<br>
                동절기(11월~2월)09:00~21:00<br>
                *한시간 전까지 입장, 설/추석 연휴 당일 휴무<br>
                관람소요시간 1시간 이상           
        </div>
    </div>

    <div class="reviewWrite"></div>

    <div class="reviewBox"></div>



    <script>
        document.addEventListener('DOMContentLoaded', () => {
            // 버튼과 tourImg, bgImg 요소 선택
            const nextBtn = document.querySelector('.nextBtn');
            const beforeBtn = document.querySelector('.beforeBtn');
            const tourImg = document.querySelector('.tourImg');
            const bgImg = document.querySelector('.bgImg'); // bgImg 요소 추가
        
            // 이미지 경로 배열
            const tourImages = [
                "./images/tour.png",
                "./images/tour2.JPG",
                "./images/tour3.JPG",
                "./images/tour4.JPG"
            ];
        
            // 배경 이미지 경로 배열
            const backgroundImages = [
                "url('./images/tour.png')",
                "url('./images/tour2.JPG')",
                "url('./images/tour3.JPG')",
                "url('./images/tour4.JPG')"
            ];
        
            // 현재 이미지 인덱스
            let currentIndex = 0;
        
            // 이미지 업데이트 함수
            function updateTourImage() {
                console.log(`현재 인덱스: ${currentIndex}`); // 디버그용 로그
                tourImg.style.backgroundImage = `url(${tourImages[currentIndex]})`;
                bgImg.style.backgroundImage = backgroundImages[currentIndex]; // bgImg 배경 이미지 변경
            }
        
            // 다음 버튼 클릭 이벤트
            nextBtn.addEventListener('click', () => {
                currentIndex = (currentIndex + 1) % tourImages.length; // 다음 이미지
                updateTourImage();
                console.log('Next button clicked!');
            });
        
            // 이전 버튼 클릭 이벤트
            beforeBtn.addEventListener('click', () => {
                currentIndex = (currentIndex - 1 + tourImages.length) % tourImages.length; // 이전 이미지
                updateTourImage();
                console.log('Before button clicked!');
            });
        
            // 초기 이미지 설정
            updateTourImage();
        });
        </script>
    
    
</body>
</html>