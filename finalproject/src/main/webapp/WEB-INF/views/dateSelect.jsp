<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>

        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');
        @import url('https://fonts.googleapis.com/icon?family=Material+Icons');        


        /* 배경이미지 */
        .bg {
            position: absolute;
            width: 100%;
            height: 1000px;
            top :100px;
            background: url('images/bg.png') no-repeat center/cover;
			z-index: -1;
        }

        /* 여행테마선택 문구 */
		.themaMain {
			position: absolute;
			width: 350px;
			height: 35px;
			top: 220px;
			left : 50%;
			transform: translate(-50%, -50%);

			font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 32px;
			line-height: 30px;
			text-align: center;
		
			color: #000000;
		}

		/* 여행테마선택 서브문구 */
		.themaSub {
			position: absolute;
			width: 700px;
			height: 35px;
			top: 270px;
			left : 50%;
			transform: translate(-50%, -50%);

			font-family: 'Gmarket Sans', sans-serif;
			font-weight: light;
			font-size: 16px;
			line-height: 30px;
			text-align: center;
		
			color: #000000;
		}

      

      .before {
			position: relative;
            width: 110px;
            height: 50px;
            background: url('images/before.png') no-repeat center/cover;
			
            border: none;
            background-color: transparent;
            cursor: pointer;
		}

		.next {
			position: relative;
            width: 110px;
            height: 50px;
            background: url('images/next.png') no-repeat center/cover;
			
            border: none;
            background-color: transparent;
            cursor: pointer;
		}

		.bottomStep {
			position: absolute;
    		width: 500px;
    		height: 10px;
            background-color: #C2C2C2;
    		display: flex;
    		align-items: center;
    		justify-content: space-evenly;
            border-radius: 20px;
		}

		.stepCir {
			position: relative;
            width: 35px;
            height: 35px;
            border-radius: 50%;
            background-color: #C2C2C2;
		}

        .smallCir {
            position: absolute;
            width: 15px;
            height: 15px;
            background-color: #ffffff; /* 원의 색상 */
            border-radius: 50%; /* 원 모양으로 만들기 */
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 5;
        }

		.stepText {
			position: relative;
            width: 50px;
            height: 50px;
			top: 40px;
			right: 6px;


			font-family: 'Gmarket Sans', sans-serif;
			font-weight: 500;
			font-size: 12px;
			line-height: 30px;
			text-align: center;
		
			color: #000000;
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

      .nebe {
			position: relative;
			display: flex;
			gap: 570px;
		}

        /*#2 */
        * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        }
        
        /*#3 */
        button {
        /* button 요소에 기본적으로 설정되는 스타일 속성 초기화 */
        border: none;
        outline: none;
        background-color: transparent;
        padding: 0;
        cursor: pointer;
        }
        

        /*#5 */
        .wrapper {
        width: 650px;
        background: #fff;
        border-radius: 10px;
        padding: 30px;
        
        }
        
        /*#6*/
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

        /*#7*/
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
        /*#8*/
        width: calc(100% / 7);
        
        /*#9*/
        position: relative;
        }
        .calendar .days li {
        /*#10*/
        z-index: 1;
        margin-top: 30px;
        cursor: pointer;
        font-size: 20px;
        }
        
        /*#11*/
        .days li.inactive {
        color: #aaa;
        }

        .days li.active {
        color: #fff;
        }
        .calendar .days li::before {
        position: absolute;
        content: '';
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

         /* 날짜 선택 시 초록색으로 변경 */
        .days li.selected::before {
        background: #00ff008f; /* 초록색 배경 */
        }

        /* 두 날짜 사이의 날짜를 위한 스타일
        .days li.in-between {
        background-color: #8c6060;
        } */

        /* 날짜 범위 중간에 표시되는 노란색의 높이를 조정 */
        .days li.in-between::before {
            background: #00ff003e; /* 노란색 */
            height: 50px; /* 높이를 증가 */
        }

        .square3 {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 320px
        }

        .margin {
         margin-bottom: 195px;
      }


    </style>

</head>
<body>

    <jsp:include page="header.jsp"></jsp:include>

    <div class="bg"></div>

    <div class="square3">
      <div class="wrapper">
        <header>
            <div class="nav">
              <button class="material-icons"> chevron_left </button>
              <p class="current-date"></p>
              <button class="material-icons"> chevron_right </span>
            </div>
          </header>
          <div class="calendar">
            <ul class="weeks">
              <li>Sun</li>
              <li>Mon</li>
              <li>Tue</li>
              <li>Wed</li>
              <li>Thu</li>
              <li>Fri</li>
              <li>Sat</li>
            </ul>
            <ul class="days">
            </ul>
          </div>
        </div>
    </div>

    <div class="square2">

        <div class="nebe">
            <button class="before" onClick="location.href='regionSelect.html'"></button>
            <button class="next" onClick="location.href='themeSelect.html'"></button>
        </div>
  
        <div class="bottomStep">
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP1</div>
            </div>
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP2</div>
            </div>
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP3</div>
            </div>
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP4</div>
            </div>
            <div class="stepCir">
                <div class="smallCir"></div>
                <div class="stepText">STEP5</div>
            </div>
          </div>	
        </div>	
     </div>



     <div class="themaMain">여행 일정 선택</div>
     <div class="themaSub">남도로 떠나는 첫 걸음, 당신만의 여행 스타일을 선택해 보세요</div>

     

     <div class="margin"></div>


        <script>
            const months = [
                '1월',
                '2월',
                '3월',
                '4월',
                '5월',
                '6월',
                '7월',
                '8월',
                '9월',
                '10월',
                '11월',
                '12월',
            ];
        
            let date = new Date();
            let currYear = date.getFullYear(),
                currMonth = date.getMonth();
        
            const currentDate = document.querySelector('.current-date');
            currentDate.innerHTML = `${currYear}년&nbsp;&nbsp;&nbsp;;${months[currMonth]}`;
        
            const daysTag = document.querySelector('.days');
            const prevNextIcon = document.querySelectorAll('.material-icons');
        
            let selectedDates = []; // 선택한 날짜를 저장하는 배열
        
            const renderCalendar = () => {
                currentDate.innerHTML = `${currYear}년&nbsp;&nbsp;&nbsp;${months[currMonth]}`;
        
                let lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate();
                let firstDayofMonth = new Date(currYear, currMonth, 1).getDay();
                let lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate();
        
                let liTag = '';
        
                for (let i = firstDayofMonth; i > 0; i--) {
                    liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
                }
        
                for (let i = 1; i <= lastDateofMonth; i++) {
                    let isToday =
                        i === date.getDate() &&
                        currMonth === new Date().getMonth() &&
                        currYear === new Date().getFullYear()
                            ? 'active'
                            : '';
                    liTag += `<li class="${isToday}" data-day="${i}">${i}</li>`;
                }
        
                let lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay();
        
                for (let i = lastDayofMonth; i < 6; i++) {
                    liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`;
                }
        
                daysTag.innerHTML = liTag;
        
                addDateClickEvent(); // 날짜 클릭 이벤트 추가
            };
        
        const addDateClickEvent = () => {
            const days = document.querySelectorAll('.calendar .days li');

        days.forEach((day) => {
            day.addEventListener('click', () => {
            if (day.classList.contains('inactive')) return;

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
                    day.classList.add('selected');
                    return;
                }

                for (let i = start; i <= end; i++) {
                    const dayElement = daysTag.querySelector(`li[data-day="${i}"]`);
                    
                    // 첫 번째 클릭과 두 번째 클릭 사이의 날짜에 in-between 클래스 추가
                    if (i > start && i < end) {
                        dayElement.classList.add('in-between');
                        dayElement.classList.remove('selected'); // 초록색을 사라지게 함
                    } else {
                        dayElement.classList.add('selected');
                        dayElement.classList.remove('in-between'); // 초록색을 유지
                    }
                }
            } else {
                // 단일 날짜는 바로 선택
                day.classList.add('selected');
                day.classList.remove('in-between');
            }
        });
    });
};

            const clearSelected = () => {
                const days = document.querySelectorAll('.calendar .days li');
                days.forEach((day) => {
                    day.classList.remove('selected');
                    day.classList.remove('in-between'); // 날짜 범위 초기화 시 in-between 클래스도 제거
                });
            };
        
            prevNextIcon.forEach((icon) => {
                icon.addEventListener('click', () => {
                    currMonth = icon.textContent.trim() === 'chevron_left' ? currMonth - 1 : currMonth + 1;
        
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
    
</body>
</html>