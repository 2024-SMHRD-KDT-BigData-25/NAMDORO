<%@page import="com.smhrd.boot.model.namdoro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>남도로 (게시판 글 작성)</title>
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
            height: 700px;
        }

        .namdoro {
            position: relative;
            top: 80px;
            text-align: center;
            font-size: 32px;
            font-weight: 500;
            color: #000000;
        }

        .form-container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 100px;
        }

        .form-header {
            font-weight: bold;
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .submit-button {
            width: 100%;
            padding: 12px;
            background-color: #000;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .submit-button:hover {
            background-color: #333;
        }

        .image-preview {
            width: 100%;
            max-height: 300px;
            object-fit: contain;
            margin-top: 10px;
        }
    </style>
</head>
<body>
 <%namdoro member = (namdoro)session.getAttribute("member"); 
 	System.out.println("Test : "  + member);
 	System.out.println("Test ID : "+member.getUser_id());
 %>
    <div class="namdoro">남도로 (게시판 글 작성)</div>

    <div class="form-container">
        <div class="form-header">게시글 작성</div>

        <form id="postForm" enctype="multipart/form-data" action="/boot/board/write" method="post">
            <!-- 제목 입력 -->
            <input type="text" id="postTitle" name="TB_TITLE" class="input-field" placeholder="제목을 입력하세요" required />

            <!-- 사진 첨부 -->
            
			<input type="file" id="TB_IMG" name="photo" class="input-field" accept="image/*" onchange="previewImage(event)" />
            <img id="imagePreview" class="image-preview" style="display: none;" />
			 
            <!-- 내용 입력 -->
            <textarea id="postContent" name="TB_CONTENT" class="input-field" rows="10" placeholder="내용을 입력하세요" required></textarea>
			<input type="hidden" name="USER_ID" value="<%=member.getUser_id()%>"></input>
            <!-- 제출 버튼 -->
            <button type="submit" class="submit-button">작성 완료</button>
        </form>
    </div>

    <script>
    
        // 이미지 미리보기 기능
        function previewImage(event) {
            const file = event.target.files[0];
            const preview = document.getElementById('imagePreview');

            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    preview.style.display = 'block';
                    preview.src = e.target.result;
                };
                reader.readAsDataURL(file);
            } else {
                preview.style.display = 'none';
            }
        }

      /*  // 폼 제출
        document.getElementById('postForm').onsubmit = function(event) {
            event.preventDefault();

            const title = document.getElementById('postTitle').value;
            const content = document.getElementById('postContent').value;
            const image = document.getElementById('postImage').files[0];

            if (!title || !content) {
                alert('제목과 내용을 모두 입력해주세요.');
                return;
            }

            // 작성한 게시글 데이터를 콘솔에 출력 (실제 서비스에서는 서버로 전송)
            console.log('제목:', title);
            console.log('내용:', content);
            if (image) {
                console.log('첨부된 이미지:', image.name);
            }

            alert('게시글이 작성되었습니다.');
            // 작성 완료 후 페이지 리셋 (서버로 전송 후 리다이렉트 처리)
            document.getElementById('postForm').reset();
            document.getElementById('imagePreview').style.display = 'none';
        }*/
    </script>

</body>
</html>
