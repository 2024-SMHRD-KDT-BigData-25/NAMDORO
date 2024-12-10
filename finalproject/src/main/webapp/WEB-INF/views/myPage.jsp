<%@page import="com.smhrd.boot.model.namdoro"%>
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
      body {
        display: flex;
        justify-content: center;
        min-height: 140vh;
        margin: 0;
      }

      .mypage {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .nick {
        display: flex;
        justify-content: space-around;
        width: 100%;
        border-bottom: 2px solid #ddd;
        padding-top: 100px;
        padding-bottom: 10px;
      }

      .nickname {
	font-size: 30px;
}

      .plan {
        width: 550px;
        height: 550px;
        padding: 16px 24px 96px 24px;
        margin-top: 40px;
      }

      .a {
        width: 332px;
        height: 30px;
      }

      .b {
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-bottom: 16px;
        padding-top: inherit;
        border-bottom: outset;
        padding-bottom: 21px;
      }

      .vertical-bar {
        height: 30px;
        width: 1px;
        background-color: #ddd;
      }

      .profile-actions {
        display: flex;
        flex-direction: column;
        text-align: right;
      }

      .profile-actions a:hover {
        text-decoration: underline;
      }

      .banner {
        display: none;
        padding: 16px;
        background-color: #fafafa;
        margin-top: 16px;
        border: 1px solid #ddd;
        min-height: 130px; /* 컨텐츠가 적어도 일정한 크기 유지 */
      }

      .active {
        display: block;
      }

      .button {
        background-color: transparent;
        border: transparent;
        cursor: pointer;
        transition: all 0.3s ease;
        font-size: 18px;
        padding: 10px 70px;
      }

      .button:hover,
      .button.active {
        color: #000000;
        background-color: rgb(210, 233, 255);
        border-radius: 5px;
      }

      .banner-content {
        display: flex;
        justify-content: space-evenly;
        align-items: center;
        border-bottom: groove;
        padding: inherit;
      }

      .banner-image {
        width: 100px;
        height: 100px;
        background-size: cover;
        background-position: center;
        border-radius: 8px;
      }

      .banner-details {
        display: flex;
        flex-direction: column;
        margin-left: 16px;
      }

      .banner-details h3 {
        margin: 0;
        font-size: 18px;
      }

      .banner-details p {
        margin: 4px 0;
      }

      .pagination {
        display: flex;
        justify-content: center;
        margin-top: 16px;
      }

      .pagination button {
        background-color: transparent;
        border: 1px solid #ddd;
        margin: 0 5px;
        padding: 8px 16px;
        cursor: pointer;
      }

      .pagination button:hover {
        background-color: rgb(210, 233, 255);
      }

      .pagination .active {
        background-color: rgb(210, 233, 255);
        font-weight: bold;
      }

      .button1 {
	text-decoration: none;
	color: #3498db; /* 기본 색상 */
	font-weight: 600; /* 글자 두께 */
	transition: color 0.3s, transform 0.3s;
}

.button2 {
	border: none;
	background-color: transparent;
	cursor: pointer;
	font-size: 12px;
	color: gray; /* 글자 색 */
}
    </style>
  </head>
  <body>
    <%namdoro member = (namdoro)session.getAttribute("member"); %>
    <div class="mypage">
      <div class="nick">
        <h2 class="nickname"><%=member.getUser_nickname() %>님</h2>
        <div class="profile-actions">
          <a class="button1" href="#">회원정보 수정</a> <a class="button1"
            href="logout">로그아웃</a> <a class="button2"
            onclick="deleteMember('<%=member.getUser_id()%>')">회원탈퇴</a>
        </div>
      </div>

      <div class="plan">
        <div class="a">
          <h2>나의 일정</h2>
        </div>

        <div class="b">
          <button class="button" id="allButton" onclick="showBanner('all')">전체 일정</button>
          <div class="vertical-bar"></div>
          <button class="button" id="sharedButton" onclick="showBanner('shared')">공유된 일정</button>
        </div>

        <div id="all-banner" class="banner active">
          <div class="banner-content" data-index="0">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 순천</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
          <div class="banner-content" data-index="1">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 여수</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
          <div class="banner-content" data-index="2">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 고흥</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
          <div class="banner-content" data-index="3">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 나주</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
          <div class="banner-content" data-index="4">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 진도</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
        </div>

        <div id="shared-banner" class="banner">
          <div class="banner-content" data-index="0">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 여수</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
          <div class="banner-content" data-index="1">
            <div class="banner-image" style="background-image: url('https://via.placeholder.com/200');"></div>
            <div class="banner-details">
              <h3>여행 지역 : 고흥</h3>
              <p>여행 기간: 2024년 12월 1일 ~ 2024년 12월 7일</p>
            </div>
          </div>
        </div>

        <div class="pagination">
          <button id="prevPage" onclick="changePage('prev')">이전</button>
          <button id="nextPage" onclick="changePage('next')">다음</button>
        </div>
      </div>
    </div>
	<script>
      let currentPage = 0;
      const bannersPerPage = 3;

      function showBanner(type) {
        // 모든 배너를 숨긴다
        document.getElementById('all-banner').classList.remove('active');
        document.getElementById('shared-banner').classList.remove('active');

        // 선택된 배너만 표시
        if (type === 'all') {
          document.getElementById('all-banner').classList.add('active');
          document.getElementById('allButton').classList.add('active');
          document.getElementById('sharedButton').classList.remove('active');
          currentPage = 0; // 초기 페이지로 리셋
          paginateBanners('all');
        } else if (type === 'shared') {
          document.getElementById('shared-banner').classList.add('active');
          document.getElementById('sharedButton').classList.add('active');
          document.getElementById('allButton').classList.remove('active');
          currentPage = 0; // 초기 페이지로 리셋
          paginateBanners('shared');
        }
      }

      function paginateBanners(type) {
        const banners = document.querySelectorAll("#"+type+"-banner .banner-content");
        console.log("배너의 개수: " + banners.length); // 배너 개수 확인용 로그

        const totalPages = Math.ceil(banners.length / bannersPerPage);

        // 배너가 3개 이하일 경우 페이지네이션 숨기기
        if (banners.length <= bannersPerPage) {
          document.querySelector('.pagination').classList.add('hidden');
        } else {
          document.querySelector('.pagination').classList.remove('hidden');
        }

        // 배너 숨기기 및 현재 페이지에 맞는 배너만 표시
        banners.forEach((banner, index) => {
          banner.style.display = (index >= currentPage * bannersPerPage && index < (currentPage + 1) * bannersPerPage) ? 'flex' : 'none';
        });

        // 페이지네이션 버튼 활성화/비활성화
        document.getElementById('prevPage').disabled = currentPage === 0;
        document.getElementById('nextPage').disabled = currentPage === totalPages - 1;
      }

      function changePage(direction) {
        const activeBannerId = document.querySelector('.banner.active').id; // 현재 활성화된 배너 ID를 가져오기
        if (direction === 'next') {
          currentPage++;
        } else if (direction === 'prev') {
          currentPage--;
        }
        paginateBanners(activeBannerId.split('-')[0]); // 'all' 또는 'shared'에 해당하는 배너 목록을 갱신
      }

      // 페이지가 로드될 때 '전체 일정' 배너를 기본적으로 표시
      window.onload = function() {
        showBanner('all');
      };
      
		function deleteMember(id){
			let choice = confirm("정말 탈퇴하시겠습니까?"); // 예(true) , 아니오(false) 선택하게끔 
			// 예 : 접근하여 삭제할 수 있게
			if (choice){
				location.href="/boot/users/"+id+"/delete";
			}
		}
    </script>
</body>
</html>
