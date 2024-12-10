<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap");
      @import url("https://fonts.googleapis.com/icon?family=Material+Icons");
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

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      /* 배경이미지 공통 스타일 */
      .bg1,
      .bg2,
      .bg3,
      .bg4,
      .bg5 {
        position: absolute;
        width: 100%;
        height: 1000px;
        top: 100px;
        background: url("images/bg.png") no-repeat center/cover;
        z-index: -1;
      }

      /* 여행테마선택 문구 공통 스타일 */
      .themaMain {
        position: absolute;
        width: 350px;
        height: 35px;
        top: 220px;
        left: 50%;
        transform: translate(-50%, -50%);
        font-family: "Gmarket Sans", sans-serif;
        font-weight: 500;
        font-size: 32px;
        line-height: 30px;
        text-align: center;
        color: #000000;
      }

      /* 여행테마선택 서브문구 공통 스타일 */
      .themaSub {
        position: absolute;
        width: 700px;
        height: 35px;
        top: 270px;
        left: 50%;
        transform: translate(-50%, -50%);
        font-family: "Gmarket Sans", sans-serif;
        font-weight: light;
        font-size: 16px;
        line-height: 30px;
        text-align: center;
        color: #000000;
      }

      .square1 {
        position: absolute;
        border-radius: 20px;
        width: 750px;
        height: 450px;
        top: 570px;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgb(239, 252, 255, 0.5);
        display: flex;
        flex-wrap: wrap;
        column-gap: 70px;
        justify-content: center;
        align-items: center;
      }

      .square2 {
        position: absolute;
        border-radius: 20px;
        width: 900px;
        height: 150px;
        top: 950px;
        left: 50%;
        transform: translate(-50%, -50%);
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .before {
        position: relative;
        width: 110px;
        height: 50px;
        background: url("images/before.png") no-repeat center/cover;
        border: none;
        background-color: transparent;
        cursor: pointer;
      }

      .next, .next2 {
        position: relative;
        width: 110px;
        height: 50px;
        background: url("images/next.png") no-repeat center/cover;
        border: none;
        background-color: transparent;
        cursor: pointer;
      }

      .bottomStep {
        position: absolute;
        width: 500px;
        height: 10px;
        background: url(images/bottomStep.png) no-repeat center / cover;
        display: flex;
        align-items: center;
        justify-content: space-evenly;
      }

      .stepCir {
        position: relative;
        width: 35px;
        height: 35px;
        background: url("images/stepCir.png") no-repeat center/cover;
      }

      .stepText {
        position: relative;
        width: 50px;
        height: 50px;
        top: 40px;
        right: 6px;
        font-family: "Gmarket Sans", sans-serif;
        font-weight: 500;
        font-size: 12px;
        line-height: 30px;
        text-align: center;
        color: #000000;
      }

      .nebe {
        position: relative;
        display: flex;
        gap: 570px;
      }

      .age {
        height: 60px;
        width: 150px;
        background-color: #ffffff;
        border-radius: 10px;
        border: 2px solid #9eb4f9;
        font-family: "Gmarket Sans", sans-serif;
        font-weight: 500;
        font-size: 16px;
        line-height: 30px;
        text-align: center;
        color: #000000;
        transition: transform 0.2s, background-color 0.2s;
      }

      .age:hover {
        background-color: rgb(200, 221, 245);
        transform: scale(1.1);
      }

      .age.active {
        background-color: #9eb4f9;
        color: #ffffff;
        transform: scale(1.1);
        border: 2px solid #7a9bf1;
      }

      .button-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        max-width: 600px;
        column-gap: 100px;
        row-gap: 65px;
      }

      .square3 {
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        padding-top: 320px;
      }

      /* Calendar styles */
      .wrapper {
        width: 650px;
        background: #fff;
        border-radius: 10px;
        padding: 30px;
      }

      .wrapper .nav {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 30px;
      }

      .wrapper .nav .current-date {
        font-size: 28px;
        font-weight: 600;
      }

      .wrapper .nav button {
        width: 45px;
        height: 45px;
        font-size: 36px;
        color: #878787;
      }

      .calendar ul {
        display: flex;
        list-style: none;
        flex-wrap: wrap;
        text-align: center;
      }

      .calendar .weeks li {
        font-weight: 500;
        font-size: 18px;
      }

      .calendar .days {
        margin-bottom: 20px;
      }

      .calendar ul li {
        width: calc(100% / 7);
        position: relative;
      }

      .calendar .days li {
        z-index: 1;
        margin-top: 30px;
        cursor: pointer;
        font-size: 20px;
      }

      .days li.inactive {
        color: #aaa;
      }

      .days li.active {
        color: #fff;
      }

      .calendar .days li::before {
        position: absolute;
        content: "";
        height: 50px;
        width: 60px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        border-radius: 10%;
        z-index: -1;
      }

      .days li:hover::before {
        background: #f2f2f2;
      }

      .days li.active::before {
        background: #008aff;
      }

      .days li.selected::before {
        background: #00ff008f;
      }

      .days li.in-between::before {
        background: #00ff003e;
        height: 50px;
      }

      /* Gender selection styles */
      .gender {
        display: flex;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        gap: 120px;
        z-index: 1;
      }

      .male,
      .female {
        cursor: pointer;
      }

      .margin {
        margin-bottom: 195px;
      }

      /* Theme selection styles */
      .themeImage {
        position: relative;
        width: 150px;
        height: 150px;
        background-size: cover;
        cursor: pointer;
        transition: 0.3s ease-in-out;
      }

      .themeImage::after {
        content: "✔";
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        font-size: 32px;
        color: white;
        background-color: rgba(0, 0, 0, 0.7);
        border-radius: 50%;
        width: 50px;
        height: 50px;
        line-height: 50px;
        text-align: center;
        opacity: 0;
        z-index: 10;
        transition: opacity 0.3s ease-in-out;
      }

      .themeImage.clicked::after {
        opacity: 1;
      }

      /* Region selection styles */
      .namdo {
        cursor: pointer;
      }

      .namdo:hover {
        background-color: rgb(200, 221, 245);
        transform: scale(1.1);
      }

      .highlight {
        background-color: rgb(0, 0, 0);
        border: 2px solid #000000;
      }

      /* 추가된 스타일 */
      .div-container > div {
        display: none;
      }

      .div-container > div.active {
        display: block;
      }

      button {
        /* button 요소에 기본적으로 설정되는 스타일 속성 초기화 */
        border: none;
        outline: none;
        background-color: transparent;
        padding: 0;
        cursor: pointer;
      }

      /* 공통 스타일 */
      input[type="radio"] {
        display: none; /* 기본 라디오 버튼 숨기기 */
      }

      label {
        display: inline-block;
        cursor: pointer;
        margin: 5px;
      }

      /* 글자 스타일 */
      .text-style {
        padding: 10px 20px;
        border: 2px solid #ccc;
        border-radius: 4px;
        background-color: #f9f9f9;
        transition: all 0.3s ease;
      }

      input[type="radio"]:checked + .text-style {
        background-color: teal;
        color: white;
        border-color: teal;
      }

      /* 사진 스타일 */
      .photo-style img {
        width: 150px;
        height: 150px;
        border: 2px solid transparent;
        border-radius: 8px;
        transition: border-color 0.3s ease;
      }

      input[type="radio"]:checked + .photo-style img {
        border-color: teal;
      }
    </style>
  </head>
  <body>
    <jsp:include page="header.jsp"></jsp:include>

    <form action="plan/call_python_api" method="post">
    <div class="div-container">
      <div class="section-1 active">
        <div class="bg1"></div>

        <div class="square1">
          <div class="button-container">
           
            <input
              type="radio"
              name="age"
              id="20대"
              value="20"
              class="text-style"
            />
            <label for="20대" class="text-style">20</label>
            <input
              type="radio"
              name="age"
              id="30대"
              value="30"
              class="text-style"
            />
            <label for="30대" class="text-style">30</label>
            <input
              type="radio"
              name="age"
              id="40대"
              value="40"
              class="text-style"
            />
            <label for="40대" class="text-style">40</label>
            <input
              type="radio"
              name="age"
              id="50대"
              value="50"
              class="text-style"
            />
            <label for="50대" class="text-style">50</label>
          </div>
        </div>

        <div class="square2">
          <div class="nebe">
            <button class="before"></button>
            <button type="button" class="next"></button>
          </div>

          <div class="bottomStep">
            <div class="stepCir">
              <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP3</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP4</div>
            </div>
          </div>
        </div>

        <div class="themaMain">연령대 선택</div>
        <div class="themaSub">
          남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
        </div>
      </div>

      <div class="section-2">
        <div class="bg2"></div>

        <div class="square1">
          <div class="button-container">
           
            <input
              type="radio"
              name="day"
              id="1day"
              value="3"
              class="text-style"
            />
            <label for="1day" class="text-style">당일치기</label>
            
            <input
              type="radio"
              name="day"
              id="2day"
              value="6"
              class="text-style"
            />
            <label for="2day" class="text-style">1박2일</label>

     
          </div>
        </div>

        <div class="square2">
          <div class="nebe">
            <button type="button" class="before"></button>
            <button type="button" class="next"></button>
          </div>

          <div class="bottomStep">
            <div class="stepCir">
              <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP3</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP4</div>
            </div>
          </div>
        </div>

        <div class="themaMain">여행 일정 선택</div>
        <div class="themaSub">
          남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
        </div>
      </div>

      <div class="section-3">
        <div class="bg3"></div>

        <div class="square1">
          <div class="gender">
          <input
              type="radio"
              name="gender"
              id="남자"
              value="남"
              class="text-style"
            />
            <label for="남자" class="text-style">남자</label>
            <input
              type="radio"
              name="gender"
              id="여자"
              value="여"
              class="text-style"
            />
            <label for="여자" class="text-style">여자</label>
          </div>
        </div>

        <div class="square2">
          <div class="nebe">
            <button type="button" class="before"></button>
            <button type="button" class="next"></button>
          </div>

          <div class="bottomStep">
            <div class="stepCir">
              <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP3</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP4</div>
            </div>
          </div>
        </div>

        <div class="themaMain">성별 선택</div>
        <div class="themaSub">
          남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
        </div>
      </div>

      <div class="section-4">
        <div class="bg4"></div>

        <div class="square2">
          <div class="nebe">
            <button type="button" class="before"></button>
            <button type="button" class="next"></button>
          </div>

          <div class="bottomStep">
            <div class="stepCir">
              <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP3</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP4</div>
            </div>
          </div>
        </div>

        <div class="themaMain">여행지 선택</div>
        <div class="themaSub">
          남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
        </div>

        <div class="square1">

            <input
              type="radio"
              name="region"
              id="강진군"
              value="강진군"
              class="text-style"
            />
            <label for="강진군" class="text-style">강진군</label>

            <input
              type="radio"
              name="region"
              id="순천시"
              value="순천시"
              class="text-style"
            />
            <label for="순천시" class="text-style">순천시</label>
            
            <input
              type="radio"
              name="region"
              id="광양시"
              value="광양시"
              class="text-style"
            />
            <label for="광양시" class="text-style">광양시</label>
            
            <input
              type="radio"
              name="region"
              id="목포시"
              value="목포시"
              class="text-style"
            />
            <label for="목포시" class="text-style">목포시</label>
            
            <input
              type="radio"
              name="region"
              id="여수시"
              value="여수시"
              class="text-style"
            />
            <label for="여수시" class="text-style">여수시</label>
            
            <input
              type="radio"
              name="region"
              id="나주시"
              value="나주시"
              class="text-style"
            />
            <label for="나주시" class="text-style">나주시</label>
            
            <input
              type="radio"
              name="region"
              id="담양군"
              value="담양군"
              class="text-style"
            />
            <label for="담양군" class="text-style">담양군</label>
            
            <input
              type="radio"
              name="region"
              id="곡성군"
              value="곡성군"
              class="text-style"
            />
            <label for="곡성군" class="text-style">곡성군</label>
            
            <input
              type="radio"
              name="region"
              id="구례군"
              value="구례군"
              class="text-style"
            />
            <label for="구례군" class="text-style">구례군</label>
            
            <input
              type="radio"
              name="region"
              id="고흥군"
              value="고흥군"
              class="text-style"
            />
            <label for="고흥군" class="text-style">고흥군</label>
            
            <input
              type="radio"
              name="region"
              id="보성군"
              value="보성군"
              class="text-style"
            />
            <label for="보성군" class="text-style">보성군</label>
            
            <input
              type="radio"
              name="region"
              id="화순군"
              value="화순군"
              class="text-style"
            />
            <label for="화순군" class="text-style">화순군</label>
            
            <input
              type="radio"
              name="region"
              id="장흥군"
              value="장흥군"
              class="text-style"
            />
            <label for="장흥군" class="text-style">장흥군</label>
            
            <input
              type="radio"
              name="region"
              id="해남군"
              value="해남군"
              class="text-style"
            />
            <label for="해남군" class="text-style">해남군</label>
            
            <input
              type="radio"
              name="region"
              id="영암군"
              value="영암군"
              class="text-style"
            />
            <label for="영암군" class="text-style">영암군</label>
            
            <input
              type="radio"
              name="region"
              id="무안군"
              value="무안군"
              class="text-style"
            />
            <label for="무안군" class="text-style">무안군</label>
            
            <input
              type="radio"
              name="region"
              id="함평군"
              value="함평군"
              class="text-style"
            />
            <label for="함평군" class="text-style">함평군</label>
            
            <input
              type="radio"
              name="region"
              id="영광군"
              value="영광군"
              class="text-style"
            />
            <label for="영광군" class="text-style">영광군</label>
            
            <input
              type="radio"
              name="region"
              id="장성군"
              value="장성군"
              class="text-style"
            />
            <label for="장성군" class="text-style">장성군</label>
            
            <input
              type="radio"
              name="region"
              id="완도군"
              value="완도군"
              class="text-style"
            />
            <label for="완도군" class="text-style">완도군</label>
            
            <input
              type="radio"
              name="region"
              id="진도군"
              value="진도군"
              class="text-style"
            />
            <label for="진도군" class="text-style">진도군</label>
            
            <input
              type="radio"
              name="region"
              id="신안군"
              value="신안군"
              class="text-style"
            />
            <label for="신안군" class="text-style">신안군</label>

          </div>
        </map>
      </div>

      <div class="section-5">
        <div class="bg5"></div>

        <div class="square1">
          <input
            type="radio"
            id="photo1"
            name="theme"
            value="산"
            class="photo-style"
          />
          <label for="photo1" class="photo-style">
            <img src="images/mountain.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo2"
            name="theme"
            value="바다"
            class="photo-style"
          />
          <label for="photo2" class="photo-style">
            <img src="images/sea.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo3"
            name="theme"
            value="실내"
            class="photo-style"
          />
          <label for="photo3" class="photo-style">
            <img src="images/indoor.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo4"
            name="theme"
            value="액티비티"
            class="photo-style"
          />
          <label for="photo4" class="photo-style">
            <img src="images/activity.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo5"
            name="theme"
            value="테마파크"
            class="photo-style"
          />
          <label for="photo5" class="photo-style">
            <img src="images/themapark.png" alt="옵션 3" />
          </label>

          <input
            type="radio"
            id="photo6"
            name="theme"
            value="문화/역사"
            class="photo-style"
          />
          <label for="photo6" class="photo-style">
            <img src="images/culture.png" alt="옵션 3" />
          </label>
        </div>

        <div class="square2">
          <div class="nebe">
            <button type="button" class="before"></button>
            <button type="submit" class="next2"></button>
          </div>
          <div class="bottomStep">
            <div class="stepCir">
              <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP3</div>
            </div>
            <div class="stepCir">
              <div class="stepText">STEP4</div>
            </div>
          </div>
        </div>

        <div class="themaMain">여행 테마 선택</div>
        <div class="themaSub">
          남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요
        </div>
      </div>
    </div>

</form>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
      function toggleActive(button) {
        const buttons = document.querySelectorAll(".age"); // 모든 버튼 선택
        buttons.forEach((btn) => {
          btn.classList.remove("active"); // 다른 버튼의 active 제거
          btn.setAttribute("data-active", "false"); // 속성 초기화
        });

        // 현재 클릭된 버튼에 active 클래스 추가
        button.classList.add("active");
        button.setAttribute("data-active", "true");
      }
    </script>

    <script>
      const months = [
        "1월",
        "2월",
        "3월",
        "4월",
        "5월",
        "6월",
        "7월",
        "8월",
        "9월",
        "10월",
        "11월",
        "12월",
      ];

      let date = new Date();
      let currYear = date.getFullYear(),
        currMonth = date.getMonth();

      const currentDate = document.querySelector(".current-date");
      currentDate.innerHTML = `${currYear}년&nbsp;&nbsp;&nbsp;;${months[currMonth]}`;

      const daysTag = document.querySelector(".days");
      const prevNextIcon = document.querySelectorAll(".material-icons");

      let selectedDates = []; // 선택한 날짜를 저장하는 배열

      const renderCalendar = () => {
        currentDate.innerHTML = `${currYear}년&nbsp;&nbsp;&nbsp;${months[currMonth]}`;

        let lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate();
        let firstDayofMonth = new Date(currYear, currMonth, 1).getDay();
        let lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate();

        let liTag = "";

        for (let i = firstDayofMonth; i > 0; i--) {
          liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
        }

        for (let i = 1; i <= lastDateofMonth; i++) {
          let isToday =
            i === date.getDate() &&
            currMonth === new Date().getMonth() &&
            currYear === new Date().getFullYear()
              ? "active"
              : "";
          liTag += `<li class="${isToday}" data-day="${i}">${i}</li>`;
        }

        let lastDayofMonth = new Date(
          currYear,
          currMonth,
          lastDateofMonth
        ).getDay();

        for (let i = lastDayofMonth; i < 6; i++) {
          liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`;
        }

        daysTag.innerHTML = liTag;

        addDateClickEvent(); // 날짜 클릭 이벤트 추가
      };

      const addDateClickEvent = () => {
        const days = document.querySelectorAll(".calendar .days li");

        days.forEach((day) => {
          day.addEventListener("click", () => {
            if (day.classList.contains("inactive")) return;

            const selectedDay = parseInt(day.dataset.day);

            // 선택 날짜 배열에 추가
            if (selectedDates.length < 2) {
              selectedDates.push(selectedDay);
            } else {
              // 기존 범위를 초기화하고 새로운 범위 선택
              selectedDates = [selectedDay];
              clearSelected();
            }

            // 두 날짜가 선택되었을 때 범위 채우기
            if (selectedDates.length === 2) {
              const [start, end] = selectedDates.sort((a, b) => a - b);

              // 날짜 차이가 3일을 초과하면 선택 취소
              if (end - start > 2) {
                clearSelected(); // 선택된 날짜 초기화
                selectedDates = [selectedDay]; // 새로운 날짜로 초기화
                day.classList.add("selected");
                return;
              }

              for (let i = start; i <= end; i++) {
                const dayElement = daysTag.querySelector(`li[data-day="${i}"]`);

                // 첫 번째 클릭과 두 번째 클릭 사이의 날짜에 in-between 클래스 추가
                if (i > start && i < end) {
                  dayElement.classList.add("in-between");
                  dayElement.classList.remove("selected"); // 초록색을 사라지게 함
                } else {
                  dayElement.classList.add("selected");
                  dayElement.classList.remove("in-between"); // 초록색을 유지
                }
              }
            } else {
              // 단일 날짜는 바로 선택
              day.classList.add("selected");
              day.classList.remove("in-between");
            }
          });
        });
      };

      const clearSelected = () => {
        const days = document.querySelectorAll(".calendar .days li");
        days.forEach((day) => {
          day.classList.remove("selected");
          day.classList.remove("in-between"); // 날짜 범위 초기화 시 in-between 클래스도 제거
        });
      };

      prevNextIcon.forEach((icon) => {
        icon.addEventListener("click", () => {
          currMonth =
            icon.textContent.trim() === "chevron_left"
              ? currMonth - 1
              : currMonth + 1;

          if (currMonth < 0) {
            currMonth = 11;
            currYear -= 1;
          } else if (currMonth > 11) {
            currMonth = 0;
            currYear += 1;
          }

          selectedDates = []; // 월 변경 시 선택 초기화
          renderCalendar();
        });
      });

      renderCalendar();
    </script>

    <script>
      // 모든 area 태그를 선택
      const areas = document.querySelectorAll("area");

      // hover 및 클릭 이벤트 처리
      areas.forEach((area) => {
        // hover 이벤트 (mouse over / out)
        area.addEventListener("mouseover", () => {
          // 이미지 위에 hover 상태를 스타일링
          area.setAttribute("class", "highlight");
        });
        area.addEventListener("mouseout", () => {
          // hover 해제 시 기본 상태로 복구
          area.removeAttribute("class");
        });

        // 클릭 이벤트
        area.addEventListener("click", (event) => {
          event.preventDefault(); // 링크 이동 방지
          const cityName = area.getAttribute("title");
          alert(`${cityName}을 선택하셨습니다.`);
        });
      });
    </script>

    <script>
      $(document).ready(function (e) {
        $("img[usemap]").rwdImageMaps();
      });
    </script>

    <script>
      document.querySelectorAll(".themeImage").forEach((image) => {
        image.addEventListener("click", () => {
          // 모든 이미지에서 클릭 상태 해제
          document
            .querySelectorAll(".themeImage")
            .forEach((img) => img.classList.remove("clicked"));
          // 클릭된 이미지에 클릭 상태 추가
          image.classList.add("clicked");
        });
      });
    </script>

    <script>
      // 화면 전환 함수 수정
      function showDiv(sectionNumber) {
        // 모든 섹션 숨기기
        document.querySelectorAll(".div-container > div").forEach((div) => {
          div.classList.remove("active");
        });

        // 선택된 섹션 보이기
        document.querySelector('.section-'+sectionNumber).classList.add("active");
      }

   // DOM이 로드된 후 이벤트 리스너 추가
      document.addEventListener('DOMContentLoaded', function() {
        // next 버튼 클릭 이벤트 처리
        document.querySelectorAll(".next").forEach((button) => {
          button.addEventListener("click", function(e) {
            e.preventDefault(); // 폼 제출 방지
            const currentSection = this.closest('[class^="section-"]');
            console.log(currentSection)
            
            const currentNumber = parseInt(currentSection.className.match(/section-(\d+)/)[1]);
            console.log(currentNumber)
            if (currentNumber < 5) {
              showDiv(currentNumber + 1);
            }
          });
        });

     // before 버튼 클릭 이벤트 처리
        document.querySelectorAll(".before").forEach((button) => {
          button.addEventListener("click", function(e) {
            e.preventDefault(); // 폼 제출 방지
            const currentSection = this.closest('[class^="section-"]');
            const currentNumber = parseInt(currentSection.className.match(/section-(\d+)/)[1]);
            if (currentNumber > 1) {
              showDiv(currentNumber - 1);
            }
          });
        });
      });
    </script>

    <script>
      function toggleActive(button) {
        const buttons = document.querySelectorAll(".age");
        buttons.forEach((btn) => {
          btn.classList.remove("active");
          btn.setAttribute("data-active", "false");
        });
        button.classList.add("active");
        button.setAttribute("data-active", "true");
      }
    </script>

    <script src="js/footer.js"></script>
  </body>
</html>
