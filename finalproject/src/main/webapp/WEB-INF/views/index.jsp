<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

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


        .mainBg {
            position: absolute;
            width: 660px;
			height: 400px;
            top: 140px;
            left: 790px;
            border-radius: 20px;
            background: url('images/main.png') no-repeat center/cover;
        }

        .hover-text {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            color: white;
            font-size: 24px;
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .main1 {
            position: absolute;
            width: 300px;
			height: 200px;
            top: 580px;
            left: 1150px;
            border-radius: 20px;
            background: url('images/담양.png') no-repeat center/cover;
            overflow: hidden;
        }

        .main1:hover .hover-text {
            color: white;
            opacity: 1;
        }

        .main2 {
            position: absolute;
            width: 300px;
			height: 200px;
            top: 580px;
            left: 790px;
            border-radius: 20px;
            background: url('images/목포.png') no-repeat center/cover;
            overflow: hidden;
        }

        .main2:hover .hover-text {
            color: white;
            opacity: 1;
        }

        .main3 {
            position: absolute;
            width: 300px;
			height: 200px;
            top: 580px;
            left: 430px;
            border-radius: 20px;
            background: url('images/순천.png') no-repeat center/cover;
            overflow: hidden;
        }

        .main3:hover .hover-text {
            color: white;
            opacity: 1;
        }

        .main4 {
            position: absolute;
            width: 300px;
			height: 200px;
            top: 580px;
            left: 70px;
            border-radius: 20px;
            background: url('images/여수.png') no-repeat center/cover;
            overflow: hidden;
        }

        .main4:hover .hover-text {
            color: white;
            opacity: 1;
        }

        .mainTitle {
            position: absolute;
			height: 35px;
			top: 250px;
			left : 350px;
			transform: translate(-50%, -50%);

			font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 36px;
			line-height: 50px;

		
			color: #000000;
        }

        .mainTitle .line1 {
            display: block;
            width:450px;
            text-align: left;
        }

        .mainTitle .line2 {
            display: block;
            width:510px;
            text-align: left;
        }


        .subTitle {
            position: absolute;
			width: 400px;
			height: 35px;
			top: 360px;
			left : 300px;
			transform: translate(-50%, -50%);

			font-family: 'Gmarket Sans', sans-serif;
			font-weight: medium;
			font-size: 16px;
			line-height: 35px;
			text-align: left;
		
			color: #000000;
        }


        .review2 {
            position: absolute;
            width: 300px;
			height: 200px;
            top: 1080px;
            left: 790px;
            border-radius: 20px;
            background: url('images/순천.png') no-repeat center/cover;

        }

        .review1 {
            position: absolute;
            width: 300px;
			height: 200px;
            top: 1080px;
            left: 70px;
            border-radius: 20px;
            background: url('images/순천.png') no-repeat center/cover;
            overflow: hidden;
        }

        
        .margin {
            margin-bottom: 100%;
        }



    </style>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>


    <div class="margin"></div>

    

<div>
    <div class="mainBg"></div>

    <div> 
        <div class="main1">
            <div class="hover-text">담양</div>
        </div>
        <div class="main2">
            <div class="hover-text">목포</div>
        </div>
        <div class="main3">
            <div class="hover-text">순천</div>
        </div>
        <div class="main4">
            <div class="hover-text">여수</div>
        </div>
    </div>
    

    <div>
        <div class="mainTitle">
            <span class="line1">남도로, 전라남도의 매력을</span>
            <span class="line2">당신에게 딱 맞게 추천합니다.</span>
        </div>
        <div class="subTitle">아름다운 자연과 풍부한 문화유산이 어우러진 전라남도에서 특별한 여행의 순간을 만나보세요.</div>
    </div>

    <div class="review1">모래미해변</div>
    <div class="review2">강덕사</div>
</div>




    
    
    
    
    

    <script src="js/footer.js"></script>
</body>
</html>