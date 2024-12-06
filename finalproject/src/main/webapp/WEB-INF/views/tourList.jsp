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
            max-height: 250px;
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
			line-height: 10px;
		
			color: #6d6d6d;

            padding-left: 15px;
        }

        .gallary-detail {
            box-shadow: 0.5px 0.5px 3px #d1d1d1;
            border-top-right-radius: 7px;
            border-top-left-radius: 7px;

        }

        .margin {
            margin-bottom: 100%;
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
        }


        .buttom-area .page { 
            display: flex; 
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .buttom-area .page button{
            background-color: #ffffff;
            border-radius: 50%;
            border: 1px solid black;
            height: 40px;
            width: 40px;
            line-height: 40px;
        }

        .buttom-area .page button.on{
            background-color: #000000;
            color : #ffffff;
            height: 40px;
            width: 40px;
            line-height: 40px;
        }

    </style>

<body>

<% List<Tour> tourlist = (List<Tour>)request.getAttribute("tourlist"); %>

<jsp:include page="header.jsp"></jsp:include>
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
    	String[] imgarray = t.getTL_IMG().split(",");
    	%>
    		
	        <div class="gallary-detail">
	            <div class="image-box" >
	                <img src="Test\<%=imgarray[0] %>" style="width: 100%; object-fit: cover; 
	                border-top-right-radius:7px; border-top-left-radius:7px;">
	                <span>바다</span>
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

        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/가야금산조테마공원_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>테마파크</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가야금산조테마공원</p>   
                    <p class="category">테마파크</p>
                </div>
                <p class="address">전라남도 영암군 영암읍 기찬랜드로 19-10</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/가학산_1_공공3유형.jpg" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>산</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가학산</p>   
                    <p class="category">산</p>
                </div>
                <p class="address">전라남도 완도군 소안면 미라리</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/강진 갯들소리마을_1_공공3유형.jpg" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>체험</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">강진 갯들소리마을</p>   
                    <p class="category">체험마을</p>
                </div>
                <p class="address">전남 강진군 신전면 논정길 3</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/강진 백련사 동백나무 숲_1_공공3유형.jpg" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>자연</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">전라남도 강진군 도암면 백련사길 125</p>   
                    <p class="category">자연</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/강진 오감통_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>실내</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">강진 오감통</p>   
                    <p class="category">실내</p>
                </div>
                <p class="address">전남 강진군 강진읍 오감길 2 2동</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/거금도.jpg" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>문화_역사</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">거금도</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전남 고흥군 금산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test/강덕사.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>문화</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">강덕사</p>   
                    <p class="category">문화</p>
                </div>
                <p class="address">전남 강진군 군동면 호라길 199-39</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>
        <div class="gallary-detail">
            <div class="image-box" >
                <img src="Test\가사해수욕장_1_공공3유형.JPG" style="width: 100%; object-fit: cover; 
                border-top-right-radius:7px; border-top-left-radius:7px;">
                <span>바다</span>
            </div>
            <div class="detail-box" >
                <div class="info" >
                    <p class="title">가사해수욕장</p>   
                    <p class="category">바다</p>
                </div>
                <p class="address">전라남도 완도군 약산면</p>
            </div>
        </div>

        <div class="buttom-area">
            <div></div>
            <div class="page">
                <button>P</button>
                <button>B</button>
                <button class="on" >1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>N</button>
                <button>L</button>
            </div>
            <div></div>
        </div>


        
        
    </div>


    <div class="margin"></div>
    <div id="header"></div>
    <div id="footer"></div>

    <script src="js/footer.js"></script>
    
    <script>
    function search(event) {
        event.preventDefault(); // 폼 기본 동작(새로고침) 방지

        // 검색어 가져오기
        const query = document.getElementById("searchInput").value.trim().toLowerCase();

        // 모든 .gallary-detail 요소 가져오기
        const galleryItems = document.querySelectorAll(".gallary-detail");

        // 검색어 포함 여부 확인 및 표시/숨기기
        galleryItems.forEach(item => {
            const title = item.querySelector(".title").textContent.toLowerCase(); // getTL_NAME 값
            if (title.includes(query)) {
                item.style.display = "block"; // 검색어가 포함된 경우 표시
            } else {
                item.style.display = "none"; // 검색어가 포함되지 않은 경우 숨김
            }
        });
    }
    </script>
    
</body>
</html>