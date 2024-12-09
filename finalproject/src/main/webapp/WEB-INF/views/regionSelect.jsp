<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전라남도 지도</title>
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
    		width: 800px;
    		height: 550px;
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

        body {
            text-align: center;
            font-family: Arial, sans-serif;
        }
        img {
            max-width: 100%;
            height: auto;
            width: 650px;
        }
		
		.namdo {
			cursor: pointer;
		}

		.namdo:hover {
        	background-color: rgb(200, 221, 245); /* 배경색 변경 */
        	transform: scale(1.1); /* 크기 확대 */
      	}

		.highlight {
            background-color: rgb(0, 0, 0); /* 배경색 변경 */
            border: 2px solid #000000; /* 강조 효과 */
        }
        

    </style>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

    <div id="header"></div>

        <div class="bg"></div>

        <div class="square2">

            <div class="nebe">
               <button class="before" onClick="location.href='main.html'"></button>
               <button class="next" onClick="location.href='dateSelect.html'"></button>
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

         <div class="themaMain">여행지 선택</div>
         <div class="themaSub">남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요</div>


         <div class="square1">
        <!-- 이미지와 이미지 맵 -->
        <img src="images/전라남도 사진 1.png" alt="전라남도 지도" usemap="#jeonnam-map">
        </div>

        <!-- 이미지 맵 정의 -->
        <map name="jeonnam-map">
		   
            <div class="namdo">
                <area target="" alt="진도" title="진도" href="" coords="81,527,113,567,185,538,204,488,154,446" shape="poly" >
    	        <area target="" alt="여수" title="여수" class="yeosu" href="" coords="662,331,690,362,674,381,682,419,710,423,716,366,743,378,757,367,765,316,732,309,672,310,670,298,684,296,697,291,698,306,667,319" shape="poly">
                <area target="" alt="해남" title="해남" href="" coords="168,362,154,387,155,414,162,417,164,436,181,450,201,454,207,467,217,462,225,465,236,478,239,518,255,522,249,532,238,544,245,559,255,554,261,583,273,574,295,570,300,537,309,524,323,522,327,514,337,512,342,508,323,498,318,472,322,454,317,440,329,399,320,395,308,400,285,402,277,406,282,415,259,409,253,413,238,409,228,390,211,383,205,389,202,406,214,422,229,432,225,439,211,434,193,418,183,394,187,383,183,368" shape="poly">
                <area target="" alt="강진" title="강진" href="" coords="329,498,325,473,330,460,325,441,337,399,325,390,320,375,333,363,346,363,360,353,378,361,387,378,396,424,392,430,401,465,389,480,387,508,378,510,368,496,368,471,368,440,363,432,357,450,354,464,353,483,348,494,342,501" shape="poly">
		        <area target="" alt="장흥" title="장흥" href="" coords="394,510,402,512,409,506,425,506,426,485,431,477,439,478,438,463,446,456,444,445,452,432,448,423,459,418,469,416,457,401,442,395,436,383,454,368,454,350,457,330,466,321,443,317,429,326,406,304,398,307,393,318,379,325,373,343,383,352,395,371,401,390,403,418,405,433,410,455,405,472,397,484" shape="poly">
                <area target="" alt="영암" title="영암" href="" coords="272,400,253,382,204,366,197,359,217,349,231,345,248,357,261,353,274,328,279,306,285,283,293,278,301,289,308,299,326,297,323,273,330,277,339,293,353,296,361,299,369,305,380,309,389,306,385,314,373,323,364,341,354,340,347,352,333,351,311,367,313,384,315,389,303,394" shape="poly">
                <area target="" alt="목포" title="목포" href="" coords="228,339,234,329,221,318,211,317,201,327,195,340,204,348" shape="poly">
                <area target="" alt="보성" title="보성" href="" coords="499,260,531,255,543,278,540,293,554,301,568,296,579,300,587,311,598,311,603,322,610,335,617,335,611,342,596,323,577,327,557,336,541,353,533,372,526,386,508,386,498,385,488,397,476,409,465,396,449,388,448,381,463,373,463,338,480,319,490,306,488,283,499,274,503,265" shape="poly">
                <area target="" alt="고흥" title="고흥" href="" coords="555,359,588,332,601,340,601,349,611,354,602,365,604,386,632,404,645,414,654,439,644,445,624,441,613,433,605,435,596,444,597,450,604,457,618,462,625,464,622,475,607,481,604,491,586,492,587,509,575,502,565,491,559,474,534,469,507,470,502,457,511,439,518,440,528,421,536,429,546,423,552,390,563,386,564,400,573,406,583,399,585,383,586,364,570,366,560,368,568,342,550,354" shape="poly">
                <area target="" alt="완도" title="완도" href="" coords="309,539,330,532,368,520,390,522,426,537,433,549,407,574,385,583,346,591,322,583,307,566,490,505,498,492,517,492,541,487,550,494,543,511,527,519,496,518" shape="poly">
                <area target="" alt="영광" title="영광" href="" coords="218,39,243,34,266,82,282,82,294,77,305,86,285,112,281,137,265,148,241,145,225,151,197,156,195,144,169,134,178,105" shape="poly">
                <area target="" alt="장성" title="장성" href="" coords="351,17,378,4,391,4,409,17,422,43,410,60,393,102,403,118,372,131,360,123,358,112,344,119,338,135,317,143,289,124,327,66,341,51" shape="poly">
                <area target="" alt="담양" title="담양" href="" coords="408,115,397,101,421,57,424,43,438,43,448,27,450,13,467,13,469,30,473,41,464,45,478,56,481,73,474,84,491,92,485,117,495,141,478,148,487,173,480,179,460,169,464,154,452,145,441,148,426,116" shape="poly">
                <area target="" alt="곡성" title="곡성" href="" coords="489,121,500,141,526,137,536,145,535,175,544,172,562,193,581,203,587,192,601,187,613,169,613,151,601,144,600,130,614,121,603,101,606,89,557,85,545,78,541,85,525,79,497,94" shape="poly">
                <area target="" alt="구례" title="구례" href="" coords="630,64,653,64,685,89,690,102,700,112,704,146,691,175,678,189,625,148,607,141,606,130,620,122,609,101,608,92" shape="poly">
                <area target="" alt="광양" title="광양" href="" coords="705,152,731,176,731,189,761,217,766,237,762,253,744,263,716,289,697,277,699,289,688,287,686,268,673,257,685,249,679,246,680,227,670,212,670,193,685,194" shape="poly">
                <area target="" alt="순천" title="순천" href="" coords="621,153,662,186,661,209,673,225,673,245,666,256,679,273,684,290,669,293,669,310,659,299,650,301,649,313,624,323,619,316,581,289,549,289,551,280,537,251,527,248,530,187,537,181,550,194,562,201,581,210,593,198,611,185" shape="poly">
                <area target="" alt="화순" title="화순" href="" coords="487,155,526,142,528,150,519,247,497,253,493,266,485,270,481,301,468,315,443,311,429,317,410,295,391,302,405,286,411,246,408,233,414,203,429,205,446,198,456,179,478,187,495,179" shape="poly">
                <area target="" alt="나주" title="나주" href="" coords="405,206,400,229,403,246,398,284,381,299,365,292,347,288,333,267,319,265,317,291,297,274,281,277,276,292,262,281,269,256,281,255,291,243,291,199,308,199,318,191,343,194,349,200,351,211,374,219" shape="poly">
                <area target="" alt="함평" title="함평" href="" coords="289,133,310,147,316,156,311,163,313,181,304,189,286,186,282,238,265,244,257,241,254,230,244,224,245,208,234,203,237,193,206,166,217,157,241,151,267,156" shape="poly">
                <area target="" alt="무안" title="무안" href="" coords="271,307,254,349,239,341,241,328,227,314,214,311,208,258,201,247,198,271,172,273,165,264,142,179,184,162,221,207,235,212,234,228,243,235,245,245,259,254,253,273" shape="poly">
                <area target="" alt="신안" title="신안" href="" coords="69,186,104,170,138,188,152,227,128,264,101,283,157,280,200,281,201,317,181,324,151,322,117,305,116,319,128,386,131,423,100,435,96,465,61,472,46,432,12,405,1,366,3,347,48,319,26,304,48,265,62,266,81,241,96,228,65,215" shape="poly">
            </div>
        </map>



	<script>
        // 모든 area 태그를 선택
        const areas = document.querySelectorAll("area");

        // hover 및 클릭 이벤트 처리
        areas.forEach(area => {
            // hover 이벤트 (mouse over / out)
            area.addEventListener("mouseover", () => {
                // 이미지 위에 hover 상태를 스타일링
                area.setAttribute("class", "highlight");
            });
            area.addEventListener("mouseout", () => {
                // hover 해제 시 기본 상태로 복구
                area.removeAttribute("class");
            });

            // 클릭 이벤트
            area.addEventListener("click", (event) => {
                event.preventDefault(); // 링크 이동 방지
                const cityName = area.getAttribute("title");
                alert(`${cityName}을 선택하셨습니다.`);
            });
        });

    </script>


    <script>
        $(document).ready(function(e) {
	    $('img[usemap]').rwdImageMaps();
        });
    </script>

</body>
</html>