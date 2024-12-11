<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        footer {
            position: fixed;
            
            left: 0;
            right: 0;
            background-color: #ceddffcc;
            text-align: center;
            padding: 10px;
            transition: bottom 0.3s ease-in-out; /* 부드러운 애니메이션 추가 */
            z-index: 999;
            bottom: -64px;
        }

        .footer a {
            text-decoration: none;
            color: #007bff;
            margin: 0 10px;
        }

        .footer a:hover {
            text-decoration: underline;
        }

        
    </style>

</head>
<body>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <h4>© 2024 남도로 | All rights reserved.</h4>
            <h4><a href="/about.html">About Us</a> | <a href="/contact.html">Contact</a></h4>
        </div>
    </footer>

<script>

    window.addEventListener('scroll', function () {
        const footer = document.querySelector('footer');

        // 현재 스크롤 위치 + 화면 높이
        const scrollPosition = window.scrollY + window.innerHeight;

        // 전체 문서의 높이
        const documentHeight = document.documentElement.scrollHeight;


        // 스크롤이 끝까지 내려갔을 때 footer 표시
        if (scrollPosition >= documentHeight) {
            footer.style.bottom = '0';
        } else {
            footer.style.bottom = '-64px';
        }
    });

</script>
         
 </body>

</html>