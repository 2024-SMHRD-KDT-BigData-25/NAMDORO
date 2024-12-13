<%@page import="com.smhrd.boot.model.region"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지역 상세 페이지</title>
    <link rel="stylesheet" href="styles.css">

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


        /* 지역 상세 페이지 전체 컨테이너 */
        .region-detail-container {
            width: 90%;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
            background-size: cover; /* 배경 이미지를 커버로 설정 */
            background-position: center; /* 배경 이미지 위치 중앙 정렬 */
            position: relative; /* 자식 요소인 ::before를 절대 위치로 배치 */
            z-index: 1; /* 배경과 다른 콘텐츠가 겹치지 않도록 설정 */
            transition: background-image 0.5s ease-in-out;
            top: 150px;
            
        }
    
        /* 배경을 투명하게 하기 위한 ::before 가상 요소 */
        .region-detail-container::before {
            content: ''; /* 가상 요소 */
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.785); /* 배경을 반투명하게 설정 */
            z-index: -1; /* 다른 콘텐츠보다 뒤에 배치 */
        }
    
        /* 지역 헤더 */
        .region-header {
            text-align: center;
            margin-bottom: 30px;
        }
    
        .region-header h1 {
            font-size: 2.5em;
            color: #333;
        }
    
        .region-header .region-description {
            font-size: 1.2em;
            color: #666;
        }
    
        /* 주요 관광지 섹션 */
        .attractions {
            margin-bottom: 40px;
            display: flex;  /* 수평 정렬 */
            justify-content: space-between;
        }
    
        .attractions h2 {
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
        }
    
        /* 왼쪽 관광지 이미지 */
        .slider-container {
            position: relative;
            width: 50%;  /* 관광지 이미지 크기 설정 */
            margin: 0;
            overflow: hidden; /* 한 번에 하나의 이미지만 보이게 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  /* 부드러운 그림자 추가 */
            align-items: center; /* 세로 중앙 정렬 */
            display: flex;
        }

        .slider-container1 {
            position: relative;
            margin: 0;
            overflow: hidden; /* 한 번에 하나의 이미지만 보이게 */
        }
    
        .attractions-images {
            display: flex;
            width: 100%;
            justify-content: center;
        }
    
        .attraction-image {
            width: 100%;
            height: auto;
            border-radius: 8px;
            display: block;
        }
    
        .slider-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            z-index: 10;
        }
    
        .slider-button.left {
            left: 0;
        }
    
        .slider-button.right {
            right: 0;
        }
    
        /* 오른쪽 지역명 및 설명 */
        .region-description-container {
            width: 45%;  /* 오른쪽 영역 크기 설정 */
            padding-left: 20px;
            height: 400px;
            margin-left: 20px;
           
            background: rgba(255, 255, 255, 0.53);
            border-radius: 8px;  /* 모서리를 둥글게 설정 */
            padding: 20px;  /* 내부 여백을 추가하여 텍스트와 이미지 간격을 줌 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  /* 부드러운 그림자 추가 */
        }
    
        /* 대표 음식 및 특산물 섹션 */
        .representative-food, .special-products {
            margin-bottom: 40px;
            display: flex;
            justify-content: space-between;
        }
    
        /* 음식 및 특산물 항목 */
        .food-item, .product-item {
            display: flex;
            align-items: center;
            width: 45%;
            flex-direction: column-reverse;
            height: 60%
        }
        
        .food-images, .product-images {
        	max-width: 300px;
        	max-height: 300px;
        	height: 300px;
        }
    
        /* 음식 사진 스타일 */
        .food-item img, .product-item img {
            width: 200%;
            height: 200%;
            max-width: 300px;  /* 이미지의 최대 너비 */
            max-height: 300px; /* 이미지의 최대 높이 */
            object-fit: contain;  /* 이미지가 잘리지 않게 비율을 유지 */
            object-position: center;  /* 이미지가 중앙에 위치하도록 설정 */
            border-radius: 8px;
        }
    
        .food-item h3, .product-item h3 {
            font-size: 1.8em;
            color: #333;
        }
    
        .food-item p, .product-item p {
            font-size: 1.1em;
            color: #666;
            max-width: 600px;
        }
        .region-description-container p {
		    font-size: 1.1em;
		    max-width: 600px;
		    overflow: auto;
		    height: 300px;
		}

    
    </style>
    
       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    
</head>
<body>

	<% region regionList = (region)request.getAttribute("regionDetail"); 
	String[] cityMainImgArray = regionList.getCITY_MAIN_IMG().split(",");
	String[] foodImage = regionList.getCITY_FOOD_IMG().split(",");
	String[] productImage = regionList.getCITY_PRODUCT_IMG().split(",");
	%>
    <div id="header"></div>

    <!-- 지역 상세 페이지 -->
    <div class="region-detail-container" id="region-detail-container">
        
        <!-- 주요 관광지 섹션 -->
        <section class="attractions">
            <div class="slider-container">
                <button class="slider-button left" onclick="moveSlide('attractions', -1)">←</button>
                <div class="attractions-images">
                <%for(String img : cityMainImgArray) {%>
                    <img src="/boot/tourists/<%=img%>" class="attraction-image">
                    <%} %>
                </div>
                <button class="slider-button right" onclick="moveSlide('attractions', 1)">→</button>
            </div>
            <div class="region-description-container">
                <h2><%=regionList.getCITY_NAME() %></h2>
                <p><%=regionList.getCITY_INFO() %></p>
            </div>
        </section>

        <!-- 대표 음식 및 특산물 섹션 -->
        <section class="representative-food">
            <div class="food-item">
                <div class="slider-container1">
                    <button class="slider-button left" onclick="moveSlide('food', -1)">←</button>
                    <div class="food-images">
                    <%for(String food : foodImage){ %>
                        <img src="/boot/foods/<%=food%>" class="food-image">
                        <%} %>
                    </div>
                    <button class="slider-button right" onclick="moveSlide('food', 1)">→</button>
                </div>
                <div>
                    <h3>대표음식</h3>
                </div>
            </div>

            <div class="product-item">
                <div class="slider-container1">
                    <button class="slider-button left" onclick="moveSlide('product', -1)">←</button>
                    <div class="product-images">
                    <%for(String product : productImage){ %>
                        <img src="/boot/products/<%=product%>" class="product-image">
                        <%} %>
                    </div>
                    <button class="slider-button right" onclick="moveSlide('product', 1)">→</button>
                </div>
                <div>
                    <h3>특산물</h3>
                </div>
            </div>
        </section>

    </div>

    <script src="js/header.js"></script>

    <script>
        let currentIndex = {
            attractions: 0,
            food: 0,
            product: 0
        };  // 각 섹션별 이미지 인덱스

        const attractionImages = [
            <% 
            for (int i = 0; i < cityMainImgArray.length; i++) {
                out.print("'/boot/tourists/" + cityMainImgArray[i] + "'");
                 if (i < cityMainImgArray.length - 1) {
                    out.print(","); // 마지막 요소가 아니면 쉼표 추가
                }
            } 
            %>
        ];

        function moveSlide(section, direction) {
    const images = document.querySelectorAll('.' + section + '-images img');
    const totalImages = images.length;

    currentIndex[section] += direction;

    // 이미지 인덱스가 범위를 벗어나지 않도록 처리
    if (currentIndex[section] < 0) {
        currentIndex[section] = totalImages - 1;  // 첫 번째 이미지로 돌아가기
    } else if (currentIndex[section] >= totalImages) {
        currentIndex[section] = 0;  // 마지막 이미지에서 처음으로 돌아가기
    }

    // 모든 이미지를 숨기고 현재 이미지만 표시
    images.forEach((img, index) => {
        img.style.display = (index === currentIndex[section]) ? "block" : "none";
    });

    // 배경 이미지 변경은 attractions 섹션에서만
    if (section === 'attractions') {
        const regionDetailContainer = document.getElementById("region-detail-container");
        const attractionImages = [
            <% 
            for (int i = 0; i < cityMainImgArray.length; i++) {
                out.print("'/boot/tourists/" + cityMainImgArray[i] + "'");
				 if (i < cityMainImgArray.length - 1) {
                    out.print(","); // 마지막 요소가 아니면 쉼표 추가
                }
            } 
            %>
        ];
        regionDetailContainer.style.backgroundImage = "url(" + attractionImages[currentIndex[section]] + ")";

    }
}

// 초기 상태에서 첫 번째 이미지들만 보이도록 설정
moveSlide('attractions', 0);
moveSlide('food', 0);
moveSlide('product', 0);

    </script>

</body>
</html>
