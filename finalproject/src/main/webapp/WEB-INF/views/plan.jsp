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
        height: 900px;
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
       border: 3px solid #2d3fa254
      }

      .square2 {
        position: absolute;
        border-radius: 20px;
        width: 900px;
        height: 150px;
        top: 798px;
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
            background-color: rgb(200, 221, 245);
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
            background-color: rgb(200, 221, 245);
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
        top: 50px;
        
      }
      
      .themeImage:hover {
    	transform: scale(1.1);
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

      img[usemap] {
   		display: block;
		margin-top: 125px;
    	display: block;
   }
   
      /* area 태그 hover 효과 */
      area {
        cursor: pointer;
        transition: all 0.3s ease;
        position: relative;
      }

     .area-selected {
          outline: 8px solid #4a90e2 !important;
          outline-offset: 2px;
          transition: outline 0.2s ease-in-out;
          color : #2C3E50;
          transform: scale(1.5); /* 요소를 1.5배 확대 */
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
            background-color: #edffff;
      }
      
      /* 기간선택 관련 css */
      
      /* 라벨 스타일 */
        .date-label {
            padding: 12px 20px;
            border-radius: 30%;
            background: linear-gradient(to right, #16c7fa, #faf7ff);
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
            background: linear-gradient(to right, #16c7fa, #faf7ff);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.2);
            transform: scale(1.1);
        }

        input[type="radio"]:checked + .date-label {
            background: linear-gradient(to right, #516bff, #516bff);
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
               <img alt="남자" src="images/남자.png">
            </label>
            <input
              type="radio"
              name="gender"
              id="여자"
              value="여"
              class="img-gender"
            />
            <label for="여자" class="img-gender">
               <img alt="여자" src="images/여자.png">
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

         <img src="images/imagemap-removebg.png" usemap="#imgmap" alt="Jeonnam Region Map" class="mapimage">
		<map id="imgmap" name="imgmap">
			<area shape="poly" alt="영광군" data-region="영광군" title="" coords="127,130,127,123,129,121,127,119,123,122,120,119,115,118,109,111,117,92,126,86,128,82,129,78,134,65,143,62,137,58,138,51,142,43,157,43,161,47,161,52,158,59,162,59,162,65,167,66,169,67,168,77,171,81,178,80,181,82,185,82,185,75,192,73,195,74,198,77,199,77,200,80,199,83,197,85,194,85,193,86,194,89,194,91,186,101,187,112,185,118,181,119,177,122,175,124,172,124,170,124,168,123,165,124,156,122,147,127,142,125,138,127,136,126,133,127" href="" target="" />
			<area shape="poly" alt="장성군" data-region="장성군" title="" coords="204,121,200,117,193,111,187,107,186,100,194,90,195,88,193,86,194,85,197,84,200,82,201,81,200,77,205,73,206,69,208,68,214,68,217,64,218,62,222,61,224,57,223,51,229,44,230,40,227,37,228,33,238,28,245,28,248,24,255,25,257,29,263,32,269,37,268,42,272,47,276,51,274,58,270,60,266,64,263,68,262,72,264,77,263,78,259,79,257,89,263,99,262,102,261,102,254,107,246,109,243,112,237,110,230,105,232,100,227,100,225,102,223,107,221,109,221,114,216,116,213,113,210,117,210,120,206,120" href="" target="" />
			<area shape="poly" alt="담양군" data-region="담양군" title="" coords="278,108,274,101,268,100,262,103,263,99,257,89,259,78,263,78,264,76,262,72,263,67,270,60,275,58,276,51,281,53,287,52,286,42,291,40,293,36,291,33,296,31,299,32,303,29,304,41,308,44,308,46,306,49,307,50,302,54,304,58,310,59,312,61,312,72,310,75,308,75,306,77,308,80,316,81,319,86,317,93,320,96,315,104,323,121,320,122,316,125,312,124,311,127,313,132,316,135,316,143,314,146,312,146,302,140,296,140,295,133,298,130,298,126,292,123,287,124,286,124,283,120,283,118,282,116,280,112,280,109" href="" target="" />
			<area shape="poly" alt="곡성군" data-region="곡성군" title="" coords="330,120,326,119,324,120,316,103,320,96,318,92,320,84,325,84,331,80,338,73,342,72,343,75,347,78,349,78,352,73,356,75,361,79,370,79,375,82,378,80,382,77,390,78,394,81,394,86,393,88,393,91,396,93,396,97,399,101,399,105,398,105,395,106,391,109,391,113,392,118,394,120,399,121,400,136,394,142,394,146,387,152,384,153,382,152,382,157,377,161,371,157,371,155,369,156,366,154,362,156,360,154,360,151,356,150,354,146,352,146,347,140,344,140,345,132,343,128,346,122,344,116,342,115,338,117" href="" target="" />
			<area shape="poly" alt="함평군" data-region="함평군" title="" coords="206,129,207,124,203,122,204,119,193,111,186,107,186,115,184,118,181,119,175,123,171,124,167,122,164,123,156,121,147,126,142,125,139,127,136,126,129,129,131,132,135,138,138,141,143,149,150,150,150,154,146,154,149,160,153,160,155,162,155,165,153,168,153,175,159,177,162,180,161,183,160,186,164,189,165,189,167,189,172,191,175,188,179,188,180,191,183,192,185,187,188,184,188,180,186,178,187,176,188,175,188,169,187,166,188,158,189,152,191,152,195,155,198,155,205,147,203,141,203,134" href="" target="" />
			<area shape="poly" alt="목포시" data-region="목포시" title="" coords="129,255,125,253,124,249,127,246,130,243,124,243,121,242,122,238,117,235,105,233,100,238,92,233,92,231,94,229,96,229,101,230,101,227,104,226,104,221,108,221,109,218,106,214,110,210,113,210,115,213,119,214,123,215,125,218,124,220,119,222,116,224,118,227,125,228,128,230,128,234,128,236,129,237,131,239,139,234,145,236,148,239,148,242,151,243,151,248,151,251,148,252,142,253,136,255" href="" target="" />
			<area shape="poly" alt="무안군" data-region="무안군" title="" coords="164,260,167,257,168,250,176,242,178,226,167,213,168,208,170,208,172,211,175,211,174,209,170,201,173,192,172,191,166,188,164,188,161,186,162,180,159,178,154,175,154,167,156,165,156,163,153,160,149,160,147,165,142,170,142,176,139,174,137,170,138,166,138,161,134,162,134,158,131,159,130,162,127,159,122,161,121,164,123,167,122,170,125,172,128,170,131,170,132,172,133,177,128,180,123,185,124,188,122,193,118,193,114,190,110,193,110,196,114,202,112,206,112,207,118,209,120,212,124,212,127,210,130,209,129,189,130,189,132,194,135,197,133,203,137,215,133,222,137,223,136,227,137,232,138,234,145,236,147,239,147,242,149,243,151,244,152,248,151,251,155,253" href="" target="" />
			<area shape="poly" alt="나주시" data-region="나주시" title="" coords="182,221,180,226,178,226,168,213,169,207,170,207,172,212,175,212,170,200,174,190,175,189,179,189,180,192,183,193,185,187,188,184,188,180,187,178,189,174,188,167,189,152,191,152,196,156,198,156,205,147,209,149,223,148,227,150,232,158,230,163,236,167,239,167,240,164,246,166,255,159,262,159,265,158,266,163,267,166,264,170,263,173,262,177,259,182,262,184,265,187,263,189,263,193,262,195,264,199,260,204,262,216,258,222,255,222,252,223,249,227,243,226,242,227,233,219,227,218,222,220,218,211,215,205,211,202,208,203,206,206,207,208,209,211,209,215,210,217,210,220,208,222,204,220,201,221,196,220,198,216,195,210,189,208,186,212,183,212,183,215,185,215,183,218" href="" target="" />
			<area shape="poly" alt="화순군" data-region="화순군" title="" coords="278,158,272,154,265,157,266,166,263,169,262,177,259,182,265,186,263,188,263,193,261,195,264,199,260,204,262,216,258,222,255,221,251,222,249,226,255,226,260,224,263,224,269,227,268,232,273,235,276,240,281,236,283,235,286,233,290,236,298,236,303,237,307,235,309,233,311,228,313,227,314,225,316,222,315,218,315,216,313,213,313,210,316,205,320,203,323,199,325,195,329,194,333,193,336,192,338,190,340,182,342,177,342,175,341,171,342,166,344,163,342,160,342,157,342,153,343,151,343,148,343,146,343,143,346,140,344,140,345,131,343,128,346,120,343,115,341,115,332,119,325,119,323,120,319,122,316,124,312,124,311,127,313,132,315,135,315,144,314,146,311,146,302,140,297,140,292,146,290,151,286,154,282,157" href="" target="" />
			<area shape="poly" alt="순천시" data-region="순천시" title="" coords="400,121,406,125,414,131,415,131,420,137,425,144,427,144,431,148,430,159,429,164,432,165,437,171,439,180,440,183,437,187,438,192,435,194,436,199,443,204,444,211,448,217,444,222,435,222,433,225,435,229,437,230,435,234,432,237,429,234,428,231,424,225,422,227,422,232,420,236,413,236,402,240,400,236,392,235,389,229,388,228,383,228,380,224,379,221,376,221,373,216,368,216,366,218,364,219,360,220,359,222,350,217,352,213,354,209,351,201,350,199,347,196,347,193,347,191,344,189,341,192,337,192,333,192,337,190,342,176,341,170,342,165,343,163,342,160,342,152,344,150,344,142,346,140,348,140,352,145,355,145,356,150,360,150,360,154,362,155,366,154,368,155,371,155,371,156,376,160,381,157,382,153,383,153,387,152,393,145,394,143,399,136" href="" target="" />
			<area shape="poly" alt="구례군" data-region="구례군" title="" coords="451,142,451,130,456,123,454,117,456,110,454,99,446,90,445,82,425,64,419,62,409,63,401,70,393,80,394,87,393,88,393,90,396,92,396,96,398,101,398,104,394,106,390,108,391,113,391,118,394,120,400,120,413,130,416,130,424,143,429,143,431,148,436,152,439,152,441,148,444,145" href="" target="" />
			<area shape="poly" alt="광양시" data-region="광양시" title="" coords="456,122,461,130,466,132,474,140,473,148,480,155,488,160,492,164,494,169,497,177,494,189,488,196,484,197,484,191,482,188,481,191,482,199,478,204,472,211,461,220,455,214,450,208,450,201,449,202,448,207,448,209,453,218,448,216,444,210,443,203,436,198,435,193,438,191,437,186,440,182,436,171,431,164,429,164,430,153,431,147,435,152,440,152,441,147,444,145,451,142,451,130" href="" target="" />
			<area shape="poly" alt="영암군" data-region="영암군" title="" coords="177,295,160,279,144,275,136,273,128,269,125,265,128,261,135,258,144,256,145,253,151,251,156,254,164,261,167,257,168,250,177,241,178,226,181,225,185,216,183,215,183,212,187,212,190,208,196,210,198,217,196,220,202,222,204,221,207,222,210,220,210,217,209,215,209,211,206,206,208,203,211,202,215,205,222,220,228,219,233,220,242,227,243,227,249,227,250,226,255,226,255,234,252,237,246,240,242,244,239,256,236,256,234,255,231,256,228,264,222,264,219,263,216,262,210,267,205,272,207,274,209,275,211,277,209,280,208,285,204,286,199,289,198,291,194,290,191,289,188,289,182,290" href="" target="" />
			<area shape="poly" alt="강진군" data-region="강진군" title="" coords="225,357,222,358,221,362,217,358,210,358,209,352,209,348,211,347,210,344,209,342,210,339,206,335,209,333,212,329,206,319,207,313,209,313,212,306,210,306,210,302,212,299,212,295,213,294,213,290,214,289,213,288,207,287,207,285,208,279,210,277,206,274,204,272,216,262,221,264,227,264,231,256,234,255,235,257,239,256,244,257,246,267,254,276,254,283,256,292,258,294,259,302,260,307,258,310,256,308,254,313,256,315,258,317,259,322,260,324,260,329,261,331,262,333,260,336,256,340,254,344,252,349,253,353,254,357,253,362,251,365,244,364,240,360,237,358,238,354,238,352,237,342,237,328,236,318,235,315,233,315,232,324,230,340,229,349,226,353" href="" target="" />
			<area shape="poly" alt="장흥군" data-region="장흥군" title="" coords="261,369,251,364,254,356,253,352,251,348,256,339,261,333,262,332,259,327,259,322,258,317,253,312,255,307,257,309,258,307,257,292,255,291,253,281,253,275,245,266,244,257,239,255,241,244,246,239,252,237,255,233,255,225,261,224,265,225,268,226,267,232,272,235,275,238,281,235,285,233,289,236,296,236,301,236,299,241,298,243,296,255,298,257,295,259,296,264,296,268,289,276,284,280,286,287,297,289,300,294,303,301,297,306,291,308,292,310,294,311,292,315,292,318,288,324,289,327,288,330,284,334,284,345,279,346,277,347,278,363,273,365,267,363,262,363,263,366" href="" target="" />
			<area shape="poly" alt="보성군" data-region="보성군" title="" coords="305,302,297,289,287,288,286,280,292,275,295,271,297,270,298,260,294,257,300,256,296,252,298,243,301,242,302,237,307,234,311,227,314,227,316,221,314,216,314,212,313,208,316,204,319,203,325,194,332,192,341,191,344,189,346,191,347,197,350,199,353,208,349,218,359,222,359,221,366,218,367,216,373,216,376,222,379,221,382,228,388,229,391,235,400,237,402,241,398,242,392,239,395,243,400,245,402,247,395,253,389,247,383,242,380,241,377,244,376,246,368,246,366,250,362,254,359,254,355,260,353,262,348,267,346,277,342,283,336,285,329,283,326,282,321,288,313,295" href="" target="" />
			<area shape="poly" alt="여수시" data-region="여수시" title="" coords="438,247,431,248,428,242,430,240,432,239,432,238,432,236,435,233,436,230,435,229,433,224,435,222,443,222,448,217,452,218,450,222,447,224,447,226,450,230,454,233,456,235,458,237,459,239,461,238,463,234,466,235,468,235,472,230,477,230,483,229,484,230,487,230,490,229,493,232,495,235,496,239,493,244,491,251,489,258,489,263,489,270,485,270,484,270,483,272,477,275,475,276,472,273,469,272,469,268,464,266,462,273,460,280,457,280,456,279,455,281,457,287,461,305,458,306,454,304,448,300,445,300,445,304,442,303,437,292,438,287,439,285,438,282,437,280,437,277,446,267,447,267,447,264,445,262,442,260,439,254" href="" target="" />
			<area shape="poly" alt="고흥군" data-region="고흥군" title="" coords="419,296,414,294,406,288,400,282,394,276,392,268,396,265,399,259,390,256,390,255,395,255,395,252,388,246,383,242,379,241,376,244,376,246,368,246,366,250,362,254,359,254,355,260,355,264,358,268,360,273,363,271,366,270,370,272,373,267,377,270,379,279,374,293,367,291,367,287,367,282,365,277,359,277,355,281,354,287,352,292,352,297,352,304,349,306,346,307,344,300,341,300,338,305,338,308,336,314,332,316,330,313,328,318,326,322,323,329,324,337,327,342,336,340,340,337,341,350,336,351,333,354,331,353,327,353,325,351,322,352,321,356,318,360,319,361,319,366,320,368,322,369,323,369,331,372,336,370,342,371,349,369,350,368,350,363,353,357,355,354,363,352,367,357,370,359,374,365,382,364,381,361,378,357,381,354,386,353,391,354,395,352,394,347,395,347,399,347,400,341,403,343,406,341,405,336,405,333,400,328,392,328,388,326,385,319,392,319,394,318,392,314,393,314,397,318,404,320,406,320,408,323,413,323,414,320,416,322,421,321,425,317,421,303,412,302,410,300,413,300,420,300" href="" target="" />
			<area shape="poly" alt="완도군" data-region="완도군" title="" coords="200,401,199,387,200,382,206,381,212,379,217,380,222,385,224,389,227,385,228,382,231,380,231,376,234,373,237,369,244,368,248,366,253,369,253,372,250,374,251,375,254,376,257,378,257,381,258,382,262,379,268,379,272,381,276,382,279,385,280,389,280,391,278,391,275,390,274,390,274,393,270,394,264,394,262,391,259,397,262,400,262,404,264,406,261,409,259,406,258,405,258,408,252,413,250,411,249,410,249,407,247,405,244,404,242,405,239,406,236,404,233,403,227,405,231,405,234,409,233,411,234,415,230,415,226,414,225,414,225,417,224,418,220,416,217,414,213,414,210,412,209,408,212,407,210,406,208,406" href="" target="" />
			<area shape="poly" alt="해남군" data-region="해남군" title="" coords="194,381,198,376,204,373,209,373,214,364,216,364,217,366,221,363,222,360,216,357,211,357,210,348,211,346,210,341,210,339,206,334,209,332,213,326,208,317,208,312,211,310,212,305,210,304,211,299,212,297,213,294,214,289,214,287,207,285,203,286,199,287,198,290,191,288,182,289,178,294,183,299,183,302,181,300,172,295,168,295,167,296,165,298,163,298,153,294,148,281,134,276,130,279,132,283,128,289,128,293,127,297,136,304,143,310,150,315,150,318,139,313,132,306,125,298,121,285,124,281,124,279,120,273,118,267,110,264,107,264,106,267,104,274,102,278,99,284,101,297,103,300,107,303,106,313,115,323,123,325,128,327,131,327,132,333,136,336,139,333,143,331,144,332,145,334,149,336,147,338,149,341,155,341,153,345,152,353,155,359,154,367,156,370,164,371,165,375,161,377,160,382,156,385,156,396,160,395,165,394,167,394,169,400,168,403,168,413,171,413,174,412,177,406,181,406,186,406,190,403,191,398,192,393,194,389" href="" target="" />
			<area shape="poly" alt="신안군" data-region="신안군" title="" coords="117,137,117,134,121,134,123,132,123,138,120,147,121,151,123,152,123,156,117,155,114,156,115,160,113,162,114,165,110,168,106,165,104,166,101,166,97,169,99,173,93,180,89,179,88,177,83,176,83,183,80,183,80,192,79,196,77,198,73,198,71,200,68,205,62,222,72,224,74,228,73,230,70,230,69,231,72,235,71,237,70,238,68,241,66,240,65,239,64,239,64,247,65,250,67,250,69,248,72,247,73,250,75,251,75,254,73,254,74,260,77,265,77,268,81,272,79,282,72,294,74,297,78,297,83,304,82,306,77,309,72,309,70,311,63,310,62,318,55,333,46,337,42,337,42,334,37,325,36,321,37,319,37,318,35,316,34,314,35,313,37,313,36,310,35,308,20,296,19,293,17,292,14,291,13,291,10,287,11,281,12,278,8,276,3,270,3,262,7,256,15,256,17,255,19,253,23,253,27,248,31,247,39,233,38,228,34,227,31,228,26,226,21,227,20,223,23,221,28,215,32,209,37,206,42,207,46,204,46,196,50,196,58,188,59,184,67,180,71,177,70,174,76,172,55,167,52,164,50,162,48,166,44,163,46,160,43,158,44,154,46,149,48,148,51,149,62,137,70,136,64,142,74,149,80,148,87,148,91,151,96,144,103,135,105,135,106,138,113,138,116,141" href="" target="" />
			<area shape="poly" alt="진도군" data-region="진도군" title="" coords="72,395,67,394,67,392,69,390,69,388,67,388,64,390,63,390,60,383,55,375,60,368,62,368,63,368,61,363,73,356,77,356,77,355,77,350,81,347,82,347,83,350,84,350,84,344,86,343,88,343,89,342,88,340,92,337,95,337,96,338,99,334,98,331,97,329,96,327,96,325,98,323,101,322,107,325,113,330,116,334,118,334,119,333,122,333,124,338,127,341,130,347,131,354,128,355,128,356,129,359,128,362,127,364,128,365,128,370,124,373,122,377,120,382,117,382,116,378,115,377,114,376,112,378,110,380,107,385,105,385,103,385,103,383,102,387,96,391,87,392,87,395,83,397,80,395,78,397,74,397,72,394" href="" target="" />
		</map>

            <input
              type="radio"
              name="region"
              id="radio-강진군"
              value="강진군"
              class="text-style"
              style="display: none;"
            />

            <input
              type="radio"
              name="region"
              id="radio-순천시"
              value="순천시"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-광양시"
              value="광양시"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-목포시"
              value="목포시"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-여수시"
              value="여수시"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-나주시"
              value="나주시"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-담양군"
              value="담양군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-곡성군"
              value="곡성군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-구례군"
              value="구례군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-고흥군"
              value="고흥군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-보성군"
              value="보성군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-화순군"
              value="화순군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-장흥군"
              value="장흥군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-해남군"
              value="해남군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-영암군"
              value="영암군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-무안군"
              value="무안군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-함평군"
              value="함평군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-영광군"
              value="영광군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-장성군"
              value="장성군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-완도군"
              value="완도군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-진도군"
              value="진도군"
              class="text-style"
              style="display: none;"
            />
            
            <input
              type="radio"
              name="region"
              id="radio-신안군"
              value="신안군"
              class="text-style"
              style="display: none;"
            />

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
          <label for="photo1" class="themeImage">
            <img src="images/mountain.png" alt="옵션 3" style="height: 150px;"/>
          </label>

          <input
            type="radio"
            id="photo2"
            name="theme"
            value="바다"
            class="photo-style"
          />
          <label for="photo2" class="themeImage">
            <img src="images/sea.png" alt="옵션 3" style="height: 150px;"/>
          </label>

          <input
            type="radio"
            id="photo3"
            name="theme"
            value="실내"
            class="photo-style"
          />
          <label for="photo3" class="themeImage">
            <img src="images/indoor.png" alt="옵션 3" style="height: 150px;"/>
          </label>

          <input
            type="radio"
            id="photo4"
            name="theme"
            value="액티비티"
            class="photo-style"
          />
          <label for="photo4" class="themeImage">
            <img src="images/activity.png" alt="옵션 3" style="height: 150px;"/>
          </label>

          <input
            type="radio"
            id="photo5"
            name="theme"
            value="테마파크"
            class="photo-style"
          />
          <label for="photo5" class="themeImage">
            <img src="images/themapark.png" alt="옵션 3" style="height: 150px;"/>
          </label>

          <input
            type="radio"
            id="photo6"
            name="theme"
            value="문화/역사"
            class="photo-style"
          />
          <label for="photo6" class="themeImage">
            <img src="images/culture.png" alt="옵션 3" style="height: 150px;"/>
          </label>
        </div>

        <div class="square2">
          <div class="nebe">
          <input type="hidden" name="user_id" value="<%=member.getUser_id()%>">
       
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
          //$("img[usemap]").rwdImageMaps();
         
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
            	   console.log("Area clicked:", area);
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
   
   <script>
        // 페이지 로드 후 스크롤을 중간으로 이동
        window.addEventListener("load", function () {
            // 현재 화면 높이와 페이지 전체 높이 계산
            const viewportHeight = window.innerHeight; // 화면 높이
            const totalHeight = document.documentElement.scrollHeight; // 페이지 전체 높이

            // 중간 위치 계산
            const middlePosition = (totalHeight - viewportHeight) / 2;

            // 스크롤 이동
            window.scrollTo({
                top: middlePosition,
                behavior: "smooth" // 부드러운 스크롤 (선택 사항)
            });
        });
    </script>

    <script src="js/footer.js"></script>
  </body>
</html>