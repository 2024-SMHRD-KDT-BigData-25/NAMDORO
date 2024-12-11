<%@page import="com.smhrd.boot.model.Tour"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

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

        .gallary-list {
            display: flex;
            flex-wrap: wrap;
            padding-left: 200px;
            margin-top: 300px;
            gap: 50px;
        }

        .image-box {
            position: relative;
            max-width: 250px;
            height: 166px;
            overflow: auto;
            display: flex;
        }


        span {
            position: absolute;
            z-index: 100px;
            padding: 3% 5%;
            background-color: #00000054;
            color: white;
            border-radius: 20px;
            margin-top: 3%;
            margin-left: 5%;
            font-size: 10px;
            top: 0;
            left: 0;
        }

        .detail-box {
            padding: 0 2%;
            width:250px;

        }
        
        .datail-box p{
			white-space: normal;
        	word-wrap: break-word;
        }


        #searchBar {
            position: relative;
            top: 200px;
            border-radius: 1px;  /* 테두리 둥굴게 */
            display: flex;
            justify-content: center;
        }


        .title {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 15px;
			line-height: 10px;
		
			color: #121212; 

            padding-left: 15px;
        }

        .category {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 12px;
			line-height: 10px;
		
			color: #454545;

            padding-left: 15px;
        }

        .address {
            font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 12px;
			line-height: 15px;
		
			color: #6d6d6d;

            padding: 0px 15px;
        }

        .gallary-detail {
            box-shadow: 0.5px 0.5px 3px #d1d1d1;
            border-top-right-radius: 7px;
            border-top-left-radius: 7px;
            word-wrap: break-word;
            height:260px;

        }

        .margin {
            margin-bottom: 10%;
        }

        .gallary-detail img {
            transform: scale(1.0);
            transition: tansform .5s;
        }

        .gallary-detail:hover {
            transform:scale(1.05);
            transition: transform .5s;
        }

        .namdoro {
            position: relative;
            top: 230px;
            padding-left: 200px;


            font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 32px;
			line-height: 10px;
		
			color: #000000;
        }

        .buttom-area {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 20px;
            width: 1155px;
            height: 36px;
            line-height: 36px;
            margin-top: 50px;
        }


        .buttom-area .page { 
            display: flex; 
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .buttom-area .page button{
            background-color: #ffffff;
            border: none;
            height: 40px;
            width: 40px;
            line-height: 40px;
            cursor: pointer;
        }

        .buttom-area .page button.on{
            background-color: #000000;
            color : #ffffff;
            height: 40px;
            width: 40px;
            line-height: 40px;
        }

        /* 페이지네이션을 위한 스타일 추가 */
        .gallary-detail.hidden {
            display: none;
        }
        p{
        margin:10px 0px;
        }
        

    </style>

<body>

<% List<Tour> tourlist = (List<Tour>)request.getAttribute("tourlist"); %>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
    <div class="namdoro">남도로 (로고자리)</div>    

    <div id="searchBar">
    	<form id="searchForm" onsubmit="search(event)">
        <input type="text" style="width:400px; height:40px; padding: 0 2%; background: url('Test/search.png') 
        no-repeat calc(100% - 10px) center; background-size: 20px 20px; background-color: white; border-radius: 5px;
        " placeholder="원하는 관광지를 검색하세요!" id="searchInput" >
        </form>
    </div>
    <div class="gallary-list" >
    	
    	<% for ( Tour t : tourlist ) {
    	String[] imgarray;
    	if(t.getTL_IMG() == null || t.getTL_IMG().equals("")) {
    	    imgarray = new String[]{"https://placehold.co/250x166/EFEFEF/6D6D6D?text=No+Image"}; // 대체 이미지 URL
    	} else {
    	    imgarray = t.getTL_IMG().split(",");
    	}
    	%>
    		
	        <div class="gallary-detail" onclick="location.href='tours/<%=t.getTL_NO() %>'">
	            <div class="image-box" >
	            	<% if(t.getTL_IMG() == null || t.getTL_IMG().equals("")) { %>
	                <img src="<%=imgarray[0] %>" style="width: 100%; object-fit: cover; 
	                border-top-right-radius:7px; border-top-left-radius:7px;">
	                <% } else {%>
	                <img src="touristimg/<%=imgarray[0] %>" style="width: 100%; object-fit: cover; 
	                border-top-right-radius:7px; border-top-left-radius:7px;">
	                <% } %>
	                <span><%=t.getTL_THEME() %></span>
	            </div>
	            <div class="detail-box" >
	                <div class="info" >
	                    <p class="title"><%=t.getTL_NAME() %></p>   
	                    <p class="category"><%=t.getTL_THEME() %></p>
	                </div>
	                <p class="address"><%=t.getTL_ADD() %></p>
	            </div>
	        </div>    		
    		
    	<% } %>

        <div class="buttom-area">
            <div></div>
            <div class="page">
                <button onclick="goToPage('first')" id="firstBtn">처음</button>
                <button onclick="goToPage('prev')" id="prevBtn">이전</button>
                <div id="pageNumbers"></div>
                <button onclick="goToPage('next')" id="nextBtn">다음</button>
                <button onclick="goToPage('last')" id="lastBtn">끝</button>
            </div>
            <div></div>
        </div>
        
    </div>

    <div class="margin"></div>


    
    <script>
    // 페이지네이션 관련 변수
    const itemsPerPage = 16; // 페이지당 표시할 항목 수
    let currentPage = 1; // 현재 페이지
    const maxPageButtons = 10; // 최대 표시할 페이지 버튼 수
    let filteredItems = []; // 검색된 항목들을 저장할 배열
    
    // 검색 기능
    function search(event) {
        event.preventDefault();
        const query = document.getElementById("searchInput").value.trim().toLowerCase();
        const galleryItems = document.querySelectorAll(".gallary-detail");
        
        // 검색 결과를 필터링하여 filteredItems 배열에 저장
        filteredItems = Array.from(galleryItems).filter(item => {
            const title = item.querySelector(".title").textContent.toLowerCase();
            return title.includes(query);
        });
        
        // 검색 결과에 따라 항목 표시/숨김 처리
        galleryItems.forEach(item => {
            item.style.display = "none"; // 모든 항목 숨김
        });
        
        // 현재 페이지를 1로 리셋
        currentPage = 1;
        
        // 페이지네이션 업데이트
        updatePagination();
    }
    
    // 페이지 이동 함수
    function goToPage(action) {
        const items = filteredItems.length > 0 ? filteredItems : document.querySelectorAll(".gallary-detail");
        const totalPages = Math.ceil(items.length / itemsPerPage);
        
        switch(action) {
            case 'first':
                currentPage = 1;
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
        
        updatePagination();
    }
    
    // 페이지네이션 업데이트 함수
    function updatePagination() {
        const allItems = document.querySelectorAll(".gallary-detail");
        const items = filteredItems.length > 0 ? filteredItems : Array.from(allItems);
        const totalPages = Math.ceil(items.length / itemsPerPage);
        
        // 처음/이전/다음/끝 버튼 표시 여부 설정
        document.getElementById('firstBtn').style.display = currentPage === 1 ? 'none' : 'block';
        document.getElementById('prevBtn').style.display = currentPage === 1 ? 'none' : 'block';
        document.getElementById('nextBtn').style.display = currentPage === totalPages ? 'none' : 'block';
        document.getElementById('lastBtn').style.display = currentPage === totalPages ? 'none' : 'block';
        
        // 모든 항목 숨기기
        allItems.forEach(item => {
            item.style.display = "none";
        });
        
        // 현재 페이지에 해당하는 항목만 표시
        const startIndex = (currentPage - 1) * itemsPerPage;
        const endIndex = startIndex + itemsPerPage;
        
        items.slice(startIndex, endIndex).forEach(item => {
            item.style.display = "block";
        });
        
        // 페이지 번호 버튼 업데이트
        const pageNumbers = document.getElementById('pageNumbers');
        pageNumbers.innerHTML = '';
        
        // 시작 페이지와 끝 페이지 계산
        let startPage = Math.max(1, Math.floor((currentPage - 1) / maxPageButtons) * maxPageButtons + 1);
        let endPage = Math.min(totalPages, startPage + maxPageButtons - 1);
        
        // 페이지 버튼 생성
        for (let i = startPage; i <= endPage; i++) {
            const button = document.createElement('button');
            button.textContent = i;
            button.onclick = () => goToPage(i);
            if (i === currentPage) {
                button.classList.add('on');
            }
            pageNumbers.appendChild(button);
        }
    }
    
    // 초기 페이지네이션 설정
    document.addEventListener('DOMContentLoaded', function() {
        updatePagination();
    });
    </script>
    
</body>
</html>