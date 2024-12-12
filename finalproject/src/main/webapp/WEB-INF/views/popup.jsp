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
        /* 팝업 배경 */
        .modal-bg {
            display: none; width:100%; height: 100%; position: fixed; top: 0; left: 0; right: 0;
            background: rgba(0, 0, 0, 0.6); z-index: 999;
        }

        /* 팝업 틀 */
        .modal-wrap {
            position: absolute; top: 38%; left: 50%; transform: translate(-50%, -50%);
            background: #fff; z-index: 1000; padding: 4% 0%;
        }

        /* 팝업 임시 버튼 스타일*/
        .btn-box .btn-open {
            display: block;
            width: 200px;
            height: 50px;
            margin: 80px auto 0;
            line-height: 50px;
            background: #333;
            text-align: center;
        }


        /* 팝업 버튼안의 글씨색깔 */
        .btn-box .btn-open span {
            color: #ffffff;
        }

        .modal-close {
            position: absolute;
		    top: 150%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    height: 40px;
		    width: 90px;
		    border: none;
		    background-color: #edfaff;
		    border-radius: 10px;
		    cursor: pointer;
		    font-family: 'Gmarket Sans', sans-serif;
		    font-weight: 700;
		    font-size: 16px;
		    line-height: 15px;
		    text-align: center;
		    color: #000000;
        }

        .bgImg {
          
            height: 100%;
            width: 100%;
            position: relative;
            
            opacity: 0.5;
            z-index: -4;
            background-position: center; /* 가운데 정렬 */
          	background-repeat: no-repeat; /* 반복 금지 */
          	background-size: cover; /* 화면에 꽉 차도록 설정 */
            transition: background-image 1s ease-in-out; /* 배경 이미지 변경 시 애니메이션 추가 */
        }
        
      

        .tourImg {
            
            display: flex;
		    height: 90%;
		    width: 75%;
		    position: absolute;
		    object-fit: cover;
		    justify-content: flex-end;
		    flex-direction: column;
        }

        .tourImg img {
          	width: 91%;
		    height: 89%;
		    object-fit: cover;
		    transform: translate(-50%, -50%);
    		left: 50%;
		    top: 45%;
		    position: relative;
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

        .square1 {
            position: relative;
            width: 100%;
            height: 500px;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: -3;
            top: -30px;
        }

        .nextBtn {
            background-image: url('data:image/svg+xml;charset=utf-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.7.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path d="M0 256a256 256 0 1 0 512 0A256 256 0 1 0 0 256zM241 377c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l87-87-87-87c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0L345 239c9.4 9.4 9.4 24.6 0 33.9L241 377z"/></svg>');
            position: absolute;
            width: 30px;
            height: 50px;
            right: 8%;
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
            left: 8%;
            border: none;
            background-color: transparent;
            cursor: pointer;

            background-repeat: no-repeat;
        }

        .square3 {
            position: absolute;
            width: 800px;
            height: 300px;
            left: 50%;
            transform: translate(-50%);
            background-color: rgb(242 242 242);
            top: 88%;
            padding-top: 25px;
            padding-left: 50px;
            padding-bottom: 40px;
            box-sizing: border-box;
            border-radius: 10px;
            box-shadow: 1px 2px 10px;

            overflow-y: scroll; /* 스크롤 가능 */
            scrollbar-width: none; /* Firefox에서 스크롤바 숨기기 */
            -ms-overflow-style: none; /* IE에서 스크롤바 숨기기 */
        }
        
        .square3::-webkit-scrollbar {
            display: none; /* Chrome, Safari에서 스크롤바 숨기기 */
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

        .TL_EXP {
            font-family: 'Gmarket Sans', sans-serif;
         font-weight: 500;
         font-size: 16px;
         line-height: 31px;
         text-align: left;
            padding-left: 20px;
         padding-right: 70px;
      
         color: #000000;
        }

        .imageBox {
            position: relative;
            width: 215px;
            height: 170px;
            left: 7%;
            border: 1px solid black;
            border-radius: 10px;
            background-color: #f8f8f8;
        }
        
        img {
        	width: 1000px;
        	height: 900px;
        }


    </style>

</head>
<body>  

	<% 
   Tour tourDetail = (Tour)request.getAttribute("tourDetail");
   String img;
   if(tourDetail.getTL_IMG() == null || tourDetail.getTL_IMG().equals("")) {
      img = "https://placehold.co/250x250/EFEFEF/6D6D6D?text=No+Image"; // 대체 이미지 URL
   } else {
      img = "/boot/touristimg/" + tourDetail.getTL_IMG().split(",")[0];
   }
   
   // 로그인 정보 불러오기
   namdoro member = (namdoro) session.getAttribute("member");
   
%>

    
	<!-- 
    <div id="wrap">
 
        
         <section class="content">
            <div class="container">

              
                 <div class="btn-box">
                    <a href="#" class="btn-open" onClick="popOpen();">
                        <span>열기</span>
                    </a>
                 </div>
            </div>
         </section>
    </div>
     -->


    <!-- modal영역 -->
    <div class="modal-bg" onClick="popClose();"></div>
    <div class="modal-wrap">

        
        <div class="square1">
        	<div class="bgImg"><img src="<%=img%>"></div>
            <div class="tourImg"><img src="<%=img%>" ></div>
          
        </div>


    <div class="square3">
     
        <div class="title"><%=tourDetail.getTL_NAME() %></div><br>
        <div class="TL_EXP"><%=tourDetail.getTL_EXP() %></div><br>

    </div>

      
        <button class="modal-close" onclick="window.close();">닫기</button>
        
    </div>
    
    <script>
        function popOpen() {

            var modalPop = $('.modal-wrap');
            var modalBg = $('.modal-bg'); 
        
            $(modalPop).show();
            $(modalBg).show();
            $('html').css({
                overflow:'auto',
                height:'auto'
            });
        
        }
        
        function popClose() {
        var modalPop = $('.modal-wrap');
        var modalBg = $('.modal-bg');
        
        $(modalPop).hide();
        $(modalBg).hide();
        $('html').removeAttr('style');
        }
    </script>
    


</body>
</html>