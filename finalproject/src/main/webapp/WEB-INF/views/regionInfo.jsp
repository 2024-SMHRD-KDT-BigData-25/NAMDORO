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
            width: 70%;
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
    font-size: 1.2em;  /* 글씨 크기를 1.2em에서 1.5em으로 변경 */
    max-width: 600px;
}

    
    </style>
    
</head>
<body>

    <div id="header"></div>

    <!-- 지역 상세 페이지 -->
    <div class="region-detail-container" id="region-detail-container">
        
        <!-- 주요 관광지 섹션 -->
        <section class="attractions">
            <div class="slider-container">
                <button class="slider-button left" onclick="moveSlide('attractions', -1)">←</button>
                <div class="attractions-images">
                    <img src="img/순천__순천만국가정원.jfif" alt="관광지 1" class="attraction-image">
                    <img src="img/순천_낙안읍성.jfif" alt="관광지 2" class="attraction-image">
                    <img src="img/순천_드라마세트장.jfif" alt="관광지 3" class="attraction-image">
                    <img src="img/순천_선암사.jfif" alt="관광지 4" class="attraction-image">
                    <img src="img/순천_송광사.jfif" alt="관광지 5" class="attraction-image">
                    <img src="img/순천_순천만습지.jfif" alt="관광지 6" class="attraction-image">
                </div>
                <button class="slider-button right" onclick="moveSlide('attractions', 1)">→</button>
            </div>
            <div class="region-description-container">
                <h2>순천</h2>
                <p>살아숨쉬는 생태 수도 전남 순천시. 매년 깊어지는 가을마다 세계 5대 습지이자 철새들의 도래지인 순천만 습지의 갈대밭은 더욱 몽환적인 모습으로 무장한다. 이를 보호하고자 만든 순천만 국가 정원에서는 다양한 생태 식물들을 관찰할 수 있어 또 다른 자연의 아름다움을 느낄 수 있다. 구불구불한 리아스식 해안선을 따라 드라이브할 수 있는 와온해변은 일몰이 아름답기로 유명하며 이곳의 마을에서는 어촌체험도 가능하다. 추억을 떠올리게 하는 순천 드라마 세트장은 60-80년대의 모습을 완벽히 재현하고 있어 떠오르는 관광 명소다.</p>
            </div>
        </section>

        <!-- 대표 음식 및 특산물 섹션 -->
        <section class="representative-food">
            <div class="food-item">
                <div class="slider-container1">
                    <button class="slider-button left" onclick="moveSlide('food', -1)">←</button>
                    <div class="food-images">
                        <img src="img/순천음식_꼬막요리.jpg" alt="대표 음식 1" class="food-image">
                        <img src="img/순천음식_돼지국밥.jpg" alt="대표 음식 2" class="food-image">
                        <img src="img/순천음식_떡갈비(염소떡갈비).jpg" alt="대표 음식 3" class="food-image">
                        <img src="img/순천음식_민물매운탕.jpg" alt="대표 음식 4" class="food-image">
                        <img src="img/순천음식_오리요리.jpg" alt="대표 음식 5" class="food-image">
                        <img src="img/순천음식_짱뚱어탕.jpg" alt="대표 음식 6" class="food-image">
                        <img src="img/순천음식_한정식.jpg" alt="대표 음식 7" class="food-image">
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
                        <img src="/img/순천특산물_고들빼기.png" alt="특산물 1" class="product-image">
                        <img src="/img/순천특산물_단감.jpg" alt="특산물 2" class="product-image">
                        <img src="/img/순천특산물_딸기묘.png" alt="특산물 3" class="product-image">
                        <img src="/img/순천특산물_미나리.png" alt="특산물 4" class="product-image">
                        <img src="/img/순천특산물_배.jpg" alt="특산물 5" class="product-image">
                        <img src="/img/순천특산물_복숭아.jpg" alt="특산물 6" class="product-image">
                        <img src="/img/순천특산물_순천매실.jpg" alt="특산물 7" class="product-image">
                        <img src="/img/순천특산물_순천오이.png" alt="특산물 8" class="product-image">
                        <img src="/img/순천특산물_조기햅쌀.png" alt="특산물 9" class="product-image">
                        <img src="/img/순천특산물_참다래.jpg" alt="특산물 10" class="product-image">
                        <img src="/img/순천특산물_한우.png" alt="특산물 11" class="product-image">
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
            'img/순천__순천만국가정원.jfif',
            'img/순천_낙안읍성.jfif',
            'img/순천_드라마세트장.jfif',
            'img/순천_선암사.jfif',
            'img/순천_송광사.jfif',
            'img/순천_순천만습지.jfif'
        ];

        function moveSlide(section, direction) {
    const images = document.querySelectorAll(`.${section}-images img`);
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
            'img/순천__순천만국가정원.jfif',
            'img/순천_낙안읍성.jfif',
            'img/순천_드라마세트장.jfif',
            'img/순천_선암사.jfif',
            'img/순천_송광사.jfif',
            'img/순천_순천만습지.jfif'
        ];
        regionDetailContainer.style.backgroundImage = `url(${attractionImages[currentIndex[section]]})`;
    }
}

// 초기 상태에서 첫 번째 이미지들만 보이도록 설정
moveSlide('attractions', 0);
moveSlide('food', 0);
moveSlide('product', 0);

    </script>

</body>
</html>
