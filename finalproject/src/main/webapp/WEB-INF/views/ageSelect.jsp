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



        /* unsplash:Zvs1bhgD5zQ */
        /* 배경이미지 */
        .bg {
            position: absolute;
            width: 100%;
            height: 1000px;
            top :100px;
            background: url('images/bg.png') no-repeat center/cover;
			z-index: -1;
        }
      

      .square1 {
         position: absolute;
         border-radius: 20px;
        width: 750px;
        height: 450px;
        top: 65%;
        left: 50%;
        transform: translate(-50%, -50%); /* 정중앙 배치 */;
        background-color:rgb(239, 252, 255, 0.5);
         z-index: -1;
      }

      /* 여행테마선택 문구 */
		.themaMain {
			position: absolute;
			width: 350px;
			height: 35px;
			top: 220px;
			left : 50%;
			transform: translate(-50%, -50%);

			font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 32px;
			line-height: 30px;
			text-align: center;
		
			color: #000000;
		}

		/* 여행테마선택 서브문구 */
		.themaSub {
			position: absolute;
			width: 700px;
			height: 35px;
			top: 270px;
			left : 50%;
			transform: translate(-50%, -50%);

			font-family: 'Gmarket Sans', sans-serif;
			font-weight: light;
			font-size: 16px;
			line-height: 30px;
			text-align: center;
		
			color: #000000;
		}

      

      .before {
			position: relative;
            width: 110px;
            height: 50px;
            background: url('images/before.png') no-repeat center/cover;
			
			border: none;
            background-color: transparent;
            cursor: pointer;
		}

		.next {
			position: relative;
            width: 110px;
            height: 50px;
            background: url('images/next.png') no-repeat center/cover;
			
			border: none;
            background-color: transparent;
            cursor: pointer;
		}

		.bottomStep {
			position: absolute;
    		width: 500px;
    		height: 10px;
            background-color: #C2C2C2;
    		display: flex;
    		align-items: center;
    		justify-content: space-evenly;
            border-radius: 20px;
		}

		.stepCir {
			position: relative;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #C2C2C2;
		}

        .smallCir {
            position: absolute;
            width: 15px;
            height: 15px;
            background-color: #ffffff; /* 원의 색상 */
            border-radius: 50%; /* 원 모양으로 만들기 */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 5;
        }

		.stepText {
			position: relative;
            width: 50px;
            height: 50px;
			top: 40px;
			right: 6px;


			font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 12px;
			line-height: 30px;
			text-align: center;
		
			color: #000000;
		}

      .square1 {
			position: absolute;
    		border-radius: 20px;
    		width: 750px;
    		height: 450px;
    		top: 570px;
    		left: 50%;
    		transform: translate(-50%, -50%);
    		background-color: rgb(239, 252, 255, 0.5);
    		display: flex;
    		flex-wrap: wrap;
    		column-gap: 70px;
    		justify-content: center;
    		align-items: center;
		}

		.square2 {
			position: absolute;
    		border-radius: 20px;
    		width: 900px;
    		height: 150px;
    		top: 950px;
    		left: 50%;
    		transform: translate(-50%, -50%);
    		
    		display: flex;
    		align-items: center;
    		justify-content: center;
		}

      .nebe {
			position: relative;
			display: flex;
			gap: 570px;
		}

		.age {
			height: 60px;
			width: 150px;
			background-color: #ffffff;
			border-radius: 10px;
			border: 2px solid #9eb4f9;
			font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 16px;
			line-height: 30px;
			text-align: center;
			color: #000000;
			transition: transform 0.2s, background-color 0.2s;
		}

		.age:hover {
			background-color: rgb(200, 221, 245);
			transform: scale(1.1);
		}

		.age.active {
			background-color: #9eb4f9;
			color: #ffffff;
			transform: scale(1.1); /* 클릭된 상태 유지 */
			border: 2px solid #7a9bf1; /* 선택된 효과 */
		}   

      .button-container {
         display: flex;
         flex-wrap: wrap;
         justify-content: center;
         max-width: 600px;
         column-gap: 100px;
         row-gap: 65px;
         }

      .margin {
			margin-bottom: 475px;
		}
      


    </style>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	
      <div class="bg"></div>
      
   <div class="square1">
      <div class="button-container">
         <button class="age" data-active="false" onclick="toggleActive(this)">19세 이하</button>
         <button class="age" data-active="false" onclick="toggleActive(this)">20대</button>
         <button class="age" data-active="false" onclick="toggleActive(this)">30대</button>
         <button class="age"data-active="false" onclick="toggleActive(this)">40대</button>
         <button class="age" data-active="false" onclick="toggleActive(this)">50대</button>
         <button class="age" data-active="false" onclick="toggleActive(this)">60대</button>
      </div>
   </div>

      
   <div class="square2">

		<div class="nebe">
			<button class="before" onClick="location.href='genderSelect.html'"></button>
            <button class="next" onClick="location.href='#'"></button>
		</div>

		<div class="bottomStep">
			<div class="stepCir">
				<div class="smallCir"></div>
				<div class="stepText">STEP1</div>
			</div>
			<div class="stepCir">
				<div class="smallCir"></div>
				<div class="stepText">STEP2</div>
			</div>
			<div class="stepCir">
				<div class="smallCir"></div>
				<div class="stepText">STEP3</div>
			</div>
			<div class="stepCir">
				<div class="smallCir"></div>
				<div class="stepText">STEP4</div>
			</div>
			<div class="stepCir">
				<div class="smallCir"></div>
				<div class="stepText">STEP5</div>
			</div>
		</div>	
	 </div>	
	</div>



         <div class="themaMain">연령대 선택</div>
         <div class="themaSub">남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요</div>

         <div class="margin"></div>

      

      

	<script>
		function toggleActive(button) {
			const buttons = document.querySelectorAll('.age'); // 모든 버튼 선택
			buttons.forEach(btn => {
				btn.classList.remove('active'); // 다른 버튼의 active 제거
				btn.setAttribute('data-active', 'false'); // 속성 초기화
			});

			// 현재 클릭된 버튼에 active 클래스 추가
			button.classList.add('active');
			button.setAttribute('data-active', 'true');
		}
	</script>
      
      
            

      <script src="js/footer.js"></script>

    </body>
</html>