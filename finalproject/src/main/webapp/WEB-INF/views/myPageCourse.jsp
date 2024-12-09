<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>나의 여행지 추천 상세 페이지</title>

    <style>
      body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }

      .content {
        width: 40%;
        max-width: 1200px;
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
      }

      .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        border-bottom: 2px solid #f0f0f0;
        padding-bottom: 15px;
      }

      .header h2 {
        margin: 0;
        font-size: 32px;
        color: #333;
        font-weight: 600;
      }

      .user-info {
        font-size: 16px;
        color: #555;
      }

      .trip-info {
        margin: 20px 0;
      }

      .trip-info h3 {
        font-size: 24px;
        color: #444;
        margin-bottom: 10px;
      }

      .trip-info .details {
        display: flex;
        justify-content: space-between;
        font-size: 16px;
        color: #777;
      }

      .itinerary {
        margin-top: 40px;
      }

      .itinerary h3 {
        font-size: 24px;
        color: #444;
        margin-bottom: 15px;
      }

      .day {
        margin: 15px 0;
        padding: 15px;
        background-color: #f8f8f8;
        border-radius: 8px;
        border-left: 5px solid rgb(210, 233, 255);
        cursor: pointer;
        transition: all 0.3s ease;
      }

      .day h4 {
        margin: 0;
        font-size: 20px;
        color: #333;
        font-weight: 600;
      }

      .day p {
        margin: 5px 0;
        font-size: 16px;
        color: #555;
      }

      /* Hover effect on day class */
      .day:hover {
        background-color: rgb(210, 233, 255); /* 배경색 변경 */
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
        border-left: 5px solid rgb(163, 208, 249); /* 왼쪽 경계선 색상 변경 */
      }

      .image-gallery {
        margin-top: 30px;
        display: flex;
        justify-content: space-between;
        gap: 15px;
      }

      .image-gallery img {
        width: 32%;
        height: 250px;
        object-fit: cover;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .footer {
        margin-top: 40px;
        text-align: center;
        font-size: 14px;
        color: #777;
      }

      .button {
        background-color: rgb(210, 233, 255);
        color: rgb(0, 0, 0);
        padding: 12px 30px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s ease;
      }

      .button:hover {
        background-color: rgb(163, 208, 249);
      }

      /* Responsive Design */
      @media screen and (max-width: 768px) {
        .content {
          width: 90%;
          padding: 20px;
        }

        .header h2 {
          font-size: 28px;
        }

        .image-gallery {
          flex-direction: column;
          align-items: center;
        }

        .image-gallery img {
          width: 80%;
          margin-bottom: 15px;
        }
      }
    </style>
  </head>
  <body>
    <div class="content">
      <!-- Header with nickname and travel details -->
      <div class="header">
        <h2>나의 여행지 상세 페이지</h2>
        <div class="user-info">
          <p><strong>닉네임:</strong> 사용자이름</p>
        </div>
      </div>

      <!-- Trip Information -->
      <div class="trip-info">
        <h3>여행지 정보</h3>
        <div class="details">
          <div>
            <p><strong>지역 : </strong> 순천</p>
            <p><strong>여행 기간 : </strong>1박 2일</p>
            <p><strong>여행 스타일 : </strong> 가족 여행</p>
            <p><strong>추천 활동 : </strong> 관광, 음식 체험</p>
          </div>
        </div>
      </div>

      <!-- Itinerary -->
      <div class="itinerary">
        <h3>여행 일정</h3>
        <div class="day" id="day1">
          <h4>1일차</h4>
          <p>순천만 국가정원 탐방</p>
          <p>순천만 습지 탐방</p>
          <p>순천 시내 맛집 탐방</p>
        </div>
        <div class="day" id="day2">
          <h4>2일차</h4>
          <p>여수 해상케이블카 탑승</p>
          <p>여수 바다낚시 체험</p>
          <p>여수 돌산 갓김치 먹기</p>
        </div>
      </div>

      <!-- Image Gallery -->
      <div class="image-gallery">
        <img src="https://via.placeholder.com/600x400?text=순천만+국가정원" alt="여행지 이미지 1" id="image1" />
        <img src="https://via.placeholder.com/600x400?text=순천만+습지" alt="여행지 이미지 2" id="image2" />
        <img src="https://via.placeholder.com/600x400?text=순천+시내+맛집" alt="여행지 이미지 3" id="image3" />
      </div>

      <!-- Footer with 'Go Back' button -->
      <div class="footer">
        <button class="button">돌아가기</button>
      </div>
    </div>

    <script>
      // 이미지들을 저장한 배열
      const images = {
        day1: [
          "https://via.placeholder.com/600x400?text=순천만+국가정원",
          "https://via.placeholder.com/600x400?text=순천만+습지",
          "https://via.placeholder.com/600x400?text=순천+시내+맛집"
        ],
        day2: [
          "https://via.placeholder.com/600x400?text=여수+해상케이블카",
          "https://via.placeholder.com/600x400?text=여수+바다낚시",
          "https://via.placeholder.com/600x400?text=여수+돌산+갓김치"
        ]
      };

      // 처음 로드 시 1일차 이미지로 설정
      document.getElementById('image1').src = images.day1[0];
      document.getElementById('image2').src = images.day1[1];
      document.getElementById('image3').src = images.day1[2];

      // day1과 day2 클릭 이벤트 핸들러
      document.getElementById('day1').addEventListener('click', function () {
        document.getElementById('image1').src = images.day1[0];
        document.getElementById('image2').src = images.day1[1];
        document.getElementById('image3').src = images.day1[2];
      });

      document.getElementById('day2').addEventListener('click', function () {
        document.getElementById('image1').src = images.day2[0];
        document.getElementById('image2').src = images.day2[1];
        document.getElementById('image3').src = images.day2[2];
      });
    </script>
  </body>
</html>
