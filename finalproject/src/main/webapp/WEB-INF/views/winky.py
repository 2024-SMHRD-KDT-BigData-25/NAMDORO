from flask import Flask, jsonify, send_file, render_template, request
import urllib.parse
import joblib
import pymysql
import pandas as pd
import itertools
import math

# Flask 앱 초기화
app = Flask(__name__)

# 대원 거리 계산 함수 (Haversine Formula)
def haversine(lat1, lon1, lat2, lon2):
    # 위도와 경도를 라디안으로 변환
    lat1, lon1, lat2, lon2 = map(math.radians, [lat1, lon1, lat2, lon2])
    
    # 차이 계산
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    
    # Haversine 공식을 사용하여 거리 계산
    a = math.sin(dlat/2)**2 + math.cos(lat1) * math.cos(lat2) * math.sin(dlon/2)**2
    c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
    
    # 지구의 반지름 (킬로미터 단위)
    R = 6371.0
    distance = R * c
    return distance

@app.route('/home', methods=['GET'])
def home():
    # 여러 파라미터를 쿼리 스트링에서 가져오기
    gender = request.args.get('gender')  # gender 파라미터
    age = request.args.get('age')  # age 파라미터
    theme = request.args.get('theme')  # theme 파라미터
    region = request.args.get('region')  # region 파라미터

    # URL 인코딩된 값들을 디코딩
    gender = urllib.parse.unquote(gender)
    age = urllib.parse.unquote(age)
    theme = urllib.parse.unquote(theme)
    region = urllib.parse.unquote(region)

    print("gender:", gender)
    print("age:", age)
    print("theme:", theme)
    print("region:", region)

    # 모델 불러오기
    model = joblib.load("model/namdoro.pkl")

    # DB 연결
    db = pymysql.connect(
        host='project-db-campus.smhrd.com',
        user='sc_24K_bigdata25_p3_2',
        port=3312,
        password='smhrd2',
        db='sc_24K_bigdata25_p3_2',
        charset='utf8'
    )
    
    sql = f"SELECT TL_NO, TL_THEME, CITY_NAME, TL_NAME, TL_IMG, TL_ADD, TL_LATITUDE, TL_LONGITUDE FROM TOURIST_INFO WHERE TL_THEME='{theme}' and CITY_NAME='{region}'"
    cursor = db.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()

    # 쿼리 결과를 pandas DataFrame으로 변환
    result_df = pd.DataFrame(result, columns=['TL_NO', 'TL_THEME', 'CITY_NAME', 'TL_NAME', 'TL_IMG', 'TL_ADD', 'TL_LATITUDE', 'TL_LONGITUDE'])
    db.commit()
    db.close()

    print('result_df:', result_df)

    # 결과 데이터 준비
    results = pd.DataFrame([], columns=['AREA', 'SCORE'])
    for area in result_df['TL_NAME']:
        user_input = [gender, age, theme, area]
        score = model.predict([user_input])
        results = pd.concat([results, pd.DataFrame([[area, score]], columns=['AREA', 'SCORE'])])

    print('results:', results.sort_values('SCORE', ascending=False)[:])

    # 새로운 DataFrame 생성
    res = pd.DataFrame([], columns=['TL_NO', 'TL_THEME', 'CITY_NAME', 'TL_NAME', 'TL_IMG', 'TL_ADD', 'TL_LATITUDE', 'TL_LONGITUDE'])

    # result_df와 results에서 'TL_NAME'과 'AREA'가 동일한 값을 찾고, 해당 행을 res에 추가
    for area in results['AREA']:
        matching_rows = result_df[result_df['TL_NAME'] == area]
        if not matching_rows.empty:
            res = pd.concat([res, matching_rows])

    print('res (전체): ', res)

    # res에서 상위 6개만 선택 (SCORE가 높은 상위 6개)
    res = res.head(6)

    print('res (상위 6개): ', res)

    # TL_LATITUDE와 TL_LONGITUDE를 float로 변환
    res['TL_LATITUDE'] = res['TL_LATITUDE'].astype(float)
    res['TL_LONGITUDE'] = res['TL_LONGITUDE'].astype(float)

    # 장소들의 위도, 경도를 사용하여 최단 경로 계산
    locations = dict(zip(res['TL_NAME'], zip(res['TL_LATITUDE'], res['TL_LONGITUDE'])))
    places = res['TL_NAME'].tolist()

    # 모든 장소의 순열을 구하기
    permutations = itertools.permutations(places)

    # 최단 경로와 그 거리를 초기화
    min_distance = float('inf')
    best_route = None
    distance_dict = {}

    # 모든 순열에 대해 거리 계산
    for perm in permutations:
        total_distance = 0
        # print(f"\n경로: {perm}")

        # 순열의 연속적인 지점들 사이의 거리 계산
        for i in range(len(perm) - 1):
            start = perm[i]
            end = perm[i + 1]
            lat1, lon1 = locations[start]
            lat2, lon2 = locations[end]

            # 거리 계산
            distance = haversine(lat1, lon1, lat2, lon2)
            total_distance += distance

            # 각 두 지점 간의 거리 저장
            if (start, end) not in distance_dict:
                distance_dict[(start, end)] = distance

        # 현재 경로의 거리가 최소 거리보다 작으면 업데이트
        if total_distance < min_distance:
            min_distance = total_distance
            best_route = perm

    # 최단 경로에 대한 장소 간 거리만 출력
    print(f"\n최단 경로: {best_route}")
    print(f"최단 거리: {min_distance:.2f} km")

    # 최단 경로에 대한 장소별 거리만 출력
    route_distances = []
    for i in range(len(best_route) - 1):
        start = best_route[i]
        end = best_route[i + 1]
        distance = distance_dict[(start, end)]
        print(f"{start} -> {end}: {distance:.2f} km")
        route_distances.append([start, end, distance])

    # 최단 경로 순서대로 새로운 DataFrame 생성
    route_df = pd.DataFrame(route_distances, columns=['Start', 'End', 'Distance'])

    # 최단 경로 순서로 정렬된 새로운 DataFrame 만들기
    ordered_res = res.set_index('TL_NAME').reindex(best_route).reset_index()

    # ordered_res에서 필요한 컬럼만 선택하여 새로운 DataFrame 생성
    selected_res = ordered_res[['TL_IMG', 'TL_NAME', 'TL_THEME', 'TL_ADD']]
    
    # ordered_res에서 TL_NAME, TL_LATITUDE, TL_LONGITUDE만 선택하여 새로운 DataFrame 생성
    location_res = ordered_res[['TL_NAME', 'TL_LATITUDE', 'TL_LONGITUDE']]

    # 'Distance' 컬럼 반올림 (소수점 두 번째 자리까지)
    route_df['Distance'] = route_df['Distance'].round(2)

    # 처리 후 결과 반환
    return render_template('result6.html', selected_res=selected_res, location_res=location_res)

# Flask 서버 실행
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=4000)
