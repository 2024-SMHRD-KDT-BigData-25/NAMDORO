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

		* {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
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

		/* 테마이미지 */
        .mountain {
            position: relative;
            width: 150px;
            height: 150px;
            background: url('images/mountain.png') no-repeat center/cover;
        }

		/* 테마이미지 */
        .sea {
            position: relative;
            width: 150px;
            height: 150px;
            background: url('images/sea.png') no-repeat center/cover;
        }

		/* 테마이미지 */
        .activity {
            position: relative;
            width: 150px;
            height: 150px;
            background: url('images/activity.png') no-repeat center/cover;
        }

		/* 테마이미지 */
        .indoor {
            position: relative;
            width: 150px;
            height: 150px;
            background: url('images/indoor.png') no-repeat center/cover;
        }

		/* 테마이미지 */
        .themapark {
            position: relative;
            width: 150px;
            height: 150px;
            background: url('images/themapark.png') no-repeat center/cover;
        }

		/* 테마이미지 */
        .culture {
            position: relative;
            width: 150px;
            height: 150px;
            background: url('images/culture.png') no-repeat center/cover;
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
    		background: url(images/bottomStep.png) no-repeat center / cover;
    		display: flex;
    		align-items: center;
    		justify-content: space-evenly;
		}

		.stepCir {
			position: relative;
            width: 35px;
            height: 35px;
            background: url('images/stepCir.png') no-repeat center/cover;
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
    		top: 900px;
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

		.margin {
			margin-bottom: 475px;
		}

		.themeImage {
			position: relative;
			width: 150px;
			height: 150px;
			background-size: cover;
			cursor: pointer;
			transition: 0.3s ease-in-out;
		}

		.themeImage::after {
			content: '✔'; /* 체크 표시를 위한 문자 */
			position: absolute;
			top: 50%;
			left: 50%;
			transform: translate(-50%, -50%);
			font-size: 32px;
			color: white; /* 체크 색상 */
			background-color: rgba(0, 0, 0, 0.7); /* 둥근 배경 */
			border-radius: 50%;
			width: 50px;
			height: 50px;
			line-height: 50px;
			text-align: center;
			opacity: 0;
			z-index: 10;
			transition: opacity 0.3s ease-in-out;
		}

		.themeImage.clicked::after {
			opacity: 1;
		}


    </style>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>

        <div class="bg"></div>

	
		<div class="square1">
			<div class="themeImage mountain" style="background: url('images/mountain.png') no-repeat center/cover;"></div>
			<div class="themeImage activity" style="background: url('images/activity.png') no-repeat center/cover;"></div>
			<div class="themeImage sea" style="background: url('images/sea.png') no-repeat center/cover;"></div>
			<div class="themeImage indoor" style="background: url('images/indoor.png') no-repeat center/cover;"></div>
			<div class="themeImage themapark" style="background: url('images/themapark.png') no-repeat center/cover;"></div>
			<div class="themeImage culture" style="background: url('images/culture.png') no-repeat center/cover;"></div>
		</div>
		
		

	<div class="square2">
		<div class="nebe">
			<button class="before" onClick="location.href='dateSelect.html'"></button>
            <button class="next" onClick="location.href='genderSelect.html'"></button>
		</div>
		<div class="bottomStep">
			<div class="stepCir">
				<div class="stepText">STEP1</div>
			</div>
			<div class="stepCir">
				<div class="stepText">STEP2</div>
			</div>
			<div class="stepCir">
				<div class="stepText">STEP3</div>
			</div>
			<div class="stepCir">
				<div class="stepText">STEP4</div>
			</div>
		</div>	
	</div>

			<div class="themaMain">여행 테마 선택</div>
			<div class="themaSub">남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요</div>

			<div class="margin"></div>

		<div id="footer"></div>


		
		
            

		<script src="js/footer.js"></script>

		<script>
			document.querySelectorAll('.themeImage').forEach(image => {
				image.addEventListener('click', () => {
					// 모든 이미지에서 클릭 상태 해제
					document.querySelectorAll('.themeImage').forEach(img => img.classList.remove('clicked'));
					// 클릭된 이미지에 클릭 상태 추가
					image.classList.add('clicked');
				});
			});
		</script>

    </body>
</html>