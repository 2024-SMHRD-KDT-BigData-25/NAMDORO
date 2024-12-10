<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.fasterxml.jackson.databind.util.JSONPObject"%>
<%@page import="org.apache.tomcat.util.json.JSONParser"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>

    <style>
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

      html,
      body {
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
        /* padding-top: 3%; */
        background-color: white;
        flex-shrink: 0;
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
    </style>
  </head>
  <body>
  
  <%
     Map<String, Object> mapData = (Map<String, Object>)session.getAttribute("mapData");
  	 //JsonObject json = mapData.get("selected_res");
  	 System.out.println(mapData.get("selected_res").toString());
  	 String jsonString = mapData.get("selected_res").toString().replaceAll("=", ":");
  	 String test = mapData.get("region").toString();
  	 System.out.println(test);
  	 
  	  JsonParser parser = new JsonParser();        
  	  JsonObject json = (JsonObject)parser.parse(jsonString);
  	  System.out.println(json.get("TL_IMG").getAsJsonObject().get("0"));
  	  
  	  
  	  JsonObject tl_img = json.get("TL_IMG").getAsJsonObject();
  	  JsonObject tl_name = json.get("TL_NAME").getAsJsonObject();
  	  JsonObject tl_theme = json.get("TL_THEME").getAsJsonObject();
  	  JsonObject tl_add = json.get("TL_ADD").getAsJsonObject();
  	  
  	  System.out.println(tl_name.get("10"));
  	  
  	 // Json 문자열        
   // String jsonStr = mapData.get();
    // Gson 객체 생성       
   // Gson gson = new Gson();
    // Json 문자열 -> Map 
  //  Map<String, Object> map = gson.fromJson(jsonStr, Map.class);
  	
  %>
    <div class="all">
      <div><h2>지역이름</h2></div>
      <div class="calBar">
      <% 
      	for(int i=0; i<10;i++){   
      		if(tl_name.get(""+i) != null){
      	%>
      	      	
      	<h1><%=tl_name.get(""+i)%></h1>
      		
      <%	}
      		
      	} %>
   
        <div class="dayBox">
          <div class="dayText">{{ (index // 3) + 1 }}일차</div>
          <div class="imageBox">
            <div
              class="image"
              style="background: url('{% if selected_res.iloc[index]['TL_IMG'].split(',')[0] %}{{ selected_res.iloc[index]['TL_IMG'].split(',')[0] }}{% else %}https://via.placeholder.com/190x110.png?text=No+Image{% endif %}') no-repeat center/cover;"
            ></div>
            <div class="title">{{ selected_res.iloc[index]['TL_NAME'] }}</div>
            <div class="genre">{{ selected_res.iloc[index]['TL_THEME'] }}</div>
            <div class="address">{{ selected_res.iloc[index]['TL_ADD'] }}</div>
          </div>
          {% endfor %}
        </div>
      </div>
      <div id="map" style="width: calc(100% - 350px); height: 650px"></div>
    </div>

      <!--  <script src="js/header.js"></script>--> 

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b191295b63ba214e903ff029903f9c5"
    ></script>

    <script type="text/javascript">
   	let myData = <%=jsonString%>
   	console.log(myData.TL_IMG['0'])
   	
   	
      // <맵 생성>
   	/*
      var container = document.getElementById("map");
      var options = {
        center: new kakao.maps.LatLng({{ location_res.iloc[0]['TL_LATITUDE'] }}, {{ location_res.iloc[0]['TL_LONGITUDE'] }}),
        level: 7,
      };

      var map = new kakao.maps.Map(container, options);
      // </맵 생성>

      var positions = [
        {% for index in range(location_res|length) %}
        {
          title: "{{ location_res.iloc[index]['TL_NAME'] }}",
          latlng: new kakao.maps.LatLng({{ location_res.iloc[index]['TL_LATITUDE'] }}, {{ location_res.iloc[index]['TL_LONGITUDE'] }})
        }{% if not loop.last %},{% endif %}
        {% endfor %}
      ];

      for (var i = 0; i < positions.length; i++) {
        var marker = new kakao.maps.Marker({
          // 마커 생성
          map: map, // 마커를 표시할 지도
          position: positions[i].latlng, // 마커를 표시할 위치
          title: positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시 됨
        });
      }*/
    </script>
  </body>
</html>
