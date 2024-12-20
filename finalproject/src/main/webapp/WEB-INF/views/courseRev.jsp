<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>남도로 (게시판)</title>
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
            font-family: 'Gmarket Sans', sans-serif;
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
            top: 210px;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        #searchInput {
            width: 300px;
            height: 40px;
            padding: 0 2%;
            background: url('Test/search.png') no-repeat calc(100% - 10px) center;
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
            margin-top: 270px;
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
            margin-top: 70px;
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
    </style>
</head>
<body>

    <div class="namdoro">남도로 (게시판)</div>

    <div id="searchBar">
        <input type="text" id="searchInput" placeholder="검색어를 입력하세요!" />
        <button id="searchButton" onclick="search()">검색</button>
    </div>

    <div class="board-container">
        <div class="board-header">게시판</div>
        <div id="boardItems">
            <!-- 게시글 항목은 HTML에서 직접 작성 -->
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>

            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>
            <div class="board-item">
                <a href="#" style="text-decoration: none; color: inherit;">
                 <div>게시글 1</div>
                </a>
                <div class="meta">작성자: 작성자 1 | 작성일: 2024-12-01</div>
                
            </div>


        </div>
    </div>

    <div class="pagination">
        <button id="firstBtn" onclick="goToPage('first')">첫 페이지</button>
        <button id="prevBtn" onclick="goToPage('prev')">이전</button>
        <div id="pageNumbers"></div>
        <button id="nextBtn" onclick="goToPage('next')">다음</button>
        <button id="lastBtn" onclick="goToPage('last')">끝 페이지</button>
    </div>

    <div class="margin"></div>

<jsp:include page="header.jsp"></jsp:include>
   

    <script>
        const itemsPerPage = 10; // 한 페이지에 표시할 게시글 수
        let currentPage = 1;
        let filteredItems = []; // 검색 결과로 필터링된 항목

        // 페이지를 변경하는 함수
function goToPage(action) {
    const boardItems = document.getElementById("boardItems");
    const items = Array.from(boardItems.getElementsByClassName("board-item"));
    const totalItems = items.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);

    switch(action) {
        case 'first':
            currentPage = 5;
            break;
        case 'prev':
            currentPage = Math.max(1, currentPage - 1);
            break;
        case 'next':
            currentPage = Math.min(totalPages, currentPage + 1);
            break;
        case 'last':
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
        pageNumbers.innerHTML = ''; // 기존 페이지 버튼을 지움

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
        document.getElementById("nextBtn").disabled = currentPage === totalPages;
        }




        // 검색 기능
        function search() {
            const query = document.getElementById("searchInput").value.toLowerCase();
            const boardItems = document.getElementById("boardItems");
            const items = Array.from(boardItems.getElementsByClassName("board-item"));

            // 검색어가 포함된 게시글만 필터링
            filteredItems = items.filter(item => item.textContent.toLowerCase().includes(query));
            
            currentPage = 1; // 검색 후 첫 페이지로 리셋
            renderBoard(filteredItems, filteredItems.length);
        }

        // 초기화
        window.onload = () => {
            const boardItems = document.getElementById("boardItems");
            const items = Array.from(boardItems.getElementsByClassName("board-item"));
            renderBoard(items, items.length);
        }
    </script>

</body>
</html>
