<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.fasterxml.jackson.databind.util.JSONPObject"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="all">
	<!DOCTYPE html>
	<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

<style>
@font-face {
	font-family: "Gmarket Sans";
	src:
		url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff")
		format("woff");
	font-style: normal;
	font-weight: 400;
}

@font-face {
	font-family: "Gmarket Sans";
	src:
		url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff")
		format("woff");
	font-style: normal;
	font-weight: 500;
}

@font-face {
	font-family: "Gmarket Sans";
	src:
		url("https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansBold.woff")
		format("woff");
	font-style: normal;
	font-weight: 700;
}

html, body {
	margin: 0;
	padding: 0;
	width: 100%;
	overflow-x: hidden;
	position: relative;
}

.all {
	display: flex;
	height: 700px;
	width: 100%;
	margin: 0 auto;
	position: relative;
	max-width: 100vw;
	box-sizing: border-box;
}

.calBar {
	width: 350px;
	height: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	background-color: white;
	flex-shrink: 0;
	transition: all 0.3s ease;
	position: absolute;
	left: 0;
	z-index: 100;
}

.calBar.collapsed {
	transform: translateX(-350px);
}

.toggleCalBar {
	position: absolute;
	right: -20px;
	top: 10px;
	width: 20px;
	height: 40px;
	background: #f0f0f0;
	border: 1px solid #ddd;
	border-left: none;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
	z-index: 1000;
}

.dayBox {
	width: 300px;
	height: 100%;
	display: flex;
	flex-direction: column;
	gap: 30px;
	overflow-y: auto;
	overflow-x: hidden;
}

.dayBox::-webkit-scrollbar {
	width: 8px;
}

.dayBox::-webkit-scrollbar-track {
	background: #f1f1f1;
	border-radius: 4px;
}

.dayBox::-webkit-scrollbar-thumb {
	background: #888;
	border-radius: 4px;
}

.dayBox::-webkit-scrollbar-thumb:hover {
	background: #555;
}

.dayText {
	position: relative;
	left: 5%;
	font-family: "Gmarket Sans", sans-serif;
	font-weight: 700;
	font-size: 12px;
	line-height: 12px;
	text-align: left;
	color: #311d05;
	margin-top: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 90%;
}

.dayText span {
	display: flex;
	align-items: center;
	gap: 8px;
	cursor: pointer;
}

.dayColorBar {
	display: inline-block;
	width: 20px;
	height: 4px;
	border-radius: 2px;
}

.toggleBtn {
	background: #f0f0f0;
	border: none;
	border-radius: 4px;
	padding: 4px 8px;
	cursor: pointer;
	font-size: 10px;
}

.dayContent {
	display: block;
	transition: all 0.3s ease;
}

.dayContent.hidden {
	display: none;
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

.image {
	position: relative;
	width: 190px;
	height: 110px;
	top: 5%;
	left: 6%;
	border-radius: 10px;
}

.title {
	position: relative;
	font-family: "Gmarket Sans", sans-serif;
	font-weight: 700;
	font-size: 10px;
	line-height: 15px;
	text-align: left;
	padding-top: 5%;
	padding-left: 10%;
	color: #000000;
}

.genre {
	position: relative;
	font-family: "Gmarket Sans", sans-serif;
	font-weight: 500;
	font-size: 10px;
	line-height: 15px;
	text-align: left;
	padding-left: 10%;
	color: #000000;
}

.address {
	position: relative;
	font-family: "Gmarket Sans", sans-serif;
	font-weight: 500;
	font-size: 10px;
	line-height: 15px;
	text-align: center;
	color: #6c6c6c;
}

.nick {
	font-family: "Gmarket Sans", sans-serif;
	font-weight: 500;
	font-size: 10px;
	line-height: 15px;
	text-align: center;
	color: #000000;
}

#map {
	position: absolute;
	right: 0;
	width: calc(100% - 350px);
	height: 650px;
	transition: all 0.3s ease;
}

.map-expanded {
	width: 100% !important;
	left: 0 !important;
}
</style>
</head>
<body>

	<%
      Map<String, Object> mapData = (Map<String, Object>)session.getAttribute("mapData");
      String jsonString = mapData.get("selected_res").toString().replaceAll("=", ":");
      String region = mapData.get("region").toString();
      System.out.println(region);
      
      JsonParser parser = new JsonParser();        
      JsonObject json = (JsonObject)parser.parse(jsonString);
      System.out.println(json.get("TL_IMG").getAsJsonObject().get("0"));
      
      System.out.println(mapData.get("location_res").toString());
      
      String location_res = mapData.get("location_res").toString().replaceAll("=", ":");
      
      JsonObject tl_img = json.get("TL_IMG").getAsJsonObject();
      JsonObject tl_name = json.get("TL_NAME").getAsJsonObject();
      JsonObject tl_theme = json.get("TL_THEME").getAsJsonObject();
      JsonObject tl_add = json.get("TL_ADD").getAsJsonObject();
      
      System.out.println(tl_name.get("10"));
   %>


	<div class="all">
		<div>
			<h2>지역</h2>
		</div>
		<div class="calBar" id="calBar">
			<button class="toggleCalBar" onclick="toggleCalBar()">◀</button>
			<div class="dayBox">

				<% 
    for (int i = 0; i < 10; i++) {
        if (tl_name.get("" + i) != null) { 
            if (i % 3 == 0) { 
%>

				<div class="dayText">
					<span onclick="moveToDay(<%=(i / 3 + 1)%>)"> <%= (i / 3 + 1) + "일차" %>
						<% if((i/3+1)==1){%>
						<div class="dayColorBar" style="background-color: #FF6B6B"></div>
						<%} else if((i/3+1)==2){%>
						<div class="dayColorBar" style="background-color: #4ECDC4"></div>
						<%}else{%>
						<div class="dayColorBar" style="background-color: #45B7D1"></div>
						<%}%>
					</span>
					<button class="toggleBtn" onclick="toggleDay(<%=(i / 3 + 1)%>)">
						<span id="toggleText<%=(i / 3 + 1)%>">접기</span>
					</button>
				</div>
				<%  } %>


				<div class="dayContent" id="day<%=(i / 3 + 1)%>">
					<div class="imageBox">
						<% if (tl_img.get("" + i).getAsString().equals("")) { %>
						<div class="image"
							style="background: url('https://via.placeholder.com/190x110.png?text=No+Image') no-repeat center/cover;"></div>
						<% } else { %>
						<div class="image"
							style="background: url('../touristimg/<%=tl_img.get("" + i).getAsString()%>') no-repeat center/cover;"></div>
						<% } %>


						<div class="title"><%= tl_name.get("" + i).getAsString() %></div>
						<div class="genre"><%= tl_theme.get("" + i).getAsString() %></div>
						<div class="address"><%= tl_add.get("" + i).getAsString() %></div>
					</div>
				</div>
				<% 
          }
      } 
  %>



			</div>
		</div>
		<div id="map"></div>
	</div>

	<script src="js/header.js"></script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b191295b63ba214e903ff029903f9c5"></script>

	<script type="text/javascript">

		let myData = <%=jsonString%>
		console.log(myData.TL_IMG[0])
		let locationData = <%=location_res%>
		console.log(locationData.TL_NAME[0])
		console.log(locationData.TL_LATITUDE[0])
		console.log(locationData.TL_LONGITUDE[0])

	
        function toggleCalBar() {
          const calBar = document.getElementById('calBar');
          const toggleBtn = calBar.querySelector('.toggleCalBar');
          const map = document.getElementById('map');

          calBar.classList.toggle('collapsed');
          map.classList.toggle('map-expanded');

          if(calBar.classList.contains('collapsed')) {
            toggleBtn.textContent = '▶';
          } else {
            toggleBtn.textContent = '◀';
          }
        }

        function toggleDay(day) {
          const dayContent = document.getElementById('day'+day);
          const toggleText = document.getElementById('toggleText'+day);

          if (dayContent.style.display === 'none') {
            dayContent.style.display = 'block';
            toggleText.textContent = '접기';
          } else {
            dayContent.style.display = 'none';
            toggleText.textContent = '펼치기';
          }
        }

        var container = document.getElementById("map");
        var options = {
          center: new kakao.maps.LatLng(locationData.TL_LATITUDE[0], locationData.TL_LONGITUDE[0]),
          level: 7,
        };

        var map = new kakao.maps.Map(container, options);

        var positions = [
        	  <%for(int i = 0; i<10; i++) {
        	  	if (tl_name.get("" + i) != null) {%>
        	  	{
        	  		title: locationData.TL_NAME[<%=i%>],
        	  		latlng: new kakao.maps.LatLng(locationData.TL_LATITUDE[<%=i%>], locationData.TL_LONGITUDE[<%=i%>]),
        	  		day: Math.floor(<%=(i / 3 + 1)%>),
        	  		number: <%=(i % 3 + 1)%>
        	  	},
        	  <%}
        	  }%>
        ];

        // 일차별로 마커와 선을 그리기 위해 positions를 일차별로 분류
        var dayPositions = {};
        positions.forEach(function(position) {
          if (!dayPositions[position.day]) {
            dayPositions[position.day] = [];
          }
          dayPositions[position.day].push(position);
        });

        // 일차별 색상 정의
        var dayColors = {
          1: '#FF6B6B',
          2: '#4ECDC4',
          3: '#45B7D1',
          4: '#666666'
        };

        // 각 일차별로 마커와 선 그리기
        Object.keys(dayPositions).forEach(function(day) {
          var dayColor = dayColors[day] || '#666666';
          var dayMarkers = dayPositions[day];
          var overlays = [];

          // 먼저 마커 생성
          dayMarkers.forEach(function(position) {
            var content = '<div style="padding:5px; background:' + dayColor + '; color: white; border:1px solid #000; border-radius:50%; width:20px; height:20px; text-align:center; line-height:20px;">' +
                         position.number + '</div>';

            var customOverlay = new kakao.maps.CustomOverlay({
              position: position.latlng,
              content: content,
              yAnchor: 0.5
            });

            customOverlay.setMap(map);
            overlays.push(customOverlay);
          });

          // 선 그리기
          var linePath = dayMarkers.map(function(position) {
            return position.latlng;
          });

          var polyline = new kakao.maps.Polyline({
            path: linePath,
            strokeWeight: 3,
            strokeColor: dayColor,
            strokeOpacity: 0.7,
            strokeStyle: 'solid'
          });

          polyline.setMap(map);
        });

        function moveToDay(day) {
          // 해당 날짜의 위치 데이터를 가져옵니다.
          const positionsForDay = dayPositions[day];

          if (!positionsForDay || positionsForDay.length === 0) {
            console.error(`No positions found for day ${day}`);
            return;
          }

          // LatLngBounds 객체를 생성합니다.
          const bounds = new kakao.maps.LatLngBounds();

          // 해당 날짜의 위치를 bounds에 추가합니다.
          positionsForDay.forEach(position => {
            bounds.extend(position.latlng);
          });

          // 지도의 범위를 해당 날짜의 위치로 설정합니다.
          map.setBounds(bounds);

          // 지도를 적절히 확대 (필요하면 level 값 조정)
          map.setLevel(5, { animate: true });
        }
        
      </script>
</body>
	</html>
</div>
