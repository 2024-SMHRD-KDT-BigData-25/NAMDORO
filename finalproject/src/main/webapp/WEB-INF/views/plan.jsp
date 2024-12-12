<%@page import="com.smhrd.boot.model.namdoro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap");
      @import url("https://fonts.googleapis.com/icon?family=Material+Icons");
      @font-face {
        font-family: "Gmarket Sans";
        src: url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff")
          format("woff");
        font-style: normal;
        font-weight: 400;
      }

      @font-face {
        font-family: "Gmarket Sans";
        src: url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
          format("woff");
        font-style: normal;
        font-weight: 500;
      }

      @font-face {
        font-family: "Gmarket Sans";
        src: url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff")
          format("woff");
        font-style: normal;
        font-weight: 700;
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      /* 배경이미지 공통 스타일 */
      .bg1,
      .bg2,
      .bg3,
      .bg4,
      .bg5 {
        position: absolute;
        width: 100%;
        height: 1100px;
        top: 100px;
        background: url("images/bg.png") no-repeat center/cover;
        z-index: -1;
        filter: blur(8px); /* 이미지 흐림 효과 */
      }

      /* 여행테마선택 문구 공통 스타일 */
      .themaMain {
            position: relative;
          font-family: "Gmarket Sans", sans-serif;
          font-weight: 500;
          font-size: 32px;
          text-align: center;
          color: #000000;
      }

      /* 여행테마선택 서브문구 공통 스타일 */
      .themaSub {
        position: relative;
       top: 25px;
       font-family: "Gmarket Sans", sans-serif;
       font-weight: 400;
       font-size: 16px;
       text-align: center;
       color: #000000;
      }

      .square1 {
        position: absolute;
       border-radius: 20px;
       width: 1000px;
       height: 600px;
       top: 500px;
       left: 50%;
       transform: translate(-50%, -50%);
       background: url("images/bg.png") no-repeat center / cover;
       display: flex;
       column-gap: 60px;
       row-gap: 60px;
       justify-content: center;
       flex-wrap: wrap;
       align-content: center;
       z-index: -1;
       padding: 0 8%;
       box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
      }

      .square2 {
        position: absolute;
        border-radius: 20px;
        width: 900px;
        height: 150px;
        top: 850px;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .before {
            position: relative;
          width: 40px;
          height: 70px;
          border: none;
          background: #f5f5f5 url(images/before.png) no-repeat center / cover;
          background-size: 50%;
          border-radius: 20%;
          cursor: pointer;
          transition: all 0.3s ease;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .before:hover {
            background-color: #a9f3fd;
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
        }

        /* Next 버튼 스타일 */
        .next, .next2 {
            position: relative;
          width: 40px;
          height: 70px;
          border: none;
          background: #f5f5f5 url(images/next.png) no-repeat center / cover;
          background-size: 50%;
          border-radius: 20%;
          cursor: pointer;
          transition: all 0.3s ease;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .next:hover, .next2:hover {
            background-color: #a9f3fd;
            transform: scale(1.1);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
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
      
      .stepCir.active {
            background-color: red; /* 활성화된 상태의 색상 */
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
        font-family: "Gmarket Sans", sans-serif;
        font-weight: 500;
        font-size: 12px;
        line-height: 30px;
        text-align: center;
        color: #000000;
      }

      .nebe {
        position: absolute;
        display: flex;
        gap: 950px;
        top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
         z-index: -1;
      }

      .age {
        height: 60px;
        width: 150px;
        background-color: #ffffff;
        border-radius: 10px;
        border: 2px solid #9eb4f9;
        font-family: "Gmarket Sans", sans-serif;
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
        transform: scale(1.1);
        border: 2px solid #7a9bf1;
      }

      .button-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        max-width: 600px;
        column-gap: 100px;
        row-gap: 65px;
      }

      .square3 {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 320px;
      }

      /* Gender selection styles */
      .gender {
        display: flex;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        gap: 120px;
        z-index: 1;
      }


      .margin {
        margin-bottom: 195px;
      }

      /* Theme selection styles */
      .themeImage {
        position: relative;
        width: 150px;
        height: 150px;
        background-size: cover;
        cursor: pointer;
        transition: 0.3s ease-in-out;
      }

      .themeImage::after {
        content: "✔";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 32px;
        color: white;
        background-color: rgba(0, 0, 0, 0.7);
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

      /* Region selection styles */
      .namdo {
        cursor: pointer;
      }

      .namdo:hover {
        background-color: rgb(200, 221, 245);
        transform: scale(1.1);
      }

      .highlight {
        stroke: blue;
        stroke-width: 2px;
        fill: rgba(0, 0, 255, 0.2);
      }
      
      img[usemap] {
       max-width: 67%;
   
       width: auto;
       height: auto;
       margin-top: 130px;
       margin-left: 40px;
   }
   
      /* area 태그 hover 효과 */
      area {
        cursor: pointer;
        transition: all 0.3s ease;
      }

     .area-selected {
          outline: 8px solid #4a90e2 !important;
          outline-offset: 2px;
          transition: outline 0.2s ease-in-out;
      }

      /* 추가된 스타일 */
      .div-container > div {
        display: none;
      }

      .div-container > div.active {
        display: block;
      }

      button {
        /* button 요소에 기본적으로 설정되는 스타일 속성 초기화 */
        border: none;
        outline: none;
        background-color: transparent;
        padding: 0;
        cursor: pointer;
      }

      /* 공통 스타일 */
      input[type="radio"] {
        display: none; /* 기본 라디오 버튼 숨기기 */
      }

      label {
        display: inline-block;
        cursor: pointer;
        margin: 5px;
      }


      /* 글자 스타일 */
      .text-style {
        height: 80px;
       width: 150px;
       padding: 10px 20px;
       border: 2px solid #9eb4f9;
       border-radius: 10px;
       background-color: #ffffff;
       transition: all 0.3s ease;
       display: flex;
       justify-content: center;
       align-items: center;
       font-family: 'Gmarket Sans', sans-serif;
       font-weight: 500;
       font-size: 14px;
       line-height: 30px;
       text-align: center;
       color: #000000;
      }
      
      .text-style:hover {
        background-color: rgb(200, 221, 245);
        transform: scale(1.1);
      }

      input[type="radio"]:checked + .text-style {
        background-color: #7a9bf1;
        color: white;
        border-color: #7a9bf1;
      }

     .photo-style {
        position:relative;
        top: 50px;
     }


      /* 사진 스타일 */
      .photo-style img {
        width: 150px;
        height: 150px;
        border: 4px solid transparent;
        border-radius: 50%;
        transition: border-color 0.3s ease;
      }

      input[type="radio"]:checked + .photo-style img {
         background-color: #3745f9;
      }
      
      /* 성별선택 관련 css */
      .img-gender img{
         width: 200px;
       height: 220px;
       border: 2px solid transparent;
       border-radius: 20px;
       transition: border-color 0.3s ease;
       padding: 15px;
      }
      
      input[type="radio"]:checked + .img-gender img {
        background: linear-gradient(to right, #09d2e757, #c899f28c);
      }
      
      /* 기간선택 관련 css */
      
      /* 라벨 스타일 */
        .date-label {
            padding: 12px 20px;
            border-radius: 30%;
            background: linear-gradient(to right, #16c7fa, #b697f0);
            color: white;
            font-size: 20px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center;
            }

        .date-label:hover {
            background: linear-gradient(to right, #e5ea58, #f8788b);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            transform: scale(1.1);
        }

        input[type="radio"]:checked + .date-label {
            background: linear-gradient(to right, #e5ea58, #f8788b);
            box-shadow: 0 8px 10px rgba(0, 0, 0, 0.3);
            transform: scale(1.05);
            }
      
      /*나이선택 컨테이너*/
      .age-container {
         position:relative;
      display: flex;
       flex-wrap: wrap;
       justify-content: center;
       max-width: 600px;
       column-gap: 80px;
       row-gap: 60px;
       top: 30px;
       
      }
      
      /*타이틀 박스 */
      .titleBox {
         position:absolute;
         width:800px;
         height:200px;
         top: 280px;
       left: 50%;
       transform: translate(-50%, -50%);
       display: flex;
       flex-direction: column;
       justify-content: center;
      }
      
    </style>
    
        <script>
        // Spring MVC에서 전달된 플래시 속성을 확인하고, 있으면 alert로 표시
        <% if (request.getAttribute("planFailMessage") != null) { %>
            alert('<%= request.getAttribute("planFailMessage") %>');
        <% } %>
    </script>
    
    
    
   <!-- <script defer src="js/jquery-3.3.1.min.js"></script> -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://mattstow.com/experiment/responsive-image-maps/jquery.rwdImageMaps.min.js"></script>
    
  </head>
  <body>
     <%
   namdoro member = (namdoro) session.getAttribute("member");
   %>
  
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>

    <form action="plan/call_python_api" method="post">
    <div class="div-container">
      <div class="section-1 active">
        <div class="bg1"></div>

        <div class="square1">
        
        <div class="nebe">
            <button class="before"></button>
            <button type="button" class="next"></button>
          </div>
          
          <div class="age-container">
            <input
              type="radio"
              name="age"
              id="20대"
              value="20"
              class="text-style"
            />
            <label for="20대" class="text-style">20대</label>
            <input
              type="radio"
              name="age"
              id="30대"
              value="30"
              class="text-style"
            />
            <label for="30대" class="text-style">30대</label>
            <input
              type="radio"
              name="age"
              id="40대"
              value="40"
              class="text-style"
            />
            <label for="40대" class="text-style">40대</label>
            <input
              type="radio"
              name="age"
              id="50대"
              value="50"
              class="text-style"
            />
            <label for="50대" class="text-style">50대</label>
          </div>
        </div>

        <div class="square2">

          <div class="bottomStep">
            <div class="stepCir" style="background-color: red;">
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
      <div class="titleBox">
           <div class="themaMain">연령대 선택</div>
           <div class="themaSub">
             남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
           </div>
        </div>
      </div>

      <div class="section-2">
        <div class="bg2"></div>

        <div class="square1">
        
        <div class="nebe">
            <button type="button" class="before"></button>
            <button type="button" class="next"></button>
          </div>
        
          <div class="button-container">
           
            <input 
            type="radio" 
            name="day" 
            id="1day" 
            value="3"/>
            <label for="1day" class="date-label">당일치기</label>

            <input 
            type="radio" 
            name="day" 
            id="2days" 
            value="6"/>
            <label for="2days" class="date-label">1박 2일</label>

     
          </div>
        </div>

        <div class="square2">
          

          <div class="bottomStep">
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir" style="background-color: red;">
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

        <div class="titleBox">
           <div class="themaMain">여행일정 선택</div>
           <div class="themaSub">
             남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
           </div>
        </div>
      </div>

      <div class="section-3">
        <div class="bg3"></div>

        <div class="square1">
        
          <div class="nebe">
            <button type="button" class="before"></button>
            <button type="button" class="next"></button>
          </div>
        
          <div class="gender">
          <input
              type="radio"
              name="gender"
              id="남자"
              value="남"
              class="img-gender"
            />
            <label for="남자" class="img-gender">
               <img alt="남자" src="images/male.png">
            </label>
            <input
              type="radio"
              name="gender"
              id="여자"
              value="여"
              class="img-gender"
            />
            <label for="여자" class="img-gender">
               <img alt="여자" src="images/female.png">
            </label>
          </div>
        </div>

        <div class="square2">
          

          <div class="bottomStep">
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir" style="background-color: red;">
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

        <div class="titleBox">
           <div class="themaMain">성별 선택</div>
           <div class="themaSub">
             남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
           </div>
        </div>
      </div>

      <div class="section-4">
        <div class="bg4"></div>

        <div class="square2">
          

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
            <div class="stepCir" style="background-color: red;">
                <div class="smallCir"></div>
                <div class="stepText">STEP4</div>
            </div>
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP5</div>
            </div>
        </div>
        </div>

        <div class="titleBox">
           <div class="themaMain">여행지 선택</div>
           <div class="themaSub">
             남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
           </div>
        </div>

        <div class="square1">

         <div class="nebe">
            <button type="button" class="before"></button>
            <button type="button" class="next"></button>
          </div>

         <img src="images/imagemap-removebg.png" usemap="#imgmap" alt="Jeonnam Region Map" class="mapimage" width="830" height="750">
         <map id="imgmap" name="imgmap" >
            <area shape="poly" alt="영광군" data-region="영광군" title="" coords="238,104,229,96,229,87,238,74,260,71,267,79,266,91,263,98,269,100,268,112,271,112,277,110,280,116,279,128,286,137,295,134,302,140,308,137,306,128,318,123,323,127,331,131,331,139,325,141,322,141,320,143,322,147,322,153,315,159,308,167,308,170,309,174,309,192,306,197,299,198,294,204,288,206,283,206,280,203,274,205,260,202,243,211,237,207,232,209,227,209,220,211,213,216,211,216,211,207,215,201,211,197,204,202,201,199,190,195,184,186,193,157,203,147,210,144,213,136,215,128,224,108,232,108,239,104,238,103" href="#" />
            <area shape="poly" alt="장성군" data-region="장성군" title="" coords="330,129,329,136,321,142,318,146,321,154,308,168,310,180,323,186,330,193,339,200,347,198,353,187,357,191,366,190,365,182,370,175,372,168,385,166,382,174,389,179,405,186,412,181,433,170,434,165,425,148,427,142,428,129,436,129,439,126,435,119,440,105,450,97,457,94,456,84,450,76,446,70,444,59,440,54,429,50,422,46,417,41,412,42,404,47,385,52,377,59,377,64,381,70,379,76,370,85,369,92,369,96,369,98,365,101,360,103,358,106,355,111,353,113,348,113,345,113,342,114,339,121,337,123,333,126" href="#" />
            <area shape="poly" alt="담양군" data-region="담양군" title="" coords="458,85,456,96,450,97,440,105,432,122,438,126,434,130,429,130,425,146,424,151,432,163,433,169,440,170,447,165,454,165,460,176,467,183,469,193,473,197,469,198,474,206,485,202,493,208,496,214,491,219,490,226,493,232,501,232,519,242,524,237,523,223,518,217,515,205,525,205,531,202,533,201,535,193,525,173,526,166,532,161,527,152,531,142,526,135,520,131,508,131,509,125,513,123,518,119,518,106,517,98,513,97,505,97,501,90,508,85,509,80,511,76,513,71,509,69,506,67,505,54,503,47,497,51,489,51,483,53,485,59,484,64,478,67,473,70,476,79,475,84,471,87,461,87" href="#" />
            <area shape="poly" alt="곡성군" data-region="곡성군" title="" coords="537,141,531,141,527,154,532,161,525,167,524,172,535,196,535,201,542,197,547,199,560,195,566,189,573,204,569,213,571,219,572,235,578,235,581,240,590,244,590,249,596,251,600,258,608,255,612,258,620,265,631,262,633,253,642,252,652,245,654,236,663,222,662,204,662,201,649,200,646,182,656,175,659,176,660,167,657,161,656,156,650,150,651,146,653,142,652,136,645,131,581,97" href="#" />
            <area shape="poly" alt="구례군" data-region="구례군" title="" coords="756,204,752,215,749,220,748,240,735,243,728,254,723,255,717,249,709,240,700,236,690,220,667,203,649,200,647,182,657,175,659,177,661,166,653,154,649,151,651,144,653,143,653,136,678,106,703,106,737,134,759,165" href="#" />
            <area shape="poly" alt="광양시" data-region="광양시" title="" coords="800,332,788,342,782,357,763,366,745,346,747,335,742,349,753,362,741,360,736,347,735,340,726,333,722,324,727,319,725,311,732,301,727,297,727,284,718,277,711,267,716,257,716,247,723,254,728,253,736,243,747,239,750,217,758,203,788,231,787,243,820,274,827,293,817,326" href="#" />
            <area shape="poly" alt="순천시" data-region="순천시" title="" coords="718,393,725,384,723,378,719,375,720,369,727,367,737,369,742,360,736,347,736,338,727,333,721,324,727,319,725,310,732,299,727,295,727,283,717,276,710,267,715,257,717,245,709,239,701,236,690,219,665,201,661,202,663,220,654,237,650,246,645,250,642,253,632,253,629,265,621,267,605,254,600,258,593,251,589,249,590,243,580,239,575,234,571,235,566,241,569,250,563,262,568,270,566,279,563,288,568,293,564,301,559,316,563,321,567,320,570,316,574,316,576,316,576,325,580,329,581,335,589,347,583,353,583,362,593,368,599,366,605,366,612,360,616,360,626,367,631,369,633,378,637,379,643,379,647,384,650,391,663,394,667,400,687,393,696,394,701,386,699,377,704,375,709,380,715,393,719,393" href="#" />
            <area shape="poly" alt="화순군" data-region="화순군" title="" coords="537,326,561,321,559,316,568,291,564,286,567,270,564,260,569,250,566,239,571,233,569,212,574,202,567,190,559,196,547,199,542,198,534,200,533,194,532,201,523,205,514,204,517,217,523,225,524,239,518,242,509,237,498,232,490,231,491,237,481,247,480,255,459,266,450,255,446,261,440,261,441,273,444,274,435,287,429,302,437,308,434,315,432,323,435,329,429,338,431,359,426,365,415,370,411,375,425,376,429,373,438,373,446,379,446,386,453,392,458,399,460,399,466,392,476,387,482,393,495,392,502,394,512,387,515,380,522,375,523,369,524,364,520,349,527,342,534,336" href="#" />
            <area shape="poly" alt="함평군" data-region="함평군" title="" coords="214,216,223,228,230,234,237,248,251,251,251,256,244,258,248,265,253,266,259,269,258,276,254,279,256,291,261,293,268,296,268,300,266,306,271,312,277,312,287,317,292,312,298,313,302,318,312,308,313,300,310,297,309,294,312,290,311,281,309,270,313,253,317,252,325,258,331,254,340,243,336,226,337,220,343,213,342,207,337,205,338,202,338,198,328,191,323,186,309,176,310,191,306,197,297,198,292,204,280,206,280,203,272,204,260,201,243,210,236,207,232,207,222,209,214,214" href="#" />
            <area shape="poly" alt="나주시" data-region="나주시" title="" coords="290,345,283,333,287,316,292,312,297,314,300,317,305,319,307,314,312,308,313,300,309,295,313,290,308,270,313,250,319,250,323,258,333,252,340,243,347,247,376,247,386,261,381,270,392,277,399,273,409,275,424,265,440,262,444,274,430,303,439,309,433,323,437,329,431,339,432,360,427,365,415,369,412,375,404,375,402,377,386,361,376,362,369,365,361,347,352,336,344,336,340,340,347,350,346,361,349,363,344,368,339,362,331,365,328,362,330,358,326,349,313,343,307,349,301,351,303,355,305,359,301,368,300,373,295,377,278,352,275,346,281,345,288,350" href="#" />
            <area shape="poly" alt="진도군" data-region="진도군" title="" coords="155,562,160,562,165,554,159,544,158,541,167,536,179,539,188,549,193,557,195,553,202,552,221,581,218,590,220,600,213,618,203,637,188,646,156,668,113,670,91,635,89,616,100,605,108,592,125,582,141,566,150,556,151,555" href="#" />
            <area shape="poly" alt="해남군" data-region="해남군" title="" coords="227,559,219,555,220,543,202,539,191,538,172,519,175,506,167,500,166,461,172,460,179,438,196,443,208,465,200,474,207,495,218,470,215,465,221,459,246,465,255,487,275,497,282,489,301,500,292,489,298,488,302,481,316,479,327,483,340,474,346,473,348,476,356,478,359,481,356,489,350,504,354,506,350,521,345,522,346,529,356,545,351,553,346,556,350,563,351,570,351,581,349,586,353,594,362,594,371,599,366,606,359,609,353,605,346,620,338,620,323,630,322,646,316,661,316,674,308,675,297,675,290,680,285,687,278,687,278,675,281,663,275,653,263,658,258,657,259,641,266,636,267,629,276,624,273,618,261,616,255,613,257,598,253,588,254,573,258,566,245,567,244,562,248,558,239,555,238,549,230,553,229,552" href="#" />
            <area shape="poly" alt="강진군" data-region="강진군" title="" coords="376,591,370,594,368,598,362,595,351,593,347,586,350,580,348,564,344,555,351,550,354,543,344,528,344,522,349,520,353,506,350,503,355,490,357,480,346,475,343,472,347,459,347,456,339,451,339,450,359,433,366,435,377,436,384,423,389,421,394,423,401,427,406,426,409,439,422,457,421,468,426,481,431,491,430,503,433,507,432,511,425,510,424,518,426,523,430,525,432,536,433,539,432,548,435,551,431,558,421,570,419,582,422,592,419,603,406,603,394,593,398,585,395,559,394,538,391,523,389,522,385,541,381,568,380,578,376,585" href="#" />
            <area shape="poly" alt="장흥군" data-region="장흥군" title="" coords="434,613,419,603,424,591,421,582,421,569,436,550,433,548,434,537,430,524,427,522,424,517,425,509,431,510,434,507,430,502,431,489,422,469,422,457,409,438,407,427,400,427,395,424,403,401,411,393,424,385,423,376,430,372,439,372,446,378,445,385,457,398,463,397,464,391,476,387,482,392,494,391,501,393,497,402,496,405,495,425,497,427,491,431,494,436,493,448,488,451,478,462,475,464,479,475,496,480,507,499,496,507,485,510,490,517,485,523,480,535,483,547,475,556,474,572,470,575,464,574,461,577,463,600,455,606,443,603,437,604,437,607" href="#" />
            <area shape="poly" alt="완도군" data-region="완도군" title="" coords="466,645,464,665,455,665,445,670,436,665,439,673,436,695,430,689,420,700,413,689,401,687,395,688,388,683,390,703,373,704,370,710,351,700,343,687,328,667,331,655,328,644,334,635,350,630,358,631,372,643,378,636,383,630,383,624,396,611,411,608,417,612,421,617,415,622,423,626,438,630,458,635,466,643" href="#" />
            <area shape="poly" alt="보성군" data-region="보성군" title="" coords="508,500,496,480,476,473,474,464,482,458,490,449,494,448,494,435,491,431,498,426,496,424,496,404,502,393,512,386,515,378,522,374,523,360,520,347,533,336,538,325,560,320,560,316,563,320,569,316,572,314,576,317,575,324,579,328,582,337,588,346,583,354,582,361,593,368,599,364,604,364,611,358,617,359,627,367,630,367,634,376,638,378,642,377,647,382,650,390,666,393,668,399,663,400,650,397,655,403,659,408,664,407,666,410,658,419,650,410,637,401,629,400,625,407,611,409,604,419,594,420,591,430,583,436,575,451,572,462,561,471,551,471,543,468,539,468,534,477,526,483,520,487" href="#" />
            <area shape="poly" alt="고흥군" data-region="고흥군" title="" coords="529,608,531,600,527,596,534,587,534,582,540,581,540,562,536,542,544,532,550,520,554,524,559,517,564,499,571,493,575,509,584,502,583,487,586,476,586,470,593,459,609,459,612,474,610,480,622,484,628,463,626,450,619,446,613,454,607,451,602,455,595,452,590,437,591,434,589,431,591,429,595,420,605,419,611,409,625,407,630,400,638,401,650,411,659,418,654,423,650,422,648,426,663,430,658,440,650,446,655,459,673,477,685,484,696,491,699,499,706,526,696,536,688,534,688,533,683,536,673,535,672,530,660,528,652,522,655,528,648,532,643,528,643,533,650,542,658,545,664,544,672,550,674,564,669,571,664,567,660,577,655,575,658,583,652,588,632,588,630,593,636,605,633,608,619,608,609,593,590,591,583,605,582,610,574,615,561,616,552,618,537,612,532,613" href="#" />
            <area shape="poly" alt="영암군" data-region="영암군" title="" coords="234,420,240,422,222,430,209,438,213,446,227,453,248,457,271,466,293,488,298,488,302,480,318,478,327,482,340,474,346,473,346,455,337,449,360,433,377,434,385,423,389,421,395,424,404,397,425,385,423,375,396,374,386,362,376,362,368,365,360,346,352,335,345,335,340,339,346,348,346,358,349,362,344,367,339,362,330,365,329,361,330,358,325,348,312,343,306,348,302,349,304,358,299,367,300,372,295,376,291,402,279,415,275,427,267,428,255,418" href="#" />
            <area shape="poly" alt="무안군" data-region="무안군" title="" coords="183,322,188,314,197,320,204,319,205,310,202,305,221,292,218,281,213,281,204,284,204,276,199,271,202,263,208,262,215,268,217,263,223,261,223,265,231,267,227,282,231,288,235,288,233,281,249,266,254,266,259,270,257,277,254,278,255,291,267,296,264,306,271,311,276,312,285,315,282,332,289,345,289,348,281,343,276,345,293,375,290,403,278,417,275,426,267,429,252,415,251,415,250,405,245,401,245,396,239,392,230,389,225,374,226,368,222,370,221,359,227,355,220,335,222,325,215,313,215,348,207,346,203,350,198,348,195,343,183,342,188,334,184,324" href="#" />
            <area shape="poly" alt="목포시" data-region="목포시" title="" coords="152,387,167,394,174,385,195,388,201,401,208,408,205,418,211,425,234,418,252,415,250,406,244,401,244,397,231,388,220,395,212,389,212,383,205,376,197,378,194,369,204,364,205,358,199,352,192,353,186,348,174,353,180,360,179,368,173,367,173,373,165,376,165,381,153,380,152,383" href="#" />
            <area shape="poly" alt="신안군" data-region="신안군" title="" coords="117,516,123,512,139,508,132,491,132,463,138,447,128,438,126,420,130,412,124,369,136,314,169,289,181,278,191,274,188,268,189,258,201,257,207,251,201,245,206,227,204,210,194,222,177,229,169,222,145,243,122,245,115,225,103,225,84,244,78,244,72,268,95,310,75,324,74,338,67,341,56,340,40,359,31,366,32,375,59,380,80,394,87,419,52,406,36,417,32,415,20,425,12,420,3,434,7,456,15,483,35,497,49,486,57,511,55,524,60,526,56,535,64,541,72,539,75,541,65,557,80,561,93,551,107,522" href="#" />
            <area shape="poly" alt="여수시" data-region="여수시" title="" coords="737,504,725,485,729,470,725,462,742,441,746,437,736,428,729,409,718,410,712,400,720,394,720,391,727,379,718,368,722,366,727,365,738,368,743,357,752,360,743,375,759,388,765,394,769,389,777,388,783,382,797,378,807,379,815,378,824,388,816,423,813,433,815,443,813,449,807,448,802,455,791,459,786,456,780,452,778,444,772,444,767,452,767,462,760,466,759,463,756,464,760,474,768,505,758,507,745,498,742,504" href="#" />
         </map>

            <input
              type="radio"
              name="region"
              id="radio-강진군"
              value="강진군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-강진군" class="text-style" style="display: none;">강진군</label>

            <input
              type="radio"
              name="region"
              id="radio-순천시"
              value="순천시"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-순천시" class="text-style" style="display: none;">순천시</label>
            
            <input
              type="radio"
              name="region"
              id="radio-광양시"
              value="광양시"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-광양시" class="text-style" style="display: none;">광양시</label>
            
            <input
              type="radio"
              name="region"
              id="radio-목포시"
              value="목포시"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-목포시" class="text-style" style="display: none;">목포시</label>
            
            <input
              type="radio"
              name="region"
              id="radio-여수시"
              value="여수시"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-여수시" class="text-style" style="display: none;">여수시</label>
            
            <input
              type="radio"
              name="region"
              id="radio-나주시"
              value="나주시"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-나주시" class="text-style" style="display: none;">나주시</label>
            
            <input
              type="radio"
              name="region"
              id="radio-담양군"
              value="담양군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-담양군" class="text-style" style="display: none;">담양군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-곡성군"
              value="곡성군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-곡성군" class="text-style" style="display: none;">곡성군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-구례군"
              value="구례군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-구례군" class="text-style" style="display: none;">구례군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-고흥군"
              value="고흥군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-고흥군" class="text-style" style="display: none;">고흥군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-보성군"
              value="보성군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-보성군" class="text-style" style="display: none;">보성군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-화순군"
              value="화순군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-화순군" class="text-style" style="display: none;">화순군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-장흥군"
              value="장흥군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-장흥군" class="text-style" style="display: none;">장흥군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-해남군"
              value="해남군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-해남군" class="text-style" style="display: none;">해남군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-영암군"
              value="영암군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-영암군" class="text-style" style="display: none;">영암군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-무안군"
              value="무안군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-무안군" class="text-style" style="display: none;">무안군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-함평군"
              value="함평군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-함평군" class="text-style" style="display: none;">함평군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-영광군"
              value="영광군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-영광군" class="text-style" style="display: none;">영광군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-장성군"
              value="장성군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-장성군" class="text-style" style="display: none;">장성군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-완도군"
              value="완도군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-완도군" class="text-style" style="display: none;">완도군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-진도군"
              value="진도군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-진도군" class="text-style" style="display: none;">진도군</label>
            
            <input
              type="radio"
              name="region"
              id="radio-신안군"
              value="신안군"
              class="text-style"
              style="display: none;"
            />
            <label for="radio-신안군" class="text-style" style="display: none;">신안군</label>

          </div>
      </div>

      <div class="section-5">
        <div class="bg5"></div>

        <div class="square1">
        
          <div class="nebe">
            <button type="button" class="before"></button>
            <button type="submit" class="next2"></button>
          </div>
        
          <input
            type="radio"
            id="photo1"
            name="theme"
            value="산"
            class="photo-style"
          />
          <label for="photo1" class="photo-style">
            <img src="images/mountain.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo2"
            name="theme"
            value="바다"
            class="photo-style"
          />
          <label for="photo2" class="photo-style">
            <img src="images/sea.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo3"
            name="theme"
            value="실내"
            class="photo-style"
          />
          <label for="photo3" class="photo-style">
            <img src="images/indoor.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo4"
            name="theme"
            value="액티비티"
            class="photo-style"
          />
          <label for="photo4" class="photo-style">
            <img src="images/activity.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo5"
            name="theme"
            value="테마파크"
            class="photo-style"
          />
          <label for="photo5" class="photo-style">
            <img src="images/themapark.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo6"
            name="theme"
            value="문화/역사"
            class="photo-style"
          />
          <label for="photo6" class="photo-style">
            <img src="images/culture.png" alt="옵션 3" />
          </label>
        </div>

        <div class="square2">
          <div class="nebe">
          <input type="hidden" name="user_id" value="<%=member.getUser_id()%>">
            <button type="button" class="before"></button>
            <button type="submit" class="next2"></button>
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
            <div class="stepCir" style="background-color: red;">
                <div class="smallCir"></div>
                <div class="stepText">STEP5</div>
            </div>
        </div>
        </div>

        <div class="titleBox">
           <div class="themaMain">여행테마 선택</div>
           <div class="themaSub">
             남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
           </div>
        </div>
      </div>
    </div>

</form>

    <script>
      function toggleActive(button) {
        const buttons = document.querySelectorAll(".age"); // 모든 버튼 선택
        buttons.forEach((btn) => {
          btn.classList.remove("active"); // 다른 버튼의 active 제거
          btn.setAttribute("data-active", "false"); // 속성 초기화
        });

        // 현재 클릭된 버튼에 active 클래스 추가
        button.classList.add("active");
        button.setAttribute("data-active", "true");
      }
    </script>


    <script>
      document.querySelectorAll(".themeImage").forEach((image) => {
        image.addEventListener("click", () => {
          // 모든 이미지에서 클릭 상태 해제
          document
            .querySelectorAll(".themeImage")
            .forEach((img) => img.classList.remove("clicked"));
          // 클릭된 이미지에 클릭 상태 추가
          image.classList.add("clicked");
        });
      });
    </script>

    <script>
      // 화면 전환 함수 수정
      function showDiv(sectionNumber) {
        // 모든 섹션 숨기기
        document.querySelectorAll(".div-container > div").forEach((div) => {
          div.classList.remove("active");
        });

        // 선택된 섹션 보이기
        document.querySelector('.section-'+sectionNumber).classList.add("active");
      }

   // DOM이 로드된 후 이벤트 리스너 추가
      document.addEventListener('DOMContentLoaded', function() {
        // next 버튼 클릭 이벤트 처리
        document.querySelectorAll(".next").forEach((button) => {
          button.addEventListener("click", function(e) {
            e.preventDefault(); // 폼 제출 방지
            const currentSection = this.closest('[class^="section-"]');
            console.log(currentSection)
            
            const currentNumber = parseInt(currentSection.className.match(/section-(\d+)/)[1]);
            console.log(currentNumber)
            if (currentNumber < 5) {
              showDiv(currentNumber + 1);
            }
          });
        });

     // before 버튼 클릭 이벤트 처리
        document.querySelectorAll(".before").forEach((button) => {
          button.addEventListener("click", function(e) {
            e.preventDefault(); // 폼 제출 방지
            const currentSection = this.closest('[class^="section-"]');
            const currentNumber = parseInt(currentSection.className.match(/section-(\d+)/)[1]);
            if (currentNumber > 1) {
              showDiv(currentNumber - 1);
            }
          });
        });
      });
    </script>

    <script>
      function toggleActive(button) {
        const buttons = document.querySelectorAll(".age");
        buttons.forEach((btn) => {
          btn.classList.remove("active");
          btn.setAttribute("data-active", "false");
        });
        button.classList.add("active");
        button.setAttribute("data-active", "true");
      }
    </script>
    
    <script>
       $(document).ready(function () {
          // 반응형 이미지맵 구현
           $("img[usemap]").rwdImageMaps();
         
          // 이미지맵 각 요소 클릭 시 radio input 태그 눌리도록 전달
           document.querySelectorAll('area').forEach(area => {
               area.addEventListener('click', function (event) {
                   const altValue = event.currentTarget.getAttribute('alt'); // 현재 이벤트가 발생한 요소의 alt 속성 가져오기
                   const targetRadio = document.querySelector(`input[type="radio"][value="\${altValue}"]`);
                   console.log(targetRadio); // 디버깅용 콘솔 출력
                   if (targetRadio) {
                       targetRadio.checked = true;
                   }
               });
           });
       });
       
       // area 마우스 hover 및 마우스 클릭 효과 js
       document.addEventListener('DOMContentLoaded', () => {
           let selectedArea = null; // 클릭된 영역을 추적

           // 모든 area 요소를 선택
           const areas = document.querySelectorAll('area');

           areas.forEach(area => {

               // 클릭 효과
               area.addEventListener('click', (event) => {
                   event.preventDefault(); // 링크 기본 동작 방지
                   if (selectedArea) {
                       removeSelectedEffect(selectedArea); // 기존 선택 영역 초기화
                   }
                   selectedArea = area; // 현재 선택된 영역 저장
                   addSelectedEffect(area); // 클릭 효과 추가
               });
           });


           // 선택 효과 추가
           function addSelectedEffect(area) {
               area.classList.add('area-selected');
           }

           // 선택 효과 제거
           function removeSelectedEffect(area) {
               area.classList.remove('area-selected');
           }
       });
   </script>

    <script src="js/footer.js"></script>
  </body>
</html>