<%@page import="com.smhrd.boot.model.region"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <style>
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

      .mainBg {
        position: absolute;
        width: 660px;
        height: 400px;
        top: 140px;
        left: 790px;
        border-radius: 20px;
        background: url("images/main.png") no-repeat center/cover;
        outline: outset 5px #d4d4d4
      }

      .hover-text {
        position: absolute;
        width: 100%;
        height: 200px;
        background: rgba(0, 0, 0, 0.5);
        color: white;
        font-size: 24px;
        display: flex;
        justify-content: center;
        align-items: center;
        opacity: 0;
        transition: opacity 0.3s ease;
        border-radius: 20px;
      }

      .main:hover .hover-text {
        color: white;
        opacity: 1;
      }

      .mainTitle {
        position: absolute;
        height: 35px;
        top: 250px;
        left: 350px;
        transform: translate(-50%, -50%);
        font-family: "Gmarket Sans", sans-serif;
        font-weight: 500;
        font-size: 36px;
        line-height: 50px;
        color: #000000;
      }

      .mainTitle .line1 {
        display: block;
        width: 450px;
        text-align: left;
      }

      .mainTitle .line2 {
        display: block;
        width: 510px;
        text-align: left;
      }

      .subTitle {
        position: absolute;
        width: 400px;
        height: 35px;
        top: 360px;
        left: 300px;
        transform: translate(-50%, -50%);
        font-family: "Gmarket Sans", sans-serif;
        font-weight: 400;
        font-size: 15px;
        line-height: 35px;
        text-align: left;
        color: #000000;
      }

      .review2 {
        position: absolute;
        width: 300px;
        height: 200px;
        top: 1080px;
        left: 790px;
        border-radius: 20px;
        background: url("images/순천.png") no-repeat center/cover;
      }

      .review1 {
        position: absolute;
        width: 300px;
        height: 200px;
        top: 1080px;
        left: 70px;
        border-radius: 20px;
        background: url("images/순천.png") no-repeat center/cover;
        overflow: hidden;
      }

      .margin {
        margin-bottom: 50%;
      }

      /* Swiper 스타일 수정 */
      .swiper-container {
        /* 스위퍼 컨테이너의 위치를 위로 올리려면:
        1. position을 absolute로 변경
        2. top 속성으로 원하는 위치 지정 */
        position: absolute;
        top: 600px; /* 이 값을 조절하여 위치 변경 */
        width: 100%;
        max-width: 1380px;
        height: 330px;
        margin: 0 auto;
        overflow: hidden;
        left: 50%;
        transform: translateX(-50%);
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        display: flex;
        justify-content: center;
        align-items: center;
        width: 300px !important;
      }

      .swiper-slide .main {
        width: 100%;
        height: 200px;
        border-radius: 20px;
        overflow: hidden;
        cursor: pointer;
      }

      .swiper-button-next,
      .swiper-button-prev {
        color:black;
      }

      .swiper-button-next {
        right: 0;
      }

      .swiper-button-prev {
        left: 0;
      }

      .swiper-pagination {
        position: absolute;
        bottom: 10px;
      }
      
          /* 팝업 스타일 */
        #popup-container {
            display: none; /* 초기에는 숨김 */
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 1000px;
            height: 600px;
            border: 1px solid #ccc;
            background-color: #fff;
            z-index: 1000;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        /* 어두운 배경 */
        #overlay {
            display: none; /* 초기에는 숨김 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

      
      
      
      
    </style>

    <!-- Swiper CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  </head>
  <body>
  
  <% List<region> regionList = (List<region>)request.getAttribute("region"); %>
  
  
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>

    <div class="margin"></div>

    <div>
      <div class="mainBg"></div>

      <!-- Swiper 컨테이너 -->
      <div class="swiper-container">
        <div class="swiper-wrapper">
        
        <%for(region r : regionList) {%>
        
          <div class="swiper-slide" onclick="openPopup('<%=r.getCITY_NAME()%>')">
            <div
              class="main"
              style="background: url('tourists/<%=r.getCITY_MAIN_IMG().split(",")[0] %>') no-repeat center/cover"
            >
              <div class="hover-text"><%=r.getCITY_NAME() %></div>
            </div>
          </div>
          <%} %>

        </div>
        <div class="swiper-pagination" style="bottom: 25%;"></div>
      </div>

        <div class="swiper-button-next" style="color: black; top: 96%; "></div>
        <div class="swiper-button-prev" style="color: black; top: 96%; "></div>

      <div>
        <div class="mainTitle">
          <span class="line1">남도로, 전라남도의 매력을</span>
          <span class="line2">당신에게 딱 맞게 추천합니다.</span>
        </div>
        <div class="subTitle">
          아름다운 자연과 풍부한 문화유산이 어우러진 전라남도에서 특별한 여행의
          순간을 만나보세요.
        </div>
      </div>
      
    </div>
    
    	        <!-- 어두운 배경 -->
    <div id="overlay"></div>

    <!-- 팝업 형태의 iframe -->
    <div id="popup-container">
        <button onclick="closePopup()" style="position: absolute; top: 15px; right: 30px; z-index: 10; background: url('/boot/images/닫기.png') no-repeat center/cover; width:30px; height:30px; cursor: pointer;"></button>
        <iframe id="popup-iframe" width="100%" height="100%" frameborder="0"></iframe>
    </div>
    
    <script>
    
 // 팝업 열기
    function openPopup(name) {
        const popupContainer = document.getElementById('popup-container');
        const overlay = document.getElementById('overlay');
        const iframe = document.getElementById('popup-iframe');

        // iframe에 URL 설정
        iframe.src = 'region/' + encodeURIComponent(name); // 안전하게 URL 인코딩

        // 팝업과 배경 표시
        popupContainer.style.display = 'block';
        overlay.style.display = 'block';
    }

    // 팝업 닫기
    function closePopup() {
        const popupContainer = document.getElementById('popup-container');
        const overlay = document.getElementById('overlay');
        const iframe = document.getElementById('popup-iframe');

        // 팝업과 배경 숨기기
        popupContainer.style.display = 'none';
        overlay.style.display = 'none';

        // iframe URL 초기화 (선택)
        iframe.src = '';
    }
</script>


    <script>
      var swiper = new Swiper(".swiper-container", {
        slidesPerView: 4,
        slidesPerGroup: 1,
        spaceBetween: 60,
        loop: true,
        centeredSlides: false,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
  </body>
</html>
