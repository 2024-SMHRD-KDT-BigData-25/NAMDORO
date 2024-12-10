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
			font-size: 38px;
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


      .male {
         cursor: pointer;
         transition: transform 0.2s ease; /* 부드러운 전환 효과 추가 */
      }
      
      .male:hover {
      	transform: scale(1.1); /*마우스 올리면 20%확대*/
      }

      .female {
         cursor: pointer;
         transition: transform 0.2s ease; /* 부드러운 전환 효과 추가 */
      }
      
      .female:hover {
      	transform: scale(1.1); /*마우스 올리면 20%확대*/
      }

      .margin {
         margin-bottom: 195px;
      }

      .gender {
         display: flex;
         position: absolute;
         left:50%;
         top:50%;
         transform: translate(-50%, -50%);
         gap: 120px;
         z-index: 1;
         font-weight: 700;
         text-align: center;
      	 font-size: 20px; /* 텍스트 크기 조정 */
      }
      
      .gender-text {
      	margin-top: 15px; /* 이미지와 텍스트 사이 간격 조정 */
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
      


    </style>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

        <div class="bg"></div>

        <div class="square1">
            <div class="gender">              
               <div class="female">
                <img src="${pageContext.request.contextPath}/images/man.png" alt="남자" style="width: 95px; height: 160px;" onClick="">
                <div class="gender-text">남자</div>
               </div>

               <div class="male">
                <img src="${pageContext.request.contextPath}/images/woman.png" alt="여자" style="width: 90px; height: 155px;" onClick="">
                <div class="gender-text">여자</div>
               </div>
            </div>
         </div>
      
         <div class="square2">

            <div class="nebe">
               <button class="before" onClick="location.href='themeSelect.jsp'">before</button>
               <button class="next" onClick="location.href='ageSelect.jsp'">next</button>
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



         <div class="themaMain">성별 선택</div>
         <div class="themaSub">남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요</div>

         

         <div class="margin"></div>



      
      
            

   

    </body>
</html>