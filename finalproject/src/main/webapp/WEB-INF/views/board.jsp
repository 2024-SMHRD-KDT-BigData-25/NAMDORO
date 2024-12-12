<%@page import="com.smhrd.boot.model.namdoro"%>
<%@page import="com.smhrd.boot.model.board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>남도로 (게시판)</title>
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

      body {
        font-family: "Gmarket Sans", sans-serif;
        margin: 0;
        padding: 0;
      }

      .namdoro {
        position: relative;
        top: 180px;
        text-align: center;
        font-size: 32px;
        font-weight: 500;
        color: #000000;
      }

      #searchBar {
        position: relative;
        top: 250px;
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
      }

      #searchInput {
        width: 300px;
        height: 40px;
        padding: 0 2%;
        background: url("Test/search.png") no-repeat calc(100% - 10px) center;
        background-size: 20px 20px;
        background-color: white;
        border-radius: 5px;
      }

      #searchButton {
        height: 40px;
        padding: 0 15px;
        background-color: #000;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 10px;
      }

      #searchButton:hover {
        background-color: #333;
      }

      .board-container {
        width: 60%;
        margin: 0 auto;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-top: 300px;
      }

      .board-header {
        font-weight: bold;
        font-size: 20px;
        text-align: center;
        margin-bottom: 10px;
      }

      .board-item {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }

      .board-item:last-child {
        border-bottom: none;
      }

      .board-item .meta {
        font-size: 12px;
        color: #666;
      }

      .pagination {
        display: flex;
        justify-content: center;
        margin-top: 20px;
      }

      .pagination button {
        background-color: white;
        border: 1px solid #ddd;
        padding: 5px 10px;
        cursor: pointer;
        margin: 0 5px;
      }

      .pagination button.active {
        background-color: black;
        color: white;
      }

      .margin {
        margin-bottom: 100%;
      }

      /* 글 작성 버튼 스타일 */
      #writeButton {
        height: 40px;
        padding: 0 15px;
        background-color: #000;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
        display: block;
        width: 100%;
        text-align: center;
      }

      #writeButton:hover {
        background-color: #333;
      }

      /* 검색결과가 없을 때 메시지 스타일 */
      #noResultsMessage {
        display: none;
        text-align: center;
        font-size: 18px;
        color: #888;
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
  <% List<board> boardList = (List<board>)request.getAttribute("boardList"); %>
  <%
	namdoro member = (namdoro) session.getAttribute("member");
	%>
  <jsp:include page="header.jsp"></jsp:include>
  <jsp:include page="footer.jsp"></jsp:include>
    <div class="namdoro">남도로 (게시판)</div>

    <div id="searchBar">
    <form  id="searchForm" onsubmit="search(event)">
      <input type="text" id="searchInput" placeholder="검색어를 입력하세요!" id="searchInput" onkeyup="search()"/>
      <button id="searchButton" onclick="search()">검색</button>
      </form>
    </div>

    

    <div class="board-container">
      <div class="board-header">게시판</div>
      <!-- 검색결과가 없을 때 메시지 -->
    <div id="noResultsMessage">검색한 결과가 없습니다.</div>
      <div id="boardItems">
        <!-- 게시글 항목은 HTML에서 직접 작성 -->
        <% for (board b : boardList) {%>
        <div class="board-item">
          <a href="board/<%=b.getTB_NO() %>" style="text-decoration: none; color: inherit">
            <div class="title"><%=b.getTB_TITLE() %></div>
          </a>
          <div class="meta">작성자: <%=b.getUSER_NICKNAME() %> | 작성일: <%=b.getCREATED_AT() %></div>
        </div>
         <%} %>
      </div>

      <!-- 글 작성 버튼 추가 -->
      <%
      if (member == null) { %>
      <button id="writeButton" onclick="location.href='/boot/login'">글 작성</button>
      <% } else  { %> 
      <button id="writeButton" onclick="location.href='/boot/board/boardwrite'">글 작성</button>
      <% } %>
    </div>

    <div class="pagination">
      <button id="firstBtn" onclick="goToPage('first')">첫 페이지</button>
      <button id="prevBtn" onclick="goToPage('prev')">이전</button>
      <div id="pageNumbers"></div>
      <button id="nextBtn" onclick="goToPage('next')">다음</button>
      <button id="lastBtn" onclick="goToPage('last')">끝 페이지</button>
    </div>

    <div class="margin"></div>

    <script>
      const itemsPerPage = 10; // 한 페이지에 표시할 게시글 수
      let currentPage = 1;
      let filteredItems = []; // 검색 결과로 필터링된 항목

      // 페이지를 변경하는 함수
      function goToPage(action) {
        const boardItems = document.getElementById("boardItems");
        const items = Array.from(
          boardItems.getElementsByClassName("board-item")
        );
        const totalItems = items.length;
        const totalPages = Math.ceil(totalItems / itemsPerPage);

        switch (action) {
          case "first":
            currentPage = 1;
            break;
          case "prev":
            currentPage = Math.max(1, currentPage - 1);
            break;
          case "next":
            currentPage = Math.min(totalPages, currentPage + 1);
            break;
          case "last":
            currentPage = totalPages;
            break;
          default:
            currentPage = parseInt(action);
        }

        renderBoard(items, totalItems);
        renderPagination(totalItems); // 페이지 번호 업데이트
      }

      // 게시글을 렌더링하는 함수
      function renderBoard(items, totalItems) {
        const boardItems = document.getElementById("boardItems");
        const start = (currentPage - 1) * itemsPerPage;
        const end = currentPage * itemsPerPage;

        // 모든 게시글을 숨기고 페이지에 맞는 것만 표시
        items.forEach((item, index) => {
          if (index >= start && index < end) {
            item.style.display = "flex";
          } else {
            item.style.display = "none";
          }
        });

        renderPagination(totalItems); // 페이지 번호 업데이트
      }

      // 페이지 번호를 렌더링하는 함수
      function renderPagination(totalItems) {
        const pageNumbers = document.getElementById("pageNumbers");
        pageNumbers.innerHTML = ""; // 기존 페이지 버튼을 지움

        const totalPages = Math.ceil(totalItems / itemsPerPage);

        // 페이지 번호를 렌더링할 범위 설정
        const startPage = Math.max(1, currentPage - 2); // 최소 1
        const endPage = Math.min(totalPages, currentPage + 2); // 최대 마지막 페이지

        // 기존 active 클래스를 지우고 새로 추가
        const buttons = pageNumbers.getElementsByTagName("button");
        for (let button of buttons) {
          button.classList.remove("active");
        }

        // 페이지 번호 버튼을 생성하고 추가
        for (let i = startPage; i <= endPage; i++) {
          const button = document.createElement("button");
          button.textContent = i;
          if (i === currentPage) {
            button.classList.add("active"); // 현재 페이지에 active 클래스를 추가
          }
          button.onclick = () => goToPage(i);
          pageNumbers.appendChild(button);
        }

        // 이전/다음 버튼 활성화 여부
        document.getElementById("prevBtn").disabled = currentPage === 1;
        document.getElementById("nextBtn").disabled =
          currentPage === totalPages;
      }

      // 검색 기능
      function search(event) {
          event.preventDefault();
          const query = document.getElementById("searchInput").value.trim().toLowerCase();
          const galleryItems = document.querySelectorAll(".board-item");
          
          // 검색 결과를 필터링하여 filteredItems 배열에 저장
          filteredItems = Array.from(galleryItems).filter(item => {
              const title = item.querySelector(".title").textContent.toLowerCase();
              return title.includes(query);
          });
          
          // 검색 결과에 따라 항목 표시/숨김 처리
          galleryItems.forEach(item => {
              item.style.display = "none"; // 모든 항목 숨김
          });
          
          // 검색된 항목만 표시
          filteredItems.forEach(item => {
              item.style.display = "flex"; // 필터링된 항목 표시
          });
          
          // 검색된 결과가 없으면 "검색한 결과가 없습니다." 메시지 표시
          const noResultsMessage = document.getElementById("noResultsMessage");
          if (filteredItems.length === 0) {
              noResultsMessage.style.display = "block"; // 메시지 표시
          } else {
              noResultsMessage.style.display = "none"; // 메시지 숨기기
          }
          
          // 현재 페이지를 1로 리셋
          currentPage = 1;
          
          // 페이지네이션 업데이트
          renderBoard(filteredItems, filteredItems.length);
          renderPagination(filteredItems.length);  // 페이지 번호 갱신
      }
    </script>
  </body>
</html>
