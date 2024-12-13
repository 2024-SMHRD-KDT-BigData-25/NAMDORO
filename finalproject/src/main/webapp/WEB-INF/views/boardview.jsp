<%@page import="com.smhrd.boot.model.namdoro"%>
<%@page import="com.smhrd.boot.model.board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>남도로 (게시판 상세보기)</title>
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
            min-height: 400px;
            margin-bottom: 50px;
        }

        .namdoro {
            position: relative;
            top: 170px;
            text-align: center;
            font-size: 32px;
            font-weight: 500;
            color: #000000;
        }

        .board-container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 15px;
            margin-top: 230px;
        }

        .post-title {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .post-meta {
            font-size: 14px;
            color: #666;
            margin-bottom: 10px;
        }

        .post-content {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .post-image {
            width: 100%;
            max-height: 400px;
            object-fit: contain;
            margin-top: 10px;
            margin-bottom: 15px;
        }

        .back-button {
            display: inline-block;
            padding: 6px 10px;
            background-color: #000;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
        }

        .back-button:hover {
            background-color: #333;
            transform: translateY(-2px)
        }

        .back-button:focus {
            outline: none;
        }

        /* 댓글 섹션 스타일 */
        .comments-section {
            margin-top: 40px;
            border-top: 1px solid #ddd;
            padding-top: 20px;
            width: 60%;
            margin: 0 auto;
        }

        .comment {
            border-bottom: 1px solid #f2f2f2;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }

        .comment-author {
            font-weight: bold;
            color: #333;
        }

        .comment-date {
            font-size: 12px;
            color: #999;
            margin-top: 5px;
        }

        .comment-content {
            margin-top: 5px;
            font-size: 14px;
            color: #555;
        }

        .comment-form {
            margin-top: 30px;
        }

        .comment-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        .comment-form button {
            background-color: rgb(255, 255, 255);
            color: rgb(0, 0, 0);
            font-size: 14px;
            /* border: none; */
            border-color: #999;
            border-radius: 5px;
            cursor: pointer;.back-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            text-align: center;
            font-weight: 500;
            font-size: 16px;
            transition: background-color 0.3s, transform 0.2s ease-in-out;
        }

        .back-button:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }

        .back-button:active {
            background-color: #004085;
            transform: translateY(2px);
        }

        .back-button:focus {
            outline: none;
        }
        }

        .comment-form button:hover {
            background-color: #e9e9e9;
        }
    </style>
    <script type="text/javascript">
        // 삭제 확인 팝업
        function confirmDelete(url) {
            var result = confirm("정말로 삭제하시겠습니까?");
            if (result) {
                window.location.href = url; // 삭제 진행
            } else {
                return false; // 삭제 취소
            }
        }
    </script>
</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
	
	
	<% 
        // 게시글 정보 가져오기
        board result = (board)request.getAttribute("board");
        // 로그인한 사용자 정보 가져오기
        namdoro member = (namdoro)session.getAttribute("member"); 
        String loggedInUser = member != null ? member.getUser_nickname() : null; // 로그인한 사용자의 닉네임
        String postAuthor = result.getUSER_NICKNAME(); // 게시글 작성자의 닉네임
    %>
    <div class="namdoro">자유게시판</div>

    <div class="board-container">
        <!-- 게시글 제목 -->
        <div class="post-title">제목 : <%= result.getTB_TITLE() %></div>

        <!-- 게시글 작성자, 작성일자 -->
        <div class="post-meta">
            작성자: <%= result.getUSER_NICKNAME() %> | 작성일: <%= result.getCREATED_AT() %>
        </div>

        <!-- 첨부 이미지 -->
        <img src="data:image/jpeg;base64,<%= result.getTB_IMG() %>"  class="post-image">

        <!-- 게시글 내용 -->
        <div class="post-content">
            <%= result.getTB_CONTENT() %>
        </div>
         <!-- 수정 및 삭제 버튼 (자신의 게시글일 경우) -->
        <% if (loggedInUser != null && loggedInUser.equals(postAuthor)) { %>
            <!-- 수정 버튼 -->
            <a href="edit/<%= result.getTB_NO() %>" class="back-button" style="background-color: #28a745;">수정</a>
            <!-- 삭제 버튼 -->
            <a href="javascript:confirmDelete('delete?TB_NO=<%= result.getTB_NO() %>')" class="back-button" style="background-color: #dc3545;">삭제</a>
        <% } %>
    </div>  

    <!-- 댓글 섹션 -->
    <div class="comments-section">

        <!-- 뒤로가기 버튼 -->
        <a href="javascript:history.back()" class="back-button">뒤로 가기</a>
    </div>

</body>
</html>
