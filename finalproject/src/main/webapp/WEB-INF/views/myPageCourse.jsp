<%@page import="com.smhrd.boot.model.Tour"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.boot.model.namdoro"%>
<%@page import="com.smhrd.boot.model.plan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>나의 여행지 추천 상세 페이지</title>

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
            font-weight: 500;
        }

        @font-face {
            font-family: 'Gmarket Sans';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff') format('woff');
            font-style: normal;
            font-weight: 700;
        }
    
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
        margin-top: 100px;
        margin-bottom: 100px;
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
  
  <jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
  
  <%
  plan res =  (plan)request.getAttribute("res");
  namdoro member = (namdoro)session.getAttribute("member"); 
  
  List<Tour> tourlist = (List<Tour>)request.getAttribute("tourlist");
  
  String spot1 = "https://placehold.co/195x250/EFEFEF/6D6D6D?text=No+Image";
  String spot2 = "https://placehold.co/195x250/EFEFEF/6D6D6D?text=No+Image";
  String spot3 = "https://placehold.co/195x250/EFEFEF/6D6D6D?text=No+Image";
  String spot4 = "https://placehold.co/195x250/EFEFEF/6D6D6D?text=No+Image";
  String spot5 = "https://placehold.co/195x250/EFEFEF/6D6D6D?text=No+Image";
  String spot6 = "https://placehold.co/195x250/EFEFEF/6D6D6D?text=No+Image";
  
  
  for (int i = 0; i < tourlist.size(); i++) {
	    if (res.getCP_SPOT1().equals(tourlist.get(i).getTL_NAME())) {
	        String[] imgArray = tourlist.get(i).getTL_IMG().split(",");
	        if (imgArray.length > 0 && imgArray[0] != null && !imgArray[0].isEmpty()) {
	            spot1 = "../touristimg/" + imgArray[0];
	        }
	        break;
	    }
	}
  
  for (int i = 0; i < tourlist.size(); i++) {
	    if (res.getCP_SPOT2().equals(tourlist.get(i).getTL_NAME())) {
	        String[] imgArray = tourlist.get(i).getTL_IMG().split(",");
	        if (imgArray.length > 0 && imgArray[0] != null && !imgArray[0].isEmpty()) {
	            spot2 = "../touristimg/" + imgArray[0];
	        }
	        break;
	    }
	}
  
  for (int i = 0; i < tourlist.size(); i++) {
	    if (res.getCP_SPOT3().equals(tourlist.get(i).getTL_NAME())) {
	        String[] imgArray = tourlist.get(i).getTL_IMG().split(",");
	        if (imgArray.length > 0 && imgArray[0] != null && !imgArray[0].isEmpty()) {
	            spot3 = "../touristimg/" + imgArray[0];
	        }
	        break;
	    }
	}
  
  if (res.getCP_SPOT4() != null) {

	    for (int i = 0; i < tourlist.size(); i++) {
	        if (res.getCP_SPOT4().equals(tourlist.get(i).getTL_NAME())) {
	            String[] imgArray = tourlist.get(i).getTL_IMG().split(",");
	            if (imgArray.length > 0 && imgArray[0] != null && !imgArray[0].isEmpty()) {
	                spot4 = "../touristimg/" + imgArray[0];
	            }
	            break;
	        }
	    }
	}
  
  
  if (res.getCP_SPOT5() != null) {

	    for (int i = 0; i < tourlist.size(); i++) {
	        if (res.getCP_SPOT5().equals(tourlist.get(i).getTL_NAME())) {
	            String[] imgArray = tourlist.get(i).getTL_IMG().split(",");
	            if (imgArray.length > 0 && imgArray[0] != null && !imgArray[0].isEmpty()) {
	                spot5 = "../touristimg/" + imgArray[0];
	            }
	            break;
	        }
	    }
	}
  
  if (res.getCP_SPOT6() != null) {

	    for (int i = 0; i < tourlist.size(); i++) {
	        if (res.getCP_SPOT6().equals(tourlist.get(i).getTL_NAME())) {
	            String[] imgArray = tourlist.get(i).getTL_IMG().split(",");
	            if (imgArray.length > 0 && imgArray[0] != null && !imgArray[0].isEmpty()) {
	                spot6 = "../touristimg/" + imgArray[0];
	            }
	            break;
	        }
	    }
	}
  System.out.println(spot1);
  System.out.println(spot2);
  System.out.println(spot3);
  System.out.println(spot4);
  System.out.println(spot5);
  System.out.println(spot6);
  %>
    <div class="content">
      <!-- Header with nickname and travel details -->
      <div class="header">
        <h2>나의 여행지 상세 페이지</h2>
        <div class="user-info">
          <p><strong>닉네임:</strong> <%= member.getUser_nickname()%></p>
        </div>
      </div>

      <!-- Trip Information -->
      <div class="trip-info">
        <h3>여행지 정보</h3>
        <div class="details">
          <div>
            <p><strong>지역 : </strong> <%=res.getCP_REGION() %></p>
            <%if(res.getCP_DATE()==3){ %>
            <p><strong>여행 기간 : </strong>당일 여행</p>
            <%}else{ %>
            <p><strong>여행 기간 : </strong>1박 2일</p>
            <%} %>
            <p><strong>여행 테마 : </strong><%=res.getCP_THEME() %></p>
            <!-- <p><strong>추천 활동 : </strong> 관광, 음식 체험</p> -->
          </div>
        </div>
      </div>

      <!-- Itinerary -->
      <div class="itinerary">
        <h3>여행 일정</h3>
        <%if(res.getCP_SPOT1() != null){ %>
        <div class="day" id="day1">
          <h4>1일차</h4>
          <p><%= res.getCP_SPOT1()%></p>
          <p><%= res.getCP_SPOT2()%></p>
          <p><%= res.getCP_SPOT3()%></p>
        </div>
        <%} %>
        <%if(res.getCP_SPOT4() != null) {%>
        <div class="day" id="day2">
          <h4>2일차</h4>
          <p><%= res.getCP_SPOT4()%></p>
          <p><%= res.getCP_SPOT5()%></p>
          <p><%= res.getCP_SPOT6()%></p>
        </div>
        <%} %>
      </div>

      <!-- Image Gallery -->
      <div class="image-gallery">
        <img src="https://via.placeholder.com/600x400?text=순천만+국가정원" alt="여행지 이미지 1" id="image1" />
        <img src="https://via.placeholder.com/600x400?text=순천만+습지" alt="여행지 이미지 2" id="image2" />
        <img src="https://via.placeholder.com/600x400?text=순천+시내+맛집" alt="여행지 이미지 3" id="image3" />
      </div>

      <!-- Footer with 'Go Back' button -->
      <div class="footer">
        <button class="button" onclick="history.back()">돌아가기</button>
      </div>
    </div>

    <script>
    
    let spot1 = "<%=spot1%>"
    let spot2 = "<%=spot2%>"
    let spot3 = "<%=spot3%>"
    let spot4 = "<%=spot4%>"
    let spot5 = "<%=spot5%>"
    let spot6 = "<%=spot6%>"
    
    console.log(spot1)
    console.log(spot2)
    console.log(spot3)
    console.log(spot4)
    console.log(spot5)
    console.log(spot6)
      // 이미지들을 저장한 배열
      const images = {
        day1: [
          spot1,
          spot2,
          spot3
        ],
        day2: [
          spot4,
          spot5,
          spot6
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
