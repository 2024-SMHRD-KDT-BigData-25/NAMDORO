<%@page import="ch.qos.logback.core.net.SyslogOutputStream"%>
<%@page import="com.smhrd.boot.model.namdoro"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.boot.model.Tour"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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

        body,html {
            background-color: #F4F8FE;
            z-index: -5;
        }

        .bgImg {
            /* background: url(images/tour.png) no-repeat center / 100% 550px;*/
            height: 70%;
            width: 100%;
            position: absolute;
            padding-top: 215px;
            opacity: 0.5;
            z-index: -4;
            background-position: center; /* 가운데 정렬 */
          background-repeat: no-repeat; /* 반복 금지 */
          background-size: cover; /* 화면에 꽉 차도록 설정 */
            transition: background-image 1s ease-in-out; /* 배경 이미지 변경 시 애니메이션 추가 */
        }
        
        .tourImg {
            /* background: url(images/tour.png) no-repeat center / 100% 450px; */
            display: flex; /* 부모 요소를 보이도록 설정 */
            height: 70%;
            width: 55%;
            position: absolute;
          object-fit: cover; /* 비율 유지하며 잘리지 않음 */
        }
        
        .tourImg img {
            width: 95%;
		    height: 100%;
		    object-fit: cover;
		    border-radius: 5px;
		    border: 2px solid #0f1b2685;
		    margin-left: 20px;
      }

        .square1 {
            position: absolute;
            width: 100%;
            height: 610px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 150px;
            z-index: -3;
        }

        .nextBtn {
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM241 377c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l87-87-87-87c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L345 239c9.4 9.4 9.4 24.6 0 33.9L241 377z"/></svg>');
            position: absolute;
            width: 30px;
            height: 50px;
            right: 20%;
            border: none;
            background-color: transparent;
            cursor: pointer;

            background-repeat: no-repeat;
        }

        .beforeBtn {
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M512 256A256 256 0 1 0 0 256a256 256 0 1 0 512 0zM271 135c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-87 87 87 87c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0L167 273c-9.4-9.4-9.4-24.6 0-33.9L271 135z"/></svg>');
            position: absolute;
            width: 30px;
            height: 50px;
            left: 20%;
            border: none;
            background-color: transparent;
            cursor: pointer;

            background-repeat: no-repeat;
        }
        
      .square2 {
          position: absolute;
          width: 70%; /* 부모 컨테이너의 80% 너비 */
          height: 130px; /* 썸네일 높이 */
          top: 90%; /* 부모 컨테이너 기준으로 세로 중앙 정렬 */
          left: 15%; /* 부모 컨테이너 기준으로 가로 중앙 정렬 */
          margin: 20px auto; /* 위아래 간격 추가 및 중앙 정렬 */
          display: flex;
          justify-content: flex-start;
          align-items: center;
          gap: 15px; /* 썸네일 간격 */
          overflow-x: auto; /* 가로 스크롤 활성화 */
          padding: 10px;
          scrollbar-width: thin; /* 스크롤바 최소화 (Firefox) */
      }
      
      .square2::-webkit-scrollbar {
          height: 1px; /* 스크롤바 높이 */
      }
      
      .square2::-webkit-scrollbar-thumb {
          background-color: #c4c4c4;
          border-radius: 10px;
      }
      
      .tour2 img {
          width: 150px; /* 썸네일 너비 */
          height: 100px; /* 썸네일 높이 */
          border-radius: 10px; /* 둥근 모서리 */
          object-fit: cover; /* 비율 유지하며 이미지 크기 조정 */
          cursor: pointer;
          transition: transform 0.3s ease-in-out, border 0.3s ease-in-out;
      }
      
      .tour2 img:hover {
          transform: scale(1.1); /* 마우스 오버 시 확대 */
      }
      
      .tour2 img.selected {
          border: 3px solid black; /* 선택된 이미지에 검은색 테두리 */
      }


        /*.square2 {
            position: absolute;
            width: 1000px;
            height: 130px;
            top: 93%;
            left : 50%;
         transform: translate(-50%);
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 80px;
        }

        .tour2 {
            width: 190px;
            height: 120px;
            border-radius: 20px;
        }*/

        .tour3 {
            background: url(images/tour3.JPG) no-repeat center/cover;
            width: 190px;
            height: 120px;
            border-radius: 20px;
        }

        .tour4 {
            background: url(images/tour4.JPG) no-repeat center/cover;
            width: 190px;
            height: 120px;
            border-radius: 20px;
        }

        .square3 {
            position: absolute;
            width: 900px;
            height: 600px;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(255, 255, 255);
            top: 120%;
            border-radius: 20px;
            padding-top: 50px;
            padding-left: 50px;
            padding-bottom: 40px;
          overflow-y: auto;
          box-sizing: border-box; /* 패딩 포함하여 크기 계산 */
        }
        
        /* 스크롤바 스타일 (선택사항) */
      .square3::-webkit-scrollbar {
          width: 8px; /* 스크롤바 너비 */
      }
      
      .square3::-webkit-scrollbar-thumb {
          background-color: #c4c4c4; /* 스크롤바 색상 */
          border-radius: 4px; /* 스크롤바 둥근 모서리 */
      }
      
      .square3::-webkit-scrollbar-track {
          background-color: #f4f4f4; /* 스크롤바 배경색 */
      }

        .title {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: bold;
         font-size: 24px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
         color: #000000;
        }

        .address {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: 400;
         font-size: 18px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }

        .tel {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: medium;
         font-size: 16px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }

        .hour {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: medium;
         font-size: 16px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }

        .closeDay {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: medium;
         font-size: 16px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }

        .activity {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: medium;
         font-size: 16px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }
        
        .TL_EXP {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: medium;
         font-size: 16px;
         line-height: 30px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }

        
        .reviewWrite {
            position: relative;
            width: 800px;
            height: 90px;
            left: 6%;
            background-color: rgb(229 229 229);
            border-radius: 10px;
            z-index: 2;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 6%;
        }
        
        .reviewBox {
            position: absolute;
            width: 900px;
            height: auto;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(255, 255, 255);
            top: 1550px;
            border-radius: 20px;
            padding-top: 50px;
        }

        .reviewTextBox {
            position: relative;
            padding-top: 5%;
            padding-bottom: 8%;
            border-bottom: 1px solid black;
            border-top: 1px solid #4d4d4d;
           
        }

        .reviewText {
            position: relative;
            word-wrap: break-word;
            word-break: break-all;
            max-width: 80%;

            font-family: 'Gmarket Sans', sans-serif;
	         font-weight: medium;
	         font-size: 16px;
	         line-height: 30px;
	         text-align: left;
            padding-left: 90px;
      
         color: #000000;
        }

        .nick {
            position: relative;

            font-family: 'Gmarket Sans', sans-serif;
            font-weight: 700;
            font-size: 20px;
            line-height: 50px;
            text-align: left;
            padding-left: 75px;
      
         color: #000000;
        }

        .writeDt {
            position: relative;
            font-family: 'Gmarket Sans', sans-serif;
            font-weight: 400;
            font-size: 16px;
            line-height: 50px;
            text-align: left;
            
            color: #000000;
            margin-right: 90px;
        }

        

        .nick, .writeDt {
            display: inline-block;

        }

        .reviewText, .like {
            display: inline-block;
        }

        .niDt {
            position: relative;
            display: flex;
            justify-content: space-between;
        }

        .teLi {
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center; /* 세로 정렬 중앙 정렬 */
            gap: 10px; /* 아이템 간격 */
            margin-top: 20px;
        }

        .like {
            position: relative;
            background: url(images/like.png) no-repeat center / cover;
            width: 18px;
            height: 16px;
        }

        .count {
            font-family: 'Gmarket Sans', sans-serif;
            font-weight: 400;
            font-size: 16px;
            line-height: 30px;
            text-align: left;
            margin-left: 5px; /* like와의 간격 조정 */
            color: #000000;
        }
        
        
        
        </style>

</head>
<body>

<% 
   Tour tourDetail = (Tour)request.getAttribute("tourDetail");
   String[] imgArray;
   Boolean imgYN= false;
   if(tourDetail.getTL_IMG() == null || tourDetail.getTL_IMG().equals("")) {
      imgArray = new String[]{"https://placehold.co/250x250/EFEFEF/6D6D6D?text=No+Image"}; // 대체 이미지 URL
      imgYN = false;
   } else {
      imgArray = tourDetail.getTL_IMG().split(",");
      imgYN = true;
   }
   
   // 로그인 정보 불러오기
   namdoro member = (namdoro) session.getAttribute("member");
   
%>

<jsp:include page="header.jsp"></jsp:include>


    <div class="bgImg"></div>

    <div class="square1">
        <button class="nextBtn"></button>
        <div class="tourImg"></div>
        <button class="beforeBtn"></button>
    </div>

    <div class="square2">
    <% if (imgYN) { 
       for ( String img : imgArray ) {%>
        <div class="tour2"><img src="<%= request.getContextPath() %>/touristimg/<%=img %>"></div>
    <%    } 
    } %>
    </div>
    
    <div class="square3">
     
        <div class="title"><%=tourDetail.getTL_NAME() %></div><br>
        <div class="address"><%=tourDetail.getTL_ADD() %></div><br>
        <div class="tel">문의 및 안내 : <%=tourDetail.getTL_INFO() %></div><br>
        <div class="hour">이용시간 : <%=tourDetail.getTL_HOURS_USE() %></div><br>
        <div class="closeDay">쉬는날 : <%=tourDetail.getTL_DAY_OFF() %></div><br>
        <div class="TL_EXP"><%=tourDetail.getTL_EXP() %></div><br>
        <div class="activity">
                <%=tourDetail.getTL_EXPERIENCE() %>
        </div>
    </div>

    <div class="reviewBox">
        <h2 style="position: relative; left: 65px;">리뷰작성</h2>
        <div class="reviewWrite">
        <form id="reviewForm">
            <input type="text" placeholder="후기를 입력해주세요" name="review" id="review" 
            style="width: 600px;
            height: 40px;
            right: 2%;
            position: relative;
            border-radius: 5px;
            padding-left: 15px;">
            <button onclick="submitReview()">작성</button>
        </form>
        </div>

        <div id="reviewContainer"></div>

    </div>



    <script>
    document.addEventListener('DOMContentLoaded', () => {
        const nextBtn = document.querySelector('.nextBtn');
        const beforeBtn = document.querySelector('.beforeBtn');
        const tourImg = document.querySelector('.tourImg');
        const bgImg = document.querySelector('.bgImg');
        const thumbnails = document.querySelectorAll('.tour2 img');
        const imgYN = <%=imgYN %>;
        let currentIndex = 0;

        // 이미지 업데이트 함수
        function updateTourImage(index) {
            tourImg.innerHTML = ''; // 기존 이미지 제거
            const img = document.createElement('img');
            console.log(imgYN);
            
            if (imgYN) {
               img.src = '<%= request.getContextPath() %>/touristimg/' + thumbnails[index].getAttribute('src').split('/').pop(); // JSP를 통해 경로 삽입
           } else {
              img.src = "https://placehold.co/250x250/EFEFEF/6D6D6D?text=No+Image";
           }
            tourImg.appendChild(img);
            
            // JSP에서 Context Path를 변수로 전달
            const contextPath = '<%= request.getContextPath() %>';
            const encodedFileName = encodeURIComponent(thumbnails[index].getAttribute('src').split('/').pop());
            bgImg.style.backgroundImage = "url('" + contextPath + "/touristimg/" + encodedFileName + "')";
            console.log("url('" + contextPath + "/touristimg/" + encodedFileName + "')");
            
            // 모든 썸네일에서 selected 클래스 제거
            thumbnails.forEach(function (thumbnail) {
                thumbnail.classList.remove('selected');
            });

            // 선택된 썸네일에 selected 클래스 추가
            thumbnails[index].classList.add('selected');
        }

        // 초기 설정
        updateTourImage(currentIndex);

        // 다음 버튼 클릭 이벤트
        nextBtn.addEventListener('click', function () {
            currentIndex = (currentIndex + 1) % thumbnails.length; // 다음 이미지
            updateTourImage(currentIndex);
        });

        // 이전 버튼 클릭 이벤트
        beforeBtn.addEventListener('click', function () {
            currentIndex = (currentIndex - 1 + thumbnails.length) % thumbnails.length; // 이전 이미지
            updateTourImage(currentIndex);
        });

        // 썸네일 클릭 이벤트
        thumbnails.forEach(function (thumbnail, index) {
            thumbnail.addEventListener('click', function () {
                currentIndex = index; // 선택된 썸네일 인덱스 업데이트
                updateTourImage(currentIndex);
            });
        });
        
        // 페이지 로드 시 리뷰 목록 불러오기
        const tl_no = <%= tourDetail.getTL_NO() %>; 
        loadReviews(tl_no);
    });
        </script>
        
        <!-- 리뷰관련 스크립트 -->
        <script>
            // 엔터 키를 눌렀을 때 리뷰 작성
            document.getElementById("review").addEventListener("keydown", function(event) {
                if (event.key === "Enter") {
                    submitReview();  // Enter를 누르면 submitReview() 함수 호출
                }
            });
           
            // 댓글 입력창 클릭 이벤트
            document.getElementById("review").addEventListener("click", function () {
               const isLoggedIn = <%= (member != null) ? "true" : "false" %>;
               // 로그인 세션 정보를 JavaScript로 전달
               console.log(isLoggedIn);
                if (!isLoggedIn) {
                    alert("로그인 후에 댓글을 작성할 수 있습니다.");
                    // 로그인 페이지로 리다이렉트 (예: /login)
                    window.location.href = "<%= request.getContextPath() %>/login";
                }
            });

            function submitReview() {
                // 리뷰 텍스트 가져오기
                const tr_com = document.getElementById("review").value.trim();
                console.log(tr_com);
                if (tr_com === "") {
                    alert("리뷰 내용을 입력해주세요.");
                    return;
                }

                // 게시판 인덱스와 추가 필요한 데이터 가져오기
                const tl_no = '<%= tourDetail.getTL_NO() %>'; // 관광지 ID (예시, JSP 변수)
                const user_id = '<%= (member != null) ? member.getUser_id() : "null" %>'; // 작성자 ID (JSP에서 세션 정보)
            
                // AJAX 요청으로 서버에 데이터 전송
                fetch("<%= request.getContextPath() %>/tours/" + tl_no + "/submitReview", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                       tl_no: tl_no,
                       user_id: user_id,
                       tr_com: tr_com
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        loadReviews(tl_no); // 성공 시 리뷰 리스트 새로고침
                        document.getElementById("review").value = ""; // 입력창 초기화
                    } else {
                        alert("리뷰 작성에 실패했습니다. 다시 시도해주세요.");
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("오류가 발생했습니다. 관리자에게 문의하세요.");
                });
            }
            
            function loadReviews(tl_no) {
                // AJAX 요청으로 서버에서 리뷰 데이터 가져오기
                fetch("<%= request.getContextPath() %>/tours/" + tl_no + "/reviews", {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())
                .then(data => {
                    const reviewContainer = document.getElementById("reviewContainer");
                    reviewContainer.innerHTML = ""; // 기존 리뷰 초기화
                    
                    if (data.reviews && data.reviews.length > 0) {
                        data.reviews.forEach(review => {
                            const reviewBox = document.createElement("div");
                            reviewBox.classList.add("reviewTextBox");
                            
                            // 데이터 검증 및 기본값 처리
                            const userId = review.user_id || "익명";
                            const reviewText = review.tr_com || "내용 없음";
                            const rawDate = review.created_at || null;
                            
                            console.log(userId);
                            console.log(rawDate);
                            
                            // 날짜 포맷팅
                            const date = new Date(review.created_at);
                            const formattedDate = date.getFullYear() + '-' + 
                                     String(date.getMonth() + 1).padStart(2, '0') + '-' + 
                                     String(date.getDate()).padStart(2, '0') + ' ' + 
                                     String(date.getHours()).padStart(2, '0') + ':' + 
                                     String(date.getMinutes()).padStart(2, '0') + ':' + 
                                     String(date.getSeconds()).padStart(2, '0');
                            
                            reviewBox.innerHTML = `
                                <div class="niDt">
                                    <div class="nick">\${review.user_nickname}</div>
                                    <div class="writeDt">\${formattedDate}</div>
                                </div>
                                <div class="teLi">
                                    <div class="reviewText">\${review.tr_com}</div>
                                </div>
                            `;
                            
                            reviewContainer.appendChild(reviewBox);
                        });
                    } else {
                        reviewContainer.innerHTML = "<div style='text-align: center; padding: 20px;'>아직 리뷰가 없습니다. 첫 리뷰를 작성해보세요!</div>";
                    }
                })
                .catch(error => {
                    console.error("Error:", error);
                    alert("리뷰를 불러오는 중 오류가 발생했습니다.");
                });
            }
        </script>
        
    
    
</body>
</html>