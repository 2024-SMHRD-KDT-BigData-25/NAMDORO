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
            top: 80px;
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
            margin-top: 120px;
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
</head>
<body>
	<% board result = (board)request.getAttribute("board"); %>
    <div class="namdoro">남도로 (게시판 상세보기)</div>

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
    </div>  

    <!-- 댓글 섹션 -->
    <div class="comments-section">

        <!-- 뒤로가기 버튼 -->
        <a href="javascript:history.back()" class="back-button">뒤로 가기</a>
    </div>

</body>
</html>
